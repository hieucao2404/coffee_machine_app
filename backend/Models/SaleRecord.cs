namespace CoffeeMachine.Models;

public class SaleRecord
{
    public DateTime Time { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public decimal PriceSoldAt { get; set; }
}