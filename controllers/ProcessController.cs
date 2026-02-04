using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.Service;
using CoffeeMachine.Dto;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProcessController : ControllerBase
{
    private readonly IProcessManagementService _processService;
    private readonly ILogger<ProcessController> _logger;

    public ProcessController(IProcessManagementService processService, ILogger<ProcessController> logger)
    {
        _processService = processService;
        _logger = logger;
    }

    /// <summary>
    /// Create complete process with steps (sequence) and materials
    /// THIS IS HOW USERS SET THE BREWING SEQUENCE!
    /// </summary>
    [HttpPost("complete")]
    public async Task<ActionResult<ProcessResponseDTO>> CreateCompleteProcess([FromBody] CompleteProcessDTO dto)
    {
        var result = await _processService.CreateCompleteProcessAsync(dto);
        if (result == null)
            return BadRequest(new { message = "Failed to create process. Check if product, operations, and materials exist." });

        return CreatedAtAction(nameof(GetProcess), new { processId = result.ProcessId }, result);
    }

    /// <summary>
    /// Get process by ID
    /// </summary>
    [HttpGet("{processId}")]
    public async Task<ActionResult<ProcessResponseDTO>> GetProcess(int processId)
    {
        var process = await _processService.GetProcessAsync(processId);
        if (process == null)
            return NotFound(new { message = $"Process {processId} not found" });

        return Ok(process);
    }

    /// <summary>
    /// Get all processes for a product
    /// </summary>
    [HttpGet("product/{productId}")]
    public async Task<ActionResult<List<ProcessResponseDTO>>> GetProductProcesses(int productId)
    {
        var processes = await _processService.GetProductProcessesAsync(productId);
        return Ok(processes);
    }

    /// <summary>
    /// Get process steps IN SEQUENCE ORDER
    /// </summary>
    [HttpGet("{processId}/steps")]
    public async Task<ActionResult<List<ProcessOperationResponseDTO>>> GetSteps(int processId)
    {
        var steps = await _processService.GetProcessStepsAsync(processId);
        return Ok(steps);
    }

    /// <summary>
    /// Get materials needed for process
    /// </summary>
    [HttpGet("{processId}/materials")]
    public async Task<ActionResult<List<ProcessedMaterialResponseDTO>>> GetMaterials(int processId)
    {
        var materials = await _processService.GetProcessMaterialsAsync(processId);
        return Ok(materials);
    }
}