namespace CoffeeMachine.Dto;

public class StockAdjustmentDTO{
    public int MaterialId{get; set;}
    public decimal AdjustmentQuantity{get;set;}
    public string AdjustmentType{get;set;} = "ADD"; // ADD, SUBTRACT, SET
    public string? Notes{get;set;}
}