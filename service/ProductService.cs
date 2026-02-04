using CoffeeMachine.Dto;
using CoffeeMachine.Models;
using CoffeeMachine.Repositories;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.Service;

public class ProductService : IProductService
{
    private readonly IProductRepository _productRepository;
    private readonly IMaterialRepository _materialRepository;
    private readonly ILogger<ProductService> _logger;

    public ProductService(
        IProductRepository productRepository,
        IMaterialRepository materialRepository,
        ILogger<ProductService> logger)
    {
        _productRepository = productRepository;
        _materialRepository = materialRepository;
        _logger = logger;
    }

    public async Task<ProductResponseDTO> CreateProductAsync(ProductCreateDTO createDto)
    {
        _logger.LogInformation("Creating new product: {ProductName}", createDto.ProductName);

        var product = new Product
        {
            ProductCode = createDto.ProductCode,
            ProductName = createDto.ProductName,
            ProductType = createDto.ProductType,
            Category = createDto.Category,
            Price = createDto.Price,
            Description = createDto.Description,
            IsActive = createDto.IsActive,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        await _productRepository.AddAsync(product);
        await _productRepository.SaveChangesAsync();

        _logger.LogInformation("Product created successfully: {ProductId}", product.ProductId);
        return MapToResponseDTO(product);
    }

    public async Task<ProductResponseDTO?> GetProductByIdAsync(int productId)
    {
        var product = await _productRepository.GetByIdAsync(productId);
        return product != null ? MapToResponseDTO(product) : null;
    }

    public async Task<ProductDetailDTO?> GetProductDetailAsync(int productId)
    {
        var product = await _productRepository.GetProductWithProcessesAsync(productId);
        if (product == null)
            return null;

        return new ProductDetailDTO
        {
            ProductId = product.ProductId,
            ProductCode = product.ProductCode,
            ProductName = product.ProductName,
            ProductType = product.ProductType,
            Category = product.Category,
            Price = product.Price,
            Description = product.Description,
            IsActive = product.IsActive,
            CreatedAt = product.CreatedAt,
            UpdatedAt = product.UpdatedAt,
            Processes = product.Processes.Select(p => new ProcessSummaryDTO
            {
                ProcessId = p.ProcessId,
                ProcessName = p.Note ?? $"Process #{p.ProcessId}",
                StepCount = p.ProcessOperations.Count,
                RequiredMaterials = p.ProcessedMaterials
                    .Select(pm => pm.Material?.MaterialName ?? "Unknown")
                    .Distinct()
                    .ToList()
            }).ToList()
        };
    }

    public async Task<IEnumerable<ProductResponseDTO>> GetAllProductsAsync()
    {
        var products = await _productRepository.GetAllAsync();
        return products.Select(MapToResponseDTO);
    }

    public async Task<ProductResponseDTO?> UpdateProductAsync(int productId, ProductUpdateDTO updateDto)
    {
        _logger.LogInformation("Updating product: {ProductId}", productId);

        var product = await _productRepository.GetByIdAsync(productId);
        if (product == null)
        {
            _logger.LogWarning("Product not found: {ProductId}", productId);
            return null;
        }

        // Update only provided fields
        if (updateDto.ProductCode != null)
            product.ProductCode = updateDto.ProductCode;
        
        if (updateDto.ProductName != null)
            product.ProductName = updateDto.ProductName;
        
        if (updateDto.ProductType != null)
            product.ProductType = updateDto.ProductType;
        
        if (updateDto.Category != null)
            product.Category = updateDto.Category;
        
        if (updateDto.Price.HasValue)
            product.Price = updateDto.Price;
        
        if (updateDto.Description != null)
            product.Description = updateDto.Description;
        
        if (updateDto.IsActive.HasValue)
            product.IsActive = updateDto.IsActive.Value;

        product.UpdatedAt = DateTime.UtcNow;

        await _productRepository.UpdateAsync(product);
        await _productRepository.SaveChangesAsync();

        _logger.LogInformation("Product updated successfully: {ProductId}", productId);
        return MapToResponseDTO(product);
    }

    public async Task<bool> DeleteProductAsync(int productId)
    {
        _logger.LogInformation("Deleting product: {ProductId}", productId);

        var product = await _productRepository.GetByIdAsync(productId);
        if (product == null)
        {
            _logger.LogWarning("Product not found: {ProductId}", productId);
            return false;
        }

        await _productRepository.DeleteAsync(product);
        await _productRepository.SaveChangesAsync();

        _logger.LogInformation("Product deleted successfully: {ProductId}", productId);
        return true;
    }

    public async Task<bool> ToggleProductStatusAsync(int productId, bool isActive)
    {
        _logger.LogInformation("Toggling product status: {ProductId} to {IsActive}", productId, isActive);

        var product = await _productRepository.GetByIdAsync(productId);
        if (product == null)
        {
            _logger.LogWarning("Product not found: {ProductId}", productId);
            return false;
        }

        product.IsActive = isActive;
        product.UpdatedAt = DateTime.UtcNow;

        await _productRepository.UpdateAsync(product);
        await _productRepository.SaveChangesAsync();

        return true;
    }

    public async Task<IEnumerable<ProductResponseDTO>> GetActiveProductsAsync()
    {
        var products = await _productRepository.GetActiveProductsAsync();
        return products.Select(MapToResponseDTO);
    }

    public async Task<IEnumerable<ProductResponseDTO>> GetProductsByTypeAsync(string productType)
    {
        var products = await _productRepository.GetProductsByTypeAsync(productType);
        return products.Select(MapToResponseDTO);
    }

    public async Task<IEnumerable<ProductResponseDTO>> GetProductsByCategoryAsync(string category)
    {
        var products = await _productRepository.GetProductsByCategoryAsync(category);
        return products.Select(MapToResponseDTO);
    }

    public async Task<IEnumerable<ProductResponseDTO>> SearchProductsAsync(string searchTerm)
    {
        var allProducts = await _productRepository.GetAllAsync();
        
        var filtered = allProducts.Where(p =>
            (p.ProductName?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false) ||
            (p.ProductCode?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false) ||
            (p.Description?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false) ||
            (p.Category?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false)
        );

        return filtered.Select(MapToResponseDTO);
    }

    public async Task<bool> IsProductAvailableAsync(int productId)
    {
        var product = await _productRepository.GetProductWithProcessesAsync(productId);
        if (product == null || !product.IsActive)
            return false;

        // Check if all required materials are available
        foreach (var process in product.Processes)
        {
            foreach (var processedMaterial in process.ProcessedMaterials)
            {
                var material = await _materialRepository.GetByIdAsync(processedMaterial.MaterialId);
                if (material == null || material.StockQuantity < processedMaterial.Quantity)
                {
                    _logger.LogWarning(
                        "Insufficient stock for product {ProductId}. Material: {MaterialName}, Required: {Required}, Available: {Available}",
                        productId,
                        material?.MaterialName ?? "Unknown",
                        processedMaterial.Quantity,
                        material?.StockQuantity ?? 0);
                    return false;
                }
            }
        }

        return true;
    }

    public async Task<Dictionary<string, decimal>> GetProductMaterialRequirementsAsync(int productId)
    {
        var product = await _productRepository.GetProductWithProcessesAsync(productId);
        if (product == null)
            return new Dictionary<string, decimal>();

        var requirements = new Dictionary<string, decimal>();

        foreach (var process in product.Processes)
        {
            foreach (var processedMaterial in process.ProcessedMaterials)
            {
                var materialName = processedMaterial.Material?.MaterialName ?? "Unknown";
                if (requirements.ContainsKey(materialName))
                {
                    requirements[materialName] += processedMaterial.Quantity;
                }
                else
                {
                    requirements[materialName] = processedMaterial.Quantity;
                }
            }
        }

        return requirements;
    }

    private ProductResponseDTO MapToResponseDTO(Product product)
    {
        return new ProductResponseDTO
        {
            ProductId = product.ProductId,
            ProductCode = product.ProductCode,
            ProductName = product.ProductName,
            ProductType = product.ProductType,
            Category = product.Category,
            Price = product.Price,
            Description = product.Description,
            IsActive = product.IsActive,
            CreatedAt = product.CreatedAt,
            UpdatedAt = product.UpdatedAt
        };
    }

    public async Task<Dictionary<int, List<MaterialRequirementDTO>>> GetAllProductMaterialsMapAsync(){
        _logger.LogInformation("Building product-materials map");
        
        var productMaterialsMap = new Dictionary<int, List<MaterialRequirementDTO>>();
        var allProducts = await _productRepository.GetAllAsync();
        
        foreach (var product in allProducts)
        {
            var productWithDetails = await _productRepository.GetProductWithProcessesAsync(product.ProductId);
            if (productWithDetails == null) continue;

            var process = productWithDetails.Processes.FirstOrDefault(p => p.IsDefault) 
                          ?? productWithDetails.Processes.FirstOrDefault();

            if (process != null && process.ProcessedMaterials.Any())
            {
                var materials = process.ProcessedMaterials.Select(pm => new MaterialRequirementDTO
                {
                    MaterialId = pm.MaterialId,
                    MaterialName = pm.Material.MaterialName,
                    Quantity = pm.Quantity,
                    Unit = pm.Material.MaterialUnit,
                    UsageType = pm.UsageType
                }).ToList();

                productMaterialsMap[product.ProductId] = materials;
            }
        }

        _logger.LogInformation("Product-materials map built with {Count} products", productMaterialsMap.Count);
        return productMaterialsMap;
    }

    public async Task<ProductMaterialMapDTO> GetProductMaterialsMapByNameAsync()
    {
        _logger.LogInformation("Building product-materials map by name");
        
        var map = new ProductMaterialMapDTO();
        var allProducts = await _productRepository.GetAllAsync();
        
        foreach (var product in allProducts)
        {
            var productWithDetails = await _productRepository.GetProductWithProcessesAsync(product.ProductId);
            if (productWithDetails == null) continue;

            var process = productWithDetails.Processes.FirstOrDefault(p => p.IsDefault) 
                          ?? productWithDetails.Processes.FirstOrDefault();

            if (process != null)
            {
                var materials = process.ProcessedMaterials.Select(pm => new MaterialRequirementDTO
                {
                    MaterialId = pm.MaterialId,
                    MaterialName = pm.Material.MaterialName,
                    Quantity = pm.Quantity,
                    Unit = pm.Material.MaterialUnit,
                    UsageType = pm.UsageType
                }).ToList();

                map.Products[product.ProductName] = new ProductMaterialsDTO
                {
                    ProductId = product.ProductId,
                    ProductCode = product.ProductCode ?? $"PROD{product.ProductId}",
                    Price = product.Price,
                    Materials = materials,
                    StepCount = process.ProcessOperations.Count
                };
            }
        }

        _logger.LogInformation("Product-materials map by name built with {Count} products", map.Products.Count);
        return map;
    }
}