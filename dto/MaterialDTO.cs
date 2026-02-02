namespace CoffeeMachine.dto;

public class MaterialDTO {
    public int MaterialId {get; set;}
    public string MaterialName {get; set;} = string.Empty;
    public decimal StockQuantity{get; set;}
}