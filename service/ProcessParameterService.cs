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
            Parameters = new BrewParameters
            {
                ProcessId = process.ProcessId,
                ProductName = process.Product?.ProductName ?? "Unknown"
            }
        };

        // Map database operations to STM32 brewing steps
        foreach (var op in process.ProcessOperations.OrderBy(po => po.Sequence))
        {
            var step = new BrewStep
            {
                StepNumber = op.Sequence,
                OperationName = op.Operation?.OperationName ?? "Unknown",
                OperationType = op.Operation?.Type ?? "Unknown"
            };

            // Map based on operation name
            switch (op.Operation?.OperationName?.ToUpper())
            {
                case "GRIND_BEANS":
                    step.DurationMs = op.Duration ?? 20000;
                    command.Parameters.GrinderDurationMs = step.DurationMs.Value;
                    break;

                case "CLOSE_LID":
                    step.Direction = -1;
                    step.Speed = op.Speed ?? 500;
                    step.CurrentLimitMa = op.CurrentLimitMa ?? 1600;
                    step.TimeoutMs = op.Duration ?? 1000;
                    command.Parameters.LidSpeed = step.Speed.Value;
                    break;

                case "OPEN_LID":
                    step.Direction = 1;
                    step.Speed = op.Speed ?? 500;
                    step.TargetPosition = op.TargetPosition ?? 200;
                    step.TimeoutMs = op.Duration ?? 500;
                    command.Parameters.LidSpeed = step.Speed.Value;
                    break;

                case "TAMP_COFFEE":
                case "TAMPER":
                    step.Direction = 1;
                    step.Speed = op.Speed ?? 500;
                    step.TargetPosition = op.TargetPosition ?? 3500;
                    step.CurrentLimitMa = op.CurrentLimitMa ?? 3500;
                    step.TimeoutMs = op.Duration ?? 400;
                    command.Parameters.PistonSpeed = step.Speed.Value;
                    command.Parameters.TamperPosition = step.TargetPosition.Value;
                    break;

                case "MOVE_PISTON":
                case "PISTON_UP":
                case "PISTON_DOWN":
                    step.Direction = op.TargetPosition > 0 ? 1 : -1;
                    step.Speed = op.Speed ?? 500;
                    step.TargetPosition = op.TargetPosition ?? 0;
                    step.CurrentLimitMa = op.CurrentLimitMa ?? 500;
                    step.TimeoutMs = op.Duration ?? 3000;
                    command.Parameters.PistonSpeed = step.Speed.Value;
                    
                    if (op.TargetPosition >= 9000)
                    {
                        command.Parameters.WipeOutPosition = op.TargetPosition.Value;
                    }
                    break;

                case "HEAT_WATER":
                    step.Temperature = (float)(op.Temperature ?? 100.0m);
                    command.Parameters.TargetTemperature = step.Temperature.Value;
                    break;

                case "PUMP_WATER":
                case "INFUSE_WATER":
                case "MAIN_INFUSION":
                    step.FlowRateMl = 60.0f;
                    step.Temperature = (float)(op.Temperature ?? 80.0m);
                    command.Parameters.PumpVolumeMl = step.FlowRateMl.Value;
                    command.Parameters.PreInfusionTemp = step.Temperature.Value;
                    break;

                case "DELAY":
                case "WAIT":
                    step.DurationMs = op.Duration ?? 2000;
                    break;
            }

            step.DelayAfterMs = 5000;
            command.Parameters.Steps.Add(step);
        }

        _logger.LogInformation(
            $"Built STM32 command for '{command.Parameters.ProductName}' with {command.Parameters.Steps.Count} steps");
        
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
