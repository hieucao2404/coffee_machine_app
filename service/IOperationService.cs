using CoffeeMachine.Dto;

namespace CoffeeMachine.Service;

public interface IOperationService
{
    // CRUD Operations
    Task<OperationResponseDTO> CreateOperationAsync(OperationCreateDTO createDto);
    Task<OperationResponseDTO?> GetOperationByIdAsync(int operationId);
    Task<IEnumerable<OperationResponseDTO>> GetAllOperationsAsync();
    Task<OperationResponseDTO?> UpdateOperationAsync(int operationId, OperationUpdateDTO updateDto);
    Task<bool> DeleteOperationAsync(int operationId);
    
    // Query Operations
    Task<IEnumerable<OperationResponseDTO>> GetOperationsByTypeAsync(string operationType);
    Task<OperationResponseDTO?> GetOperationByNameAsync(string operationName);
}