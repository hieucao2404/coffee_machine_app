using CoffeeMachine.Dto;

namespace CoffeeMachine.Service;

public interface IProcessManagementService
{
    //Create complete process with steps and materials in ONE call
    Task<ProcessResponseDTO?> CreateCompleteProcessAsync(CompleteProcessDTO dto);

    Task<ProcessResponseDTO?> GetProcessAsync(int processId);
    Task<List<ProcessedMaterialResponseDTO>> GetProcessMaterialsAsync(int processId);
    Task<List<ProcessResponseDTO>> GetProductProcessesAsync(int productId);
    Task<List<string>> GetProcessMaterialsSequenceAsync(int processId);
}
