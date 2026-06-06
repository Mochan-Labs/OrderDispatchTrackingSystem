const express = require('express');
const router = express.Router();

function ensureTrackingUser(req, res, next) {
  if (!req.session || !req.session.user) return res.redirect('/signin');
  const role = req.session.user.role;
  if (role !== 'DEALER' && role !== 'ADMIN' && role !== 'DISPATCHER') {
    return res.status(403).send('Access denied.');
  }
  return next();
}

router.get('/tracking', ensureTrackingUser, (req, res) => {
  res.status(503).send(`
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Live Tracking</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <style>
        body { display: flex; align-items: center; justify-content: center; min-height: 100vh; background: #eef2f7; }
        .message-container { text-align: center; background: white; padding: 3rem; border-radius: 10px; box-shadow: 0 2px 8px rgba(15,37,68,.08); max-width: 400px; }
        .icon { font-size: 3rem; margin-bottom: 1.5rem; }
        h2 { color: #0f2544; margin-bottom: 1rem; }
        p { color: #64748b; margin-bottom: 2rem; }
        .btn { background: #0f2544; color: white; border: none; padding: 0.6rem 1.5rem; border-radius: 6px; text-decoration: none; display: inline-block; }
        .btn:hover { background: #1a3a6b; color: white; }
      </style>
    </head>
    <body>
      <div class="message-container">
        <div class="icon">🚀</div>
        <h2>Live Tracking</h2>
        <p>Live Tracking is currently unavailable. Real-time tracking capabilities feature will be available soon.</p>
        <a href="/dashboard" class="btn">Back to Dashboard</a>
      </div>
    </body>
    </html>
  `);
});

router.get('/api/tracking/config', ensureTrackingUser, (req, res) => {
  res.json({
    firebase: {
      apiKey: process.env.FIREBASE_API_KEY || '',
      authDomain: process.env.FIREBASE_AUTH_DOMAIN || '',
      databaseURL: process.env.FIREBASE_DATABASE_URL || '',
      projectId: process.env.FIREBASE_PROJECT_ID || '',
      storageBucket: process.env.FIREBASE_STORAGE_BUCKET || '',
      messagingSenderId: process.env.FIREBASE_MESSAGING_SENDER_ID || '',
      appId: process.env.FIREBASE_APP_ID || ''
    },
    googleMapsApiKey: process.env.GOOGLE_MAPS_API_KEY || '',
    trackingPathPrefix: process.env.FIREBASE_TRACKING_PATH_PREFIX || 'driver_locations'
  });
});

module.exports = router;
