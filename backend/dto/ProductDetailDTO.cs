namespace CoffeeMachine.Dto;

public class ProductDetailDTO
{
    public int ProductId { get; set; }
    public string? ProductCode { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public string? ProductType { get; set; }
    public string? Category { get; set; }
    public decimal? Price { get; set; }
    public string? Description { get; set; }
    public bool IsActive { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    
    // Process information
    public List<ProcessSummaryDTO> Processes { get; set; } = new List<ProcessSummaryDTO>();
}

public class ProcessSummaryDTO
{
    public int ProcessId { get; set; }
    public string ProcessName { get; set; } = string.Empty;
    public int StepCount { get; set; }
    public List<string> RequiredMaterials { get; set; } = new List<string>();
}