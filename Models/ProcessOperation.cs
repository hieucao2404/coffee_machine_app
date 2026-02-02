namespace CoffeeMachine.Models;

public class ProcessOperation
{
    public int ProcessOperationId { get; set; }
    public int ProcessId { get; set; }
    public int OperationId { get; set; }
    public int Sequence { get; set; }
    public int? Speed { get; set; }
    public decimal? Temperature { get; set; }
    public int? Duration { get; set; }
    public int? CurrentLimitMa { get; set; }
    public int? TargetPosition { get; set; }
    public string? StopCondition { get; set; }

    public Process? Process { get; set; }
    public Operation? Operation { get; set; }
}
