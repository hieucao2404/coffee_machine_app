namespace CoffeeMachine.service.Hardware;

public interface ISTM32CommunicationService
{
    Task<bool> ConnectAsync(string portName = "", int baudRate = 115200);
    Task DisconnectAsync();
    Task<STM32Response> SendCommandAsync(STM32BrewCommand command);
    Task<STM32Response> GetStatusAsync();
    string[] GetAvailablePorts();
    bool IsConnected { get; }
}