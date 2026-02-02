namespace CoffeeMachine.service.Hardware;

public class STM32BrewCommand
{
    public string CommandType { get; set; } = "BREW"; // "BREW", "INIT", "CLEAN"
    public BrewParameters Parameters { get; set; } = new();
}

public class BrewParameters
{
    public int ProcessId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    
    // Motor speeds (from your STM32 code)
    public int LidSpeed { get; set; } = 500;
    public int PistonSpeed { get; set; } = 500;
    
    // Positions (from your STM32 code)
    public int TamperPosition { get; set; } = 3500;
    public int WipeOutPosition { get; set; } = 9999;
    
    // Temperatures (from your STM32 code)
    public float TargetTemperature { get; set; } = 100.0f;
    public float PreInfusionTemp { get; set; } = 80.0f;
    
    // Volumes and times (from your STM32 code)
    public float PumpVolumeMl { get; set; } = 60.0f;
    public int GrinderDurationMs { get; set; } = 20000;
    
    // All brewing steps
    public List<BrewStep> Steps { get; set; } = new();
}

public class BrewStep
{
    public int StepNumber { get; set; }
    public string OperationName { get; set; } = string.Empty;
    public string OperationType { get; set; } = string.Empty;
    
    // Motor control
    public int? Direction { get; set; } // 1 or -1
    public int? Speed { get; set; }
    public int? TargetPosition { get; set; }
    public int? CurrentLimitMa { get; set; }
    public int? TimeoutMs { get; set; }
    
    // Temperature/flow
    public float? Temperature { get; set; }
    public float? FlowRateMl { get; set; }
    
    // Timing
    public int? DurationMs { get; set; }
    public int? DelayAfterMs { get; set; }
}

public class STM32Response
{
    public bool Success { get; set; }
    public string Status { get; set; } = string.Empty; // "COMPLETED", "ERROR", "RUNNING"
    public string Message { get; set; } = string.Empty;
    public int CurrentStep { get; set; }
    public Dictionary<string, object> Data { get; set; } = new();
}
