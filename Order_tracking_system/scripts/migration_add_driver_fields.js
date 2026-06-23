/**
 * Migration: Add driver_name, driver_phone, vehicle_number to dealer_orders table
 * Run once: node scripts/migration_add_driver_fields.js
 */
const pool = require('../db');

async function run() {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    // Check if columns already exist
    const result = await client.query(`
      SELECT column_name
      FROM information_schema.columns
      WHERE table_schema = 'odts'
      AND table_name = 'dealer_orders'
      AND column_name IN ('driver_name', 'driver_phone', 'vehicle_number')
    `);

    const existingColumns = result.rows.map(r => r.column_name);
    const columnsToAdd = [];

    if (!existingColumns.includes('driver_name')) {
      columnsToAdd.push('driver_name VARCHAR(255)');
    }
    if (!existingColumns.includes('driver_phone')) {
      columnsToAdd.push('driver_phone VARCHAR(20)');
    }
    if (!existingColumns.includes('vehicle_number')) {
      columnsToAdd.push('vehicle_number VARCHAR(50)');
    }

    if (columnsToAdd.length > 0) {
      const sql = `ALTER TABLE odts.dealer_orders ADD COLUMN ${columnsToAdd.join(', ADD COLUMN ')}`;
      await client.query(sql);
      console.log(`✓ Added columns: ${columnsToAdd.join(', ')}`);
    } else {
      console.log('✓ All columns already exist');
    }

    await client.query('COMMIT');
    console.log('Migration complete: driver fields added to dealer_orders table.');
  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Migration failed:', err.message);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

run();
