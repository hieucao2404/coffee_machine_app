using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public interface IMaterialRepository : IRepository<Material>
{
    Task<IEnumerable<Material>> GetConsumableMaterialsAsync();
    Task<IEnumerable<Material>> GetLowStockMaterialsAsync(decimal threshold);
    Task<Material?> GetMaterialByNameAsync(string materialName);
    Task UpdateStockQuantityAsync(int materialId, decimal newQuantity);
}