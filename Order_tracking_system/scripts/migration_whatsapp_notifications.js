/**
 * Migration script: Create WhatsApp notification tables
 * Run: node scripts/migration_whatsapp_notifications.js
 */

const pool = require('../db');

(async () => {
  try {
    console.log('[Migration] Starting WhatsApp notification tables creation...');

    // Create whatsapp_message_templates table
    await pool.query(`
      CREATE TABLE IF NOT EXISTS odts.whatsapp_message_templates (
        template_id SERIAL PRIMARY KEY,
        template_name VARCHAR(255) NOT NULL UNIQUE,
        message_body TEXT NOT NULL,
        is_active BOOLEAN DEFAULT TRUE,
        created_by INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY (created_by) REFERENCES odts.users(user_id)
      );
    `);
    console.log('✓ Created whatsapp_message_templates table');

    // Create whatsapp_message_logs table
    await pool.query(`
      CREATE TABLE IF NOT EXISTS odts.whatsapp_message_logs (
        message_id SERIAL PRIMARY KEY,
        dealer_id INT NOT NULL,
        phone_number VARCHAR(50) NOT NULL,
        template_id INT,
        message_sent TEXT,
        status VARCHAR(50) NOT NULL,
        message_sid VARCHAR(255),
        error_message TEXT,
        sent_at TIMESTAMP DEFAULT NOW(),
        sent_by INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY (dealer_id) REFERENCES odts.dealers(dealer_id),
        FOREIGN KEY (template_id) REFERENCES odts.whatsapp_message_templates(template_id) ON DELETE SET NULL,
        FOREIGN KEY (sent_by) REFERENCES odts.users(user_id)
      );
    `);
    console.log('✓ Created whatsapp_message_logs table');

    // Insert sample templates
    const adminUserId = (await pool.query(`
      SELECT user_id FROM odts.users
      WHERE user_role_id = (SELECT role_id FROM odts.user_roles WHERE role_name = 'ADMIN' LIMIT 1)
      LIMIT 1
    `)).rows[0]?.user_id || 1;

    const templates = [
      {
        name: 'Order Confirmation',
        body: 'Hi {{dealer_name}}, your order has been confirmed. Your Dealer Code: {{dealer_code}}. We will contact you shortly with dispatch details.'
      },
      {
        name: 'Dispatch Alert',
        body: 'Hi {{dealer_name}}, your order is on its way! Driver will reach soon. Contact: {{dealer_phone}}'
      },
      {
        name: 'Delivery Complete',
        body: 'Hi {{dealer_name}}, your order has been successfully delivered. Thank you for your business!'
      },
      {
        name: 'Follow-up',
        body: 'Hi {{dealer_name}}, we hope you received your order. Please let us know if you have any questions.'
      }
    ];

    for (const tpl of templates) {
      const existing = await pool.query(
        `SELECT template_id FROM odts.whatsapp_message_templates WHERE template_name = $1`,
        [tpl.name]
      );
      if (!existing.rows.length) {
        await pool.query(
          `INSERT INTO odts.whatsapp_message_templates (template_name, message_body, created_by) VALUES ($1, $2, $3)`,
          [tpl.name, tpl.body, adminUserId]
        );
      }
    }
    console.log('✓ Inserted sample templates');

    console.log('[Migration] ✓ WhatsApp notification tables created successfully!');
    process.exit(0);

  } catch (error) {
    console.error('[Migration] ✗ Error:', error.message);
    process.exit(1);
  }
})();
