using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.Service;
using CoffeeMachine.Dto;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class MaterialController : ControllerBase
{
    private readonly IMaterialService _materialService;
    private readonly IWebHostEnvironment _environment;
    private readonly ILogger<MaterialController> _logger;

    public MaterialController(
        IMaterialService materialService, 
        IWebHostEnvironment environment,
        ILogger<MaterialController> logger)
    {
        _materialService = materialService;
        _environment = environment;
        _logger = logger;
    }

    /// <summary>
    /// Create material with optional image upload
    /// </summary>
    [HttpPost]
    public async Task<ActionResult<MaterialResponseDTO>> CreateMaterial(
        [FromForm] MaterialCreateDTO dto,
        [FromForm] IFormFile? image)
    {
        // Handle image upload if provided
        if (image != null)
        {
            var imageUrl = await SaveImageAsync(image, "materials");
            if (imageUrl == null)
                return BadRequest(new { error = "Failed to upload image" });
            
            dto.ImageUrl = imageUrl;
        }

        var material = await _materialService.CreateMaterialAsync(dto);
        if (material == null)
            return BadRequest(new { error = "Failed to create material" });

        return CreatedAtAction(nameof(GetMaterialById), new { id = material.MaterialId }, material);
    }

    /// <summary>
    /// Update material with optional image upload
    /// </summary>
    [HttpPut("{id}")]
    public async Task<ActionResult<MaterialResponseDTO>> UpdateMaterial(
        int id,
        [FromForm] MaterialUpdateDTO dto,
        [FromForm] IFormFile? image)
    {
        // Handle image upload if provided
        if (image != null)
        {
            var imageUrl = await SaveImageAsync(image, "materials");
            if (imageUrl == null)
                return BadRequest(new { error = "Failed to upload image" });
            
            // Add ImageUrl to UpdateDTO
            dto.ImageUrl = imageUrl;
        }

        var material = await _materialService.UpdateMaterialAsync(id, dto);
        if (material == null)
            return NotFound(new { error = $"Material {id} not found" });

        return Ok(material);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<MaterialResponseDTO>> GetMaterialById(int id)
    {
        var material = await _materialService.GetMaterialByIdAsync(id);
        if (material == null)
            return NotFound(new { error = $"Material {id} not found" });

        return Ok(material);
    }

    [HttpGet]
    public async Task<ActionResult<List<MaterialResponseDTO>>> GetAllMaterials()
    {
        var materials = await _materialService.GetAllMaterialsAsync();
        return Ok(materials);
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteMaterial(int id)
    {
        var success = await _materialService.DeleteMaterialAsync(id);
        if (!success)
            return NotFound(new { error = $"Material {id} not found" });

        return NoContent();
    }

    /// <summary>
    /// Helper method to save uploaded images
    /// </summary>
    private async Task<string?> SaveImageAsync(IFormFile file, string folder)
    {
        try
        {
            // Validate file type
            var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif", ".webp" };
            var extension = Path.GetExtension(file.FileName).ToLowerInvariant();
            
            if (!allowedExtensions.Contains(extension))
            {
                _logger.LogWarning("Invalid file type: {Extension}", extension);
                return null;
            }

            // Validate file size (max 5MB)
            if (file.Length > 5 * 1024 * 1024)
            {
                _logger.LogWarning("File too large: {Size} bytes", file.Length);
                return null;
            }

            // Create unique filename
            var fileName = $"{Guid.NewGuid()}{extension}";
            var uploadPath = Path.Combine(_environment.WebRootPath, "images", folder);
            
            // Create directory if it doesn't exist
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            var filePath = Path.Combine(uploadPath, fileName);

            // Save file
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            var imageUrl = $"/images/{folder}/{fileName}";
            _logger.LogInformation("Image saved: {ImageUrl}", imageUrl);

            return imageUrl;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to save image");
            return null;
        }
    }
}