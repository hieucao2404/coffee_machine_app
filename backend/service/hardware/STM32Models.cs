namespace CoffeeMachine.service.Hardware;

/// <summary>
/// Simplified brew command - Backend sends ONLY ordered array of materials
/// STM32 firmware handles ALL brewing logic based on material order
/// Example: [Water, Coffee Beans, Cup] → STM32 knows to heat, grind, dispense
/// </summary>
public class STM32BrewCommand
{
    public string CommandType { get; set; } = "BREW"; // "BREW", "INIT", "CLEAN"
    public int ProductId { get; set; }
    public int ProcessId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public List<SimplifiedMaterial> Materials { get; set; } = new();
    public string[] MaterialSequence { get; set; } = Array.Empty<string>();
}

/// <summary>
/// Material data sent to STM32 - order in array represents sequence
/// STM32 firmware determines operations based on material type and position
/// </summary>
public class SimplifiedMaterial
{
    public int MaterialId { get; set; }
    public string MaterialName { get; set; } = string.Empty; // "Water", "Coffee Beans", "Cup"
    public decimal Quantity { get; set; }
    public string Unit { get; set; } = string.Empty;  // "g", "ml", "piece"
    public int Sequence { get; set; }  // Position in brewing process
}

public class STM32Response
{
    public bool Success { get; set; }
    public string Status { get; set; } = string.Empty; // "COMPLETED", "ERROR", "RUNNING"
    public string Message { get; set; } = string.Empty;
    public int CurrentStep { get; set; }
    public Dictionary<string, object> Data { get; set; } = new();
}
