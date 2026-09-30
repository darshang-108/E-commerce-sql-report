-- ============================================
-- E-Commerce SQL Report
-- File: 06_groupby_having.sql
-- SECTION C — GROUP BY / HAVING
-- Demonstrates: GROUP BY, HAVING, aggregate
--   functions with grouping
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q19. Number of customers in each city
-- Demonstrates: GROUP BY with COUNT
-- -----------------------------------------------
SELECT city, COUNT(*) AS customer_count
FROM customers
WHERE city IS NOT NULL
GROUP BY city
ORDER BY customer_count DESC;

-- -----------------------------------------------
-- Q20. Number of products in each category
-- Demonstrates: GROUP BY with COUNT
-- -----------------------------------------------
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;

-- -----------------------------------------------
-- Q21. Average product price by category
-- Demonstrates: GROUP BY with AVG
-- -----------------------------------------------
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- -----------------------------------------------
-- Q22. Total stock quantity by category
-- Demonstrates: GROUP BY with SUM
-- -----------------------------------------------
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category
ORDER BY total_stock DESC;

-- -----------------------------------------------
-- Q23. Number of orders per customer
-- Demonstrates: GROUP BY with JOIN and COUNT
-- -----------------------------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY order_count DESC;

-- -----------------------------------------------
-- Q24. Total spending per customer (from paid payments)
-- Demonstrates: GROUP BY with multiple JOINs and SUM
-- -----------------------------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- -----------------------------------------------
-- Q25. Categories with average price above ₹1000
-- Demonstrates: HAVING with AVG
-- -----------------------------------------------
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 1000
ORDER BY avg_price DESC;

-- -----------------------------------------------
-- Q26. Customers whose total spending exceeds ₹3000
-- Demonstrates: HAVING with SUM
-- -----------------------------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(p.amount) > 3000
ORDER BY total_spent DESC;
