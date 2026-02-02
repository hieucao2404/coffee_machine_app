using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public interface IProcessRepository : IRepository<Process>
{
    Task<Process?> GetProcessWithDetailsAsync(int processId);
    Task<IEnumerable<Process>> GetProcessesByProductIdAsync(int productId);
    Task<Process?> GetDefaultProcessForProductAsync(int productId);
    Task<IEnumerable<Process>> GetProcessesByTypeAsync(string processType);
}