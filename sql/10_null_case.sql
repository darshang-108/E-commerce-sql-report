-- ============================================
-- E-Commerce SQL Report
-- File: 10_null_case.sql
-- SECTION G — NULL Handling / CASE Expressions
-- Demonstrates: IS NULL, IS NOT NULL,
--   COALESCE, CASE WHEN
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q45. Display customers with missing city using COALESCE
-- Demonstrates: COALESCE to replace NULL with default
-- -----------------------------------------------
SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(city, 'Not Provided') AS city
FROM customers
ORDER BY customer_id;

-- -----------------------------------------------
-- Q46. Categorize products as Cheap / Medium / Expensive
-- Demonstrates: CASE WHEN with price ranges
-- -----------------------------------------------
SELECT
    product_name,
    category,
    price,
    CASE
        WHEN price < 500  THEN 'Cheap'
        WHEN price <= 1500 THEN 'Medium'
        ELSE 'Expensive'
    END AS price_category
FROM products
ORDER BY price;

-- -----------------------------------------------
-- Q47. Categorize orders based on their status
-- Demonstrates: CASE WHEN with status labels
-- -----------------------------------------------
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.status,
    CASE o.status
        WHEN 'Delivered'  THEN 'Completed'
        WHEN 'Shipped'    THEN 'In Transit'
        WHEN 'Pending'    THEN 'Awaiting Shipment'
        WHEN 'Cancelled'  THEN 'Order Cancelled'
        ELSE 'Unknown'
    END AS status_description
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- -----------------------------------------------
-- Q48. Show payment details with descriptive status labels
-- Demonstrates: CASE WHEN on payment_status
-- -----------------------------------------------
SELECT
    p.payment_id,
    o.order_id,
    c.first_name,
    c.last_name,
    p.amount,
    p.payment_status,
    CASE p.payment_status
        WHEN 'Paid'     THEN 'Payment Received'
        WHEN 'Pending'  THEN 'Awaiting Payment'
        WHEN 'Failed'   THEN 'Payment Failed — Retry Needed'
        WHEN 'Refunded' THEN 'Amount Refunded'
        ELSE 'Unknown Status'
    END AS status_description
FROM payments p
INNER JOIN orders o ON p.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY p.payment_id;
