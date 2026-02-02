namespace CoffeeMachine.dto;

public class ProductDTO {
    public int ProductId {get; set;}
    public string? ProductCode {get; set;}
    public string ProductName {get;set;} = string.Empty;
    public decimal? Price {get; set;}
    public bool IsActive {get;set;}
}