using Microsoft.EntityFrameworkCore;
using CoffeeMachine.Data;
using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public class ProductRepository : Repository<Product>, IProductRepository
{
    private readonly CoffeeMachineDbContext _context;

    public ProductRepository(CoffeeMachineDbContext context) : base(context)
    {
        _context = context;
    }

    public async Task<Product> UpdateAsync(Product product) {
        //Ensure Dateime field are UTC
        if (product.CreatedAt.HasValue && product.CreatedAt.Value.Kind != DateTimeKind.Utc)
            product.CreatedAt = DateTime.SpecifyKind(product.CreatedAt.Value, DateTimeKind.Utc);
        
        if (product.UpdatedAt.HasValue && product.UpdatedAt.Value.Kind != DateTimeKind.Utc)
            product.UpdatedAt = DateTime.SpecifyKind(product.UpdatedAt.Value, DateTimeKind.Utc);

        await base.UpdateAsync(product);
        return product;
    }

    public async Task<Product?> GetProductWithProcessesAsync(int productId)
    {
        return await _context.Products
            .Include(p => p.Processes)
                .ThenInclude(pr => pr.ProcessedMaterials)
                    .ThenInclude(pm => pm.Material)
            .FirstOrDefaultAsync(p => p.ProductId == productId);
    }

    public async Task<IEnumerable<Product>> GetActiveProductsAsync()
    {
        return await _context.Products
            .Where(p => p.IsActive)
            .ToListAsync();
    }

    public async Task<IEnumerable<Product>> GetProductsByTypeAsync(string productType)
    {
        return await _context.Products
            .Where(p => p.ProductType == productType)
            .ToListAsync();
    }

    public async Task<IEnumerable<Product>> GetProductsByCategoryAsync(string category)
    {
        return await _context.Products
            .Where(p => p.Category == category)
            .ToListAsync();
    }
}