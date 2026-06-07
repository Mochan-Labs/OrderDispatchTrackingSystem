const { Pool } = require('pg');
const { getPoolConfig } = require('../config/database');

const pool = new Pool(getPoolConfig());

async function run() {
  const client = await pool.connect();
  try {
    console.log('Updating dispatch_status from onhold to dispatch_onhold...');

    const result = await client.query(`
      UPDATE odts.order_dispatch
      SET dispatch_status = 'dispatch_onhold'
      WHERE dispatch_status = 'onhold'
    `);

    console.log(`✓ Updated ${result.rowCount} records`);
    console.log('\nMigration completed successfully!');
  } catch (e) {
    console.error('ERROR:', e.message);
  } finally {
    client.release();
    pool.end();
  }
}

run();
