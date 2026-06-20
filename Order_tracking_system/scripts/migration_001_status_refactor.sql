-- Migration: Consolidate status columns (order_status only)
-- This migration:
-- 1. Backs up dispatch_status values before removal
-- 2. Merges dispatch_status into order_status
-- 3. Removes dispatch_status column


-- Step 5: Update dealer_orders.order_status with dispatch_status values
UPDATE odts.dealer_orders
SET order_status = CASE
    WHEN order_id IN (
        SELECT order_id FROM odts.order_dispatch
        WHERE dispatch_status = 'dispatch_completed'
    ) THEN 'FULLY_DISPATCHED'
    WHEN order_id IN (
        SELECT order_id FROM odts.order_dispatch
        WHERE dispatch_status = 'dispatch_partial'
    ) THEN 'PARTIALLY_DISPATCHED'
    WHEN order_id IN (
        SELECT order_id FROM odts.order_dispatch
        WHERE dispatch_status = 'dispatch_onhold'
    ) THEN 'DISPATCH_ON_HOLD'
    ELSE order_status
END
WHERE order_status = 'DISPATCHED'
AND order_id IN (
    SELECT order_id FROM odts.order_dispatch
    WHERE dispatch_status IS NOT NULL
);

-- Step 6: Remove dispatch_status column from order_dispatch
ALTER TABLE odts.order_dispatch
DROP COLUMN IF EXISTS dispatch_status;


