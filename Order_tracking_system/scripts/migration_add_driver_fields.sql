-- Migration: Add driver_name, driver_phone, vehicle_number to dealer_orders table
-- Run once on production database

ALTER TABLE odts.dealer_orders
  ADD COLUMN IF NOT EXISTS driver_name VARCHAR(255),
  ADD COLUMN IF NOT EXISTS driver_phone VARCHAR(20),
  ADD COLUMN IF NOT EXISTS vehicle_number VARCHAR(50);

-- Verify columns were added
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'odts'
  AND table_name = 'dealer_orders'
  AND column_name IN ('driver_name', 'driver_phone', 'vehicle_number')
ORDER BY column_name;
