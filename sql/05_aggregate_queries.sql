-- ============================================
-- E-Commerce SQL Report
-- File: 05_aggregate_queries.sql
-- SECTION B — Aggregate Functions
-- Demonstrates: COUNT, SUM, AVG, MIN, MAX
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q11. Count total number of customers
-- Demonstrates: COUNT(*)
-- -----------------------------------------------
SELECT COUNT(*) AS total_customers
FROM customers;

-- -----------------------------------------------
-- Q12. Count total number of products
-- Demonstrates: COUNT(*)
-- -----------------------------------------------
SELECT COUNT(*) AS total_products
FROM products;

-- -----------------------------------------------
-- Q13. Find the average product price
-- Demonstrates: AVG()
-- -----------------------------------------------
SELECT ROUND(AVG(price), 2) AS average_price
FROM products;

-- -----------------------------------------------
-- Q14. Find the maximum product price
-- Demonstrates: MAX()
-- -----------------------------------------------
SELECT MAX(price) AS max_price
FROM products;

-- -----------------------------------------------
-- Q15. Find the minimum product price
-- Demonstrates: MIN()
-- -----------------------------------------------
SELECT MIN(price) AS min_price
FROM products;

-- -----------------------------------------------
-- Q16. Calculate total stock available across all products
-- Demonstrates: SUM()
-- -----------------------------------------------
SELECT SUM(stock_quantity) AS total_stock
FROM products;

-- -----------------------------------------------
-- Q17. Count orders by status
-- Demonstrates: COUNT with GROUP BY
-- -----------------------------------------------
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- -----------------------------------------------
-- Q18. Calculate total revenue (from successful payments only)
-- Demonstrates: SUM with WHERE filter
-- -----------------------------------------------
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'Paid';
