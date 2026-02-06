using System.Text.Json;
using Microsoft.Extensions.Logging;

namespace CoffeeMachine.service.Hardware;

/// <summary>
/// Simplified STM32 Communication Service - Software Simulation Mode
/// This version focuses on testing software logic without hardware
/// </summary>
public class STM32CommunicationService : ISTM32CommunicationService
{
    private readonly ILogger<STM32CommunicationService> _logger;
    private bool _isConnected = false;

    public STM32CommunicationService(ILogger<STM32CommunicationService> logger)
    {
        _logger = logger;
    }

    public bool IsConnected => _isConnected;

    public async Task<bool> ConnectAsync(string portName = "", int baudRate = 115200)
    {
        _logger.LogInformation("📡 Connecting to STM32 (Simulation Mode)...");
        await Task.Delay(100); // Simulate connection delay
        
        _isConnected = true;
        _logger.LogInformation("✓ Connected to STM32 simulator");
        return true;
    }

    public async Task DisconnectAsync()
    {
        _logger.LogInformation("Disconnecting from STM32 simulator");
        _isConnected = false;
        await Task.CompletedTask;
    }

    public async Task<STM32Response> SendCommandAsync(STM32BrewCommand command)
    {
        _logger.LogInformation($"→ Simulating STM32 command: {command.CommandType}");
        
        // Log command details
        var jsonOptions = new JsonSerializerOptions 
        { 
            WriteIndented = true,
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase 
        };
        var jsonCommand = JsonSerializer.Serialize(command, jsonOptions);
        _logger.LogDebug($"Command JSON:\n{jsonCommand}");

        // Simulate processing delay based on command type
        int delay = command.CommandType.ToUpper() switch
        {
            "INIT" => 500,
            "BREW" => 2000,
            "CLEAN" => 1000,
            _ => 100
        };

        await Task.Delay(delay);

        // Simulate successful response
        var response = new STM32Response
        {
            Success = true,
            Status = "COMPLETED",
            Message = $"{command.CommandType} completed successfully (simulated)",
            CurrentStep = command.Steps.Count,
            Data = new Dictionary<string, object>
            {
                ["simulation"] = true,
                ["command_type"] = command.CommandType,
                ["steps_count"] = command.Steps.Count,
                ["product"] = command.ProductName,
                ["duration_ms"] = delay
            }
        };

        _logger.LogInformation($"← Simulated response: {response.Status}");
        return response;
    }

    public async Task<STM32Response> GetStatusAsync()
    {
        await Task.CompletedTask;
        
        return new STM32Response
        {
            Success = true,
            Status = "READY",
            Message = "STM32 simulator ready",
            Data = new Dictionary<string, object>
            {
                ["mode"] = "simulation",
                ["ready"] = true
            }
        };
    }

    public string[] GetAvailablePorts()
    {
        // Return empty array in simulation mode
        return Array.Empty<string>();
    }
}
