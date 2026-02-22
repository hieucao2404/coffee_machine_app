using CoffeeMachine.Dto;
using CoffeeMachine.Models;
using CoffeeMachine.Repositories;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.Service;

public class MaterialService : IMaterialService
{
    private readonly IMaterialRepository _materialRepository;
    private readonly ILogger<MaterialService> _logger;

    public MaterialService(IMaterialRepository materialRepository, ILogger<MaterialService> logger)
    {
        _materialRepository = materialRepository;
        _logger = logger;
    }
    public async Task<MaterialResponseDTO> CreateMaterialAsync(MaterialCreateDTO createDto)
    {
        _logger.LogInformation("Creating new material: {MaterialName}", createDto.MaterialName);

        var material = new Material
        {
            MaterialName = createDto.MaterialName,
            MaterialUnit = createDto.MaterialUnit,
            CostPerUnit = createDto.CostPerUnit,
            StockQuantity = createDto.StockQuantity,
            IsConsumable = createDto.IsConsumable,
            ImageUrl = createDto.ImageUrl,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        await _materialRepository.AddAsync(material);
        await _materialRepository.SaveChangesAsync();

        _logger.LogInformation("Material created successfully: {MaterialId}", material.MaterialId);
        return MapToResponseDTO(material);
    }

    public async Task<MaterialResponseDTO?> GetMaterialByIdAsync(int materialId)
    {
        var material = await _materialRepository.GetByIdAsync(materialId);
        return material != null ? MapToResponseDTO(material) : null;
    }

    public async Task<IEnumerable<MaterialResponseDTO>> GetAllMaterialsAsync()
    {
        var materials = await _materialRepository.GetAllAsync();
        return materials.Select(MapToResponseDTO);
    }

    public async Task<MaterialResponseDTO?> UpdateMaterialAsync(int id, MaterialUpdateDTO dto)
    {
        _logger.LogInformation("Updating material: {MaterialId}", id);

        var material = await _materialRepository.GetByIdAsync(id);
        if (material == null)
        {
            _logger.LogWarning("Material not found: {MaterialId}", id);
            return null;
        }

        // Update only provided fields
        if (dto.MaterialName != null)
            material.MaterialName = dto.MaterialName;
        
        if (dto.MaterialUnit != null)
            material.MaterialUnit = dto.MaterialUnit;
        
        if (dto.CostPerUnit != null)
            material.CostPerUnit = dto.CostPerUnit;
        
        if (dto.StockQuantity != null)
            material.StockQuantity = dto.StockQuantity;
        
        if (dto.IsConsumable != null)
            material.IsConsumable = dto.IsConsumable;
        
        if (dto.ImageUrl != null)  // ← NEW
            material.ImageUrl = dto.ImageUrl;

        material.UpdatedAt = DateTime.UtcNow;

        await _materialRepository.UpdateAsync(material);
        await _materialRepository.SaveChangesAsync();

        _logger.LogInformation("Material updated successfully: {MaterialId}", id);
        return new MaterialResponseDTO
        {
            MaterialId = material.MaterialId,
            MaterialName = material.MaterialName,
            MaterialUnit = material.MaterialUnit,
            CostPerUnit = material.CostPerUnit,
            StockQuantity = material.StockQuantity,
            IsConsumable = material.IsConsumable,
            ImageUrl = material.ImageUrl,  // ← NEW
            CreatedAt = material.CreatedAt ?? DateTime.UtcNow,
            UpdatedAt = material.UpdatedAt ?? DateTime.UtcNow
        };
    }

    public async Task<bool> DeleteMaterialAsync(int materialId)
    {
        _logger.LogInformation("Deleting material: {MaterialId}", materialId);

        var material = await _materialRepository.GetByIdAsync(materialId);
        if (material == null)
        {
            _logger.LogWarning("Material not found: {MaterialId}", materialId);
            return false;
        }

        await _materialRepository.DeleteAsync(material);
        await _materialRepository.SaveChangesAsync();

        _logger.LogInformation("Material deleted successfully: {MaterialId}", materialId);
        return true;
    }

    public async Task<MaterialResponseDTO?> AdjustStockAsync(StockAdjustmentDTO adjustmentDto)
    {
        _logger.LogInformation("Adjusting stock for material: {MaterialId}, Type: {Type}, Quantity: {Quantity}",
            adjustmentDto.MaterialId, adjustmentDto.AdjustmentType, adjustmentDto.AdjustmentQuantity);

        var material = await _materialRepository.GetByIdAsync(adjustmentDto.MaterialId);
        if (material == null)
        {
            _logger.LogWarning("Material not found: {MaterialId}", adjustmentDto.MaterialId);
            return null;
        }

        switch (adjustmentDto.AdjustmentType.ToUpper())
        {
            case "ADD":
                material.StockQuantity = (material.StockQuantity ?? 0) + adjustmentDto.AdjustmentQuantity;
                break;
            case "SUBTRACT":
                material.StockQuantity = (material.StockQuantity ?? 0) - adjustmentDto.AdjustmentQuantity;
                if (material.StockQuantity < 0)
                {
                    _logger.LogWarning("Stock quantity cannot be negative. Setting to 0.");
                    material.StockQuantity = 0;
                }
                break;
            case "SET":
                material.StockQuantity = adjustmentDto.AdjustmentQuantity;
                break;
            default:
                _logger.LogError("Invalid adjustment type: {Type}", adjustmentDto.AdjustmentType);
                throw new ArgumentException($"Invalid adjustment type: {adjustmentDto.AdjustmentType}");
        }

        material.UpdatedAt = DateTime.UtcNow;
        await _materialRepository.UpdateAsync(material);
        await _materialRepository.SaveChangesAsync();

        _logger.LogInformation("Stock adjusted successfully. New quantity: {Quantity}", material.StockQuantity);
        return MapToResponseDTO(material);
    }

    public async Task<IEnumerable<MaterialResponseDTO>> GetLowStockMaterialsAsync(decimal threshold = 10)
    {
        var materials = await _materialRepository.GetLowStockMaterialsAsync(threshold);
        return materials.Select(MapToResponseDTO);
    }

    public async Task<IEnumerable<MaterialResponseDTO>> GetConsumableMaterialsAsync()
    {
        var materials = await _materialRepository.GetConsumableMaterialsAsync();
        return materials.Select(MapToResponseDTO);
    }

    public async Task<MaterialResponseDTO?> GetMaterialByNameAsync(string materialName)
    {
        var material = await _materialRepository.GetMaterialByNameAsync(materialName);
        return material != null ? MapToResponseDTO(material) : null;
    }

    public async Task<bool> BulkUpdateStockAsync(IEnumerable<StockAdjustmentDTO> adjustments)
    {
        _logger.LogInformation("Performing bulk stock update for {Count} materials", adjustments.Count());

        try
        {
            foreach (var adjustment in adjustments)
            {
                await AdjustStockAsync(adjustment);
            }
            return true;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error during bulk stock update");
            return false;
        }
    }

    private MaterialResponseDTO MapToResponseDTO(Material material)
    {
        return new MaterialResponseDTO
        {
            MaterialId = material.MaterialId,
            MaterialName = material.MaterialName,
            MaterialUnit = material.MaterialUnit,
            CostPerUnit = material.CostPerUnit,
            StockQuantity = material.StockQuantity,
            IsConsumable = material.IsConsumable,
            ImageUrl = material.ImageUrl,
            // Ensure DateTime is UTC
            CreatedAt = material.CreatedAt.HasValue 
                ? DateTime.SpecifyKind(material.CreatedAt.Value, DateTimeKind.Utc)
                : DateTime.UtcNow,
            UpdatedAt = material.UpdatedAt.HasValue 
                ? DateTime.SpecifyKind(material.UpdatedAt.Value, DateTimeKind.Utc)
                : DateTime.UtcNow
        };
    }
}