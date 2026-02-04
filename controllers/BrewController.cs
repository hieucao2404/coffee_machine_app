using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.service;
using System.Text.Json;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class BrewController : ControllerBase
{
    private readonly IProcessExecutionService _executionService;
    private readonly IProcessParameterService _parameterService;
    private readonly ILogger<BrewController> _logger;

    public BrewController(
        IProcessExecutionService executionService,
        IProcessParameterService parameterService,
        ILogger<BrewController> logger)
    {
        _executionService = executionService;
        _parameterService = parameterService;
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
            
            // Return both the command and execution result
            return Ok(new
            {
                stm32Command = stm32Command,
                executionResult = result
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
