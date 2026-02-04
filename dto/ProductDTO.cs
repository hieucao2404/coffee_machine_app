namespace CoffeeMachine.Dto;

public class ProductDTO {
    public int ProductId {get; set;}
    public string? ProductCode {get; set;}
    public string ProductName {get;set;} = string.Empty;
    public decimal? Price {get; set;}
    public bool IsActive {get;set;}
}

public class ProductCreateDTO
{
    public string? ProductCode { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public string? ProductType { get; set; }
    public string? Category { get; set; }
    public decimal? Price { get; set; }
    public string? Description { get; set; }
    public bool IsActive { get; set; } = true;
}
public class ProductUpdateDTO
{
    public string? ProductCode { get; set; }
    public string? ProductName { get; set; }
    public string? ProductType { get; set; }
    public string? Category { get; set; }
    public decimal? Price { get; set; }
    public string? Description { get; set; }
    public bool? IsActive { get; set; }
}


public class ProductResponseDTO
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
}