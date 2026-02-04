using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.Service;
using CoffeeMachine.Dto;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class MaterialsController : ControllerBase
{
    private readonly IMaterialService _materialService;
    private readonly ILogger<MaterialsController> _logger;

    public MaterialsController(IMaterialService materialService, ILogger<MaterialsController> logger)
    {
        _materialService = materialService;
        _logger = logger;
    }

    /// <summary>
    /// Get all materials
    /// </summary>
    [HttpGet]
    public async Task<ActionResult<IEnumerable<MaterialResponseDTO>>> GetAllMaterials()
    {
        var materials = await _materialService.GetAllMaterialsAsync();
        return Ok(materials);
    }

    /// <summary>
    /// Get material by ID
    /// </summary>
    [HttpGet("{id}")]
    public async Task<ActionResult<MaterialResponseDTO>> GetMaterial(int id)
    {
        var material = await _materialService.GetMaterialByIdAsync(id);
        if (material == null)
            return NotFound(new { message = $"Material with ID {id} not found" });
        
        return Ok(material);
    }

    /// <summary>
    /// Create a new material
    /// </summary>
    [HttpPost]
    public async Task<ActionResult<MaterialResponseDTO>> CreateMaterial([FromBody] MaterialCreateDTO createDto)
    {
        try
        {
            var material = await _materialService.CreateMaterialAsync(createDto);
            return CreatedAtAction(nameof(GetMaterial), new { id = material.MaterialId }, material);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating material");
            return BadRequest(new { message = ex.Message });
        }
    }

    /// <summary>
    /// Update a material
    /// </summary>
    [HttpPut("{id}")]
    public async Task<ActionResult<MaterialResponseDTO>> UpdateMaterial(int id, [FromBody] MaterialUpdateDTO updateDto)
    {
        var material = await _materialService.UpdateMaterialAsync(id, updateDto);
        if (material == null)
            return NotFound(new { message = $"Material with ID {id} not found" });
        
        return Ok(material);
    }

    /// <summary>
    /// Delete a material
    /// </summary>
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteMaterial(int id)
    {
        var success = await _materialService.DeleteMaterialAsync(id);
        if (!success)
            return NotFound(new { message = $"Material with ID {id} not found" });
        
        return NoContent();
    }

    /// <summary>
    /// Adjust material stock
    /// </summary>
    [HttpPost("adjust-stock")]
    public async Task<ActionResult<MaterialResponseDTO>> AdjustStock([FromBody] StockAdjustmentDTO adjustmentDto)
    {
        try
        {
            var material = await _materialService.AdjustStockAsync(adjustmentDto);
            if (material == null)
                return NotFound(new { message = $"Material with ID {adjustmentDto.MaterialId} not found" });
            
            return Ok(material);
        }
        catch (ArgumentException ex)
        {
            return BadRequest(new { message = ex.Message });
        }
    }

    /// <summary>
    /// Get low stock materials
    /// </summary>
    [HttpGet("low-stock")]
    public async Task<ActionResult<IEnumerable<MaterialResponseDTO>>> GetLowStock([FromQuery] decimal threshold = 10)
    {
        var materials = await _materialService.GetLowStockMaterialsAsync(threshold);
        return Ok(materials);
    }

    /// <summary>
    /// Get consumable materials
    /// </summary>
    [HttpGet("consumable")]
    public async Task<ActionResult<IEnumerable<MaterialResponseDTO>>> GetConsumable()
    {
        var materials = await _materialService.GetConsumableMaterialsAsync();
        return Ok(materials);
    }

    /// <summary>
    /// Search material by name
    /// </summary>
    [HttpGet("search/{name}")]
    public async Task<ActionResult<MaterialResponseDTO>> SearchByName(string name)
    {
        var material = await _materialService.GetMaterialByNameAsync(name);
        if (material == null)
            return NotFound(new { message = $"Material with name '{name}' not found" });
        
        return Ok(material);
    }

    /// <summary>
    /// Bulk update stock
    /// </summary>
    [HttpPost("bulk-adjust-stock")]
    public async Task<IActionResult> BulkAdjustStock([FromBody] IEnumerable<StockAdjustmentDTO> adjustments)
    {
        var success = await _materialService.BulkUpdateStockAsync(adjustments);
        if (!success)
            return BadRequest(new { message = "Bulk stock update failed" });
        
        return Ok(new { message = "Stock adjusted successfully" });
    }
}