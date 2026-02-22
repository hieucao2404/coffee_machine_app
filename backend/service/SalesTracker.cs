using System.Collections.Concurrent;
using CoffeeMachine.Models;

namespace CoffeeMachine.service;

public class InMemorySalesTracker : ISalesTracker
{
       private readonly ConcurrentBag<SaleRecord> _sales = new();

    public void RecordSale(string productName, decimal price)
    {
        _sales.Add(new SaleRecord
        {
            Time = DateTime.Now,
            ProductName = productName,
            PriceSoldAt = price
        });
    }

    public decimal GetTotalRevenue()
    {
        // LINQ Sum - fast and easy
        return _sales.Sum(s => s.PriceSoldAt);
    }

    public int GetTotalCupsSold()
    {
        return _sales.Count;
    }

    public void ResetDay()
    {
        _sales.Clear();
    }

    public List<SaleRecord> GetAllSales(){
        return _sales.OrderByDescending(s => s.Time).ToList();
    }

    public Dictionary<string, int> GetSalesByProduct(){
        return _sales.GroupBy(s => s.ProductName).ToDictionary(g => g.Key, g => g.Count());
    }
}
