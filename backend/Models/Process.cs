namespace CoffeeMachine.Models;

/// <summary>
/// Process - A brewing recipe for a product
/// Contains only ordered materials - STM32 handles operations
/// </summary>
public class Process
{
    public int ProcessId { get; set; }
    public int ProductId { get; set; }
    public int Version { get; set; } = 1;
    public string? Note { get; set; }
    public string? Type { get; set; }
    public bool IsDefault { get; set; } = false;

    public Product? Product { get; set; }
    public ICollection<ProcessedMaterial> ProcessedMaterials { get; set; } = new List<ProcessedMaterial>();
}
