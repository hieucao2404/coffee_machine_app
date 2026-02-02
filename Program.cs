using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using CoffeeMachine.Data;
using CoffeeMachine.Repositories;
using CoffeeMachine.service;
using CoffeeMachine.service.Hardware;
using System.Text.Json;

var builder = Host.CreateApplicationBuilder(args);

// Configuration
builder.Configuration.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);

// Database
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<CoffeeMachineDbContext>(options =>
    options.UseNpgsql(connectionString));

// Repositories
builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<IMaterialRepository, MaterialRepository>();
builder.Services.AddScoped<IProcessRepository, ProcessRepository>();
builder.Services.AddScoped<IOperationRepository, OperationRepository>();

// Services
builder.Services.AddSingleton<ISTM32CommunicationService, STM32CommunicationService>();
builder.Services.AddScoped<IProcessParameterService, ProcessParameterService>();
builder.Services.AddScoped<IProcessExecutionService, ProcessExecutionService>();

using var host = builder.Build();

// ═══════════════════════════════════════════════════════════
//                    MAIN APPLICATION
// ═══════════════════════════════════════════════════════════

using (var scope = host.Services.CreateScope())
{
    var parameterService = scope.ServiceProvider.GetRequiredService<IProcessParameterService>();
    var processExecution = scope.ServiceProvider.GetRequiredService<IProcessExecutionService>();
    
    try
    {
        Console.WriteLine("╔════════════════════════════════════════════════════╗");
        Console.WriteLine("║     Coffee Machine Control System v1.0            ║");
        Console.WriteLine("║     Database → .NET → STM32                        ║");
        Console.WriteLine("╚════════════════════════════════════════════════════╝\n");
        
        // ═══════════════════════════════════════════════════
        // STEP 0: Auto-detect STM32 Port
        // ═══════════════════════════════════════════════════
        Console.WriteLine("═══ STEP 0: AUTO-DETECT STM32 ═══\n");

        var stm32Service = scope.ServiceProvider.GetRequiredService<ISTM32CommunicationService>();
        var availablePorts = stm32Service.GetAvailablePorts();

        Console.WriteLine($"🔌 Available Serial Ports ({availablePorts.Length}):");
        foreach (var port in availablePorts)
        {
            Console.WriteLine($"   • {port}");
        }

        Console.WriteLine($"\n🔍 Auto-detecting STM32...");
        var initResult = await processExecution.InitializeMachineAsync();

        foreach(var log in initResult.ExecutionLog)
        {
            Console.WriteLine($"  {log}");
        }

        Console.WriteLine();
        
        // ═══════════════════════════════════════════════════
        // STEP 1: Load Process from Database
        // ═══════════════════════════════════════════════════
        Console.WriteLine("═══ STEP 1: LOAD PROCESS FROM DATABASE ═══\n");
        
        var parameters = await parameterService.GetProcessParametersAsync(1);
        
        if (parameters != null)
        {
            Console.WriteLine($"📦 Product: {parameters.ProductName}");
            Console.WriteLine($"   Type: {parameters.ProcessType}");
            Console.WriteLine($"   Process ID: {parameters.ProcessId}\n");
            
            Console.WriteLine($"🔧 Operations ({parameters.Steps.Count} steps):");
            foreach (var step in parameters.Steps)
            {
                Console.WriteLine($"\n   Step {step.Sequence}: {step.OperationName} ({step.OperationType})");
                if (step.Speed.HasValue) 
                    Console.WriteLine($"      • Speed: {step.Speed}");
                if (step.TargetPosition.HasValue) 
                    Console.WriteLine($"      • Target Position: {step.TargetPosition}");
                if (step.CurrentLimitMa.HasValue) 
                    Console.WriteLine($"      • Current Limit: {step.CurrentLimitMa}mA");
                if (step.Duration.HasValue) 
                    Console.WriteLine($"      • Duration: {step.Duration}ms");
                if (step.Temperature.HasValue) 
                    Console.WriteLine($"      • Temperature: {step.Temperature}°C");
            }
            
            Console.WriteLine($"\n📦 Materials Required:");
            foreach (var mat in parameters.Materials)
            {
                Console.WriteLine($"   • {mat.Quantity}{mat.Unit} {mat.MaterialName} ({mat.UsageType})");
            }
        }
        
        // ═══════════════════════════════════════════════════
        // STEP 2: Build STM32 Command
        // ═══════════════════════════════════════════════════
        Console.WriteLine("\n\n═══ STEP 2: BUILD STM32 COMMAND ═══\n");
        
        var brewCommand = await parameterService.BuildSTM32BrewCommandAsync(1);
        
        Console.WriteLine($"🎯 Command Configuration:");
        Console.WriteLine($"   • Command Type: {brewCommand.CommandType}");
        Console.WriteLine($"   • Product: {brewCommand.Parameters.ProductName}");
        Console.WriteLine($"   • Lid Speed: {brewCommand.Parameters.LidSpeed}");
        Console.WriteLine($"   • Piston Speed: {brewCommand.Parameters.PistonSpeed}");
        Console.WriteLine($"   • Tamper Position: {brewCommand.Parameters.TamperPosition}");
        Console.WriteLine($"   • Wipe-Out Position: {brewCommand.Parameters.WipeOutPosition}");
        Console.WriteLine($"   • Target Temperature: {brewCommand.Parameters.TargetTemperature}°C");
        Console.WriteLine($"   • Pre-Infusion Temp: {brewCommand.Parameters.PreInfusionTemp}°C");
        Console.WriteLine($"   • Pump Volume: {brewCommand.Parameters.PumpVolumeMl}ml");
        Console.WriteLine($"   • Grinder Duration: {brewCommand.Parameters.GrinderDurationMs}ms");
        Console.WriteLine($"   • Total Steps: {brewCommand.Parameters.Steps.Count}");
        
        // ═══════════════════════════════════════════════════
        // STEP 3: Show JSON for STM32
        // ═══════════════════════════════════════════════════
        Console.WriteLine("\n\n═══ STEP 3: JSON COMMAND FOR STM32 ═══\n");
        
        var jsonOptions = new JsonSerializerOptions 
        { 
            WriteIndented = true,
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };
        var json = JsonSerializer.Serialize(brewCommand, jsonOptions);
        Console.WriteLine(json);
        
        // ═══════════════════════════════════════════════════
        // STEP 4: Execute Process
        // ═══════════════════════════════════════════════════
        Console.WriteLine("\n\n═══ STEP 4: EXECUTE BREWING PROCESS ═══\n");
        
        var result = await processExecution.ExecuteProcessAsync(1);
        
        foreach(var log in result.ExecutionLog)
        {
            Console.WriteLine($"  {log}");
        }
        
        Console.WriteLine($"\n⏱️  Duration: {(result.EndTime - result.StartTime)?.TotalSeconds:F2} seconds");
        Console.WriteLine($"📊 Result: {(result.Success ? "✓ SUCCESS" : "✗ FAILED")}");
        
        if (!string.IsNullOrEmpty(result.Message))
        {
            Console.WriteLine($"💬 Message: {result.Message}");
        }
    }
    catch (Exception ex)
    {
        Console.WriteLine($"\n❌ FATAL ERROR: {ex.Message}");
        Console.WriteLine($"\n🔍 Stack Trace:\n{ex.StackTrace}");
    }
}

Console.WriteLine("\n\n╔════════════════════════════════════════════════════╗");
Console.WriteLine("║              Program Complete                      ║");
Console.WriteLine("╚════════════════════════════════════════════════════╝");