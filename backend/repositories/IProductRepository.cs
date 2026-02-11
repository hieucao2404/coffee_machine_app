using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public interface IProductRepository : IRepository<Product>
{
    Task<Product?> GetProductWithProcessesAsync(int productId);
    Task<IEnumerable<Product>> GetActiveProductsAsync();
    Task<IEnumerable<Product>> GetProductsByTypeAsync(string productType);
    Task<IEnumerable<Product>> GetProductsByCategoryAsync(string category);
    Task<Product> UpdateAsync(Product product);
}