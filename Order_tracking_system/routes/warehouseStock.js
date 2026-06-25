const express = require('express');
const router = express.Router();
const pool = require('../db');

// Middleware: ensure admin, stock_manager, or dispatcher
function ensureAdminOrStockManagerOrDispatcher(req, res, next) {
  if (!req.session?.user) {
    if (req.path.startsWith('/api/')) return res.status(401).json({ error: 'Unauthorized' });
    return res.redirect('/signin');
  }
  const role = req.session.user.role;
  if (role !== 'ADMIN' && role !== 'STOCK_MANAGER' && role !== 'DISPATCHER') {
    if (req.path.startsWith('/api/')) return res.status(403).json({ error: 'Admin, Stock Manager, or Dispatcher only' });
    return res.status(403).send('Admin, Stock Manager, or Dispatcher only');
  }
  return next();
}

// GET page - multiline entry view
router.get('/admin/warehouse-stock', ensureAdminOrStockManagerOrDispatcher, (req, res) => {
  const currentUser = {
    id: req.session.user.id,
    role: req.session.user.role,
    user_warehouse_id: req.session.user.user_warehouse_id || null
  };
  res.render('master/warehouse-stock-multiline', { currentUser });
});

// GET API: all warehouse stock with items and product details
router.get('/api/warehouse-stock', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const isDispatcher = req.session.user.role === 'DISPATCHER';
    const userWarehouseId = req.session.user.user_warehouse_id;

    let whereClause = '';
    const params = [];
    if (isDispatcher && userWarehouseId) {
      whereClause = ' WHERE ws.warehouse_id = $1';
      params.push(userWarehouseId);
    }

    const result = await pool.query(`
      SELECT
        ws.warehouse_stock_id,
        ws.warehouse_id,
        ws.warehouse_stock_date,
        ws.warehouse_vehicle_number,
        ws.warehouse_driver_name,
        ws.warehouse_driver_phone,
        ws.warehouse_bilty_number,
        ws.warehouse_receipt_image_url,
        ws.warehouse_receipt_image_type,
        ws.warehouse_stock_notes,
        ws.created_at,
        ws.updated_at,
        wm.warehouse_name,
        (SELECT json_agg(json_build_object(
          'item_id', wsi.warehouse_stock_item_id,
          'product_id', wsi.warehouse_product_id,
          'product_name', pm.product_name,
          'qty', wsi.warehouse_product_qty
        ) ORDER BY wsi.warehouse_stock_item_id) FILTER (WHERE wsi.warehouse_stock_item_id IS NOT NULL)
         FROM odts.warehouse_stock_items wsi
         LEFT JOIN odts.product_master pm ON pm.product_id = wsi.warehouse_product_id
         WHERE wsi.warehouse_stock_id = ws.warehouse_stock_id
        ) AS items
      FROM odts.warehouse_stock ws
      LEFT JOIN odts.warehouse_master wm ON wm.warehouse_id = ws.warehouse_id
      ${whereClause}
      ORDER BY ws.warehouse_stock_date DESC, ws.warehouse_stock_id DESC
    `, params);
    res.json(result.rows);
  } catch (e) {
    console.error('Error fetching warehouse stock:', e);
    res.status(500).json({ error: e.message });
  }
});

// POST API: create warehouse stock header with items
router.post('/api/warehouse-stock', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  const client = await pool.connect();
  try {
    const {
      warehouse_id,
      warehouse_vehicle_number,
      warehouse_driver_name,
      warehouse_driver_phone,
      warehouse_bilty_number,
      warehouse_receipt_image_url,
      warehouse_receipt_image_type,
      warehouse_receipt_image_orig_size,
      warehouse_receipt_image_comp_size,
      warehouse_stock_notes,
      items
    } = req.body;

    if (!warehouse_id || !Array.isArray(items) || items.length === 0) {
      return res.status(400).json({ error: 'Warehouse and at least one item are required' });
    }

    const isDispatcher = req.session.user.role === 'DISPATCHER';
    const userWarehouseId = req.session.user.user_warehouse_id;
    const parsedWarehouseId = parseInt(warehouse_id, 10);

    if (isDispatcher && userWarehouseId && parsedWarehouseId !== userWarehouseId) {
      return res.status(403).json({ error: 'Access denied. You can only manage stock for your assigned warehouse.' });
    }

    await client.query('BEGIN');

    // Create header
    const headerResult = await client.query(`
      INSERT INTO odts.warehouse_stock (
        warehouse_id, warehouse_vehicle_number, warehouse_driver_name,
        warehouse_driver_phone, warehouse_bilty_number, warehouse_receipt_image_url,
        warehouse_receipt_image_type, warehouse_receipt_image_orig_size,
        warehouse_receipt_image_comp_size, warehouse_stock_notes, created_by, updated_by
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $11)
      RETURNING *
    `, [
      warehouse_id, warehouse_vehicle_number || null, warehouse_driver_name || null,
      warehouse_driver_phone || null, warehouse_bilty_number || null,
      warehouse_receipt_image_url || null, warehouse_receipt_image_type || null,
      warehouse_receipt_image_orig_size || null, warehouse_receipt_image_comp_size || null,
      warehouse_stock_notes || null, req.session.user.id
    ]);

    const headerId = headerResult.rows[0].warehouse_stock_id;

    // Create items
    for (const item of items) {
      if (!item.warehouse_product_id || !item.warehouse_product_qty) {
        throw new Error('All items must have product and quantity');
      }
      await client.query(`
        INSERT INTO odts.warehouse_stock_items (
          warehouse_stock_id, warehouse_product_id, warehouse_product_qty, created_by, updated_by
        ) VALUES ($1, $2, $3, $4, $4)
      `, [headerId, item.warehouse_product_id, parseInt(item.warehouse_product_qty), req.session.user.id]);
    }

    await client.query('COMMIT');

    // Fetch created record with items
    const createdResult = await pool.query(`
      SELECT
        ws.warehouse_stock_id,
        ws.warehouse_id,
        ws.warehouse_stock_date,
        ws.warehouse_vehicle_number,
        ws.warehouse_driver_name,
        ws.warehouse_driver_phone,
        ws.warehouse_bilty_number,
        ws.warehouse_stock_notes,
        wm.warehouse_name,
        (SELECT json_agg(json_build_object(
          'item_id', wsi.warehouse_stock_item_id,
          'product_id', wsi.warehouse_product_id,
          'product_name', pm.product_name,
          'qty', wsi.warehouse_product_qty
        ) ORDER BY wsi.warehouse_stock_item_id)
         FROM odts.warehouse_stock_items wsi
         LEFT JOIN odts.product_master pm ON pm.product_id = wsi.warehouse_product_id
         WHERE wsi.warehouse_stock_id = ws.warehouse_stock_id
        ) AS items
      FROM odts.warehouse_stock ws
      LEFT JOIN odts.warehouse_master wm ON wm.warehouse_id = ws.warehouse_id
      WHERE ws.warehouse_stock_id = $1
    `, [headerId]);

    res.json(createdResult.rows[0]);
  } catch (e) {
    await client.query('ROLLBACK');
    console.error('Error creating warehouse stock:', e);
    res.status(500).json({ error: e.message });
  } finally {
    client.release();
  }
});

// PUT API: update warehouse stock header
router.put('/api/warehouse-stock/:id', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const { id } = req.params;
    const {
      warehouse_vehicle_number,
      warehouse_driver_name,
      warehouse_driver_phone,
      warehouse_bilty_number,
      warehouse_receipt_image_url,
      warehouse_receipt_image_type,
      warehouse_stock_notes
    } = req.body;

    const result = await pool.query(`
      UPDATE odts.warehouse_stock SET
        warehouse_vehicle_number = $1,
        warehouse_driver_name = $2,
        warehouse_driver_phone = $3,
        warehouse_bilty_number = $4,
        warehouse_receipt_image_url = $5,
        warehouse_receipt_image_type = $6,
        warehouse_stock_notes = $7,
        updated_by = $8,
        updated_at = NOW()
      WHERE warehouse_stock_id = $9
      RETURNING *
    `, [
      warehouse_vehicle_number || null, warehouse_driver_name || null,
      warehouse_driver_phone || null, warehouse_bilty_number || null,
      warehouse_receipt_image_url || null, warehouse_receipt_image_type || null,
      warehouse_stock_notes || null, req.session.user.id, id
    ]);

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Warehouse stock not found' });
    }

    res.json(result.rows[0]);
  } catch (e) {
    console.error('Error updating warehouse stock:', e);
    res.status(500).json({ error: e.message });
  }
});

// DELETE API: delete warehouse stock header and items
router.delete('/api/warehouse-stock/:id', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  const client = await pool.connect();
  try {
    const { id } = req.params;

    await client.query('BEGIN');
    await client.query('DELETE FROM odts.warehouse_stock_items WHERE warehouse_stock_id = $1', [id]);
    await client.query('DELETE FROM odts.warehouse_stock WHERE warehouse_stock_id = $1', [id]);
    await client.query('COMMIT');

    res.json({ success: true, message: 'Warehouse stock deleted' });
  } catch (e) {
    await client.query('ROLLBACK');
    console.error('Error deleting warehouse stock:', e);
    res.status(500).json({ error: e.message });
  } finally {
    client.release();
  }
});

// POST API: add item to existing warehouse stock
router.post('/api/warehouse-stock/:id/items', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const { id } = req.params;
    const { warehouse_product_id, warehouse_product_qty } = req.body;

    if (!warehouse_product_id || !warehouse_product_qty) {
      return res.status(400).json({ error: 'Product and quantity required' });
    }

    const result = await pool.query(`
      INSERT INTO odts.warehouse_stock_items (
        warehouse_stock_id, warehouse_product_id, warehouse_product_qty, created_by, updated_by
      ) VALUES ($1, $2, $3, $4, $4)
      RETURNING *
    `, [id, warehouse_product_id, parseInt(warehouse_product_qty), req.session.user.id]);

    res.json(result.rows[0]);
  } catch (e) {
    console.error('Error adding item:', e);
    res.status(500).json({ error: e.message });
  }
});

// PUT API: update warehouse stock item
router.put('/api/warehouse-stock-item/:itemId', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const { itemId } = req.params;
    const { warehouse_product_qty } = req.body;

    const result = await pool.query(`
      UPDATE odts.warehouse_stock_items SET
        warehouse_product_qty = $1,
        updated_by = $2,
        updated_at = NOW()
      WHERE warehouse_stock_item_id = $3
      RETURNING *
    `, [parseInt(warehouse_product_qty), req.session.user.id, itemId]);

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Item not found' });
    }

    res.json(result.rows[0]);
  } catch (e) {
    console.error('Error updating item:', e);
    res.status(500).json({ error: e.message });
  }
});

// DELETE API: delete warehouse stock item
router.delete('/api/warehouse-stock-item/:itemId', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const { itemId } = req.params;

    await pool.query(
      'DELETE FROM odts.warehouse_stock_items WHERE warehouse_stock_item_id = $1',
      [itemId]
    );

    res.json({ success: true, message: 'Item deleted' });
  } catch (e) {
    console.error('Error deleting item:', e);
    res.status(500).json({ error: e.message });
  }
});

// GET API: warehouses dropdown
router.get('/api/warehouses-dropdown', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const isDispatcher = req.session.user.role === 'DISPATCHER';
    const userWarehouseId = req.session.user.user_warehouse_id;

    let query = 'SELECT warehouse_id, warehouse_name FROM odts.warehouse_master';
    const params = [];

    if (isDispatcher && userWarehouseId) {
      query += ' WHERE warehouse_id = $1';
      params.push(userWarehouseId);
    }

    query += ' ORDER BY warehouse_name';

    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// GET API: warehouse inventory summary (current qty by warehouse)
router.get('/api/warehouse-inventory', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const { startDate, endDate } = req.query;
    const isDispatcher = req.session.user.role === 'DISPATCHER';
    const userWarehouseId = req.session.user.user_warehouse_id;

    let query = `
      SELECT
        wi.warehouse_id,
        wm.warehouse_name,
        wi.product_id,
        pm.product_name,
        wi.current_qty,
        wi.last_updated,
        (SELECT COUNT(*) FROM odts.warehouse_stock ws
         WHERE ws.warehouse_id = wi.warehouse_id) as stock_entries
      FROM odts.warehouse_inventory wi
      LEFT JOIN odts.warehouse_master wm ON wm.warehouse_id = wi.warehouse_id
      LEFT JOIN odts.product_master pm ON pm.product_id = wi.product_id
      WHERE wi.current_qty > 0
    `;

    let params = [];
    if (isDispatcher && userWarehouseId) {
      query += ` AND wi.warehouse_id = $${params.length + 1}`;
      params.push(userWarehouseId);
    }

    if (startDate || endDate) {
      const start = startDate ? new Date(startDate) : new Date('2020-01-01');
      const end = endDate ? new Date(endDate) : new Date();
      query += ` AND wi.last_updated BETWEEN $${params.length + 1} AND $${params.length + 2}`;
      params.push(start, end);
    }

    query += ` ORDER BY wm.warehouse_name, pm.product_name`;

    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (e) {
    console.error('[Warehouse Inventory API]', e.message);
    res.status(500).json({ error: e.message });
  }
});

// GET API: warehouse inventory summary by warehouse (net stock per warehouse)
router.get('/api/warehouse-inventory/summary/by-warehouse', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const { startDate, endDate } = req.query;
    const isDispatcher = req.session.user.role === 'DISPATCHER';
    const userWarehouseId = req.session.user.user_warehouse_id;

    let query = `
      SELECT
        wm.warehouse_id,
        wm.warehouse_name,
        SUM(wi.current_qty) as total_stock_qty,
        MAX(wi.last_updated) as last_updated,
        STRING_AGG(DISTINCT pm.product_name || '(' || wi.current_qty || ')', ', ') as products
      FROM odts.warehouse_inventory wi
      LEFT JOIN odts.warehouse_master wm ON wm.warehouse_id = wi.warehouse_id
      LEFT JOIN odts.product_master pm ON pm.product_id = wi.product_id
      WHERE wi.current_qty > 0
    `;

    let params = [];
    if (isDispatcher && userWarehouseId) {
      query += ` AND wi.warehouse_id = $${params.length + 1}`;
      params.push(userWarehouseId);
    }

    if (startDate || endDate) {
      const start = startDate ? new Date(startDate) : new Date('2020-01-01');
      const end = endDate ? new Date(endDate) : new Date();
      query += ` AND wi.last_updated BETWEEN $${params.length + 1} AND $${params.length + 2}`;
      params.push(start, end);
    }

    query += ` GROUP BY wm.warehouse_id, wm.warehouse_name ORDER BY wm.warehouse_name`;

    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (e) {
    console.error('[Warehouse Inventory Summary API]', e.message);
    res.status(500).json({ error: e.message });
  }
});

// GET API: products dropdown
router.get('/api/products-dropdown', ensureAdminOrStockManagerOrDispatcher, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT product_id, product_name FROM odts.product_master WHERE product_is_active_flag = true ORDER BY product_name'
    );
    res.json(result.rows);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = router;
