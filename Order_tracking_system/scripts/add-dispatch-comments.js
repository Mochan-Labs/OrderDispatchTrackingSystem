const { Pool } = require('pg');
const { getPoolConfig } = require('../config/database');

const pool = new Pool(getPoolConfig());

async function run() {
  const client = await pool.connect();
  try {
    console.log('Adding order_dispatch_comments column to dealer_order_items table...');

    const checkComments = await client.query(`
      SELECT 1 FROM information_schema.columns
      WHERE table_schema = 'odts' AND table_name = 'dealer_order_items'
      AND column_name = 'order_dispatch_comments'
    `);

    if (checkComments.rows.length === 0) {
      await client.query(`
        ALTER TABLE odts.dealer_order_items
        ADD COLUMN order_dispatch_comments TEXT
      `);
      console.log('✓ order_dispatch_comments column added');
    } else {
      console.log('✓ order_dispatch_comments column already exists');
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
