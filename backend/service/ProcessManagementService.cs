using CoffeeMachine.Dto;
using CoffeeMachine.Models;
using CoffeeMachine.Repositories;
using CoffeeMachine.Data;

namespace CoffeeMachine.Service;

public class ProcessManagementService : IProcessManagementService
{
    private readonly IProcessRepository _processRepository;
    private readonly IProductRepository _productRepository;
    private readonly IMaterialRepository _materialRepository;  // ← FIXED: IMaterialRepository
    private readonly IOperationRepository _operationRepository;
    private readonly CoffeeMachineDbContext _context;  // ← FIXED: CoffeeMachineDbContext
    private readonly ILogger<ProcessManagementService> _logger;

    public ProcessManagementService(
        IProcessRepository processRepository,
        IProductRepository productRepository,
        IMaterialRepository materialRepository,
        IOperationRepository operationRepository,
        CoffeeMachineDbContext context,
        ILogger<ProcessManagementService> logger)
    {
        _processRepository = processRepository;
        _productRepository = productRepository;
        _materialRepository = materialRepository;
        _operationRepository = operationRepository;
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

        // 3. Add process operations (THE SEQUENCE STEPS!)
        foreach (var step in dto.Steps.OrderBy(s => s.Sequence))
        {
            var operation = await _operationRepository.GetByIdAsync(step.OperationId);
            if (operation == null)
            {
                _logger.LogWarning("Operation {OperationId} not found, skipping", step.OperationId);
                continue;
            }

            var processOp = new ProcessOperation
            {
                ProcessId = process.ProcessId,
                OperationId = step.OperationId,
                Sequence = step.Sequence,
                Speed = step.Speed,
                Temperature = step.Temperature,
                Duration = step.Duration,
                CurrentLimitMa = step.CurrentLimitMa,
                TargetPosition = step.TargetPosition,
                StopCondition = step.StopCondition
            };

            _context.Set<ProcessOperation>().Add(processOp);
        }

        // 4. Add processed materials
        foreach (var mat in dto.Materials)
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
                Sequence = mat.Sequence  // Link material to specific step
            };

            _context.Set<ProcessedMaterial>().Add(processedMat);
        }

        await _context.SaveChangesAsync();

        _logger.LogInformation("Process {ProcessId} complete with {StepCount} steps and {MaterialCount} materials",
            process.ProcessId, dto.Steps.Count, dto.Materials.Count);

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

    public async Task<List<ProcessOperationResponseDTO>> GetProcessStepsAsync(int processId)
    {
        var process = await _processRepository.GetProcessWithDetailsAsync(processId);
        if (process == null)
            return new List<ProcessOperationResponseDTO>();

        return process.ProcessOperations
            .OrderBy(po => po.Sequence)
            .Select(po => new ProcessOperationResponseDTO
            {
                ProcessOperationId = po.ProcessOperationId,
                ProcessId = po.ProcessId,
                OperationId = po.OperationId,
                OperationName = po.Operation.OperationName,
                OperationType = po.Operation.Type,
                Sequence = po.Sequence,
                Speed = po.Speed,
                Temperature = po.Temperature,
                Duration = po.Duration,
                CurrentLimitMa = po.CurrentLimitMa,
                TargetPosition = po.TargetPosition,
                StopCondition = po.StopCondition
            }).ToList();
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
            UsageType = pm.UsageType
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
}