-- Script to remove STOCK_MANAGER role and users
-- Run this in your database

-- Step 1: View all roles to verify
SELECT role_id, role_name FROM odts.user_roles_master WHERE role_name ILIKE '%STOCK_MANAGER%' ORDER BY role_name;

-- Step 2: View all STOCK_MANAGER users (before deletion)
SELECT u.user_id, u.user_login_name, u.user_name, r.role_name, u.user_warehouse_id
FROM odts.user_master u
LEFT JOIN odts.user_roles_master r ON u.user_role_id = r.role_id
WHERE UPPER(COALESCE(r.role_name, '')) = 'STOCK_MANAGER'
ORDER BY u.user_id;

-- Step 3: Delete all STOCK_MANAGER users
DELETE FROM odts.user_master
WHERE user_role_id IN (
  SELECT role_id FROM odts.user_roles_master
  WHERE UPPER(role_name) = 'STOCK_MANAGER'
);

-- Step 4: Delete STOCK_MANAGER role
DELETE FROM odts.user_roles_master
WHERE UPPER(role_name) = 'STOCK_MANAGER';

-- Step 5: Verify deletion
SELECT 'Remaining roles:' as status;
SELECT role_id, role_name FROM odts.user_roles_master ORDER BY role_name;

SELECT 'Remaining users:' as status;
SELECT u.user_id, u.user_login_name, u.user_name, r.role_name
FROM odts.user_master u
LEFT JOIN odts.user_roles_master r ON u.user_role_id = r.role_id
ORDER BY u.user_id;
