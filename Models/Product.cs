namespace CoffeeMachine.Models;

public class Product {
    public int ProductId{get; set;}
    public string? ProductCode{get; set;}
    public string ProductName{get;set;} = string.Empty;
    public string? ProductType{get;set;}
    public string? Category{get;set;}
    public decimal? Price{get; set;}
    public string? Description{get; set;}
    public bool IsActive{get; set;} =true;
    public string? ImageUrl{get;set;}  // Changed from Image to ImageUrl
    public DateTime? CreatedAt {get; set;}
    public DateTime? UpdatedAt {get; set;}

    public ICollection<Process> Processes {get; set;} = new List<Process>();
}