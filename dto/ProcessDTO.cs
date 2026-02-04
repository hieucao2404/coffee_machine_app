namespace CoffeeMachine.Dto;

public class ProcessDTO {
    public int ProcessId {get;set;}
    public int ProductId{get; set;}
    public string? Type{get;set;}
}

public class ProcessCreateDTO{
    public int ProductId{get;set;}
    public int Version {get;set;} = 1;
    public string? Type{get;set;}
    public string? Note{get;set;}
    public bool IsDefault{get;set;} = false;
}

public class ProcessResponseDTO
{
    public int ProcessId{get;set;}
    public int ProductId{get;set;}
    public string? ProductName{get;set;}
    public int Version{get;set;}
    public string? Type{get;set;}
    public string? Note{get;set;}
    public bool IsDefault{get;set;}
}

public class ProcessOperationCreateDTO
{
    public int ProcessId { get; set; }
    public int OperationId { get; set; }
    public int Sequence { get; set; }
    public int? Speed { get; set; }
    public decimal? Temperature { get; set; }
    public int? Duration { get; set; }
    public int? CurrentLimitMa { get; set; }
    public int? TargetPosition { get; set; }
    public string? StopCondition { get; set; }
}

public class ProcessOperationResponseDTO
{
    public int ProcessOperationId { get; set; }
    public int ProcessId { get; set; }
    public int OperationId { get; set; }
    public string OperationName { get; set; } = string.Empty;
    public string? OperationType { get; set; }
    public int Sequence { get; set; }
    public int? Speed { get; set; }
    public decimal? Temperature { get; set; }
    public int? Duration { get; set; }
    public int? CurrentLimitMa { get; set; }
    public int? TargetPosition { get; set; }
    public string? StopCondition { get; set; }
}

public class ProcessedMaterialCreateDTO
{
    public int ProcessId { get; set; }
    public int MaterialId { get; set; }
    public decimal Quantity { get; set; }
    public string? UsageType { get; set; }
}

public class ProcessedMaterialResponseDTO
{
    public int ProcessId { get; set; }
    public int MaterialId { get; set; }
    public string MaterialName { get; set; } = string.Empty;
    public decimal Quantity { get; set; }
    public string? Unit { get; set; }
    public string? UsageType { get; set; }
}

/// <summary>
/// ALL-IN-ONE: Create complete process with steps and materials
/// This is what users will use to set sequences!
/// </summary>
public class CompleteProcessDTO
{
    public int ProductId { get; set; }
    public int Version { get; set; } = 1;
    public string? Type { get; set; }
    public string? Note { get; set; }
    public bool IsDefault { get; set; } = false;
    
    /// <summary>
    /// The sequence of steps (operations) - USER SETS THIS!
    /// </summary>
    public List<ProcessStepCreateDTO> Steps { get; set; } = new();
    
    /// <summary>
    /// Materials needed
    /// </summary>
    public List<MaterialUsageDTO> Materials { get; set; } = new();
}

/// <summary>
/// Single step in the brewing sequence
/// </summary>
public class ProcessStepCreateDTO
{
    public int OperationId { get; set; }
    public int Sequence { get; set; }  // ← USER SETS THIS (1, 2, 3...)
    public int? Speed { get; set; }
    public decimal? Temperature { get; set; }
    public int? Duration { get; set; }
    public int? CurrentLimitMa { get; set; }
    public int? TargetPosition { get; set; }
    public string? StopCondition { get; set; }
}

/// <summary>
/// Material usage in process
/// </summary>
public class MaterialUsageDTO
{
    public int MaterialId { get; set; }
    public decimal Quantity { get; set; }
    public string? UsageType { get; set; }
    public int? Sequence { get; set; }  // NEW: Which step uses this material (NULL = used across all steps)
}

/// <summary>
/// Material requirement - used in brewing and HashMap responses
    /// </summary>
public class MaterialRequirementDTO
{
    public int MaterialId { get; set; }
    public string MaterialName { get; set; } = string.Empty;
    public decimal Quantity { get; set; }
    public string? Unit { get; set; }
    public string? UsageType { get; set; }
}