using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.service;
using CoffeeMachine.Repositories;
using System.Text.Json;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class BrewController : ControllerBase
{
    private readonly IProcessExecutionService _executionService;
    private readonly IProcessParameterService _parameterService;
    private readonly ISalesTracker _salesTracker;
    private readonly IProductRepository _productRepo;
    private readonly ILogger<BrewController> _logger;
    public BrewController(
        IProcessExecutionService executionService,
        IProcessParameterService parameterService,
        ISalesTracker salesTracker,
        IProductRepository productRepository,
        ILogger<BrewController> logger)
    {
        _executionService = executionService;
        _parameterService = parameterService;
        _salesTracker = salesTracker;
        _productRepo = productRepository;
        _logger = logger;
    }

    /// <summary>
    /// Initialize the coffee machine hardware
    /// </summary>
    [HttpPost("init")]
    public async Task<IActionResult> Initialize()
    {
        var result = await _executionService.InitializeMachineAsync();

        if (result.Success)
        {
            return Ok(result);
        }

        return BadRequest(result);
    }

    /// <summary>
    /// Execute a brewing process and see the material-based command sent to STM32
    /// Also records the sale for revenue tracking
    /// </summary>
    [HttpPost("process/{processId}")]
    public async Task<IActionResult> BrewProcess(int processId)
    {
        try
        {
            // Build the STM32 command first to show what will be sent
            var stm32Command = await _parameterService.BuildSTM32BrewCommandAsync(processId);

            // Log the command as JSON for debugging
            var commandJson = JsonSerializer.Serialize(stm32Command, new JsonSerializerOptions
            {
                WriteIndented = true
            });

            _logger.LogInformation("📤 STM32 Command to be sent:\n{Command}", commandJson);

            // Execute the brewing
            var result = await _executionService.ExecuteProcessAsync(processId);

            // If brewing was successful, record the sale
            if (result.Success)
            {
                var product = await _productRepo.GetByIdAsync(stm32Command.ProductId);
                if (product != null)
                {
                    // Check if price is set, if not use 0 or skip recording
                    decimal price = product.Price ?? 0m;

                    if (price > 0)
                    {
                        _salesTracker.RecordSale(product.ProductName, price);
                        _logger.LogInformation("💰 Sale recorded: {Product} - ${Price}",
                            product.ProductName, price);
                    }
                    else
                    {
                        _logger.LogWarning("⚠️ Product {Product} has no price set. Sale not recorded.",
                            product.ProductName);
                    }
                }
                else
                {
                    _logger.LogWarning("⚠️ Product {ProductId} not found. Sale not recorded.",
                        stm32Command.ProductId);
                }
            }

            // Return both the command and execution result
            return Ok(new
            {
                stm32Command = stm32Command,
                executionResult = result,
                saleRecorded = result.Success
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to brew process {ProcessId}", processId);
            return BadRequest(new { error = ex.Message });
        }
    }

    /// <summary>
    /// Run the cleaning cycle
    /// </summary>
    [HttpPost("clean")]
    public async Task<IActionResult> Clean()
    {
        var result = await _executionService.CleanMachineAsync();

        if (result.Success)
        {
            return Ok(result);
        }

        return BadRequest(result);
    }

    /// <summary>
    /// Preview what command would be sent to STM32 without executing
    /// </summary>
    [HttpGet("preview/{processId}")]
    public async Task<IActionResult> PreviewCommand(int processId)
    {
        try
        {
            var command = await _parameterService.BuildSTM32BrewCommandAsync(processId);
            return Ok(command);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to preview process {ProcessId}", processId);
            return BadRequest(new { error = ex.Message });
        }
    }
}
