const pool = require('../db');

async function createWarehousesTable() {
  try {
    console.log('Creating warehouses table...');

    await pool.query(`
      CREATE TABLE IF NOT EXISTS odts.warehouses (
        warehouse_id SERIAL PRIMARY KEY,
        warehouse_name VARCHAR(255) NOT NULL UNIQUE,
        warehouse_location VARCHAR(255),
        warehouse_description TEXT,
        is_active BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);

    console.log('✓ Warehouses table created');

    // Add warehouse_id column to user_master if not exists
    console.log('Adding warehouse_id column to user_master...');

    const hasWarehouseId = await pool.query(`
      SELECT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = 'odts' AND table_name = 'user_master' AND column_name = 'warehouse_id'
      )
    `);

    if (!hasWarehouseId.rows[0].exists) {
      await pool.query(`
        ALTER TABLE odts.user_master
        ADD COLUMN warehouse_id INTEGER REFERENCES odts.warehouses(warehouse_id) ON DELETE SET NULL
      `);
      console.log('✓ warehouse_id column added to user_master');
    } else {
      console.log('✓ warehouse_id column already exists in user_master');
    }

    // Insert sample warehouses
    console.log('Inserting sample warehouses...');
    const warehouses = [
      { name: 'Main Warehouse', location: 'Mumbai' },
      { name: 'Secondary Warehouse', location: 'Delhi' },
      { name: 'Distribution Center', location: 'Bangalore' }
    ];

    for (const wh of warehouses) {
      await pool.query(`
        INSERT INTO odts.warehouses (warehouse_name, warehouse_location)
        VALUES ($1, $2)
        ON CONFLICT (warehouse_name) DO NOTHING
      `, [wh.name, wh.location]);
    }

    console.log('✓ Sample warehouses inserted');

    console.log('\n✅ Database migration completed successfully!');
    process.exit(0);
  } catch (e) {
    console.error('❌ Error:', e.message);
    process.exit(1);
  }
}

createWarehousesTable();
