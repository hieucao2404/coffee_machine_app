## How to Define Specific Sequence with Specific Material

### Database Structure

After the update, `processed_material` now has a `sequence` column that links materials to specific operation steps:

```sql
CREATE TABLE processed_material (
  process_id INTEGER NOT NULL,
  material_id INTEGER NOT NULL,
  quantity NUMERIC NOT NULL,
  usage_type VARCHAR,
  sequence INTEGER,  -- Links to process_operation.sequence (NULL = used across all steps)
  PRIMARY KEY (process_id, material_id, sequence)
);
```

### Example: Making Cappuccino

#### Step 1: Define Operations (The Steps)
```json
POST /api/process/complete
{
  "productId": 2,
  "version": 1,
  "type": "Standard",
  "note": "Cappuccino with proper sequencing",
  "isDefault": true,
  
  "steps": [
    {
      "operationId": 1,           // HEAT_WATER
      "sequence": 1,
      "temperature": 120.0
    },
    {
      "operationId": 4,           // STEAM_MILK
      "sequence": 2,
      "temperature": 120.0,
      "duration": 15000
    },
    {
      "operationId": 2,           // GRIND_BEANS
      "sequence": 3,
      "speed": 5,
      "duration": 3000
    },
    {
      "operationId": 3,           // PUMP_PRESSURE
      "sequence": 4,
      "temperature": 93.0,
      "duration": 30000
    }
  ],
  
  "materials": [
    {
      "materialId": 3,            // Whole Milk
      "quantity": 150.0,
      "usageType": "Ingredient",
      "sequence": 2               // ✅ Used in Step 2 (STEAM_MILK)
    },
    {
      "materialId": 1,            // Coffee Beans
      "quantity": 18.0,
      "usageType": "Ingredient",
      "sequence": 3               // ✅ Used in Step 3 (GRIND_BEANS)
    },
    {
      "materialId": 2,            // Water
      "quantity": 35.0,
      "usageType": "Ingredient",
      "sequence": 4               // ✅ Used in Step 4 (PUMP_PRESSURE)
    },
    {
      "materialId": 4,            // Paper Cup
      "quantity": 1.0,
      "usageType": "Container",
      "sequence": null            // ✅ Not tied to specific step
    }
  ]
}
```

### How It Works

When you execute the process, the system knows:

| Sequence | Operation | Material Used | Quantity | Action |
|----------|-----------|---------------|----------|--------|
| 1 | HEAT_WATER | _(none)_ | - | Heat boiler to 120°C |
| 2 | STEAM_MILK | **Whole Milk** | 150ml | Steam the milk |
| 3 | GRIND_BEANS | **Coffee Beans** | 18g | Grind beans at speed 5 |
| 4 | PUMP_PRESSURE | **Water** | 35ml | Extract espresso shot |
| - | _(pre-step)_ | **Paper Cup** | 1 cup | Dispensed before brewing |

### Query to Get Complete Process with Materials

```sql
SELECT 
    po.sequence,
    o.operation_name,
    m.material_name,
    pm.quantity,
    pm.usage_type,
    po.temperature,
    po.speed,
    po.duration
FROM process_operation po
LEFT JOIN operation o ON po.operation_id = o.operation_id
LEFT JOIN processed_material pm ON po.process_id = pm.process_id 
    AND po.sequence = pm.sequence  -- ✅ This links step to material
LEFT JOIN material m ON pm.material_id = m.material_id
WHERE po.process_id = 2
ORDER BY po.sequence;
```

Result:
```
sequence | operation_name | material_name | quantity | temperature | speed | duration
---------|----------------|---------------|----------|-------------|-------|----------
1        | HEAT_WATER     | NULL          | NULL     | 120.0       | NULL  | NULL
2        | STEAM_MILK     | Whole Milk    | 150.0    | 120.0       | NULL  | 15000
3        | GRIND_BEANS    | Coffee Beans  | 18.0     | NULL        | 5     | 3000
4        | PUMP_PRESSURE  | Water         | 35.0     | 93.0        | NULL  | 30000
```

### Benefits

✅ **Clear relationship**: Each material is tied to its specific operation step  
✅ **Flexible**: Materials with `sequence = NULL` are used globally (like cups)  
✅ **Inventory tracking**: Deduct materials at the exact step they're consumed  
✅ **STM32 commands**: Send material info with each operation command  

### Migration Steps

1. **Run the migration SQL**:
   ```bash
   psql -U your_user -d coffee_machine -f migration_add_sequence_to_materials.sql
   ```

2. **Rebuild your .NET app**:
   ```bash
   dotnet build
   ```

3. **Update existing data** (if you have any) to assign sequences to materials

4. **Test with the new API** using the example above

### Alternative: If You Don't Want Sequence in Materials

If you prefer to keep materials separate from steps (simpler but less precise), you can:
- Keep `processed_material` as-is (no sequence column)
- Track materials only at process level (not step level)
- Deduct all materials at the start or end of brewing
- This is simpler but less accurate for inventory tracking

Would you like me to proceed with this approach or keep the simpler version?
