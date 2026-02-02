using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public interface IOperationRepository : IRepository<Operation> {
    Task<IEnumerable<Operation>> GetOperationByTypeAsync(string operation);
    Task<Operation?> GetOperationByNameAsync(string operationName);
}