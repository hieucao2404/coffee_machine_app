namespace CoffeeMachine.Models;

public class Material
{
    public int MaterialId { get; set; }
    public string MaterialName { get; set; } = string.Empty;
    public string? MaterialUnit { get; set; }
    public decimal? CostPerUnit { get; set; }
    public decimal StockQuantity { get; set; } = 0.00m;
    public bool IsConsumable { get; set; } = true;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<ProcessedMaterial> ProcessedMaterials { get; set; } = new List<ProcessedMaterial>();
}