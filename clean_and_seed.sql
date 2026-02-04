-- =============================================
-- CLEAN ALL DATA
-- =============================================

-- Delete in reverse order of dependencies
DELETE FROM processed_material;
DELETE FROM process_operation;
DELETE FROM process;
DELETE FROM operation;
DELETE FROM material;
DELETE FROM product;

-- Reset sequences (auto-increment counters)
ALTER SEQUENCE product_product_id_seq RESTART WITH 1;
ALTER SEQUENCE material_material_id_seq RESTART WITH 1;
ALTER SEQUENCE operation_operation_id_seq RESTART WITH 1;
ALTER SEQUENCE process_process_id_seq RESTART WITH 1;
ALTER SEQUENCE process_operation_process_operation_id_seq RESTART WITH 1;

-- Reset processed_material_id sequence if it exists
DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'public' AND sequencename = 'processed_material_processed_material_id_seq') THEN
        ALTER SEQUENCE processed_material_processed_material_id_seq RESTART WITH 1;
    END IF;
END $$;

-- =============================================
-- SEED NEW DATA
-- =============================================

-- ============= 1. PRODUCTS (The Menu) =============
INSERT INTO product (product_name, product_code, product_type, category, price, description) VALUES
('Espresso', 'ESP001', 'Hot Coffee', 'Black', 2.50, 'Strong, concentrated coffee shot'),
('Cappuccino', 'CAP001', 'Hot Coffee', 'Milk', 3.50, 'Espresso with steamed milk and foam'),
('Latte', 'LAT001', 'Hot Coffee', 'Milk', 3.75, 'Espresso with steamed milk'),
('Americano', 'AME001', 'Hot Coffee', 'Black', 2.75, 'Espresso diluted with hot water'),
('Iced Latte', 'LAT002', 'Cold Coffee', 'Milk', 4.00, 'Espresso with cold milk and ice');

-- ============= 2. MATERIALS (The Inventory) =============
INSERT INTO material (material_name, material_unit, cost_per_unit, stock_quantity, is_consumable) VALUES
('Coffee Beans', 'g', 0.02, 5000.00, true),
('Hot Water', 'ml', 0.0001, 50000.00, true),
('Whole Milk', 'ml', 0.0015, 3000.00, true),
('Paper Cup 8oz', 'piece', 0.10, 500.00, true),
('Paper Cup 12oz', 'piece', 0.12, 500.00, true),
('Ice Cubes', 'g', 0.001, 2000.00, true),
('Plastic Cup 16oz', 'piece', 0.15, 300.00, true);

-- ============= 3. OPERATIONS (Machine Capabilities) =============
INSERT INTO operation (operation_name, type) VALUES
('HEAT_WATER', 'Heater'),
('GRIND_BEANS', 'Motor'),
('PUMP_PRESSURE', 'Pump'),
('STEAM_MILK', 'Heater/Pump'),
('DISPENSE_CUP', 'Actuator'),
('ADD_HOT_WATER', 'Pump'),
('ADD_ICE', 'Dispenser');

-- =============================================
-- PROCESS #1: ESPRESSO
-- =============================================

INSERT INTO process (product_id, version, type, note, is_default) VALUES
(1, 1, 'Standard', 'Classic 9-bar espresso extraction', true);

INSERT INTO process_operation (process_id, operation_id, sequence, speed, temperature, duration) VALUES
(1, 5, 1, NULL, NULL, 2000),
(1, 1, 2, NULL, 93.0, NULL),
(1, 2, 3, 5, NULL, 3000),
(1, 3, 4, NULL, 93.0, 30000);

INSERT INTO processed_material (process_id, material_id, quantity, usage_type, sequence) VALUES
(1, 4, 1.00, 'Container', 1),
(1, 1, 18.00, 'Ingredient', 3),
(1, 2, 35.00, 'Ingredient', 4);

-- =============================================
-- PROCESS #2: CAPPUCCINO
-- =============================================

INSERT INTO process (product_id, version, type, note, is_default) VALUES
(2, 1, 'Standard', 'Traditional cappuccino with foam', true);

INSERT INTO process_operation (process_id, operation_id, sequence, speed, temperature, duration) VALUES
(2, 5, 1, NULL, NULL, 2000),
(2, 1, 2, NULL, 120.0, NULL),
(2, 4, 3, NULL, 120.0, 15000),
(2, 2, 4, 5, NULL, 3000),
(2, 3, 5, NULL, 93.0, 30000);

INSERT INTO processed_material (process_id, material_id, quantity, usage_type, sequence) VALUES
(2, 4, 1.00, 'Container', 1),
(2, 3, 150.00, 'Ingredient', 3),
(2, 1, 18.00, 'Ingredient', 4),
(2, 2, 35.00, 'Ingredient', 5);

-- =============================================
-- PROCESS #3: LATTE
-- =============================================

INSERT INTO process (product_id, version, type, note, is_default) VALUES
(3, 1, 'Standard', 'Smooth latte with more milk', true);

INSERT INTO process_operation (process_id, operation_id, sequence, speed, temperature, duration) VALUES
(3, 5, 1, NULL, NULL, 2000),
(3, 1, 2, NULL, 120.0, NULL),
(3, 4, 3, NULL, 120.0, 20000),
(3, 2, 4, 5, NULL, 3000),
(3, 3, 5, NULL, 93.0, 30000);

INSERT INTO processed_material (process_id, material_id, quantity, usage_type, sequence) VALUES
(3, 5, 1.00, 'Container', 1),
(3, 3, 240.00, 'Ingredient', 3),
(3, 1, 18.00, 'Ingredient', 4),
(3, 2, 35.00, 'Ingredient', 5);

-- =============================================
-- PROCESS #4: AMERICANO
-- =============================================

INSERT INTO process (product_id, version, type, note, is_default) VALUES
(4, 1, 'Standard', 'Espresso with hot water', true);

INSERT INTO process_operation (process_id, operation_id, sequence, speed, temperature, duration) VALUES
(4, 5, 1, NULL, NULL, 2000),
(4, 1, 2, NULL, 93.0, NULL),
(4, 2, 3, 5, NULL, 3000),
(4, 3, 4, NULL, 93.0, 30000),
(4, 6, 5, NULL, 90.0, 10000);

INSERT INTO processed_material (process_id, material_id, quantity, usage_type, sequence) VALUES
(4, 5, 1.00, 'Container', 1),
(4, 1, 18.00, 'Ingredient', 3),
(4, 2, 35.00, 'Ingredient', 4),
(4, 2, 120.00, 'Ingredient', 5);

-- =============================================
-- PROCESS #5: ICED LATTE
-- =============================================

INSERT INTO process (product_id, version, type, note, is_default) VALUES
(5, 1, 'Standard', 'Cold latte with ice', true);

INSERT INTO process_operation (process_id, operation_id, sequence, speed, temperature, duration) VALUES
(5, 5, 1, NULL, NULL, 2000),
(5, 7, 2, NULL, NULL, 5000),
(5, 2, 3, 5, NULL, 3000),
(5, 1, 4, NULL, 93.0, NULL),
(5, 3, 5, NULL, 93.0, 30000);

INSERT INTO processed_material (process_id, material_id, quantity, usage_type, sequence) VALUES
(5, 7, 1.00, 'Container', 1),
(5, 6, 100.00, 'Ingredient', 2),
(5, 1, 18.00, 'Ingredient', 3),
(5, 2, 35.00, 'Ingredient', 5),
(5, 3, 200.00, 'Ingredient', NULL);

-- =============================================
-- VERIFICATION QUERIES
-- =============================================

SELECT 'PRODUCTS:' as info;
SELECT product_id, product_name, product_code, category, price FROM product ORDER BY product_id;

SELECT '' as info;
SELECT 'MATERIALS:' as info;
SELECT material_id, material_name, material_unit, stock_quantity FROM material ORDER BY material_id;

SELECT '' as info;
SELECT 'OPERATIONS:' as info;
SELECT operation_id, operation_name, type FROM operation ORDER BY operation_id;

SELECT '' as info;
SELECT 'PROCESS BREAKDOWN (Espresso):' as info;
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
JOIN operation o ON po.operation_id = o.operation_id
LEFT JOIN processed_material pm ON po.process_id = pm.process_id AND po.sequence = pm.sequence
LEFT JOIN material m ON pm.material_id = m.material_id
WHERE po.process_id = 1
ORDER BY po.sequence;

SELECT '' as info;
SELECT 'SUMMARY:' as info;
SELECT 
    p.product_name,
    COUNT(DISTINCT pr.process_id) as num_processes,
    COUNT(DISTINCT po.process_operation_id) as total_steps,
    COUNT(DISTINCT pm.material_id) as total_materials
FROM product p
LEFT JOIN process pr ON p.product_id = pr.product_id
LEFT JOIN process_operation po ON pr.process_id = po.process_id
LEFT JOIN processed_material pm ON pr.process_id = pm.process_id
GROUP BY p.product_id, p.product_name
ORDER BY p.product_id;
