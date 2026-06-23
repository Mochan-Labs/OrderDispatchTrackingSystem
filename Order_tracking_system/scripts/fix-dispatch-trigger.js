/**
 * Migration: Fix trigger on order_dispatch_items table
 * Drop any existing triggers that reference old product_id column
 * Run: node scripts/fix-dispatch-trigger.js
 */
const pool = require('../db');

async function run() {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    console.log('Dropping problematic triggers on order_dispatch_items...');

    // Drop all triggers on order_dispatch_items table
    await client.query(`
      SELECT trigger_name
      FROM information_schema.triggers
      WHERE event_object_table = 'order_dispatch_items'
      AND trigger_schema = 'odts'
    `).then(async (result) => {
      for (const row of result.rows) {
        console.log(`  Dropping trigger: ${row.trigger_name}`);
        await client.query(`DROP TRIGGER IF EXISTS ${row.trigger_name} ON odts.order_dispatch_items`);
      }
    });

    console.log('Triggers dropped successfully');

    await client.query('COMMIT');
    console.log('✅ Migration complete: Old triggers removed');
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
