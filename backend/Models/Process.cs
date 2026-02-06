namespace CoffeeMachine.Models;

public class Process
{
    public int ProcessId { get; set; }
    public int ProductId { get; set; }
    public int Version { get; set; } = 1;
    public string? Note { get; set; }
    public string? Type { get; set; }
    public bool IsDefault { get; set; } = false;

    public Product? Product { get; set; }
    public ICollection<ProcessOperation> ProcessOperations { get; set; } = new List<ProcessOperation>();
    public ICollection<ProcessedMaterial> ProcessedMaterials { get; set; } = new List<ProcessedMaterial>();
}
