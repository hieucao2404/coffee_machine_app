using Microsoft.Extensions.Logging;

namespace CoffeeMachine.Service;

public class ImageService : IImageService
{
    private readonly IWebHostEnvironment _environment;
    private readonly ILogger<ImageService> _logger;

    public ImageService(IWebHostEnvironment environment,
        ILogger<ImageService> logger)
    {
        _environment = environment;
        _logger = logger;
    }

    public async Task<string?> SaveImageAsync(IFormFile file, string folder)
    {
        try
        {
            //validate file type
            var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif", ".webp" };
            var extension = Path.GetExtension(file.FileName).ToLowerInvariant();

            if (!allowedExtensions.Contains(extension))
            {
                _logger.LogWarning("Invalid file type: {Extension}", extension);
                return null;

            }// Validate file size (5MB max)
            if (file.Length > 5 * 1024 * 1024)
            {
                _logger.LogWarning("File too large: {Size} bytes", file.Length);
                return null;
            }

            // Create unique filename
            var fileName = $"{Guid.NewGuid()}{extension}";

            // Use WebRootPath if available, otherwise use current directory
            var webRootPath = _environment.WebRootPath
                ?? Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
            var uploadPath = Path.Combine(webRootPath, "images", folder);

            // Create directory if it doesn't exist
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
                _logger.LogInformation("Created directory: {Path}", uploadPath);
            }

            var filePath = Path.Combine(uploadPath, fileName);

            // Save file
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            var imageUrl = $"/images/{folder}/{fileName}";
            _logger.LogInformation("Image saved successfully: {ImageUrl}", imageUrl);

            return imageUrl;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to save image");
            return null;
        }

    }

    public async Task<bool> DeleteImageAsync(string imageUrl)
    {
        try
        {
            if (string.IsNullOrEmpty(imageUrl))
                return false;

            var filePath = GetImagePath(imageUrl);

            if (File.Exists(filePath))
            {
                await Task.Run(() => File.Delete(filePath));
                _logger.LogInformation("Image deleted: {ImageUrl}", imageUrl);
                return true;
            }

            return false;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to delete image: {ImageUrl}", imageUrl);
            return false;
        }
    }

    public string GetImagePath(string imageUrl)
    {
        if(string.IsNullOrEmpty(imageUrl)) return string.Empty;

        //remvoe leading splash if present
        var relativePath = imageUrl.TrimStart('/');

         var webRootPath = _environment.WebRootPath 
            ?? Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");

        return Path.Combine(webRootPath, relativePath.Replace('/', Path.DirectorySeparatorChar));
    }
}