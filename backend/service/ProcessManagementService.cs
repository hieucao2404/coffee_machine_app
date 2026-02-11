using CoffeeMachine.Dto;
using CoffeeMachine.Models;
using CoffeeMachine.Repositories;
using CoffeeMachine.Data;

namespace CoffeeMachine.Service;

public class ProcessManagementService : IProcessManagementService
{
    private readonly IProcessRepository _processRepository;
    private readonly IProductRepository _productRepository;
    private readonly IMaterialRepository _materialRepository;
    private readonly CoffeeMachineDbContext _context;
    private readonly ILogger<ProcessManagementService> _logger;

    public ProcessManagementService(
        IProcessRepository processRepository,
        IProductRepository productRepository,
        IMaterialRepository materialRepository,
        CoffeeMachineDbContext context,
        ILogger<ProcessManagementService> logger)
    {
        _processRepository = processRepository;
        _productRepository = productRepository;
        _materialRepository = materialRepository;
        _context = context;
        _logger = logger;
    }

    public async Task<ProcessResponseDTO?> CreateCompleteProcessAsync(CompleteProcessDTO dto)  // ← FIXED: Added ?
    {
        _logger.LogInformation("Creating complete process for product {ProductId}", dto.ProductId);

        // 1. Validate product exists
        var product = await _productRepository.GetByIdAsync(dto.ProductId);
        if (product == null)
        {
            _logger.LogWarning("Product {ProductId} not found", dto.ProductId);
            return null;
        }

        // 2. Create the process (recipe header)
        var process = new Process
        {
            ProductId = dto.ProductId,
            Version = dto.Version,
            Type = dto.Type,
            Note = dto.Note,
            IsDefault = dto.IsDefault
        };

        await _processRepository.AddAsync(process);
        await _processRepository.SaveChangesAsync();

        _logger.LogInformation("Process {ProcessId} created", process.ProcessId);

        // 3. Add processed materials (ordered by sequence)
        foreach (var mat in dto.Materials.OrderBy(m => m.Sequence))
        {
            var material = await _materialRepository.GetByIdAsync(mat.MaterialId);
            if (material == null)
            {
                _logger.LogWarning("Material {MaterialId} not found, skipping", mat.MaterialId);
                continue;
            }

            var processedMat = new ProcessedMaterial
            {
                ProcessId = process.ProcessId,
                MaterialId = mat.MaterialId,
                Quantity = mat.Quantity,
                UsageType = mat.UsageType,
                Sequence = mat.Sequence
            };

            _context.Set<ProcessedMaterial>().Add(processedMat);
        }

        await _context.SaveChangesAsync();

        _logger.LogInformation("Process {ProcessId} complete with {MaterialCount} materials",
            process.ProcessId, dto.Materials.Count);

        return new ProcessResponseDTO
        {
            ProcessId = process.ProcessId,
            ProductId = process.ProductId,
            ProductName = product.ProductName,
            Version = process.Version,
            Type = process.Type,
            Note = process.Note,
            IsDefault = process.IsDefault
        };
    }

    public async Task<ProcessResponseDTO?> GetProcessAsync(int processId)
    {
        var process = await _processRepository.GetByIdAsync(processId);
        if (process == null)
            return null;

        var product = await _productRepository.GetByIdAsync(process.ProductId);

        return new ProcessResponseDTO
        {
            ProcessId = process.ProcessId,
            ProductId = process.ProductId,
            ProductName = product?.ProductName,
            Version = process.Version,
            Type = process.Type,
            Note = process.Note,
            IsDefault = process.IsDefault
        };
    }

    public async Task<List<ProcessedMaterialResponseDTO>> GetProcessMaterialsAsync(int processId)
    {
        var process = await _processRepository.GetProcessWithDetailsAsync(processId);
        if (process == null)
            return new List<ProcessedMaterialResponseDTO>();

        return process.ProcessedMaterials.Select(pm => new ProcessedMaterialResponseDTO
        {
            ProcessId = pm.ProcessId,
            MaterialId = pm.MaterialId,
            MaterialName = pm.Material.MaterialName,
            Quantity = pm.Quantity,
            Unit = pm.Material.MaterialUnit,
            UsageType = pm.UsageType,
            Sequence = pm.Sequence
        }).ToList();
    }

    public async Task<List<ProcessResponseDTO>> GetProductProcessesAsync(int productId)
    {
        var processes = await _processRepository.GetProcessesByProductIdAsync(productId);
        var product = await _productRepository.GetByIdAsync(productId);

        return processes.Select(p => new ProcessResponseDTO
        {
            ProcessId = p.ProcessId,
            ProductId = p.ProductId,
            ProductName = product?.ProductName,
            Version = p.Version,
            Type = p.Type,
            Note = p.Note,
            IsDefault = p.IsDefault
        }).ToList();
    }

    public async Task<List<string>> GetProcessMaterialsSequenceAsync(int processId)
    {
        var process = await _processRepository.GetProcessWithDetailsAsync(processId);
        if (process == null)
        {
            _logger.LogWarning("Process {ProcessId} not found", processId);
            return new List<string>();
        }

        var result = process.ProcessedMaterials
            .OrderBy(pm => pm.Sequence ?? int.MaxValue)
            .Select(pm => pm.Material.MaterialName)
            .ToList();

        _logger.LogInformation("Process {ProcessId} has {Count} materials: {Materials}",
            processId, result.Count, string.Join(", ", result));

        return result;
    }
}