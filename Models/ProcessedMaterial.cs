namespace CoffeeMachine.Models;

public class ProcessedMaterial
{
    public int ProcessId { get; set; }
    public int MaterialId { get; set; }
    public decimal Quantity { get; set; }
    public string? UsageType { get; set; }

    public Process? Process { get; set; }
    public Material? Material { get; set; }
}
