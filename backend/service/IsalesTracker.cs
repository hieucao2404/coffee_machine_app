using CoffeeMachine.Models;

namespace CoffeeMachine.service;

public interface ISalesTracker
{
    void RecordSale(string productName, decimal price);
    decimal GetTotalRevenue();
    int GetTotalCupsSold();
    void ResetDay();
    List<SaleRecord> GetAllSales();
    Dictionary<string, int> GetSalesByProduct(); 
}