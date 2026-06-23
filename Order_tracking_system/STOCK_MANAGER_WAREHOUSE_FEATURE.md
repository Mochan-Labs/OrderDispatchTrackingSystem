# STOCK_MANAGER Warehouse Assignment Feature

## Overview
Added functionality to assign warehouses to STOCK_MANAGER role users during user creation. STOCK_MANAGER users can only view records for their assigned warehouse, while ADMIN users can view all warehouses.

## Changes Made

### 1. Database
- Uses existing `user_warehouse_id` column in `user_master` table
- Uses existing `warehouse_master` table (warehouse_id, warehouse_name, is_active, etc.)

### 2. Backend Changes

#### routes/auth.js
- Updated `fetchSignupScreenData()` to fetch warehouses from `warehouse_master`
- Added warehouse validation in POST `/signup` for STOCK_MANAGER role
- Updated user creation to pass `userWarehouseId` to userModel
- Added `user_warehouse_id` to session object on successful login

#### models/userModel.js
- Updated `findUserByLoginName()` to include `user_warehouse_id` in query
- Updated `createLoginUser()` function signature to accept `userWarehouseId` parameter
- Stores `user_warehouse_id` in database for STOCK_MANAGER users (null for others)

#### routes/masterUsers.js
- Added `/api/master/users/warehouses` endpoint to fetch active warehouses
- Updated user list query to include warehouse name and stock manager role flag
- Updated POST endpoint to accept and store `user_warehouse_id`
- Updated PUT endpoint to accept and store `user_warehouse_id`

### 3. Frontend Changes

#### views/signup.ejs
- Added warehouse dropdown section that appears only when STOCK_MANAGER role is selected
- Warehouse is required field for STOCK_MANAGER, optional for other roles
- Warehouse dropdown populated from API
- Form reset includes warehouse field

#### views/master/users.ejs
- User list now includes "Warehouse" column
- Edit modal shows warehouse dropdown for STOCK_MANAGER users
- Table headers updated to show warehouse info
- Excel export includes warehouse information

### 4. Session Object
After login, session includes:
```javascript
req.session.user = {
  id, username, user_login_name, email, mobile, role, dealer_id, user_warehouse_id
}
```

## Usage

### Creating a STOCK_MANAGER User
1. Go to Admin → Create Login User (Signup page)
2. Select role: STOCK_MANAGER
3. A warehouse dropdown appears
4. Select the warehouse the user should have access to
5. Fill in other required fields (login name, password)
6. Submit

### Warehouse-Based Access
- When a STOCK_MANAGER user logs in, their `user_warehouse_id` is available in `req.session.user.user_warehouse_id`
- Controllers can filter records by warehouse using: `WHERE warehouse_id = $1` with the user's warehouse_id
- ADMIN users have `user_warehouse_id = null` and should see all warehouses (no filter)

### ADMIN & Other Roles
- ADMIN, DISPATCHER, OFFICE_EXECUTIVE, DEALER, SALES_OFFICER users have `user_warehouse_id = NULL`
- No warehouse restriction for these roles

## Future Implementation
To implement warehouse filtering in views:

```javascript
// In order/dispatch controllers
if (req.session.user.role === 'STOCK_MANAGER' && req.session.user.user_warehouse_id) {
  // Add WHERE clause: AND warehouse_id = $X with req.session.user.user_warehouse_id
}
```

## Database Column Reference
- Column in user_master: `user_warehouse_id`
- References: `warehouse_master.warehouse_id`
