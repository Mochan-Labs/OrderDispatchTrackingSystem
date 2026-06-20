const express = require('express');
const router = express.Router();
const pool = require('../db');
const { sendWhatsAppMessage } = require('../services/smsService');

// ── Auth Middleware: Admin only ──────────────────────────────────────────
function ensureAdmin(req, res, next) {
  if (!req.session?.user) {
    if (req.path.startsWith('/api/')) return res.status(401).json({ error: 'Unauthorized' });
    return res.redirect('/signin');
  }
  if (req.session.user.role !== 'ADMIN') {
    return res.status(403).json({ error: 'Only admins can access notifications' });
  }
  return next();
}

// ── PAGE ROUTES ──────────────────────────────────────────────────────────

// GET /notifications — WhatsApp notifications standalone page
router.get('/notifications', ensureAdmin, (req, res) => {
  res.render('notifications', {
    user: req.session.user
  });
});

// ── TEMPLATE ENDPOINTS ───────────────────────────────────────────────────

// GET /api/admin/whatsapp/templates — List all templates
router.get('/api/admin/whatsapp/templates', ensureAdmin, async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT template_id, template_name, message_body, is_active, created_by, created_at
      FROM odts.whatsapp_message_templates
      ORDER BY created_at DESC
    `);
    res.json(result.rows);
  } catch (e) {
    console.error('[WhatsApp] Templates list error:', e.message);
    res.status(500).json({ error: 'Failed to fetch templates' });
  }
});

// POST /api/admin/whatsapp/templates — Create new template
router.post('/api/admin/whatsapp/templates', ensureAdmin, async (req, res) => {
  try {
    const { template_name, message_body } = req.body;

    if (!template_name || !message_body) {
      return res.status(400).json({ error: 'Template name and message body required' });
    }

    const result = await pool.query(`
      INSERT INTO odts.whatsapp_message_templates
        (template_name, message_body, created_by, is_active)
      VALUES ($1, $2, $3, TRUE)
      RETURNING template_id, template_name, message_body, is_active, created_at
    `, [template_name.trim(), message_body.trim(), req.session.user.id]);

    res.status(201).json({
      success: true,
      message: 'Template created successfully',
      template: result.rows[0]
    });
  } catch (e) {
    if (e.code === '23505') {
      return res.status(400).json({ error: 'Template name already exists' });
    }
    console.error('[WhatsApp] Create template error:', e.message);
    res.status(500).json({ error: 'Failed to create template' });
  }
});

// PUT /api/admin/whatsapp/templates/:id — Update template
router.put('/api/admin/whatsapp/templates/:id', ensureAdmin, async (req, res) => {
  try {
    const { template_name, message_body, is_active } = req.body;
    const templateId = parseInt(req.params.id);

    const result = await pool.query(`
      UPDATE odts.whatsapp_message_templates
      SET template_name = COALESCE($1, template_name),
          message_body = COALESCE($2, message_body),
          is_active = COALESCE($3, is_active),
          updated_at = NOW()
      WHERE template_id = $4
      RETURNING template_id, template_name, message_body, is_active, updated_at
    `, [template_name?.trim() || null, message_body?.trim() || null, is_active, templateId]);

    if (!result.rows.length) {
      return res.status(404).json({ error: 'Template not found' });
    }

    res.json({
      success: true,
      message: 'Template updated successfully',
      template: result.rows[0]
    });
  } catch (e) {
    console.error('[WhatsApp] Update template error:', e.message);
    res.status(500).json({ error: 'Failed to update template' });
  }
});

// DELETE /api/admin/whatsapp/templates/:id — Delete template
router.delete('/api/admin/whatsapp/templates/:id', ensureAdmin, async (req, res) => {
  try {
    const templateId = parseInt(req.params.id);

    const result = await pool.query(`
      DELETE FROM odts.whatsapp_message_templates
      WHERE template_id = $1
      RETURNING template_id
    `, [templateId]);

    if (!result.rows.length) {
      return res.status(404).json({ error: 'Template not found' });
    }

    res.json({
      success: true,
      message: 'Template deleted successfully'
    });
  } catch (e) {
    console.error('[WhatsApp] Delete template error:', e.message);
    res.status(500).json({ error: 'Failed to delete template' });
  }
});

// ── DEALER LIST ENDPOINT ─────────────────────────────────────────────────

// GET /api/admin/whatsapp/dealers — List dealers for selection
router.get('/api/admin/whatsapp/dealers', ensureAdmin, async (req, res) => {
  try {
    const { search } = req.query;
    let query = `
      SELECT dealer_id, dealer_name, dealer_code, dealer_phone
      FROM odts.dealer_master
      WHERE dealer_phone IS NOT NULL AND dealer_phone != ''
    `;
    const params = [];

    if (search) {
      query += ` AND (dealer_name ILIKE $1 OR dealer_code ILIKE $1)`;
      params.push(`%${search}%`);
    }

    query += ` ORDER BY dealer_name ASC LIMIT 100`;

    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (e) {
    console.error('[WhatsApp] Dealers list error:', e.message);
    res.status(500).json({ error: 'Failed to fetch dealers' });
  }
});

// ── SEND MESSAGE ENDPOINTS ──────────────────────────────────────────────

// Helper: Replace variables in message
function replaceVariables(message, data) {
  let result = message;
  Object.keys(data).forEach(key => {
    const regex = new RegExp(`{{${key}}}`, 'g');
    result = result.replace(regex, data[key] || '');
  });
  return result;
}

// POST /api/admin/whatsapp/logs/log-attempt — Log message attempt when wa.me link is opened
router.post('/api/admin/whatsapp/logs/log-attempt', ensureAdmin, async (req, res) => {
  try {
    const { dealer_id, phone_number, template_id, message_sent, status } = req.body;

    if (!dealer_id || !phone_number) {
      return res.status(400).json({ error: 'dealer_id and phone_number required' });
    }

    await pool.query(`
      INSERT INTO odts.whatsapp_message_logs
        (dealer_id, phone_number, template_id, message_sent, status, message_sid, sent_by)
      VALUES ($1, $2, $3, $4, $5, $6, $7)
    `, [dealer_id, phone_number, template_id || null, message_sent || null, status || 'opened', 'WA_WEB_' + Date.now(), req.session.user.id]);

    res.json({ success: true });
  } catch (e) {
    console.error('[WhatsApp] Log attempt error:', e.message);
    res.status(500).json({ error: 'Failed to log attempt' });
  }
});

// POST /api/admin/whatsapp/send — Send messages to dealer(s)
router.post('/api/admin/whatsapp/send', ensureAdmin, async (req, res) => {
  try {
    const { dealer_ids, template_id, custom_message, use_custom } = req.body;

    if (!dealer_ids || !Array.isArray(dealer_ids) || dealer_ids.length === 0) {
      return res.status(400).json({ error: 'At least one dealer must be selected' });
    }

    if (!use_custom && !template_id) {
      return res.status(400).json({ error: 'Template or custom message required' });
    }

    // Fetch template if not using custom message
    let messageTemplate = null;
    if (!use_custom) {
      const templateRes = await pool.query(
        `SELECT message_body FROM odts.whatsapp_message_templates WHERE template_id = $1`,
        [template_id]
      );
      if (!templateRes.rows.length) {
        return res.status(404).json({ error: 'Template not found' });
      }
      messageTemplate = templateRes.rows[0].message_body;
    }

    // Fetch dealer details
    const dealerRes = await pool.query(
      `SELECT dealer_id, dealer_name, dealer_code, dealer_phone FROM odts.dealer_master WHERE dealer_id = ANY($1)`,
      [dealer_ids]
    );

    if (!dealerRes.rows.length) {
      return res.status(404).json({ error: 'No dealers found' });
    }

    const dealers = dealerRes.rows;
    const sentMessages = [];
    const failedMessages = [];

    // Send messages to each dealer
    for (const dealer of dealers) {
      try {
        // Prepare variables for replacement
        const variables = {
          dealer_name: dealer.dealer_name,
          dealer_code: dealer.dealer_code,
          dealer_phone: dealer.dealer_phone
        };

        // Get final message
        const finalMessage = use_custom
          ? custom_message
          : replaceVariables(messageTemplate, variables);

        // Send via WhatsApp
        const result = await sendWhatsAppMessage(dealer.dealer_phone, finalMessage);

        // Log message in database
        await pool.query(`
          INSERT INTO odts.whatsapp_message_logs
            (dealer_id, phone_number, template_id, message_sent, status, message_sid, sent_by)
          VALUES ($1, $2, $3, $4, $5, $6, $7)
        `, [
          dealer.dealer_id,
          dealer.dealer_phone,
          use_custom ? null : template_id,
          finalMessage,
          'sent',
          result.message_sid || null,
          req.session.user.id
        ]);

        sentMessages.push({
          dealer_id: dealer.dealer_id,
          dealer_name: dealer.dealer_name,
          phone: dealer.dealer_phone,
          status: 'sent'
        });
      } catch (err) {
        console.error(`[WhatsApp] Failed to send to ${dealer.dealer_name}:`, err.message);

        // Log failed message
        await pool.query(`
          INSERT INTO odts.whatsapp_message_logs
            (dealer_id, phone_number, template_id, message_sent, status, error_message, sent_by)
          VALUES ($1, $2, $3, $4, $5, $6, $7)
        `, [
          dealer.dealer_id,
          dealer.dealer_phone,
          use_custom ? null : template_id,
          use_custom ? custom_message : messageTemplate,
          'failed',
          err.message,
          req.session.user.id
        ]);

        failedMessages.push({
          dealer_id: dealer.dealer_id,
          dealer_name: dealer.dealer_name,
          phone: dealer.dealer_phone,
          error: err.message
        });
      }
    }

    res.json({
      success: true,
      message: `Messages sent to ${sentMessages.length} dealer(s)`,
      sent: sentMessages,
      failed: failedMessages,
      total: dealers.length
    });
  } catch (e) {
    console.error('[WhatsApp] Send message error:', e.message);
    res.status(500).json({ error: 'Failed to send messages' });
  }
});

// ── LOGS ENDPOINTS ──────────────────────────────────────────────────────

// GET /api/admin/whatsapp/logs — View message logs
router.get('/api/admin/whatsapp/logs', ensureAdmin, async (req, res) => {
  try {
    const { dealer_id, status, start_date, end_date, limit = 100, offset = 0 } = req.query;

    let query = `
      SELECT
        wml.message_id, wml.dealer_id, wml.phone_number, wml.message_sent,
        wml.status, wml.message_sid, wml.error_message, wml.sent_at, wml.created_at,
        d.dealer_name, d.dealer_code,
        u.user_name as sent_by_name,
        wmt.template_name
      FROM odts.whatsapp_message_logs wml
      LEFT JOIN odts.dealer_master d ON d.dealer_id = wml.dealer_id
      LEFT JOIN odts.user_master u ON u.user_id = wml.sent_by
      LEFT JOIN odts.whatsapp_message_templates wmt ON wmt.template_id = wml.template_id
      WHERE 1=1
    `;
    const params = [];
    let paramIndex = 1;

    if (dealer_id) {
      query += ` AND wml.dealer_id = $${paramIndex++}`;
      params.push(parseInt(dealer_id));
    }

    if (status) {
      query += ` AND wml.status = $${paramIndex++}`;
      params.push(status);
    }

    if (start_date) {
      query += ` AND DATE(wml.created_at) >= $${paramIndex++}`;
      params.push(start_date);
    }

    if (end_date) {
      query += ` AND DATE(wml.created_at) <= $${paramIndex++}`;
      params.push(end_date);
    }

    query += ` ORDER BY wml.created_at DESC LIMIT $${paramIndex++} OFFSET $${paramIndex++}`;
    params.push(parseInt(limit));
    params.push(parseInt(offset));

    const result = await pool.query(query, params);

    res.json({
      logs: result.rows,
      pagination: {
        limit: parseInt(limit),
        offset: parseInt(offset)
      }
    });
  } catch (e) {
    console.error('[WhatsApp] Logs error:', e.message);
    res.status(500).json({ error: 'Failed to fetch logs' });
  }
});

// GET /api/admin/whatsapp/logs/stats — Get message statistics
router.get('/api/admin/whatsapp/logs/stats', ensureAdmin, async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT
        status,
        COUNT(*) as count
      FROM odts.whatsapp_message_logs
      WHERE created_at >= NOW() - INTERVAL '30 days'
      GROUP BY status
    `);

    const stats = {
      total: 0,
      sent: 0,
      failed: 0,
      pending: 0
    };

    result.rows.forEach(row => {
      stats[row.status] = parseInt(row.count);
      stats.total += parseInt(row.count);
    });

    res.json(stats);
  } catch (e) {
    console.error('[WhatsApp] Stats error:', e.message);
    res.status(500).json({ error: 'Failed to fetch statistics' });
  }
});

module.exports = router;
