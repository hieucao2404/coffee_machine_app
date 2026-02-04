namespace CoffeeMachine.Dto;

public class MaterialDTO {
    public int MaterialId {get; set;}
    public string MaterialName {get; set;} = string.Empty;
    public decimal StockQuantity{get; set;}
}

public class MaterialCreateDTO{
    public string MaterialName {get; set;}
    public string? MaterialUnit{get;set;}
    public decimal? CostPerUnit{get; set;}
    public decimal StockQuantity{get; set;} = 0.00m;
    public bool IsConsumable{get; set;} =true;
}

public class MaterialUpdateDTO {
    public string? MaterialName{get;set;}
    public string? MaterialUnit{get;set;}
    public decimal? CostPerUnit{get;set;}
    public decimal? StockQuantity{get;set;}
    public bool? IsConsumable{get;set;}
}

public class MaterialResponseDTO{
       public int MaterialId { get; set; }
    public string MaterialName { get; set; } = string.Empty;
    public string? MaterialUnit { get; set; }
    public decimal? CostPerUnit { get; set; }
    public decimal StockQuantity { get; set; }
    public bool IsConsumable { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}