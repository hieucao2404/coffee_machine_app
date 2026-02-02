using CoffeeMachine.service.Hardware;

namespace CoffeeMachine.service;

public class ProcessParameters
{
    public int ProcessId {get; set;}
    public string ProductName {get; set;} = string.Empty;
    public string ProcessType {get; set;} = string.Empty;
    public List<OperationStep> Steps {get; set;} = new();
    public List<MaterialRequirement> Materials {get; set;} = new();
}

public class OperationStep
{
    public int Sequence{get; set;}
    public string OperationName {get; set;} = string.Empty;
    public string OperationType {get; set;} = string.Empty;
    public int? Speed {get; set;}
    public decimal? Temperature {get; set;}
    public int? Duration {get; set;}
    public int? CurrentLimitMa {get; set;}
    public int? TargetPosition{get; set;}
    public string? StopCondition{get; set;}
}

public class MaterialRequirement
{
    public string MaterialName {get; set;} = string.Empty;
    public decimal Quantity {get; set;}
    public string Unit {get; set;} = string.Empty;
    public String UsageType{get; set;} = string.Empty;
}

public interface IProcessParameterService
{
    Task<ProcessParameters?> GetProcessParametersAsync(int processId);
    Task<STM32BrewCommand> BuildSTM32BrewCommandAsync(int processId);
    Task<bool> ValidateMaterialAvailabilityAsync(int processId);
}
