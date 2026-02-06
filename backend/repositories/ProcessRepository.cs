using Microsoft.EntityFrameworkCore;
using CoffeeMachine.Data;
using CoffeeMachine.Models;

namespace CoffeeMachine.Repositories;

public class ProcessRepository : Repository<Process>, IProcessRepository
{
    private readonly CoffeeMachineDbContext _context;

    public ProcessRepository(CoffeeMachineDbContext context) : base(context)
    {
        _context = context;
    }

    public async Task<Process?> GetProcessWithDetailsAsync(int processId)
    {
        return await _context.Processes
            .Include(p => p.Product)
            .Include(p => p.ProcessOperations)
                .ThenInclude(po => po.Operation)
            .Include(p => p.ProcessedMaterials)
                .ThenInclude(pm => pm.Material)
            .FirstOrDefaultAsync(p => p.ProcessId == processId);
    }

    public async Task<IEnumerable<Process>> GetProcessesByProductIdAsync(int productId)
    {
        return await _context.Processes
            .Where(p => p.ProductId == productId)
            .Include(p => p.ProcessOperations)
                .ThenInclude(po => po.Operation)
            .ToListAsync();
    }

    public async Task<Process?> GetDefaultProcessForProductAsync(int productId)
    {
        return await _context.Processes
            .Where(p => p.ProductId == productId && p.IsDefault)
            .Include(p => p.ProcessOperations)
                .ThenInclude(po => po.Operation)
            .Include(p => p.ProcessedMaterials)
                .ThenInclude(pm => pm.Material)
            .FirstOrDefaultAsync();
    }

    public async Task<IEnumerable<Process>> GetProcessesByTypeAsync(string processType)
    {
        return await _context.Processes
            .Where(p => p.Type == processType)
            .Include(p => p.Product)
            .ToListAsync();
    }
}