using Microsoft.EntityFrameworkCore;
using CoffeeMachine.Data;
using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public class OperationRepository : Repository<Operation>, IOperationRepository {
    private readonly CoffeeMachineDbContext _context;

    public OperationRepository(CoffeeMachineDbContext context) : base(context) {
        _context = context;
    }

    public async Task<IEnumerable<Operation>> GetOperationByTypeAsync(string operationType) {
        return await _context.Operations.Where(o => o.Type == operationType).ToListAsync();
    }

    public async Task<Operation?> GetOperationByNameAsync(string operationName) {
        return await _context.Operations.FirstOrDefaultAsync(o => o.OperationName == operationName);
    }
}