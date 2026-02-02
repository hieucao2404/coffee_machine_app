namespace CoffeeMachine.dto;

public class OperationDTO {
    public int OperationId { get; set; }
    public string OperationName { get; set; } = string.Empty;
    public string? Type { get; set; }
}