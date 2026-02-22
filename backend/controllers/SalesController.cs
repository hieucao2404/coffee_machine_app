using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.service;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SalesController : ControllerBase
{
    private readonly ISalesTracker _salesTracker;
    private readonly ILogger<SalesController> _logger;

    public SalesController(ISalesTracker salesTracker, ILogger<SalesController> logger)
    {
        _salesTracker = salesTracker;
        _logger = logger;
    }

    /// <summary>
    /// Get total revenue for today
    /// </summary>
    [HttpGet("revenue")]
    public IActionResult GetTotalRevenue()
    {
        var revenue = _salesTracker.GetTotalRevenue();
        return Ok(new { totalRevenue = revenue });
    }

    /// <summary>
    /// Get total cups sold today
    /// </summary>
    [HttpGet("cups-sold")]
    public IActionResult GetTotalCupsSold()
    {
        var count = _salesTracker.GetTotalCupsSold();
        return Ok(new { totalCups = count });
    }

    /// <summary>
    /// Get all sales records for today
    /// </summary>
    [HttpGet("all")]
    public IActionResult GetAllSales()
    {
        var sales = _salesTracker.GetAllSales();
        return Ok(sales);
    }

    /// <summary>
    /// Get sales breakdown by product
    /// </summary>
    [HttpGet("by-product")]
    public IActionResult GetSalesByProduct()
    {
        var salesByProduct = _salesTracker.GetSalesByProduct();
        return Ok(salesByProduct);
    }

    /// <summary>
    /// Get sales summary (revenue, cups, breakdown)
    /// </summary>
    [HttpGet("summary")]
    public IActionResult GetSalesSummary()
    {
        var summary = new
        {
            totalRevenue = _salesTracker.GetTotalRevenue(),
            totalCups = _salesTracker.GetTotalCupsSold(),
            salesByProduct = _salesTracker.GetSalesByProduct(),
            recentSales = _salesTracker.GetAllSales().Take(10)
        };
        return Ok(summary);
    }

    /// <summary>
    /// Reset daily sales (call this at midnight or start of day)
    /// </summary>
    [HttpPost("reset")]
    public IActionResult ResetDailySales()
    {
        _salesTracker.ResetDay();
        _logger.LogInformation("Daily sales reset at {Time}", DateTime.Now);
        return Ok(new { message = "Daily sales have been reset" });
    }

    /// <summary>
    /// Manually record a sale (for testing or manual entry)
    /// </summary>
    [HttpPost("record")]
    public IActionResult RecordSale([FromBody] RecordSaleRequest request)
    {
        _salesTracker.RecordSale(request.ProductName, request.Price);
        _logger.LogInformation("Sale recorded: {Product} - ${Price}", request.ProductName, request.Price);
        return Ok(new { message = "Sale recorded successfully" });
    }
}

public class RecordSaleRequest
{
    public string ProductName { get; set; } = string.Empty;
    public decimal Price { get; set; }
}