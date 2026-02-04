# Simplified Material-Based Command System

## Backend → STM32 Command

The backend sends **operation name + material quantity only**. STM32 handles all hardware control.

### Example Command (JSON)

```json
{
  "commandType": "BREW",
  "productId": 2,
  "processId": 1,
  "productName": "Cappuccino",
  "steps": [
    {
      "sequence": 1,
      "operationName": "DISPENSE_CUP",
      "material": {"materialName": "Paper Cup", "quantity": 1, "unit": "piece"}
    },
    {
      "sequence": 2,
      "operationName": "HEAT_WATER",
      "material": null
    },
    {
      "sequence": 3,
      "operationName": "STEAM_MILK",
      "material": {"materialName": "Whole Milk", "quantity": 150, "unit": "ml"}
    },
    {
      "sequence": 4,
      "operationName": "GRIND_BEANS",
      "material": {"materialName": "Coffee Beans", "quantity": 18, "unit": "g"}
    },
    {
      "sequence": 5,
      "operationName": "PUMP_PRESSURE",
      "material": {"materialName": "Hot Water", "quantity": 35, "unit": "ml"}
    }
  ]
}
```

## STM32 Firmware Logic

| Operation | Material Quantity Used For | STM32 Defaults |
|-----------|----------------------------|----------------|
| GRIND_BEANS | Grind duration (18g → calc time) | Speed: 500 RPM, Current: 2000mA |
| PUMP_PRESSURE | Water volume (35ml) | Pressure: 9 bar, use flow sensor |
| STEAM_MILK | Milk volume (150ml) | Temp: 65°C, use steam sensor |
| HEAT_WATER | _(not used)_ | Temp: 93°C for espresso |
| DISPENSE_CUP | Cup count (1) | Actuator pulse duration |

## Benefits

✅ Backend is simple - just send material info  
✅ STM32 has all hardware logic  
✅ Easy to tune without API changes  
✅ Material tracking per step for inventory  
