const { Pool } = require('pg');
const { getPoolConfig } = require('../config/database');

const pool = new Pool(getPoolConfig());

async function run() {
  const client = await pool.connect();
  try {
    console.log('Adding dispatch quantity fields to dealer_order_items table...');

    // Check if columns exist before adding
    const checkBags = await client.query(`
      SELECT 1 FROM information_schema.columns
      WHERE table_schema = 'odts' AND table_name = 'dealer_order_items'
      AND column_name = 'order_dispatch_bags'
    `);

    if (checkBags.rows.length === 0) {
      await client.query(`
        ALTER TABLE odts.dealer_order_items
        ADD COLUMN order_dispatch_bags INTEGER
      `);
      console.log('✓ order_dispatch_bags column added');
    } else {
      console.log('✓ order_dispatch_bags column already exists');
    }

    const checkQty = await client.query(`
      SELECT 1 FROM information_schema.columns
      WHERE table_schema = 'odts' AND table_name = 'dealer_order_items'
      AND column_name = 'order_dispatch_quantity'
    `);

    if (checkQty.rows.length === 0) {
      await client.query(`
        ALTER TABLE odts.dealer_order_items
        ADD COLUMN order_dispatch_quantity NUMERIC(10, 3)
      `);
      console.log('✓ order_dispatch_quantity column added');
    } else {
      console.log('✓ order_dispatch_quantity column already exists');
    }

    // Add dispatch_status column to order_dispatch
    const checkStatus = await client.query(`
      SELECT 1 FROM information_schema.columns
      WHERE table_schema = 'odts' AND table_name = 'order_dispatch'
      AND column_name = 'dispatch_status'
    `);

    if (checkStatus.rows.length === 0) {
      await client.query(`
        ALTER TABLE odts.order_dispatch
        ADD COLUMN dispatch_status VARCHAR(20) DEFAULT 'dispatch_onhold'
      `);
      console.log('✓ dispatch_status column added to order_dispatch');
    } else {
      console.log('✓ dispatch_status column already exists in order_dispatch');
    }

    console.log('\nMigration completed successfully!');
  } catch (e) {
    console.error('ERROR:', e.message);
  } finally {
    client.release();
    pool.end();
  }
}

run();
