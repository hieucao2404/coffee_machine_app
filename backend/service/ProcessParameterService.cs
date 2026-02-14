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
            Materials = process.ProcessedMaterials
                .OrderBy(pm => pm.Sequence ?? 0)
                .Select(pm => new MaterialRequirement
                {
                    MaterialName = pm.Material?.MaterialName ?? "Unknown",
                    Quantity = pm.Quantity,
                    Unit = pm.Material?.MaterialUnit ?? "",
                    UsageType = pm.UsageType ?? "Ingredient",
                    Sequence = pm.Sequence ?? 0
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

        var orderedMaterials = process.ProcessedMaterials.OrderBy(pm => pm.Sequence ?? 0)
        .ToList();

        var command = new STM32BrewCommand
        {
            CommandType = "BREW",
            ProductId = process.Product?.ProductId ?? 0,
            ProcessId = process.ProcessId,
            ProductName = process.Product?.ProductName ?? "Unknown",
            Materials = process.ProcessedMaterials
                .OrderBy(pm => pm.Sequence ?? 0)
                .Select(pm => new SimplifiedMaterial
                {
                    MaterialId = pm.MaterialId,
                    MaterialName = pm.Material?.MaterialName ?? "Unknown",
                    Quantity = pm.Quantity,
                    Unit = pm.Material?.MaterialUnit ?? "",
                    Sequence = pm.Sequence ?? 0
                })
                .ToList(),
                MaterialSequence = orderedMaterials.Select(pm => pm.Material?.MaterialName ?? "Unknwn").ToArray()
        };

        _logger.LogInformation($"Built STM32 command for {command.ProductName} with {command.Materials.Count} materials");
        _logger.LogInformation($"Material sequence: {string.Join(" → ", command.MaterialSequence)}");
    
        
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
