-- ============================================
-- E-Commerce SQL Report
-- File: 07_joins.sql
-- SECTION D — JOINs
-- Demonstrates: INNER JOIN, LEFT JOIN,
--   multiple-table JOINs
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q27. Display orders with customer names
-- Demonstrates: INNER JOIN (2 tables)
-- -----------------------------------------------
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- -----------------------------------------------
-- Q28. Display order items with product names and prices
-- Demonstrates: INNER JOIN (2 tables)
-- -----------------------------------------------
SELECT
    oi.order_item_id,
    oi.order_id,
    pr.product_name,
    pr.price AS unit_price,
    oi.quantity,
    (pr.price * oi.quantity) AS item_total
FROM order_items oi
INNER JOIN products pr ON oi.product_id = pr.product_id
ORDER BY oi.order_id;

-- -----------------------------------------------
-- Q29. Display complete order details (customer + items + products)
-- Demonstrates: Multiple-table JOIN (4 tables)
-- -----------------------------------------------
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.status,
    pr.product_name,
    oi.quantity,
    pr.price AS unit_price,
    (pr.price * oi.quantity) AS item_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products pr ON oi.product_id = pr.product_id
ORDER BY o.order_id, oi.order_item_id;

-- -----------------------------------------------
-- Q30. Display each customer's name and their total order count
-- Demonstrates: LEFT JOIN with COUNT
-- -----------------------------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_orders DESC;

-- -----------------------------------------------
-- Q31. Display customers who have placed at least one order
-- Demonstrates: INNER JOIN (only matching records)
-- -----------------------------------------------
SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- -----------------------------------------------
-- Q32. Display customers who have NOT placed any orders
-- Demonstrates: LEFT JOIN with IS NULL
-- -----------------------------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- -----------------------------------------------
-- Q33. Display products that have never been ordered
-- Demonstrates: LEFT JOIN with IS NULL
-- -----------------------------------------------
SELECT
    pr.product_id,
    pr.product_name,
    pr.category,
    pr.price
FROM products pr
LEFT JOIN order_items oi ON pr.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- -----------------------------------------------
-- Q34. Display payments with customer and order information
-- Demonstrates: Multiple-table JOIN (3 tables)
-- -----------------------------------------------
SELECT
    p.payment_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    p.payment_date,
    p.amount,
    p.payment_status
FROM payments p
INNER JOIN orders o ON p.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY p.payment_date;
