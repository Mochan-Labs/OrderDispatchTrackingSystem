const express = require('express');
const router = express.Router();
const pool = require('../db');

function ensureAdmin(req, res, next) {
  if (!req.session || !req.session.user) return res.status(401).json({ error: 'Not authenticated' });
  if (req.session.user.role !== 'ADMIN') return res.status(403).json({ error: 'Admin access required' });
  return next();
}
function ensureAuth(req, res, next) {
  if (!req.session || !req.session.user) return res.redirect('/signin');
  return next();
}

router.get('/master/locations', ensureAuth, (req, res) => {
  if (req.session.user.role !== 'ADMIN') return res.status(403).send('Access denied. Admin only.');
  res.render('master/locations', { user: req.session.user });
});

router.get('/master/warehouse', ensureAuth, (req, res) => {
  if (req.session.user.role !== 'ADMIN') return res.status(403).send('Access denied. Admin only.');
  res.render('master/warehouse', { user: req.session.user });
});

router.get('/api/warehouses', ensureAdmin, async (req, res) => {
  try {
    const r = await pool.query(`
      SELECT warehouse_id, warehouse_code, warehouse_name, warehouse_type, warehouse_ui_label, warehouse_ui_order, created_at, updated_at, created_by, updated_by
      FROM odts.warehouse_master
      ORDER BY warehouse_type, warehouse_ui_order, warehouse_name
    `);
    res.json(r.rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

router.post('/api/warehouses', ensureAdmin, async (req, res) => {
  const { warehouse_code, warehouse_name, warehouse_type, warehouse_ui_label, warehouse_ui_order } = req.body;
  if (!warehouse_code || !warehouse_name || !warehouse_type) return res.status(400).json({ error: 'Warehouse code, name, and type are required' });
  try {
    const userId = req.session.user.id;
    const r = await pool.query(
      `INSERT INTO odts.warehouse_master(warehouse_code, warehouse_name, warehouse_type, warehouse_ui_label, warehouse_ui_order, created_by, updated_by, created_at, updated_at)
       VALUES($1,$2,$3,$4,$5,$6,$7,now(),now()) RETURNING *`,
      [warehouse_code.trim(), warehouse_name.trim(), warehouse_type.trim(), warehouse_ui_label||'', warehouse_ui_order||0, userId, userId]
    );
    res.status(201).json(r.rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

router.put('/api/warehouses/:id', ensureAdmin, async (req, res) => {
  const { warehouse_code, warehouse_name, warehouse_type, warehouse_ui_label, warehouse_ui_order } = req.body;
  if (!warehouse_code || !warehouse_name || !warehouse_type) return res.status(400).json({ error: 'Warehouse code, name, and type are required' });
  try {
    const userId = req.session.user.id;
    const r = await pool.query(
      `UPDATE odts.warehouse_master SET warehouse_code=$1, warehouse_name=$2, warehouse_type=$3, warehouse_ui_label=$4, warehouse_ui_order=$5, updated_by=$6, updated_at=now()
       WHERE warehouse_id=$7 RETURNING *`,
      [warehouse_code.trim(), warehouse_name.trim(), warehouse_type.trim(), warehouse_ui_label||'', warehouse_ui_order||0, userId, req.params.id]
    );
    if (!r.rows.length) return res.status(404).json({ error: 'Not found' });
    res.json(r.rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

module.exports = router;
