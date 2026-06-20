-- Rollback: Status Refactor Migration
-- This script reverses the status consolidation migration

-- Step 1: Re-add dispatch_status column to order_dispatch
ALTER TABLE odts.order_dispatch
ADD COLUMN dispatch_status VARCHAR(50) NULL;

-- Step 2: Restore dispatch_status from backup
UPDATE odts.order_dispatch
SET dispatch_status = (
    SELECT dispatch_status FROM odts.order_dispatch_backup
    WHERE order_dispatch_backup.order_id = order_dispatch.order_id
)
WHERE order_id IN (
    SELECT order_id FROM odts.order_dispatch_backup
);

-- Step 3: Revert order_status back to 'DISPATCHED' for dispatched orders
UPDATE odts.dealer_orders
SET order_status = 'DISPATCHED'
WHERE order_status IN ('FULLY_DISPATCHED', 'PARTIALLY_DISPATCHED', 'DISPATCH_ON_HOLD')
AND order_id IN (
    SELECT order_id FROM odts.order_dispatch
    WHERE dispatch_status IS NOT NULL
);

-- Step 4: Verify rollback
SELECT 'Rollback Complete. Verification:' as status;
SELECT
    order_status,
    COUNT(*) as count
FROM odts.dealer_orders
GROUP BY order_status
ORDER BY order_status;

-- Step 5: Show restored dispatch statuses
SELECT
    dispatch_status,
    COUNT(*) as count
FROM odts.order_dispatch
WHERE dispatch_status IS NOT NULL
GROUP BY dispatch_status;

-- Note: Migration log tables (order_dispatch_backup, status_migration_log) remain for audit purposes
-- They can be dropped manually if needed
