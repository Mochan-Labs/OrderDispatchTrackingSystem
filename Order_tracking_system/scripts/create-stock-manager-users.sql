-- Create STOCK_MANAGER users for each warehouse with unique phone numbers
-- Phone numbers will be: 9999900001, 9999900002, 9999900003, etc.

INSERT INTO odts.user_master
(user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
SELECT
  LOWER(REPLACE(wm.warehouse_name, ' ', '_')) as user_login_name,
  wm.warehouse_name as user_name,
  LOWER(REPLACE(wm.warehouse_name, ' ', '_')) || '@warehouse.local' as user_email,
  '9999900' || LPAD((ROW_NUMBER() OVER (ORDER BY wm.warehouse_id))::text, 3, '0') as user_phone,
  '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq' as password_hash,
  (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'STOCK_MANAGER' LIMIT 1) as user_role_id,
  TRUE as user_is_active_flag,
  FALSE as user_is_locked_flag,
  wm.warehouse_id as user_warehouse_id,
  1 as created_by,
  NOW() as created_at,
  1 as updated_by,
  NOW() as updated_at
FROM odts.warehouse_master wm
ON CONFLICT (user_login_name) DO NOTHING;

-- Verify the created users
SELECT
  user_login_name,
  user_name,
  user_phone,
  wm.warehouse_name,
  user_role_id
FROM odts.user_master um
LEFT JOIN odts.warehouse_master wm ON um.user_warehouse_id = wm.warehouse_id
WHERE um.user_role_id = (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'STOCK_MANAGER')
ORDER BY um.user_warehouse_id;
