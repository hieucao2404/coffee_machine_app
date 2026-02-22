using Microsoft.AspNetCore.Mvc;
using CoffeeMachine.Service;
using CoffeeMachine.Dto;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IProductService _productService;
    private readonly ILogger<ProductsController> _logger;
    private readonly IImageService _imageService;

    public ProductsController(
        IProductService productService,
        IImageService imageService,
        ILogger<ProductsController> logger)
    {
        _productService = productService;
        _imageService = imageService;
        _logger = logger;
    }

    /// <summary>
    /// Get all products
    /// </summary>
    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProductResponseDTO>>> GetAllProducts()
    {
        var products = await _productService.GetAllProductsAsync();
        return Ok(products);
    }

    /// <summary>
    /// Get product by ID
    /// </summary>
    [HttpGet("{id}")]
    public async Task<ActionResult<ProductResponseDTO>> GetProduct(int id)
    {
        var product = await _productService.GetProductByIdAsync(id);
        if (product == null)
            return NotFound(new { message = $"Product with ID {id} not found" });
        
        return Ok(product);
    }

    /// <summary>
    /// Get product detail with processes
    /// </summary>
    [HttpGet("{id}/detail")]
    public async Task<ActionResult<ProductDetailDTO>> GetProductDetail(int id)
    {
        var product = await _productService.GetProductDetailAsync(id);
        if (product == null)
            return NotFound(new { message = $"Product with ID {id} not found" });
        
        return Ok(product);
    }

    /// <summary>
    /// Create a new product
    /// </summary>
    [HttpPost]
    public async Task<ActionResult<ProductResponseDTO>> CreateProduct(
        [FromForm] ProductCreateDTO dto,
        [FromForm] IFormFile? image)
    {
        if (image != null)
        {
            var imageUrl = await _imageService.SaveImageAsync(image, "products");
            if (imageUrl == null)
                return BadRequest(new { error = "Failed to upload image" });
            
            dto.ImageUrl = imageUrl;
        }

        var product = await _productService.CreateProductAsync(dto);
        if (product == null)
            return BadRequest(new { error = "Failed to create product" });

        return CreatedAtAction(nameof(GetProduct), new { id = product.ProductId }, product);
    }

    /// <summary>
    /// Update a product
    /// </summary>
    [HttpPut("{id}")]
    public async Task<ActionResult<ProductResponseDTO>> UpdateProduct(
        int id,
        [FromForm] ProductUpdateDTO dto,
        [FromForm] IFormFile? image)
    {
        if (image != null)
        {
            var imageUrl = await _imageService.SaveImageAsync(image, "products");
            if (imageUrl == null)
                return BadRequest(new { error = "Failed to upload image" });
            
            dto.ImageUrl = imageUrl;
        }

        var product = await _productService.UpdateProductAsync(id, dto);
        if (product == null)
            return NotFound(new { error = $"Product {id} not found" });

        return Ok(product);
    }

    /// <summary>
    /// Delete a product
    /// </summary>
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteProduct(int id)
    {
        var success = await _productService.DeleteProductAsync(id);
        if (!success)
            return NotFound(new { message = $"Product with ID {id} not found" });
        
        return NoContent();
    }

    /// <summary>
    /// Toggle product active status
    /// </summary>
    [HttpPatch("{id}/toggle-status")]
    public async Task<IActionResult> ToggleProductStatus(int id, [FromBody] bool isActive)
    {
        var success = await _productService.ToggleProductStatusAsync(id, isActive);
        if (!success)
            return NotFound(new { message = $"Product with ID {id} not found" });
        
        return Ok(new { message = $"Product status updated to {(isActive ? "active" : "inactive")}" });
    }

    /// <summary>
    /// Get active products only
    /// </summary>
    [HttpGet("active")]
    public async Task<ActionResult<IEnumerable<ProductResponseDTO>>> GetActiveProducts()
    {
        var products = await _productService.GetActiveProductsAsync();
        return Ok(products);
    }

    /// <summary>
    /// Get products by type
    /// </summary>
    [HttpGet("type/{type}")]
    public async Task<ActionResult<IEnumerable<ProductResponseDTO>>> GetProductsByType(string type)
    {
        var products = await _productService.GetProductsByTypeAsync(type);
        return Ok(products);
    }

    /// <summary>
    /// Get products by category
    /// </summary>
    [HttpGet("category/{category}")]
    public async Task<ActionResult<IEnumerable<ProductResponseDTO>>> GetProductsByCategory(string category)
    {
        var products = await _productService.GetProductsByCategoryAsync(category);
        return Ok(products);
    }

    /// <summary>
    /// Search products
    /// </summary>
    [HttpGet("search/{searchTerm}")]
    public async Task<ActionResult<IEnumerable<ProductResponseDTO>>> SearchProducts(string searchTerm)
    {
        var products = await _productService.SearchProductsAsync(searchTerm);
        return Ok(products);
    }

    /// <summary>
    /// Check product availability
    /// </summary>
    [HttpGet("{id}/availability")]
    public async Task<ActionResult<object>> CheckAvailability(int id)
    {
        var isAvailable = await _productService.IsProductAvailableAsync(id);
        return Ok(new { productId = id, isAvailable });
    }

    /// <summary>
    /// Get material requirements for product
    /// </summary>
    [HttpGet("{id}/material-requirements")]
    public async Task<ActionResult<Dictionary<string, decimal>>> GetMaterialRequirements(int id)
    {
        var requirements = await _productService.GetProductMaterialRequirementsAsync(id);
        if (requirements == null || !requirements.Any())
            return NotFound(new { message = $"No material requirements found for product ID {id}" });
        
        return Ok(requirements);
    }

        /// <summary>
    /// Get HashMap: ProductId → Materials
    /// Fast lookup by product ID
    /// </summary>
    [HttpGet("materials-map")]
    public async Task<ActionResult<Dictionary<int, List<MaterialRequirementDTO>>>> GetProductMaterialsMap()
    {
        var map = await _productService.GetAllProductMaterialsMapAsync();
        return Ok(map);
    }

    /// <summary>
    /// Get HashMap: ProductName → Materials
    /// More readable, good for displays
    /// </summary>
    [HttpGet("materials-map-by-name")]
    public async Task<ActionResult<ProductMaterialMapDTO>> GetProductMaterialsMapByName()
    {
        var map = await _productService.GetProductMaterialsMapByNameAsync();
        return Ok(map);
    }

    /// <summary>
    /// Check if a product can be made based on current material stock levels
    /// Returns availability status and reason if unavailable
    /// </summary>
    [HttpGet("{id}/can-make")]
    public async Task<ActionResult> CanMakeProduct(int id)
    {
        try
        {
            var result = await _productService.CanMakeProductAsync(id);
            return Ok(result);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error checking if product {ProductId} can be made", id);
            return BadRequest(new { error = ex.Message });
        }
    }
}