const express = require('express');
const router = express.Router();
const pool = require('../db');
const { generatePresignedUploadUrl, generatePresignedReadUrl } = require('../services/s3Service');
const path = require('path');
const fs = require('fs');

// Helper: Generate local upload URL for development
function generateLocalUploadUrl(dealerId, orderId, fileName) {
  const now = new Date();
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, '0');
  const day = String(now.getDate()).padStart(2, '0');
  const timestamp = Math.floor(now.getTime() / 1000);
  const ext = fileName.split('.').pop() || 'jpg';

  const dir = `receipts/${year}/${month}/${day}/${dealerId}`;
  const filename = `O${orderId}_${timestamp}.${ext}`;
  const uploadDir = path.join(process.cwd(), 'public/uploads', dir);

  // Create directory if it doesn't exist
  if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
  }

  return {
    uploadUrl: `/api/dispatcher/upload-local`,
    filePath: path.join(dir, filename),
    uploadPath: path.join(uploadDir, filename)
  };
}
const { broadcastOrderUpdate } = require('../services/sseService');

function ensureDispatcher(req, res, next) {
  if (!req.session?.user) {
    const isApiRoute = req.path.startsWith('/api/');
    return isApiRoute ? res.status(401).json({ error: 'Unauthorized' }) : res.redirect('/signin');
  }
  const role = req.session.user.role;
  if (role !== 'DISPATCHER' && role !== 'ADMIN') {
    const isApiRoute = req.path.startsWith('/api/');
    return isApiRoute ? res.status(403).json({ error: 'Access denied. Dispatcher or Admin only.' }) : res.status(403).send('Access denied. Dispatcher or Admin only.');
  }
  return next();
}

// Generate presigned URLs for receipt images (or use local paths for development)
async function addPresignedUrlsToDispatcherOrders(orders) {
  try {
    for (const order of orders) {
      if (order.image_url && !order.image_url.includes('?')) {
        // For local storage, image_url is already a valid local path
        if (process.env.STORAGE_MODE === 'local') {
          console.log(`[Dispatcher] Using local image path: ${order.image_url}`);
          continue;
        }

        // For S3 storage, generate presigned URL
        const receiptIndex = order.image_url.indexOf('/receipts/');
        let s3Key = null;
        if (receiptIndex !== -1) {
          s3Key = order.image_url.substring(receiptIndex + 1);
        }
        if (s3Key) {
          try {
            console.log(`[Dispatcher] Generating presigned URL for: ${s3Key}`);
            const presignedUrl = await generatePresignedReadUrl(s3Key);
            order.image_url = presignedUrl;
          } catch (err) {
            console.error(`[Dispatcher] Failed to generate presigned URL for ${s3Key}:`, err.message);
          }
        }
      }
    }
  } catch (err) {
    console.error('[Dispatcher] Error adding presigned URLs:', err.message);
  }
  return orders;
}

// Page route
router.get('/dispatcher', ensureDispatcher, (req, res) => {
  res.render('dispatcher/dashboard', { user: req.session.user });
});

// GET orders grouped for dispatcher view
router.get('/api/dispatcher/orders', ensureDispatcher, async (req, res) => {
  try {
    const { statuses, startDate, endDate } = req.query;
    const statusFilter = statuses ? statuses.split(',') : ['ORDER_PLACED', 'ACCEPTED'];

    const conditions = ['o.order_status = ANY($1::text[])'];
    const values = [statusFilter];
    let paramIndex = 2;

    if (startDate) {
      conditions.push(`o.order_date >= $${paramIndex++}::timestamp`);
      values.push(`${startDate}T00:00:00`);
    }
    if (endDate) {
      conditions.push(`o.order_date <= $${paramIndex++}::timestamp`);
      values.push(`${endDate}T23:59:59.999`);
    }

    const whereClause = conditions.join(' AND ');

    const result = await pool.query(`
      SELECT
        o.order_id,
        o.dealer_id,
        o.order_quantity,
        o.load_type_code,
        o.preferred_location_code,
        o.order_status,
        o.order_date,
        o.driver_name AS driver_name_on_order,
        o.driver_phone AS driver_phone_on_order,
        o.vehicle_number AS vehicle_number_on_order,
        d.dealer_name,
        d.dealer_company_name,
        (SELECT u.user_login_name
           FROM odts.users u
          WHERE u.dealer_id = o.dealer_id
            AND u.user_role_id = (SELECT role_id FROM odts.user_roles WHERE role_name = 'DEALER' LIMIT 1)
          LIMIT 1
        ) AS dealer_login_name,
        dp.party_company_name,
        dp.party_name AS party_name_col,
        dp.party_phone,
        dp.party_address,
        lt.code_desc  AS load_type_desc,
        pl.code_desc  AS preferred_location_desc,
        od.dispatch_id,
        od.dispatch_vehicle_number,
        od.driver_name AS dispatch_driver_name,
        od.driver_phone AS dispatch_driver_phone,
        od.bilty_number,
        od.actual_loading_location_code,
        al.code_desc  AS actual_location_desc,
        od.dispatch_status,
        od.created_at AS dispatch_created_at,
        od.image_url,
        od.image_type,
        od.image_original_size,
        od.image_compressed_size,
        od.image_uploaded_at,
        (SELECT COALESCE(json_agg(json_build_object(
            'item_id',       oi.item_id,
            'product_id',    oi.product_id,
            'product_name',  p.product_name,
            'order_bags',    oi.order_bags,
            'order_quantity', oi.order_quantity::text,
            'order_dispatch_bags', oi.order_dispatch_bags,
            'order_dispatch_quantity', oi.order_dispatch_quantity::text,
            'order_dispatch_comments', oi.order_dispatch_comments
          ) ORDER BY oi.item_id), '[]'::json)
         FROM odts.dealer_order_items oi
         LEFT JOIN odts.products p ON p.product_id = oi.product_id
         WHERE oi.order_id = o.order_id
        ) AS items
      FROM odts.dealer_orders o
      LEFT JOIN odts.dealers       d  ON d.dealer_id  = o.dealer_id
      LEFT JOIN odts.dealer_party  dp ON dp.party_id  = o.party_id
      LEFT JOIN odts.code_reference lt ON lt.code_type = 'loading_type'     AND lt.code = o.load_type_code
      LEFT JOIN odts.code_reference pl ON pl.code_type = 'loading_location' AND pl.code = o.preferred_location_code
      LEFT JOIN odts.order_dispatch od ON od.order_id  = o.order_id
      LEFT JOIN odts.code_reference al ON al.code_type = 'loading_location' AND al.code = od.actual_loading_location_code
      WHERE ${whereClause}
      ORDER BY o.dealer_id, o.order_date ASC
    `, values);

    const ordersWithPresignedUrls = await addPresignedUrlsToDispatcherOrders(result.rows);
    res.json(ordersWithPresignedUrls);
  } catch (e) {
    console.error('[Dispatcher] orders error:', e.message);
    res.status(500).json({ error: e.message });
  }
});

// POST accept: ORDER_PLACED → ACCEPTED
router.post('/api/dispatcher/orders/:id/accept', ensureDispatcher, async (req, res) => {
  try {
    const orderId = parseInt(req.params.id);
    const existing = await pool.query(
      'SELECT order_id, order_status FROM odts.dealer_orders WHERE order_id = $1',
      [orderId]
    );
    if (!existing.rows.length) return res.status(404).json({ error: 'Order not found' });
    if (existing.rows[0].order_status !== 'ORDER_PLACED') {
      return res.status(400).json({ error: `Order is ${existing.rows[0].order_status}, cannot accept` });
    }
    await pool.query(
      `UPDATE odts.dealer_orders
          SET order_status = 'ACCEPTED', updated_by = $1, updated_at = NOW()
        WHERE order_id = $2`,
      [req.session.user.id, orderId]
    );
    broadcastOrderUpdate({ orderId, newStatus: 'ACCEPTED', updatedBy: req.session.user.id });
    res.json({ success: true });
  } catch (e) {
    console.error('[Dispatcher] accept error:', e.message);
    res.status(500).json({ error: e.message });
  }
});

// POST presigned URL for receipt upload
router.post('/api/dispatcher/presigned-url', ensureDispatcher, async (req, res) => {
  try {
    const { order_id, dealer_id, file_name, file_type } = req.body;

    if (!order_id || !dealer_id || !file_name || !file_type) {
      return res.status(400).json({ error: 'Missing required fields: order_id, dealer_id, file_name, file_type' });
    }

    console.log(`[Dispatcher] Presigned URL request: order=${order_id}, dealer=${dealer_id}, file=${file_name}, type=${file_type}`);

    // Check storage mode - use local storage for development
    if (process.env.STORAGE_MODE === 'local') {
      const localUrl = generateLocalUploadUrl(dealer_id, order_id, file_name);
      return res.json({
        url: localUrl.uploadUrl,
        s3Key: localUrl.filePath,
        isLocal: true
      });
    }

    const presignedUrl = await generatePresignedUploadUrl(dealer_id, order_id, file_name, file_type);
    res.json(presignedUrl);
  } catch (error) {
    console.error('[Dispatcher] presigned URL error:', error);
    console.error('[Dispatcher] Error details:', error.message, error.code);
    res.status(500).json({ error: `Failed to generate upload URL: ${error.message}` });
  }
});

// POST local file upload handler (for local development only)
router.post('/api/dispatcher/upload-local', ensureDispatcher, async (req, res) => {
  try {
    const { filePath, fileData, order_id, dealer_id } = req.body;

    if (!filePath || !fileData) {
      return res.status(400).json({ error: 'Missing filePath or fileData' });
    }

    const uploadDir = path.join(process.cwd(), 'public/uploads');
    const fullPath = path.join(uploadDir, filePath);

    // Security: ensure path is within uploads directory
    if (!fullPath.startsWith(uploadDir)) {
      return res.status(400).json({ error: 'Invalid file path' });
    }

    // Create directory if needed
    const dir = path.dirname(fullPath);
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }

    // Handle base64 or direct binary data
    let buffer;
    if (typeof fileData === 'string') {
      // Base64 encoded
      const base64Data = fileData.includes(',') ? fileData.split(',')[1] : fileData;
      buffer = Buffer.from(base64Data, 'base64');
    } else {
      buffer = Buffer.from(fileData);
    }

    fs.writeFileSync(fullPath, buffer);

    const localPath = `/uploads/${filePath}`;
    console.log(`[Dispatcher] File saved locally: ${localPath} (order=${order_id}, dealer=${dealer_id})`);

    res.json({
      success: true,
      image_url: localPath,
      ETag: Buffer.from(localPath).toString('base64').substring(0, 16),
      VersionId: null
    });
  } catch (error) {
    console.error('[Dispatcher] Local upload error:', error);
    res.status(500).json({ error: `Upload failed: ${error.message}` });
  }
});

// POST dispatch: ACCEPTED → DISPATCHED + create/update order_dispatch record
router.post('/api/dispatcher/orders/:id/dispatch', ensureDispatcher, async (req, res) => {
  try {
    const orderId = parseInt(req.params.id);
    const { vehicle_number, driver_name, driver_phone, bilty_number, actual_loading_location_code, image_url, image_type, image_original_size, image_compressed_size } = req.body;

    if (!vehicle_number?.trim())                return res.status(400).json({ error: 'Vehicle number is required' });
    if (!driver_phone?.trim())                  return res.status(400).json({ error: 'Driver phone is required' });
    if (!bilty_number?.trim())                  return res.status(400).json({ error: 'Bilty number is required' });
    if (!actual_loading_location_code?.trim())  return res.status(400).json({ error: 'Actual loading location is required' });

    const existing = await pool.query(
      'SELECT order_id, order_status FROM odts.dealer_orders WHERE order_id = $1',
      [orderId]
    );
    if (!existing.rows.length) return res.status(404).json({ error: 'Order not found' });
    if (existing.rows[0].order_status !== 'ACCEPTED') {
      return res.status(400).json({ error: 'Order must be ACCEPTED before dispatching' });
    }

    const userId       = req.session.user.id;
    const vehicleUpper = vehicle_number.trim().toUpperCase();

    const existingDispatch = await pool.query(
      'SELECT dispatch_id FROM odts.order_dispatch WHERE order_id = $1',
      [orderId]
    );

    if (existingDispatch.rows.length) {
      await pool.query(
        `UPDATE odts.order_dispatch
            SET dispatch_vehicle_number      = $1,
                driver_name                  = $2,
                driver_phone                 = $3,
                bilty_number                 = $4,
                actual_loading_location_code = $5,
                image_url                    = COALESCE($8, image_url),
                image_type                   = COALESCE($9, image_type),
                image_original_size          = COALESCE($10, image_original_size),
                image_compressed_size        = COALESCE($11, image_compressed_size),
                image_uploaded_at            = CASE WHEN $8 IS NOT NULL THEN NOW() ELSE image_uploaded_at END,
                updated_by                   = $6,
                updated_at                   = NOW()
          WHERE dispatch_id = $7`,
        [vehicleUpper, driver_name || null, driver_phone.trim(),
         bilty_number.trim(), actual_loading_location_code.trim(),
         userId, existingDispatch.rows[0].dispatch_id,
         image_url || null, image_type || null, image_original_size || null, image_compressed_size || null]
      );
    } else {
      await pool.query(
        `INSERT INTO odts.order_dispatch
           (order_id, dispatch_vehicle_number, driver_name, driver_phone,
            bilty_number, actual_loading_location_code, image_url, image_type,
            image_original_size, image_compressed_size, image_uploaded_at,
            created_by, updated_by, created_at, updated_at)
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $12, NOW(), NOW())`,
        [orderId, vehicleUpper, driver_name || null, driver_phone.trim(),
         bilty_number.trim(), actual_loading_location_code.trim(),
         image_url || null, image_type || null, image_original_size || null,
         image_compressed_size || null, image_url ? 'NOW()' : null, userId]
      );
    }

    await pool.query(
      `UPDATE odts.dealer_orders
          SET order_status = 'DISPATCHED', updated_by = $1, updated_at = NOW()
        WHERE order_id = $2`,
      [userId, orderId]
    );

    broadcastOrderUpdate({ orderId, newStatus: 'DISPATCHED', updatedBy: userId });
    res.json({ success: true });
  } catch (e) {
    console.error('[Dispatcher] dispatch error:', e.message);
    res.status(500).json({ error: e.message });
  }
});

// PATCH /api/dispatcher/orders/:id/dispatch-quantities — update dispatch quantities in dealer_order_items
router.patch('/api/dispatcher/orders/:id/dispatch-quantities', ensureDispatcher, async (req, res) => {
  try {
    const orderId = parseInt(req.params.id);
    const { dispatchQuantities } = req.body; // Array of { item_id, dispatch_bags, dispatch_quantity }

    if (!Array.isArray(dispatchQuantities) || dispatchQuantities.length === 0) {
      return res.status(400).json({ error: 'Dispatch quantities are required' });
    }

    console.log(`[Dispatcher] Updating dispatch quantities for order ${orderId}:`, JSON.stringify(dispatchQuantities, null, 2));

    const client = await pool.connect();
    try {
      await client.query('BEGIN');

      // Update each item with dispatch quantities and comments
      for (const item of dispatchQuantities) {
        const { item_id, dispatch_bags, dispatch_quantity, dispatch_comments } = item;

        if (!item_id || dispatch_bags === undefined || dispatch_quantity === undefined) {
          throw new Error('Invalid dispatch quantity data');
        }

        // Fetch the original order_bags and order_quantity for validation
        const itemData = await client.query(
          `SELECT oi.order_bags, oi.order_quantity, p.product_name
           FROM odts.dealer_order_items oi
           LEFT JOIN odts.products p ON p.product_id = oi.product_id
           WHERE oi.item_id = $1`,
          [parseInt(item_id)]
        );

        if (itemData.rows.length === 0) {
          throw new Error(`Item ${item_id} not found`);
        }

        const { order_bags, order_quantity, product_name } = itemData.rows[0];
        const dispatchBags = parseInt(dispatch_bags) || 0;
        const dispatchQty = parseFloat(dispatch_quantity) || 0;
        const productDisplay = product_name || `Item #${item_id}`;

        // Validation: dispatch_bags should not exceed order_bags
        if (dispatchBags > parseInt(order_bags)) {
          throw new Error(`${productDisplay}: Dispatch bags (${dispatchBags}) cannot exceed order bags (${order_bags})`);
        }

        // Validation: dispatch_quantity should not exceed order_quantity
        if (dispatchQty > parseFloat(order_quantity)) {
          throw new Error(`${productDisplay}: Dispatch quantity (${dispatchQty}) cannot exceed order quantity (${order_quantity})`);
        }

        console.log(`[Dispatcher] Updating item ${item_id}: bags=${dispatchBags}, qty=${dispatchQty}`);

        await client.query(
          `UPDATE odts.dealer_order_items
           SET order_dispatch_bags = $1, order_dispatch_quantity = $2, order_dispatch_comments = $4
           WHERE item_id = $3`,
          [dispatchBags, dispatchQty, parseInt(item_id), dispatch_comments || null]
        );
      }

      // Calculate dispatch status based on totals
      const totalsResult = await client.query(
        `SELECT
          COALESCE(SUM(order_bags), 0) as total_order_bags,
          COALESCE(SUM(order_dispatch_bags), 0) as total_dispatch_bags
         FROM odts.dealer_order_items
         WHERE order_id = $1`,
        [orderId]
      );

      let { total_order_bags, total_dispatch_bags } = totalsResult.rows[0];

      // Ensure values are numbers, not strings
      total_order_bags = parseInt(total_order_bags) || 0;
      total_dispatch_bags = parseInt(total_dispatch_bags) || 0;

      console.log(`[Dispatcher] Order ${orderId} totals: total_order_bags=${total_order_bags}, total_dispatch_bags=${total_dispatch_bags}`);
      console.log(`[Dispatcher] Types: order_bags=${typeof total_order_bags}, dispatch_bags=${typeof total_dispatch_bags}`);

      let dispatchStatus = 'dispatch_onhold';

      console.log(`[Dispatcher] Condition check: ${total_dispatch_bags} === ${total_order_bags}? ${total_dispatch_bags === total_order_bags}`);
      console.log(`[Dispatcher] Condition check: ${total_dispatch_bags} > 0? ${total_dispatch_bags > 0}`);
      console.log(`[Dispatcher] Condition check: ${total_dispatch_bags} < ${total_order_bags}? ${total_dispatch_bags < total_order_bags}`);
      console.log(`[Dispatcher] Condition check: ${total_dispatch_bags} > 0 && ${total_dispatch_bags} < ${total_order_bags}? ${total_dispatch_bags > 0 && total_dispatch_bags < total_order_bags}`);

      if (total_dispatch_bags === total_order_bags) {
        dispatchStatus = 'dispatch_completed';
      } else if (total_dispatch_bags > 0 && total_dispatch_bags < total_order_bags) {
        dispatchStatus = 'dispatch_partial';
      }

      console.log(`[Dispatcher] Setting dispatch_status to: ${dispatchStatus}`);

      // Update dispatch status in order_dispatch
      await client.query(
        `UPDATE odts.order_dispatch
         SET dispatch_status = $1, updated_at = NOW()
         WHERE order_id = $2`,
        [dispatchStatus, orderId]
      );

      console.log(`[Dispatcher] Successfully updated order ${orderId} dispatch_status to: ${dispatchStatus}`);

      await client.query('COMMIT');

      res.json({
        success: true,
        dispatch_status: dispatchStatus,
        message: `Dispatch updated to ${dispatchStatus} status`
      });
    } catch (e) {
      await client.query('ROLLBACK');
      throw e;
    } finally {
      client.release();
    }
  } catch (e) {
    console.error('[Dispatcher] update dispatch quantities error:', e.message);
    res.status(500).json({ error: e.message });
  }
});

// PATCH /api/dispatcher/orders/:id/dispatch — update dispatch details (vehicle, driver, bilty, location, receipt)
router.patch('/api/dispatcher/orders/:id/dispatch', ensureDispatcher, async (req, res) => {
  try {
    const orderId = parseInt(req.params.id);
    const { vehicle_number, driver_name, driver_phone, bilty_number, actual_loading_location_code, image_url, image_type, image_original_size, image_compressed_size } = req.body;

    console.log('[Dispatcher] Updating dispatch for order:', orderId, { vehicle_number, driver_name, driver_phone, bilty_number, actual_loading_location_code, image_url: image_url ? 'provided' : 'none' });

    // Check if dispatch record exists
    const existing = await pool.query(
      'SELECT dispatch_id FROM odts.order_dispatch WHERE order_id = $1',
      [orderId]
    );

    if (!existing.rows.length) {
      return res.status(404).json({ error: 'Dispatch record not found' });
    }

    // Update order_dispatch record with non-null values only
    const updates = [];
    const values = [];
    let paramIndex = 1;

    if (vehicle_number) {
      updates.push(`dispatch_vehicle_number = $${paramIndex++}`);
      values.push(vehicle_number.toUpperCase().trim());
    }
    if (driver_name) {
      updates.push(`driver_name = $${paramIndex++}`);
      values.push(driver_name.trim());
    }
    if (driver_phone) {
      updates.push(`driver_phone = $${paramIndex++}`);
      values.push(driver_phone.trim());
    }
    if (bilty_number) {
      updates.push(`bilty_number = $${paramIndex++}`);
      values.push(bilty_number.trim());
    }
    if (actual_loading_location_code) {
      updates.push(`actual_loading_location_code = $${paramIndex++}`);
      values.push(actual_loading_location_code.trim());
    }
    if (image_url) {
      updates.push(`image_url = $${paramIndex++}`);
      values.push(image_url);
      if (image_type) {
        updates.push(`image_type = $${paramIndex++}`);
        values.push(image_type);
      }
      if (image_original_size) {
        updates.push(`image_original_size = $${paramIndex++}`);
        values.push(image_original_size);
      }
      if (image_compressed_size) {
        updates.push(`image_compressed_size = $${paramIndex++}`);
        values.push(image_compressed_size);
      }
      updates.push(`image_uploaded_at = NOW()`);
    }

    updates.push(`updated_by = $${paramIndex++}`);
    values.push(req.session.user.id);

    updates.push(`updated_at = NOW()`);
    values.push(orderId);

    const query = `UPDATE odts.order_dispatch SET ${updates.join(', ')} WHERE order_id = $${paramIndex}`;

    console.log('[Dispatcher] Update query:', query);
    await pool.query(query, values);

    res.json({ success: true, message: 'Dispatch details updated successfully' });
  } catch (e) {
    console.error('[Dispatcher] update dispatch details error:', e.message, e.detail);
    res.status(500).json({ error: e.message });
  }
});

module.exports = router;
