const express = require('express');
const router = express.Router();
const userModel = require('../models/userModel');
const pool = require('../db');
const failedPasswordAttemptsGlobal = new Map();
let hasUserIsLockedFlagColumnCache = null;
const auditColumnCache = new Map();

// ── Audit helpers ────────────────────────────────────────────────────────────
async function getAuditColumn(candidates) {
  const key = candidates.join('|');
  if (auditColumnCache.has(key)) return auditColumnCache.get(key);

  const r = await pool.query(
    `SELECT column_name
       FROM information_schema.columns
      WHERE table_schema = 'odts'
        AND table_name = 'user_login_audit'
        AND column_name = ANY($1::text[])
      ORDER BY array_position($1::text[], column_name)
      LIMIT 1`,
    [candidates]
  );

  const col = r.rows[0]?.column_name || null;
  auditColumnCache.set(key, col);
  return col;
}

async function insertAudit(req, user, method, status) {
  try {
    const ip = (req.headers['x-forwarded-for'] || req.socket.remoteAddress || '').split(',')[0].trim() || null;
    const ua = (req.headers['user-agent'] || '').substring(0, 500) || null;
    const sid = req.session ? req.session.id : null;

    const userIdCol = await getAuditColumn(['login_user_id', 'user_id']);
    const usernameCol = await getAuditColumn(['login_username', 'username']);
    const emailCol = await getAuditColumn(['login_email', 'email']);
    const mobileCol = await getAuditColumn(['login_mobile', 'mobile']);
    const roleCol = await getAuditColumn(['login_role', 'role']);
    const methodCol = await getAuditColumn(['login_method']);
    const statusCol = await getAuditColumn(['login_status']);
    const loginAtCol = await getAuditColumn(['login_at']);
    const ipCol = await getAuditColumn(['login_ip_address', 'ip_address']);
    const userAgentCol = await getAuditColumn(['login_user_agent', 'user_agent']);
    const sessionCol = await getAuditColumn(['login_session_id', 'session_id']);
    const activeCol = await getAuditColumn(['login_is_active', 'is_active']);
    const auditIdCol = await getAuditColumn(['audit_id', 'login_audit_id']);

    const cols = [];
    const vals = [];
    const placeholders = [];
    let i = 1;
    const add = (col, val) => {
      if (!col) return;
      cols.push(col);
      vals.push(val);
      placeholders.push(`$${i++}`);
    };

    add(userIdCol, user.id || null);
    add(usernameCol, user.username || null);
    add(emailCol, user.email || null);
    add(mobileCol, user.mobile || null);
    add(roleCol, user.role || null);
    add(methodCol, method || 'PASSWORD');
    add(statusCol, status || 'SUCCESS');
    add(ipCol, ip);
    add(userAgentCol, ua);
    add(sessionCol, sid);
    add(activeCol, String(status || '').toUpperCase() === 'SUCCESS');

    if (loginAtCol) {
      cols.push(loginAtCol);
      placeholders.push('NOW()');
    }

    if (!cols.length) return null;

    const returning = auditIdCol ? ` RETURNING ${auditIdCol} AS audit_id` : '';
    const result = await pool.query(
      `INSERT INTO odts.user_login_audit (${cols.join(', ')})
       VALUES (${placeholders.join(', ')})${returning}`,
      vals
    );

    return result.rows[0]?.audit_id || null;
  } catch (e) {
    console.error('[Audit] insert error:', e.message);
    return null;
  }
}

async function markLogout({ sessionId = null, userId = null, auditId = null } = {}) {
  try {
    const logoutAtCol = await getAuditColumn(['logout_at', 'login_logout_at']);
    const activeCol = await getAuditColumn(['login_is_active', 'is_active']);
    const sessionCol = await getAuditColumn(['login_session_id', 'session_id']);
    const userIdCol = await getAuditColumn(['login_user_id', 'user_id']);
    const auditIdCol = await getAuditColumn(['audit_id', 'login_audit_id']);

    const setParts = [];
    if (logoutAtCol) setParts.push(`${logoutAtCol} = NOW()`);
    if (activeCol) setParts.push(`${activeCol} = FALSE`);
    if (!setParts.length) return;

    const whereParts = [];
    const vals = [];
    let i = 1;

    if (auditId && auditIdCol) {
      whereParts.push(`${auditIdCol} = $${i++}`);
      vals.push(auditId);
    } else if (sessionId && sessionCol) {
      whereParts.push(`${sessionCol} = $${i++}`);
      vals.push(sessionId);
    } else if (userId && userIdCol) {
      whereParts.push(`${userIdCol} = $${i++}`);
      vals.push(userId);
    }

    if (!whereParts.length) return;
    if (activeCol) whereParts.push(`${activeCol} = TRUE`);

    await pool.query(
      `UPDATE odts.user_login_audit
          SET ${setParts.join(', ')}
        WHERE ${whereParts.join(' AND ')}`,
      vals
    );
  } catch (e) {
    console.error('[Audit] logout error:', e.message);
  }
}
// ─────────────────────────────────────────────────────────────────────────────

async function hasTableColumn(tableName, columnName) {
  const result = await pool.query(
    `SELECT 1
       FROM information_schema.columns
      WHERE table_schema = 'odts'
        AND table_name = $1
        AND column_name = $2`,
    [tableName, columnName]
  );
  return result.rows.length > 0;
}

async function fetchSignupScreenData() {
  const rolesRes = await pool.query(
    `SELECT role_id, role_name
       FROM odts.user_roles_master
      ORDER BY role_name`
  );

  const hasDealerCompanyName = await hasTableColumn('dealers', 'dealer_company_name');
  const hasDealerActiveFlag = await hasTableColumn('dealers', 'dealer_is_active_flag');

  const dealersRes = await pool.query(
    `SELECT dealer_id,
            dealer_name,
            dealer_code,
            ${hasDealerCompanyName ? 'dealer_company_name' : 'dealer_name AS dealer_company_name'}
       FROM odts.dealer_master
      ${hasDealerActiveFlag ? 'WHERE COALESCE(dealer_is_active_flag, TRUE) = TRUE' : ''}
      ORDER BY dealer_name`
  );

  const warehousesRes = await pool.query(
    `SELECT warehouse_id, warehouse_name
       FROM odts.warehouse_master
      ORDER BY warehouse_name`
  );

  const usersRes = await pool.query(
    `SELECT u.user_id,
            u.user_role_id,
            u.dealer_id,
            u.user_warehouse_id,
            u.user_login_name,
            u.user_name,
        ${hasDealerCompanyName ? 'd.dealer_company_name' : 'd.dealer_name AS dealer_company_name'},
        d.dealer_name,
            w.warehouse_name,
            COALESCE(u.user_is_active_flag, TRUE)  AS user_is_active_flag,
            COALESCE(u.user_is_locked_flag, FALSE) AS user_is_locked_flag,
            r.role_name
       FROM odts.user_master u
       LEFT JOIN odts.user_roles_master r ON r.role_id = u.user_role_id
      LEFT JOIN odts.dealer_master d ON d.dealer_id = u.dealer_id
      LEFT JOIN odts.warehouse_master w ON w.warehouse_id = u.user_warehouse_id
      ORDER BY u.user_role_id, u.dealer_id, u.user_login_name`
  );

  return {
    roles: rolesRes.rows,
    dealers: dealersRes.rows,
    warehouses: warehousesRes.rows,
    existingUsers: usersRes.rows,
  };
}

async function renderSignup(req, res, { error = null, success = null, formData = {} } = {}) {
  const data = await fetchSignupScreenData();
  return res.render('signup', {
    error,
    success,
    roles: data.roles,
    dealers: data.dealers,
    warehouses: data.warehouses,
    existingUsers: data.existingUsers,
    formData,
    user: req.session && req.session.user ? req.session.user : null,
  });
}

function ensureAuthenticated(req, res, next) {
  if (req.session && req.session.user) return next();
  return res.redirect('/signin');
}

function isAdminOrOfficeExecutiveRole(roleValue) {
  const normalized = String(roleValue || '').trim().toUpperCase().replace(/[\s-]+/g, '_');
  return normalized === 'ADMIN' || normalized === 'OFFICE_EXECUTIVE';
}

function ensureAdminOrOfficeExecutive(req, res, next) {
  if (!req.session || !req.session.user) return res.redirect('/signin');
  if (isAdminOrOfficeExecutiveRole(req.session.user.role)) return next();
  return res.status(403).send('Access denied. Admin or Office Executive only.');
}

function getFailedAttemptStore(req) {
  if (!req.session) return {};
  if (!req.session.failedPasswordAttempts) req.session.failedPasswordAttempts = {};
  return req.session.failedPasswordAttempts;
}

function incrementFailedAttempt(req, loginName) {
  const key = String(loginName || '').trim().toLowerCase();
  if (!key) return 0;
  const store = getFailedAttemptStore(req);
  store[key] = (store[key] || 0) + 1;
  return store[key];
}

function clearFailedAttempt(req, loginName) {
  const key = String(loginName || '').trim().toLowerCase();
  if (!key || !req.session || !req.session.failedPasswordAttempts) return;
  delete req.session.failedPasswordAttempts[key];
}

function getFailedAttemptKey(userId, loginName) {
  if (userId) return `id:${userId}`;
  const normalizedLogin = String(loginName || '').trim().toLowerCase();
  return normalizedLogin ? `login:${normalizedLogin}` : '';
}

function incrementGlobalFailedAttempt(userId, loginName) {
  const key = getFailedAttemptKey(userId, loginName);
  if (!key) return 0;
  const next = (failedPasswordAttemptsGlobal.get(key) || 0) + 1;
  failedPasswordAttemptsGlobal.set(key, next);
  return next;
}

function clearGlobalFailedAttempt(userId, loginName) {
  const key = getFailedAttemptKey(userId, loginName);
  if (!key) return;
  failedPasswordAttemptsGlobal.delete(key);
}

async function hasUserIsLockedFlagColumn() {
  if (hasUserIsLockedFlagColumnCache !== null) return hasUserIsLockedFlagColumnCache;
  try {
    const r = await pool.query(
      `SELECT 1
         FROM information_schema.columns
        WHERE table_schema = 'odts'
          AND table_name = 'users'
          AND column_name = 'user_is_locked_flag'`
    );
    hasUserIsLockedFlagColumnCache = r.rows.length > 0;
  } catch (e) {
    hasUserIsLockedFlagColumnCache = false;
  }
  return hasUserIsLockedFlagColumnCache;
}

async function lockUserAfterFailedAttempts(userId) {
  if (!userId) return;
  try {
    if (await hasUserIsLockedFlagColumn()) {
      await pool.query(
        `UPDATE odts.user_master
            SET user_is_locked_flag = TRUE
          WHERE user_id = $1`,
        [userId]
      );
      return;
    }
  } catch (e) {
    console.error('[Auth] direct user_is_locked_flag update failed:', e.message);
  }
  await userModel.setUserLockedFlag(userId, true);
}

// ── /api/me — returns current session user (for Flutter / mobile clients) ────
router.get('/api/me', (req, res) => {
  if (req.session && req.session.user) {
    return res.json(req.session.user);
  }
  return res.status(401).json({ error: 'Not authenticated' });
});

// Landing page: Sign-in for unauthenticated users, dashboard for signed-in users
router.get('/', (req, res) => {
  if (req.session && req.session.user) return res.redirect('/dashboard');
  return res.redirect('/signin');
});

router.get('/signup', ensureAdminOrOfficeExecutive, async (req, res) => {
  try {
    await renderSignup(req, res, { error: null, success: null, formData: {} });
  } catch (err) {
    console.error(err);
    res.render('signup', { error: 'Unable to load page data', success: null, roles: [], dealers: [], warehouses: [], existingUsers: [], formData: {} });
  }
});

router.post('/signup', ensureAdminOrOfficeExecutive, async (req, res) => {
  const {
    role_id,
    dealer_id,
    warehouse_id,
    user_login_name,
    password,
    user_name,
    user_phone,
    user_email,
  } = req.body;

  const formData = {
    role_id: role_id || '',
    dealer_id: dealer_id || '',
    warehouse_id: warehouse_id || '',
    user_login_name: user_login_name || '',
    user_name: user_name || '',
    user_phone: user_phone || '',
    user_email: user_email || '',
  };

  try {
    const parsedRoleId = parseInt(role_id, 10);
    if (!parsedRoleId) {
      return renderSignup(req, res, { error: 'Role is mandatory.', formData });
    }

    const roleRes = await pool.query('SELECT role_id, role_name FROM odts.user_roles_master WHERE role_id = $1', [parsedRoleId]);
    if (!roleRes.rows.length) {
      return renderSignup(req, res, { error: 'Selected role is invalid.', formData });
    }
    const role = roleRes.rows[0];
    const isDealerRole = String(role.role_name || '').toUpperCase() === 'DEALER';
    const isStockManagerRole = String(role.role_name || '').toUpperCase() === 'STOCK_MANAGER';
    const isDispatcherRole = String(role.role_name || '').toUpperCase() === 'DISPATCHER';

    let parsedDealerId = null;
    if (isDealerRole) {
      parsedDealerId = parseInt(dealer_id, 10);
      if (!parsedDealerId) {
        return renderSignup(req, res, { error: 'Dealer is mandatory for Dealer role.', formData });
      }

      const hasDealerActiveFlag = await hasTableColumn('dealers', 'dealer_is_active_flag');

      const dealerExists = await pool.query(
        `SELECT dealer_id
           FROM odts.dealer_master
          WHERE dealer_id = $1
            ${hasDealerActiveFlag ? 'AND COALESCE(dealer_is_active_flag, TRUE) = TRUE' : ''}`,
        [parsedDealerId]
      );
      if (!dealerExists.rows.length) {
        return renderSignup(req, res, { error: 'Selected dealer is invalid or inactive.', formData });
      }
    }

    let parsedWarehouseId = null;
    if (isStockManagerRole || isDispatcherRole) {
      parsedWarehouseId = parseInt(warehouse_id, 10);
      if (!parsedWarehouseId) {
        return renderSignup(req, res, { error: `Warehouse is mandatory for ${role.role_name} role.`, formData });
      }

      const warehouseExists = await pool.query(
        `SELECT warehouse_id FROM odts.warehouse_master
         WHERE warehouse_id = $1`,
        [parsedWarehouseId]
      );
      if (!warehouseExists.rows.length) {
        return renderSignup(req, res, { error: 'Selected warehouse is invalid.', formData });
      }
    }

    const createdBy = req.session && req.session.user && req.session.user.id ? req.session.user.id : 0;

    await userModel.createLoginUser({
      roleId: parsedRoleId,
      dealerId: isDealerRole ? parsedDealerId : null,
      userWarehouseId: (isStockManagerRole || isDispatcherRole) ? parsedWarehouseId : null,
      userLoginName: String(user_login_name).trim(),
      password: String(password),
      userName: isDealerRole ? null : (user_name ? String(user_name).trim() : null),
      userPhone: isDealerRole ? null : (user_phone ? String(user_phone).trim() : null),
      userEmail: isDealerRole ? null : (user_email ? String(user_email).trim().toLowerCase() : null),
      createdBy,
    });

    return renderSignup(req, res, {
      success: 'Login user created successfully.',
      error: null,
      formData: {},
    });
  } catch (err) {
    console.error(err);
    let errorMsg = 'Server error';

    // Handle specific database constraint errors
    if (err.code === '23505') { // Unique constraint violation
      if (err.detail && err.detail.includes('user_phone')) {
        errorMsg = 'Phone number already exists. Please use a different phone number.';
      } else if (err.detail && err.detail.includes('user_login_name')) {
        errorMsg = 'Login name already exists. Please use a different login name.';
      } else if (err.detail && err.detail.includes('user_email')) {
        errorMsg = 'Email already exists. Please use a different email.';
      } else {
        errorMsg = 'This record already exists. Please check the entered data.';
      }
    }

    return renderSignup(req, res, { error: errorMsg, formData });
  }
});

router.get('/signin', (req, res) => {
  if (req.session && req.session.user) return res.redirect('/dashboard');
  res.render('signin', { error: null });
});

router.post('/signin', async (req, res) => {
  // handle user name/password signin
  const { user_login_name, password } = req.body;
  if (!user_login_name || !password) return res.render('signin', { error: 'Provide user name and password' });

  const loginName = String(user_login_name || '').trim();
  try {
    console.log(`[Signin] Attempting login for: ${loginName}`);
    const user = await userModel.findUserByLoginName(loginName);
    console.log(`[Signin] User lookup result:`, user ? `Found (id: ${user.id})` : 'NOT FOUND');

    if (!user) {
      await insertAudit(req, { username: loginName }, 'PASSWORD', 'FAILED');
      return res.render('signin', { error: 'Invalid user name or password' });
    }

    if (!user.user_is_active_flag) {
      console.log(`[Signin] User inactive`);
      await insertAudit(req, { id: user.id, username: user.user_login_name || user.username, email: user.email, mobile: user.mobile || null, role: user.role }, 'PASSWORD', 'FAILED');
      return res.render('signin', { error: 'User is not active. Kindly contact Office' });
    }

    if (user.user_is_locked_flag) {
      console.log(`[Signin] User locked`);
      await insertAudit(req, { id: user.id, username: user.user_login_name || user.username, email: user.email, mobile: user.mobile || null, role: user.role }, 'PASSWORD', 'FAILED');
      return res.render('signin', { error: 'User is locked due to multiple incorrect password. Kindly contact Office' });
    }

    console.log(`[Signin] Verifying password for user: ${user.user_login_name}`);
    const ok = await userModel.verifyPassword(password, user.password_hash);
    console.log(`[Signin] Password verification:`, ok ? 'SUCCESS' : 'FAILED');
    if (!ok) {
      await insertAudit(req, { id: user.id, username: user.user_login_name || user.username, email: user.email, mobile: user.mobile || null, role: user.role }, 'PASSWORD', 'FAILED');

      const failedAttemptsFromAudit = await userModel.countConsecutiveFailedPasswordAttempts(user.id);
      const failedAttemptsFromSession = incrementFailedAttempt(req, loginName);
      const failedAttemptsFromGlobal = incrementGlobalFailedAttempt(user.id, loginName);
      const failedAttempts = Math.max(failedAttemptsFromAudit || 0, failedAttemptsFromSession || 0, failedAttemptsFromGlobal || 0);

      if (failedAttempts >= 5) {
        await lockUserAfterFailedAttempts(user.id);
        clearFailedAttempt(req, loginName);
        clearGlobalFailedAttempt(user.id, loginName);
        return res.render('signin', { error: 'User is locked due to multiple incorrect password. Kindly contact Office' });
      }

      return res.render('signin', { error: 'Invalid user name or password' });
    }

    req.session.user = {
      id: user.id,
      username: user.username,
      user_login_name: user.user_login_name || user.username,
      email: user.email,
      mobile: user.mobile || null,
      role: user.role || 'user',
      dealer_id: user.dealer_id || null,
      user_warehouse_id: user.user_warehouse_id || null
    };

    await userModel.updateUserLastLoginAt(user.id);
    clearFailedAttempt(req, loginName);
    clearGlobalFailedAttempt(user.id, loginName);
    const auditId = await insertAudit(req, req.session.user, 'PASSWORD', 'SUCCESS');
    if (req.session) req.session.loginAuditId = auditId || null;
    res.redirect('/dashboard');
  } catch (err) {
    console.error(err);
    res.render('signin', { error: 'Server error' });
  }
});

// Request OTP for mobile number (POST /request-otp)
router.post('/request-otp', async (req, res) => {
  return res.status(403).json({
    type: 'disabled',
    error: 'Mobile / OTP sign-in is disabled as of now.'
  });
});

// Verify OTP (POST /verify-otp)
router.post('/verify-otp', async (req, res) => {
  return res.status(403).json({
    type: 'disabled',
    error: 'Mobile / OTP sign-in is disabled as of now.'
  });
});

router.get('/logout', async (req, res) => {
  const sid = req.session ? req.session.id : null;
  const userId = req.session && req.session.user ? req.session.user.id : null;
  const auditId = req.session ? req.session.loginAuditId : null;
  await markLogout({ sessionId: sid, userId, auditId });
  req.session.destroy(() => res.redirect('/signin'));
});

// Change password endpoint
router.post('/api/change-password', ensureAuthenticated, async (req, res) => {
  try {
    const { currentPassword, newPassword } = req.body;
    const userId = req.session.user.id;

    // Validate input
    if (!currentPassword || !newPassword) {
      return res.status(400).json({ error: 'Current and new password are required' });
    }

    if (newPassword.length < 6) {
      return res.status(400).json({ error: 'New password must be at least 6 characters' });
    }

    // Fetch user from database
    const userResult = await pool.query(
      'SELECT user_id, password_hash FROM odts.user_master WHERE user_id = $1',
      [userId]
    );

    if (userResult.rows.length === 0) {
      return res.status(404).json({ error: 'User not found' });
    }

    const user = userResult.rows[0];

    // Verify current password
    const bcrypt = require('bcrypt');
    const isPasswordValid = await bcrypt.compare(currentPassword, user.password_hash);

    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Current password is incorrect' });
    }

    // Hash new password
    const newPasswordHash = await bcrypt.hash(newPassword, 10);

    // Update password in database
    await pool.query(
      'UPDATE odts.user_master SET password_hash = $1, updated_at = NOW(), updated_by = $2 WHERE user_id = $3',
      [newPasswordHash, userId, userId]
    );

    res.json({ success: true, message: 'Password changed successfully' });
  } catch (e) {
    console.error('Error changing password:', e);
    res.status(500).json({ error: 'Failed to change password' });
  }
});

router.get('/dashboard', ensureAuthenticated, (req, res) => {
  const userRole = req.session.user.role;

  // Render role-specific dashboard
  if (userRole === 'STOCK_MANAGER') {
    return res.render('dashboard-stock-manager', { user: req.session.user });
  }

  if (userRole === 'DISPATCHER') {
    return res.render('dashboard-dispatcher', { user: req.session.user });
  }

  // Default dashboard for ADMIN, OFFICE_EXECUTIVE, DEALER, SALES_OFFICER
  res.render('dashboard', { user: req.session.user });
});

module.exports = router;
