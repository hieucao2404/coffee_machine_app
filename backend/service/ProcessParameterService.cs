using CoffeeMachine.Repositories;
using CoffeeMachine.service.Hardware;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.service;

public class ProcessParameterService : IProcessParameterService
{
    private readonly IProcessRepository _processRepo;
    private readonly IMaterialRepository _materialRepo;
    private readonly ILogger<ProcessParameterService> _logger;

    public ProcessParameterService(
        IProcessRepository processRepo,
        IMaterialRepository materialRepo,
        ILogger<ProcessParameterService> logger)
    {
        _processRepo = processRepo;
        _materialRepo = materialRepo;
        _logger = logger;
    }

    public async Task<ProcessParameters?> GetProcessParametersAsync(int processId)
    {
        var process = await _processRepo.GetProcessWithDetailsAsync(processId);
        
        if (process == null)
        {
            _logger.LogWarning($"Process {processId} not found");
            return null;
        }

        var parameters = new ProcessParameters
        {
            ProcessId = process.ProcessId,
            ProductName = process.Product?.ProductName ?? "Unknown",
            ProcessType = process.Type ?? "Standard",
            Steps = process.ProcessOperations
                .OrderBy(po => po.Sequence)
                .Select(po => new OperationStep
                {
                    Sequence = po.Sequence,
                    OperationName = po.Operation?.OperationName ?? "Unknown",
                    OperationType = po.Operation?.Type ?? "Unknown",
                    Speed = po.Speed,
                    Temperature = po.Temperature,
                    Duration = po.Duration,
                    CurrentLimitMa = po.CurrentLimitMa,
                    TargetPosition = po.TargetPosition,
                    StopCondition = po.StopCondition
                })
                .ToList(),
            Materials = process.ProcessedMaterials
                .Select(pm => new MaterialRequirement
                {
                    MaterialName = pm.Material?.MaterialName ?? "Unknown",
                    Quantity = pm.Quantity,
                    Unit = pm.Material?.MaterialUnit ?? "",
                    UsageType = pm.UsageType ?? "Ingredient"
                })
                .ToList()
        };

        return parameters;
    }

    public async Task<STM32BrewCommand> BuildSTM32BrewCommandAsync(int processId)
    {
        var process = await _processRepo.GetProcessWithDetailsAsync(processId);
        
        if (process == null)
        {
            throw new InvalidOperationException($"Process {processId} not found");
        }

        var command = new STM32BrewCommand
        {
            CommandType = "BREW",
            ProductId = process.Product?.ProductId ?? 0,
            ProcessId = process.ProcessId,
            ProductName = process.Product?.ProductName ?? "Unknown",
            Steps = new List<MaterialBasedStep>()
        };

        // Build simplified steps: operation name + material only
        foreach (var op in process.ProcessOperations.OrderBy(po => po.Sequence))
        {
            var step = new MaterialBasedStep
            {
                Sequence = op.Sequence,
                OperationName = op.Operation?.OperationName ?? "Unknown",
                OperationType = op.Operation?.Type ?? "Unknown",
                Material = null  // Will be filled if material exists for this step
            };

            // Find material used in this specific step (matched by sequence)
            var material = process.ProcessedMaterials
                .FirstOrDefault(pm => pm.Sequence == op.Sequence);

            if (material != null && material.Material != null)
            {
                step.Material = new StepMaterial
                {
                    MaterialId = material.MaterialId,
                    MaterialName = material.Material.MaterialName,
                    Quantity = material.Quantity,
                    Unit = material.Material.MaterialUnit ?? "",
                    UsageType = material.UsageType ?? "Ingredient"
                };
            }

            command.Steps.Add(step);
        }

        _logger.LogInformation($"Built STM32 command for {command.ProductName} with {command.Steps.Count} steps");
        
        return command;
    }

    public async Task<bool> ValidateMaterialAvailabilityAsync(int processId)
    {
        var process = await _processRepo.GetProcessWithDetailsAsync(processId);
        
        if (process == null) return false;

        foreach (var pm in process.ProcessedMaterials)
        {
            var material = await _materialRepo.GetByIdAsync(pm.MaterialId);
            
            if (material == null || material.StockQuantity < pm.Quantity)
            {
                _logger.LogWarning(
                    $"Insufficient {material?.MaterialName ?? "material"}: " +
                    $"Required {pm.Quantity}, Available {material?.StockQuantity ?? 0}");
                return false;
            }
        }

        return true;
    }
}
