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
  processed_material_id SERIAL PRIMARY KEY,
  process_id INTEGER NOT NULL REFERENCES process(process_id),
  material_id INTEGER NOT NULL REFERENCES material(material_id),
  quantity NUMERIC NOT NULL,
  usage_type VARCHAR,
  sequence INTEGER  -- Links to process_operation.sequence (NULL = used across all steps or not tied to specific step)
);

SELECT * FROM processed_material

SELECT *  FROM process_operation
SELECT *  FROM operation
SELECT *  FROM process

SELECT * FROM product



-- Add image column to product table
ALTER TABLE product 
ADD COLUMN image_url VARCHAR(500);

-- Add image column to material table
ALTER TABLE material 
ADD COLUMN image_url VARCHAR(500);

