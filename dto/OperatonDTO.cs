namespace CoffeeMachine.Dto;

public class OperationDTO {
    public int OperationId { get; set; }
    public string OperationName { get; set; } = string.Empty;
    public string? Type { get; set; }
}

public class OperationCreateDTO {
    public string OperationName{get; set;} = string.Empty;
    public string? Type{get;set;}
}

public class OperationUpdateDTO{
    public string? OperationName{get;set;}
    public string? Type{get;set;}
}

public class OperationResponseDTO{
    public int OperationId{get; set;}
    public string OperationName{get;set;} = string.Empty;
    public string? Type{get;set;}
}