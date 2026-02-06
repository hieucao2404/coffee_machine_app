namespace CoffeeMachine.Dto;

public class ProductMaterialMapDTO
{
    public Dictionary<string, ProductMaterialsDTO> Products { get; set; } = new();
}

public class ProductMaterialsDTO
{
    public int ProductId { get; set; }
    public string ProductCode { get; set; } = string.Empty;
    public decimal? Price { get; set; }
    public List<MaterialRequirementDTO> Materials { get; set; } = new();
    public int StepCount { get; set; }
}

//Simple numeric key
public class ProductMaterialsDictionaryDTO
{
    public Dictionary<int, List<MaterialRequirementDTO>> ProductMaterials { get; set; } = new();
}