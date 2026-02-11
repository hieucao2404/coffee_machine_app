namespace CoffeeMachine.Service;

public interface IImageService{
    Task<string?> SaveImageAsync(IFormFile file, string folder);
    Task<bool> DeleteImageAsync(string imageUrl);
    string GetImagePath(string imageUrl);
}