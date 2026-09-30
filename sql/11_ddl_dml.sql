-- ============================================
-- E-Commerce SQL Report
-- File: 11_ddl_dml.sql
-- SECTION H — DDL / Data Modification
-- Demonstrates: ALTER TABLE, UPDATE, DELETE,
--   ADD/DROP COLUMN, ADD CONSTRAINT
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q49. Add a 'phone' column to the customers table
-- Demonstrates: ALTER TABLE ... ADD COLUMN
-- -----------------------------------------------
ALTER TABLE customers
ADD COLUMN phone VARCHAR(15);

-- Verify the new column
SELECT customer_id, first_name, last_name, phone
FROM customers
LIMIT 5;

-- -----------------------------------------------
-- Q50. Update phone number for a specific customer
-- Demonstrates: UPDATE with WHERE
-- -----------------------------------------------
UPDATE customers
SET phone = '9876543210'
WHERE customer_id = 1;

-- Update city for a customer who had NULL city
UPDATE customers
SET city = 'Ahmedabad'
WHERE customer_id = 18;

-- Verify updates
SELECT customer_id, first_name, last_name, city, phone
FROM customers
WHERE customer_id IN (1, 18);

-- -----------------------------------------------
-- Q51. Delete a cancelled order's payment record (safe delete)
-- Demonstrates: DELETE with WHERE
-- Note: Order 30 is Cancelled and has no payment,
--       so we delete the Refunded payment for order 20
-- -----------------------------------------------

-- First, view the record we will delete
SELECT * FROM payments WHERE order_id = 20;

-- Delete the refunded payment
DELETE FROM payments
WHERE order_id = 20 AND payment_status = 'Refunded';

-- Verify deletion
SELECT * FROM payments WHERE order_id = 20;

-- -----------------------------------------------
-- Q52. Drop the phone column (cleanup)
-- Demonstrates: ALTER TABLE ... DROP COLUMN
-- -----------------------------------------------
ALTER TABLE customers
DROP COLUMN phone;

-- Verify the column was removed
DESCRIBE customers;
