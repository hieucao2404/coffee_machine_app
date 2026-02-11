# Coffee Machine Architecture - Simplified

## ✅ What Changed

### Removed Tables & Code
- ❌ `operation` table (deleted from database schema)
- ❌ `process_operation` table (deleted from database schema)
- ❌ `Operation.cs` model
- ❌ `ProcessOperation.cs` model
- ❌ `OperationRepository.cs` & `IOperationRepository.cs`
- ❌ `OperationService.cs` & `IOperationService.cs`
- ❌ `OperationsController.cs`
- ❌ `GetProcessStepsAsync()` method

### Kept & Simplified
- ✅ `process` table
- ✅ `processed_material` table (with `sequence` field)
- ✅ `material` table
- ✅ `product` table
- ✅ Process management (materials only)
- ✅ Material services

## 🎯 New Architecture

### Database Schema
```
product
  ├── process (brewing recipe)
  │    └── processed_material (sequence: 1, 2, 3...)
  │         └── material
  └── ... (other relations)
```

### STM32 Command Format
**Before (Complex):**
```json
{
  "CommandType": "BREW",
  "ProductName": "Espresso",
  "Steps": [
    {
      "Sequence": 1,
      "OperationName": "HEAT_WATER",
      "Speed": 100,
      "Temperature": 92.5,
      "Duration": 30000,
      "Material": { "Water": "200ml" }
    },
    {
      "Sequence": 2,
      "OperationName": "GRIND_BEANS",
      "Speed": 80,
      "CurrentLimitMa": 500,
      "Material": { "Coffee Beans": "18g" }
    }
  ]
}
```

**After (Simplified):**
```json
{
  "CommandType": "BREW",
  "ProductName": "Espresso",
  "Materials": [
    {
      "Sequence": 1,
      "MaterialName": "Water",
      "Quantity": 200,
      "Unit": "ml"
    },
    {
      "Sequence": 2,
      "MaterialName": "Coffee Beans",
      "Quantity": 18,
      "Unit": "g"
    },
    {
      "Sequence": 3,
      "MaterialName": "Cup",
      "Quantity": 1,
      "Unit": "piece"
    }
  ]
}
```

## 🔧 How It Works Now

1. **Backend**: Stores materials in sequence order (1, 2, 3...)
2. **API**: Sends ordered array of materials to STM32
3. **STM32 Firmware**: Receives materials and knows what to do:
   - Water → Heat it
   - Coffee Beans → Grind them
   - Cup → Dispense into it

## 📊 Benefits

✅ **Simpler Database** - 2 tables removed  
✅ **Simpler Backend** - Less code to maintain  
✅ **More Flexible** - Change brewing logic in STM32 without database migration  
✅ **Better Separation** - Hardware logic in hardware, data storage in database  
✅ **Easier Testing** - Just test material sequences

## 🗑️ Files Renamed (Backup)

These files were renamed to `.old` extension:
- `repositories/OperationRepository.cs.old`
- `repositories/IOperationRepository.cs.old`
- `service/OperationService.cs.old`
- `service/IOperationService.cs.old`
- `controllers/OperationsController.cs.old`
- `Models/Operation.cs.old`
- `Models/ProcessOperation.cs.old`

You can safely delete these files after confirming everything works.

## 🚀 Next Steps

1. ✅ Backend builds successfully (0 errors)
2. ⏭️ Update database schema (drop operation tables)
3. ⏭️ Test brewing with simplified command
4. ⏭️ Update STM32 firmware to handle material-based commands

Product → Process → ProcessedMaterials (sequence: 1, 2, 3...)
                           ↓
                    STM32BrewCommand
                    {
                      Materials: [
                        {Seq: 1, Water, 200ml},
                        {Seq: 2, Beans, 18g},
                        {Seq: 3, Cup, 1pc}
                      ]
                    }
                           ↓
                  STM32 Firmware handles:
                  - Water → Heat
                  - Beans → Grind
                  - Cup → Dispense