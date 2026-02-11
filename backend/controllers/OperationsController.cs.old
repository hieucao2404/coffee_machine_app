using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.Service;
using CoffeeMachine.Dto;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class OperationsController : ControllerBase
{
    private readonly IOperationService _operationService;
    private readonly ILogger<OperationsController> _logger;

    public OperationsController(IOperationService operationService, ILogger<OperationsController> logger)
    {
        _operationService = operationService;
        _logger = logger;
    }

    /// <summary>
    /// Get all operations
    /// </summary>
    [HttpGet]
    public async Task<ActionResult<IEnumerable<OperationResponseDTO>>> GetAllOperations()
    {
        var operations = await _operationService.GetAllOperationsAsync();
        return Ok(operations);
    }

    /// <summary>
    /// Get operation by ID
    /// </summary>
    [HttpGet("{id}")]
    public async Task<ActionResult<OperationResponseDTO>> GetOperation(int id)
    {
        var operation = await _operationService.GetOperationByIdAsync(id);
        if (operation == null)
            return NotFound(new { message = $"Operation with ID {id} not found" });
        
        return Ok(operation);
    }

    /// <summary>
    /// Create a new operation
    /// </summary>
    [HttpPost]
    public async Task<ActionResult<OperationResponseDTO>> CreateOperation([FromBody] OperationCreateDTO createDto)
    {
        try
        {
            var operation = await _operationService.CreateOperationAsync(createDto);
            return CreatedAtAction(nameof(GetOperation), new { id = operation.OperationId }, operation);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating operation");
            return BadRequest(new { message = ex.Message });
        }
    }

    /// <summary>
    /// Update an operation
    /// </summary>
    [HttpPut("{id}")]
    public async Task<ActionResult<OperationResponseDTO>> UpdateOperation(int id, [FromBody] OperationUpdateDTO updateDto)
    {
        var operation = await _operationService.UpdateOperationAsync(id, updateDto);
        if (operation == null)
            return NotFound(new { message = $"Operation with ID {id} not found" });
        
        return Ok(operation);
    }

    /// <summary>
    /// Delete an operation
    /// </summary>
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteOperation(int id)
    {
        var success = await _operationService.DeleteOperationAsync(id);
        if (!success)
            return NotFound(new { message = $"Operation with ID {id} not found" });
        
        return NoContent();
    }

    /// <summary>
    /// Get operations by type
    /// </summary>
    [HttpGet("type/{type}")]
    public async Task<ActionResult<IEnumerable<OperationResponseDTO>>> GetOperationsByType(string type)
    {
        var operations = await _operationService.GetOperationsByTypeAsync(type);
        return Ok(operations);
    }

    /// <summary>
    /// Search operation by name
    /// </summary>
    [HttpGet("search/{name}")]
    public async Task<ActionResult<OperationResponseDTO>> SearchByName(string name)
    {
        var operation = await _operationService.GetOperationByNameAsync(name);
        if (operation == null)
            return NotFound(new { message = $"Operation with name '{name}' not found" });
        
        return Ok(operation);
    }
}