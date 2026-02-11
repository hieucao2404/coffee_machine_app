using CoffeeMachine.service.Hardware;

namespace CoffeeMachine.service;

/// <summary>
/// Simplified process parameters - only materials matter
/// No operation details needed since STM32 handles brewing logic
/// </summary>
public class ProcessParameters
{
    public int ProcessId {get; set;}
    public string ProductName {get; set;} = string.Empty;
    public string ProcessType {get; set;} = string.Empty;
    public List<MaterialRequirement> Materials {get; set;} = new();
}

/// <summary>
/// Material requirement with sequence for ordering
/// </summary>
public class MaterialRequirement
{
    public string MaterialName {get; set;} = string.Empty;
    public decimal Quantity {get; set;}
    public string Unit {get; set;} = string.Empty;
    public string UsageType{get; set;} = string.Empty;
    public int Sequence {get; set;}
}

public interface IProcessParameterService
{
    Task<ProcessParameters?> GetProcessParametersAsync(int processId);
    Task<STM32BrewCommand> BuildSTM32BrewCommandAsync(int processId);
    Task<bool> ValidateMaterialAvailabilityAsync(int processId);
}
