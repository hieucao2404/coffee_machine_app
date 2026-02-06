namespace CoffeeMachine.Models;

public class Material
{
    public int MaterialId { get; set; }
    public string MaterialName { get; set; } = string.Empty;
    public string? MaterialUnit { get; set; }
    public decimal? CostPerUnit { get; set; }
    public decimal? StockQuantity { get; set; }  // Make nullable
    public bool? IsConsumable { get; set; }  // Make nullable
    public string? ImageUrl { get; set; }
    public DateTime? CreatedAt { get; set; }  // Make nullable
    public DateTime? UpdatedAt { get; set; }  // Make nullable

    public ICollection<ProcessedMaterial> ProcessedMaterials { get; set; } = new List<ProcessedMaterial>();
}