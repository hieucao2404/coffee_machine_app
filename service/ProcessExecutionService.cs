using CoffeeMachine.Repositories;
using CoffeeMachine.service.Hardware;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.service;

public class ProcessExecutionService : IProcessExecutionService
{
    private readonly IProcessParameterService _parameterService;
    private readonly ISTM32CommunicationService _stm32;
    private readonly IMaterialRepository _materialRepo;
    private readonly IProcessRepository _processRepo;
    private readonly ILogger<ProcessExecutionService> _logger;

    public ProcessExecutionService(
        IProcessParameterService parameterService,
        ISTM32CommunicationService stm32,
        IMaterialRepository materialRepo,
        IProcessRepository processRepo,
        ILogger<ProcessExecutionService> logger)
    {
        _parameterService = parameterService;
        _stm32 = stm32;
        _materialRepo = materialRepo;
        _processRepo = processRepo;
        _logger = logger;
    }

    public async Task<ProcessExecutionResult> InitializeMachineAsync()
    {
        var result = new ProcessExecutionResult
        {
            StartTime = DateTime.UtcNow
        };

        try
        {
            result.ExecutionLog.Add("🔍 Searching for STM32 device...");
            
            if (!_stm32.IsConnected)
            {
                // Auto-detect port (leave portName empty for auto-detection)
                var connected = await _stm32.ConnectAsync("", 115200);
                
                if (!connected)
                {
                    result.ExecutionLog.Add("⚠️  STM32 not found - running in simulation mode");
                    result.ExecutionLog.Add($"   Available ports: {string.Join(", ", _stm32.GetAvailablePorts())}");
                }
                else
                {
                    result.ExecutionLog.Add("✓ STM32 connected successfully");
                }
            }

            result.ExecutionLog.Add("Sending initialization command to STM32...");
            
            var command = new STM32BrewCommand
            {
                CommandType = "INIT",
                Parameters = new BrewParameters()
            };

            var response = await _stm32.SendCommandAsync(command);
            
            result.ExecutionLog.Add($"STM32 Response: {response.Status}");
            result.ExecutionLog.Add($"Message: {response.Message}");
            result.Success = response.Success || response.Status == "SIMULATED";
            result.Message = response.Message;
        }
        catch (Exception ex)
        {
            result.Success = false;
            result.Message = ex.Message;
            result.ExecutionLog.Add($"❌ Error: {ex.Message}");
            _logger.LogError(ex, "Initialization failed");
        }
        finally
        {
            result.EndTime = DateTime.UtcNow;
        }

        return result;
    }

    public async Task<ProcessExecutionResult> ExecuteProcessAsync(int processId)
    {
        var result = new ProcessExecutionResult
        {
            StartTime = DateTime.UtcNow
        };

        try
        {
            result.ExecutionLog.Add($"📋 Loading process {processId} from database...");
            
            // Get process parameters
            var parameters = await _parameterService.GetProcessParametersAsync(processId);
            if (parameters == null)
            {
                throw new Exception($"Process {processId} not found in database");
            }

            result.ExecutionLog.Add($"✓ Loaded: {parameters.ProductName}");
            result.ExecutionLog.Add($"  - {parameters.Steps.Count} operations");
            result.ExecutionLog.Add($"  - {parameters.Materials.Count} materials required");

            // Validate materials
            result.ExecutionLog.Add("📦 Checking material availability...");
            var hasEnoughMaterials = await _parameterService.ValidateMaterialAvailabilityAsync(processId);
            
            if (!hasEnoughMaterials)
            {
                throw new Exception("Insufficient materials in stock");
            }
            result.ExecutionLog.Add("✓ All materials available");

            // Build STM32 command
            result.ExecutionLog.Add("🔧 Building command for STM32...");
            var command = await _parameterService.BuildSTM32BrewCommandAsync(processId);
            result.ExecutionLog.Add($"✓ Command built with {command.Parameters.Steps.Count} steps");

            // Send to STM32
            result.ExecutionLog.Add("📤 Sending command to STM32...");
            var response = await _stm32.SendCommandAsync(command);

            result.ExecutionLog.Add($"📥 STM32 Response: {response.Status}");
            result.ExecutionLog.Add($"   {response.Message}");

            if (response.Success || response.Status == "SIMULATED")
            {
                // Update material inventory
                result.ExecutionLog.Add("📝 Updating material inventory...");
                await UpdateInventoryAsync(processId, result);
                
                result.Success = true;
                result.Message = $"{parameters.ProductName} completed successfully";
                result.ExecutionLog.Add($"✓ {parameters.ProductName} brewing complete!");
            }
            else
            {
                result.Success = false;
                result.Message = response.Message;
                result.ExecutionLog.Add($"❌ Brewing failed: {response.Message}");
            }
        }
        catch (Exception ex)
        {
            result.Success = false;
            result.Message = ex.Message;
            result.ExecutionLog.Add($"❌ Error: {ex.Message}");
            _logger.LogError(ex, "Process execution failed");
        }
        finally
        {
            result.EndTime = DateTime.UtcNow;
        }

        return result;
    }

    public async Task<ProcessExecutionResult> CleanMachineAsync()
    {
        var result = new ProcessExecutionResult
        {
            StartTime = DateTime.UtcNow
        };

        try
        {
            result.ExecutionLog.Add("🧹 Sending cleaning command to STM32...");
            
            var command = new STM32BrewCommand
            {
                CommandType = "CLEAN",
                Parameters = new BrewParameters()
            };

            var response = await _stm32.SendCommandAsync(command);
            
            result.ExecutionLog.Add($"STM32 Response: {response.Status}");
            result.ExecutionLog.Add($"Message: {response.Message}");
            result.Success = response.Success;
            result.Message = response.Message;
        }
        catch (Exception ex)
        {
            result.Success = false;
            result.Message = ex.Message;
            result.ExecutionLog.Add($"❌ Error: {ex.Message}");
            _logger.LogError(ex, "Cleaning failed");
        }
        finally
        {
            result.EndTime = DateTime.UtcNow;
        }

        return result;
    }

    private async Task UpdateInventoryAsync(int processId, ProcessExecutionResult result)
    {
        var process = await _processRepo.GetProcessWithDetailsAsync(processId);
        
        if (process == null) return;

        foreach (var pm in process.ProcessedMaterials)
        {
            var material = await _materialRepo.GetByIdAsync(pm.MaterialId);
            if (material != null && material.IsConsumable)
            {
                var oldStock = material.StockQuantity;
                var newStock = material.StockQuantity - pm.Quantity;
                await _materialRepo.UpdateStockQuantityAsync(pm.MaterialId, newStock);
                
                result.ExecutionLog.Add(
                    $"   • {material.MaterialName}: {oldStock}{material.MaterialUnit} → {newStock}{material.MaterialUnit}");
                
                _logger.LogInformation(
                    $"Updated {material.MaterialName}: {oldStock} → {newStock}");
            }
        }
        
        await _materialRepo.SaveChangesAsync();
    }
}