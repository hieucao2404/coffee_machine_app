namespace CoffeeMachine.Dto;

public class BrewCommandDTO
{
    public int ProductId {set;get;}
    public string ProductCode {get;set;} = string.Empty;
    public string ProductName{get;set;} = string.Empty;
    public List<MaterialRequirementDTO> Materials {get;set;} = new();
    public List<ProcessStepDTO> StepDTOs{get;set;} = new();
}

// public class MaterialRequirementDTO
// {
//     public int MaterialId{get;set;}
//     public string MaterialName{get;set;} = string.Empty;
//     public decimal Quantity{get;set;}
//     public string? Unit{get;set;}
//     public string? UsageType{get;set;}
// }

public class ProcessStepDTO{
    public int Sequence{get;set;}
    public string OperationName{get;set;} = string.Empty;
    public string? OperationType{get;set;}

    //Hardware use
    public int? Speed {get;set;}
    public decimal? Temperature{get;set;}
    public int? Duration{get; set;}
    public int? CurrentLimitMa{get;set;}
    public int? TargetPosition{get;set;}
    public string? StopCondition{get;set;}
}

public class BrewStatusDTO{
    public bool IsAvailable{get;set;}
    public string Status{get;set;} = string.Empty;
    public string? Message{get;set;}
    public int? TotalSteps{get;set;}
    public Dictionary<string,decimal>? MissingMaterials{get;set;}
}