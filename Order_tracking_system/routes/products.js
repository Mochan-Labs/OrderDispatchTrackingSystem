const express = require('express');
const router = express.Router();
const pool = require('../db');

function ensureAdminOrOffice(req, res, next) {
  if (!req.session || !req.session.user) return res.status(401).json({ error: 'Not authenticated' });
  const role = req.session.user.role;
  if (role !== 'ADMIN' && role !== 'OFFICE_EXECUTIVE') return res.status(403).json({ error: 'Access denied' });
  return next();
}

function ensureAuth(req, res, next) {
  if (!req.session || !req.session.user) return res.redirect('/signin');
  return next();
}

// --- Page route (admin and office executive) ---
router.get('/master/products', ensureAuth, (req, res) => {
  const role = req.session.user.role;
  if (role !== 'ADMIN' && role !== 'OFFICE_EXECUTIVE') return res.status(403).send('Access denied.');
  res.render('master/products', { user: req.session.user });
});

// --- REST API ---

// GET all products
router.get('/api/products', ensureAdminOrOffice, async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT
        p.product_id,
        p.product_name,
        p.product_desc,
        p.product_is_active_flag,
        p.created_at,
        p.updated_at,
        u.user_login_name AS updated_by
      FROM odts.products p
      LEFT JOIN odts.users u ON u.user_id = p.updated_by
      ORDER BY p.product_name
    `);
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch products' });
  }
});

// POST create product
router.post('/api/products', ensureAdminOrOffice, async (req, res) => {
  const { product_name, product_desc, product_is_active_flag } = req.body;
  if (!product_name) return res.status(400).json({ error: 'Product name is required' });
  try {
    const result = await pool.query(
      `INSERT INTO odts.products (product_name, product_desc, product_is_active_flag, created_by, updated_by, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, now(), now()) RETURNING *`,
      [product_name.trim(), product_desc || '', product_is_active_flag !== false, req.session.user.id, req.session.user.id]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create product' });
  }
});

// PUT update product
router.put('/api/products/:id', ensureAdminOrOffice, async (req, res) => {
  const { id } = req.params;
  const { product_name, product_desc, product_is_active_flag } = req.body;
  if (!product_name) return res.status(400).json({ error: 'Product name is required' });
  try {
    const result = await pool.query(
      `UPDATE odts.products SET product_name=$1, product_desc=$2, product_is_active_flag=$3, updated_by=$4, updated_at=now()
       WHERE product_id=$5 RETURNING *`,
      [product_name.trim(), product_desc || '', product_is_active_flag !== false, req.session.user.id, id]
    );
    if (!result.rows.length) return res.status(404).json({ error: 'Product not found' });
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to update product' });
  }
});

module.exports = router;
