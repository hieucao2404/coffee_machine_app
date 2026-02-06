namespace CoffeeMachine.Models;

public class ProcessedMaterial
{
    public int ProcessedMaterialId { get; set; }  // NEW: Surrogate primary key
    public int ProcessId { get; set; }
    public int MaterialId { get; set; }
    public decimal Quantity { get; set; }
    public string? UsageType { get; set; }
    public int? Sequence { get; set; }  // Links to the operation step (NULL = used across all steps)

    public Process? Process { get; set; }
    public Material? Material { get; set; }
}
