using Microsoft.EntityFrameworkCore;
using CoffeeMachine.Data;
using CoffeeMachine.Repositories;
using CoffeeMachine.Service;
using CoffeeMachine.service;
using CoffeeMachine.service.Hardware;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Add DbContext
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<CoffeeMachineDbContext>(options =>
    options.UseNpgsql(connectionString));

// Register Repositories
builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<IMaterialRepository, MaterialRepository>();
builder.Services.AddScoped<IProcessRepository, ProcessRepository>();
builder.Services.AddScoped<IOperationRepository, OperationRepository>();

// Register Services
builder.Services.AddScoped<IProductService, ProductService>();
builder.Services.AddScoped<IMaterialService, MaterialService>();
builder.Services.AddScoped<IOperationService, OperationService>();
builder.Services.AddScoped<IProcessManagementService, ProcessManagementService>();

// Register Brewing Services
builder.Services.AddScoped<IProcessParameterService, ProcessParameterService>();
builder.Services.AddScoped<IProcessExecutionService, ProcessExecutionService>();
builder.Services.AddSingleton<ISTM32CommunicationService, STM32CommunicationService>();

// Add CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline - Enable Swagger for all environments
app.UseSwagger();
app.UseSwaggerUI(options =>
{
    options.SwaggerEndpoint("/swagger/v1/swagger.json", "Coffee Machine API v1");
    options.RoutePrefix = "swagger";
});

// Add a welcome endpoint at root
app.MapGet("/", () => Results.Ok(new
{
    message = "☕ Coffee Machine Management API",
    version = "1.0",
    documentation = "/swagger",
    endpoints = new
    {
        products = "/api/products",
        materials = "/api/materials",
        operations = "/api/operations"
    }
})).WithName("Welcome").WithOpenApi();

app.UseStaticFiles();  // Fixed - added ()
app.UseCors("AllowAll");
app.UseAuthorization();
app.MapControllers();

app.Run();