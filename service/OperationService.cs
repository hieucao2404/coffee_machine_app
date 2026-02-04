using CoffeeMachine.Dto;
using CoffeeMachine.Models;
using CoffeeMachine.Repositories;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.Service;

public class OperationService : IOperationService
{
    private readonly IOperationRepository _operationRepository;
    private readonly ILogger<OperationService> _logger;

    public OperationService(IOperationRepository operationRepository, ILogger<OperationService> logger)
    {
        _operationRepository = operationRepository;
        _logger = logger;
    }

    public async Task<OperationResponseDTO> CreateOperationAsync(OperationCreateDTO createDto)
    {
        _logger.LogInformation("Creating new operation: {OperationName}", createDto.OperationName);

        var operation = new Operation
        {
            OperationName = createDto.OperationName,
            Type = createDto.Type
        };

        await _operationRepository.AddAsync(operation);
        await _operationRepository.SaveChangesAsync();

        _logger.LogInformation("Operation created successfully: {OperationId}", operation.OperationId);
        return MapToResponseDTO(operation);
    }

    public async Task<OperationResponseDTO?> GetOperationByIdAsync(int operationId)
    {
        var operation = await _operationRepository.GetByIdAsync(operationId);
        return operation != null ? MapToResponseDTO(operation) : null;
    }

    public async Task<IEnumerable<OperationResponseDTO>> GetAllOperationsAsync()
    {
        var operations = await _operationRepository.GetAllAsync();
        return operations.Select(MapToResponseDTO);
    }

    public async Task<OperationResponseDTO?> UpdateOperationAsync(int operationId, OperationUpdateDTO updateDto)
    {
        _logger.LogInformation("Updating operation: {OperationId}", operationId);

        var operation = await _operationRepository.GetByIdAsync(operationId);
        if (operation == null)
        {
            _logger.LogWarning("Operation not found: {OperationId}", operationId);
            return null;
        }

        // Update only provided fields
        if (updateDto.OperationName != null)
            operation.OperationName = updateDto.OperationName;
        
        if (updateDto.Type != null)
            operation.Type = updateDto.Type;

        await _operationRepository.UpdateAsync(operation);
        await _operationRepository.SaveChangesAsync();

        _logger.LogInformation("Operation updated successfully: {OperationId}", operationId);
        return MapToResponseDTO(operation);
    }

    public async Task<bool> DeleteOperationAsync(int operationId)
    {
        _logger.LogInformation("Deleting operation: {OperationId}", operationId);

        var operation = await _operationRepository.GetByIdAsync(operationId);
        if (operation == null)
        {
            _logger.LogWarning("Operation not found: {OperationId}", operationId);
            return false;
        }

        await _operationRepository.DeleteAsync(operation);
        await _operationRepository.SaveChangesAsync();

        _logger.LogInformation("Operation deleted successfully: {OperationId}", operationId);
        return true;
    }

    public async Task<IEnumerable<OperationResponseDTO>> GetOperationsByTypeAsync(string operationType)
    {
        var operations = await _operationRepository.GetOperationByTypeAsync(operationType);
        return operations.Select(MapToResponseDTO);
    }

    public async Task<OperationResponseDTO?> GetOperationByNameAsync(string operationName)
    {
        var operation = await _operationRepository.GetOperationByNameAsync(operationName);
        return operation != null ? MapToResponseDTO(operation) : null;
    }

    private OperationResponseDTO MapToResponseDTO(Operation operation)
    {
        return new OperationResponseDTO
        {
            OperationId = operation.OperationId,
            OperationName = operation.OperationName,
            Type = operation.Type
        };
    }
}