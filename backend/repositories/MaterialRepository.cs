using Microsoft.EntityFrameworkCore;
using CoffeeMachine.Data;
using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public class MaterialRepository : Repository<Material>, IMaterialRepository
{
    private readonly CoffeeMachineDbContext _context;

    public MaterialRepository(CoffeeMachineDbContext context) : base(context)
    {
        _context = context;
    }

    public async Task<IEnumerable<Material>> GetConsumableMaterialsAsync()
    {
        return await _context.Materials
            .Where(m => m.IsConsumable == true)
            .ToListAsync();
    }

    public async Task<IEnumerable<Material>> GetLowStockMaterialsAsync(decimal threshold)
    {
        return await _context.Materials
            .Where(m => m.StockQuantity < threshold)
            .ToListAsync();
    }

    public async Task<Material?> GetMaterialByNameAsync(string materialName)
    {
        return await _context.Materials
            .FirstOrDefaultAsync(m => m.MaterialName == materialName);
    }

    public async Task UpdateStockQuantityAsync(int materialId, decimal newQuantity)
    {
        var material = await _context.Materials.FindAsync(materialId);
        if (material != null)
        {
            material.StockQuantity = newQuantity;
            material.UpdatedAt = DateTime.UtcNow;
        }
    }
}