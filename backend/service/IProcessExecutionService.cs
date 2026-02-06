namespace CoffeeMachine.service;

public class ProcessExecutionResult
{
    public bool Success { get; set; }
    public string Message { get; set; } = string.Empty;
    public DateTime StartTime { get; set; }
    public DateTime? EndTime { get; set; }
    public List<string> ExecutionLog { get; set; } = new();
}

public interface IProcessExecutionService
{
    Task<ProcessExecutionResult> ExecuteProcessAsync(int processId);
    Task<ProcessExecutionResult> InitializeMachineAsync();
    Task<ProcessExecutionResult> CleanMachineAsync();
}