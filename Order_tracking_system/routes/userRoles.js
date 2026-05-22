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

router.get('/master/user-roles', ensureAuth, (req, res) => {
  if (req.session.user.role !== 'ADMIN') return res.status(403).send('Access denied. Admin only.');
  res.render('master/user_roles', { user: req.session.user });
});

// --- REST API ---

// GET all user roles
router.get('/api/user-roles', ensureAdmin, async (req, res) => {
  try {
    const r = await pool.query(`
      SELECT
        ur.*,
        u.user_login_name AS updated_by
      FROM odts.user_roles ur
      LEFT JOIN odts.users u ON u.user_id = ur.updated_by
      ORDER BY ur.role_name
    `);
    res.json(r.rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// POST create user roles
router.post('/api/user-roles', ensureAdmin, async (req, res) => {
  const { role_name, role_desc } = req.body;
  if (!role_name) return res.status(400).json({ error: 'Role name required' });
  try {
    const r = await pool.query(
      `INSERT INTO odts.user_roles(role_name, role_desc, created_by, updated_by, created_at, updated_at) VALUES($1,$2,$3,$4,now(),now()) RETURNING *`,
      [role_name.trim().toUpperCase(), role_desc||'', req.session.user.id, req.session.user.id]
    );
    res.status(201).json(r.rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// PUT update user roles
router.put('/api/user-roles/:id', ensureAdmin, async (req, res) => {
  const { role_name, role_desc } = req.body;
  if (!role_name) return res.status(400).json({ error: 'Role name required' });
  try {
    const r = await pool.query(
      `UPDATE odts.user_roles SET role_name=$1, role_desc=$2, updated_by=$3, updated_at=now() WHERE role_id=$4 RETURNING *`,
      [role_name.trim().toUpperCase(), role_desc||'', req.session.user.id, req.params.id]
    );
    if (!r.rows.length) return res.status(404).json({ error: 'Role not found' });
    res.json(r.rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

module.exports = router;
