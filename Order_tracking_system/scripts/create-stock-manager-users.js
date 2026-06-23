const pool = require('../db');
const bcrypt = require('bcrypt');

async function createStockManagerUsers() {
  try {
    console.log('Fetching warehouses...');

    // Get all warehouses
    const warehousesRes = await pool.query(
      `SELECT warehouse_id, warehouse_name
       FROM odts.warehouse_master
       ORDER BY warehouse_id`
    );

    console.log(`Found ${warehousesRes.rows.length} warehouses`);

    // Get STOCK_MANAGER role ID
    const roleRes = await pool.query(
      `SELECT role_id FROM odts.user_roles_master WHERE role_name = 'STOCK_MANAGER'`
    );

    if (!roleRes.rows.length) {
      console.error('STOCK_MANAGER role not found!');
      process.exit(1);
    }

    const stockManagerRoleId = roleRes.rows[0].role_id;
    const passwordHash = await bcrypt.hash('bca@12345', 10);

    let createdCount = 0;
    let skippedCount = 0;

    // Create user for each warehouse
    for (let i = 0; i < warehousesRes.rows.length; i++) {
      const warehouse = warehousesRes.rows[i];

      // Generate unique phone: 9999900001, 9999900002, etc.
      const phoneNumber = '9999900' + String(i + 1).padStart(3, '0');
      const userLoginName = warehouse.warehouse_name.toLowerCase().replace(/\s+/g, '_');
      const userEmail = `${userLoginName}@warehouse.local`;

      try {
        const result = await pool.query(
          `INSERT INTO odts.user_master
           (user_login_name, user_name, user_email, user_phone, password_hash,
            user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id,
            created_by, created_at, updated_by, updated_at)
           VALUES ($1, $2, $3, $4, $5, $6, TRUE, FALSE, $7, 1, NOW(), 1, NOW())
           ON CONFLICT (user_login_name) DO NOTHING
           RETURNING user_id`,
          [
            userLoginName,
            warehouse.warehouse_name,
            userEmail,
            phoneNumber,
            passwordHash,
            stockManagerRoleId,
            warehouse.warehouse_id
          ]
        );

        if (result.rows.length > 0) {
          createdCount++;
          console.log(`✓ Created user: ${userLoginName} (Phone: ${phoneNumber}) for warehouse: ${warehouse.warehouse_name}`);
        } else {
          skippedCount++;
          console.log(`⊘ Skipped user: ${userLoginName} (already exists)`);
        }
      } catch (err) {
        console.error(`✗ Error creating user for warehouse ${warehouse.warehouse_name}:`, err.message);
      }
    }

    console.log(`\n📊 Summary:`);
    console.log(`   Created: ${createdCount} users`);
    console.log(`   Skipped: ${skippedCount} users (already exist)`);
    console.log(`   Total:   ${warehousesRes.rows.length} warehouses`);

    // Display created users
    console.log('\n📋 Created STOCK_MANAGER Users:');
    const usersRes = await pool.query(
      `SELECT
         um.user_login_name,
         um.user_name,
         um.user_phone,
         um.user_email,
         wm.warehouse_name
       FROM odts.user_master um
       LEFT JOIN odts.warehouse_master wm ON um.user_warehouse_id = wm.warehouse_id
       WHERE um.user_role_id = $1
       ORDER BY um.user_warehouse_id`,
      [stockManagerRoleId]
    );

    console.table(usersRes.rows);

    process.exit(0);
  } catch (err) {
    console.error('Error:', err.message);
    process.exit(1);
  }
}

createStockManagerUsers();
