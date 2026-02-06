using CoffeeMachine.Dto;

namespace CoffeeMachine.Service;

public interface IProductService
{
    // CRUD Operations
    Task<ProductResponseDTO> CreateProductAsync(ProductCreateDTO createDto);
    Task<ProductResponseDTO?> GetProductByIdAsync(int productId);
    Task<ProductDetailDTO?> GetProductDetailAsync(int productId);
    Task<IEnumerable<ProductResponseDTO>> GetAllProductsAsync();
    Task<ProductResponseDTO?> UpdateProductAsync(int productId, ProductUpdateDTO updateDto);
    Task<bool> DeleteProductAsync(int productId);
    Task<bool> ToggleProductStatusAsync(int productId, bool isActive);

    // Query Operations
    Task<IEnumerable<ProductResponseDTO>> GetActiveProductsAsync();
    Task<IEnumerable<ProductResponseDTO>> GetProductsByTypeAsync(string productType);
    Task<IEnumerable<ProductResponseDTO>> GetProductsByCategoryAsync(string category);
    Task<IEnumerable<ProductResponseDTO>> SearchProductsAsync(string searchTerm);

    // Product Availability
    Task<bool> IsProductAvailableAsync(int productId);
    Task<Dictionary<string, decimal>> GetProductMaterialRequirementsAsync(int productId);

    // service/IProductService.cs - Add these methods at the end
    Task<Dictionary<int, List<MaterialRequirementDTO>>> GetAllProductMaterialsMapAsync();
    Task<ProductMaterialMapDTO> GetProductMaterialsMapByNameAsync();
}