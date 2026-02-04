namespace CoffeeMachine.service.Hardware;

/// <summary>
/// Simplified brew command - Backend sends ONLY material info per step
/// STM32 handles all hardware control (pump, heat, grind) based on operation name
/// </summary>
public class STM32BrewCommand
{
    public string CommandType { get; set; } = "BREW"; // "BREW", "INIT", "CLEAN"
    public int ProductId { get; set; }
    public int ProcessId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public List<MaterialBasedStep> Steps { get; set; } = new();
}

/// <summary>
/// Each step contains: operation name + material (if used)
/// STM32 firmware knows what to do based on operation name
/// Material quantity is the only dynamic parameter
/// </summary>
public class MaterialBasedStep
{
    public int Sequence { get; set; }
    public string OperationName { get; set; } = string.Empty; // "HEAT_WATER", "GRIND_BEANS", etc.
    public string OperationType { get; set; } = string.Empty;  // "Heater", "Motor", "Pump", etc.
    public StepMaterial? Material { get; set; }  // null if no material used in this step
}

/// <summary>
/// Material information for a step
/// </summary>
public class StepMaterial
{
    public int MaterialId { get; set; }
    public string MaterialName { get; set; } = string.Empty;
    public decimal Quantity { get; set; }
    public string Unit { get; set; } = string.Empty;  // "g", "ml", "piece"
    public string UsageType { get; set; } = string.Empty; // "Ingredient", "Container"
}

public class STM32Response
{
    public bool Success { get; set; }
    public string Status { get; set; } = string.Empty; // "COMPLETED", "ERROR", "RUNNING"
    public string Message { get; set; } = string.Empty;
    public int CurrentStep { get; set; }
    public Dictionary<string, object> Data { get; set; } = new();
}
