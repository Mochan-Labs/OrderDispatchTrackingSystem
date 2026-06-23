-- Migration: Fix order_dispatch table schema
-- Remove columns that should be in order_dispatch_items instead
-- Run once on production database

-- Drop unnecessary columns from order_dispatch
ALTER TABLE odts.order_dispatch
  DROP COLUMN IF EXISTS driver_id,
  DROP COLUMN IF EXISTS dispatch_vehicle_number,
  DROP COLUMN IF EXISTS builty_number,
  DROP COLUMN IF EXISTS bilty_number,
  DROP COLUMN IF EXISTS dispatch_receipt,
  DROP COLUMN IF EXISTS driver_name,
  DROP COLUMN IF EXISTS driver_phone,
  DROP COLUMN IF EXISTS image_url,
  DROP COLUMN IF EXISTS image_type,
  DROP COLUMN IF EXISTS image_original_size,
  DROP COLUMN IF EXISTS image_compressed_size,
  DROP COLUMN IF EXISTS actual_loading_location_code,
  DROP COLUMN IF EXISTS image_uploaded_at;

-- Verify order_dispatch structure
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'odts'
  AND table_name = 'order_dispatch'
ORDER BY column_name;
