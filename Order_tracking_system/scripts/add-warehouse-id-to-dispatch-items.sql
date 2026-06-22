-- Migration: Add warehouse_id column to order_dispatch_items table
-- This column tracks which warehouse the dispatch came from for inventory tracking

ALTER TABLE odts.order_dispatch_items
ADD COLUMN IF NOT EXISTS warehouse_id INTEGER REFERENCES odts.warehouse_master(warehouse_id);

-- Create index on warehouse_id for faster lookups
CREATE INDEX IF NOT EXISTS idx_order_dispatch_items_warehouse_id
ON odts.order_dispatch_items(warehouse_id);

-- Create index on dispatch_id for faster lookups
CREATE INDEX IF NOT EXISTS idx_order_dispatch_items_dispatch_id
ON odts.order_dispatch_items(dispatch_id);

-- Create composite index for warehouse + product lookups
CREATE INDEX IF NOT EXISTS idx_order_dispatch_items_warehouse_product
ON odts.order_dispatch_items(warehouse_id, product_id);

COMMIT;
