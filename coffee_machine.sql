CREATE TABLE product (
  product_id SERIAL PRIMARY KEY,
  product_code VARCHAR,
  product_name VARCHAR NOT NULL,
  product_type VARCHAR,
  category VARCHAR,
  price NUMERIC,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE material (
  material_id SERIAL PRIMARY KEY,
  material_name VARCHAR NOT NULL,
  material_unit VARCHAR,
  cost_per_unit NUMERIC,
  stock_quantity NUMERIC DEFAULT 0.00,
  is_consumable BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE operation (
  operation_id SERIAL PRIMARY KEY,
  operation_name VARCHAR NOT NULL,
  type VARCHAR
);

CREATE TABLE process (
  process_id SERIAL PRIMARY KEY,
product_id INTEGER NOT NULL REFERENCES product(product_id),
  version INTEGER DEFAULT 1,
  note TEXT,
  type VARCHAR,
  is_default BOOLEAN DEFAULT false
);

CREATE TABLE process_operation (
  process_operation_id SERIAL PRIMARY KEY,
  process_id INTEGER NOT NULL REFERENCES process(process_id),
  operation_id INTEGER NOT NULL REFERENCES operation(operation_id),
  sequence INTEGER NOT NULL,
  speed INTEGER,
  temperature NUMERIC,
  duration INTEGER
);

CREATE TABLE processed_material (
  process_id INTEGER NOT NULL REFERENCES process(process_id),
  material_id INTEGER NOT NULL REFERENCES material(material_id),
  quantity NUMERIC NOT NULL,
  usage_type VARCHAR,
  PRIMARY KEY (process_id, material_id)
);

SELECT *  FROM material;




-- =============================================
-- 1. INDEPENDENT TABLES (Populate these first)
-- =============================================

-- Products (The Menu)
INSERT INTO product (product_name, product_code, product_type, category, price, description) VALUES
('Espresso', 'ESP001', 'Hot Coffee', 'Black', 2.50, 'Strong, concentrated coffee.'),
('Cappuccino', 'CAP001', 'Hot Coffee', 'Milk', 3.50, 'Espresso with steamed milk foam.'),
('Iced Latte', 'LAT002', 'Cold Coffee', 'Milk', 4.00, 'Espresso with cold milk and ice.');

-- Materials (The Inventory)
INSERT INTO material (material_name, material_unit, cost_per_unit, stock_quantity, is_consumable) VALUES
('Coffee Beans', 'g', 0.02, 5000.00, true), -- 5kg in stock
('Water', 'ml', 0.0001, 10000.00, true),   -- Plumbed in or tank
('Whole Milk', 'ml', 0.0015, 2000.00, true),
('Paper Cup', 'piece', 0.10, 500.00, true);

-- Operations (The Machine Capabilities)
INSERT INTO operation (operation_name, type) VALUES
('HEAT_WATER', 'Heater'),
('GRIND_BEANS', 'Motor'),
('PUMP_PRESSURE', 'Pump'),
('STEAM_MILK', 'Heater/Pump'),
('DISPENSE_CUP', 'Actuator');

-- =============================================
-- 2. DEPENDENT TABLES (Link Products & Recipes)
-- =============================================

-- Process (The Recipes)
-- We assume IDs: Espresso=1, Cappuccino=2
INSERT INTO process (product_id, version, type, note, is_default) VALUES
(1, 1, 'Standard', 'Standard 9-bar extraction', true),   -- Process #1 (Espresso)
(2, 1, 'Standard', 'Foam heavy cappuccino', true);       -- Process #2 (Cappuccino)

-- =============================================
-- 3. JUNCTION TABLES (The Details)
-- =============================================

-- Process Operations (The Steps to make Process #1 - Espresso)
INSERT INTO process_operation (process_id, operation_id, sequence, speed, temperature, duration) VALUES
-- Step 1: Heat Boiler (Op 1)
(1, 1, 1, NULL, 93.0, NULL),
-- Step 2: Grind Beans (Op 2) - Speed 5, 3 seconds
(1, 2, 2, 5, NULL, 3000),
-- Step 3: Pump Water (Op 3) - 30 seconds
(1, 3, 3, NULL, 93.0, 30000);

-- Process Operations (The Steps to make Process #2 - Cappuccino)
INSERT INTO process_operation (process_id, operation_id, sequence, speed, temperature, duration) VALUES
-- Step 1: Heat (Hotter for steam)
(2, 1, 1, NULL, 120.0, NULL),
-- Step 2: Steam Milk (Op 4)
(2, 4, 2, NULL, 120.0, 15000),
-- Step 3: Grind Beans
(2, 2, 3, 5, NULL, 3000),
-- Step 4: Pump Coffee
(2, 3, 4, NULL, 93.0, 30000);

-- Processed Material (The Ingredients used in Process #1 - Espresso)
INSERT INTO processed_material (process_id, material_id, quantity, usage_type) VALUES
(1, 1, 18.00, 'Ingredient'),  -- 18g Beans
(1, 2, 35.00, 'Ingredient'),  -- 35ml Water
(1, 4, 1.00, 'Container');    -- 1 Cup

-- Processed Material (The Ingredients used in Process #2 - Cappuccino)
INSERT INTO processed_material (process_id, material_id, quantity, usage_type) VALUES
(2, 1, 18.00, 'Ingredient'),  -- Beans
(2, 2, 35.00, 'Ingredient'),  -- Water
(2, 3, 150.00, 'Ingredient'), -- 150ml Milk
(2, 4, 1.00, 'Container');    -- Cup

-- 1. Add specific hardware limit columns
ALTER TABLE process_operation 
ADD COLUMN current_limit_ma INTEGER,       -- For "300mA"
ADD COLUMN target_position INTEGER,        -- For "Encoder 10000"
ADD COLUMN stop_condition VARCHAR(50);     -- "TIME", "CURRENT", "POSITION", "MANUAL"

-- 2. (Optional) Rename 'speed' if you want to be more specific, 
-- or just keep using it for PWM duty cycle (0-100%).