/**
 * Migration: Add warehouse_id column to order_dispatch_items table
 * Run: node scripts/migrate-add-warehouse-id.js
 */
const pool = require('../db');

async function run() {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    console.log('Adding warehouse_id column to order_dispatch_items...');
    await client.query(`
      ALTER TABLE odts.order_dispatch_items
      ADD COLUMN IF NOT EXISTS warehouse_id INTEGER REFERENCES odts.warehouse_master(warehouse_id)
    `);

    console.log('Creating indexes...');
    await client.query(`
      CREATE INDEX IF NOT EXISTS idx_order_dispatch_items_warehouse_id
      ON odts.order_dispatch_items(warehouse_id)
    `);

    await client.query(`
      CREATE INDEX IF NOT EXISTS idx_order_dispatch_items_dispatch_id
      ON odts.order_dispatch_items(dispatch_id)
    `);

    await client.query(`
      CREATE INDEX IF NOT EXISTS idx_order_dispatch_items_warehouse_product
      ON odts.order_dispatch_items(warehouse_id, product_id)
    `);

    await client.query('COMMIT');
    console.log('✅ Migration complete: warehouse_id column added to order_dispatch_items');
  } catch (err) {
    await client.query('ROLLBACK');
    console.error('❌ Migration failed:', err.message);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

run();
