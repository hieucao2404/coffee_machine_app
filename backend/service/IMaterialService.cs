using CoffeeMachine.Dto;
namespace CoffeeMachine.Service;

public interface IMaterialService
{
    //CRUD Operation
    Task<MaterialResponseDTO> CreateMaterialAsync(MaterialCreateDTO createDto);
    Task<MaterialResponseDTO?> GetMaterialByIdAsync(int materialId);
    Task<IEnumerable<MaterialResponseDTO>> GetAllMaterialsAsync();
    Task<MaterialResponseDTO?> UpdateMaterialAsync(int materialId, MaterialUpdateDTO updateDto);
    Task<bool> DeleteMaterialAsync(int materialId);

    //Stock Management 
    Task<MaterialResponseDTO?> AdjustStockAsync(StockAdjustmentDTO adjustmentDto);
    Task<IEnumerable<MaterialResponseDTO>> GetLowStockMaterialsAsync(decimal threshold = 10);
    Task<IEnumerable<MaterialResponseDTO>> GetConsumableMaterialsAsync();
    Task<MaterialResponseDTO?> GetMaterialByNameAsync(string materialName);

    //Batch Operations
    Task<bool> BulkUpdateStockAsync(IEnumerable<StockAdjustmentDTO> adjustments);
    }
