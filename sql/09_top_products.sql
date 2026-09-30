-- ============================================
-- E-Commerce SQL Report
-- File: 09_top_products.sql
-- SECTION F — Top Products Analysis
-- Demonstrates: SUM, GROUP BY, ORDER BY,
--   LIMIT, LEFT JOIN with IS NULL
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q40. Find top 5 products by total quantity sold
-- Demonstrates: SUM with GROUP BY, ORDER BY, LIMIT
-- -----------------------------------------------
SELECT
    pr.product_id,
    pr.product_name,
    pr.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM products pr
INNER JOIN order_items oi ON pr.product_id = oi.product_id
GROUP BY pr.product_id, pr.product_name, pr.category
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- -----------------------------------------------
-- Q41. Find top 5 products by revenue generated
-- Demonstrates: SUM with calculated column
-- -----------------------------------------------
SELECT
    pr.product_id,
    pr.product_name,
    pr.category,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(pr.price * oi.quantity) AS total_revenue
FROM products pr
INNER JOIN order_items oi ON pr.product_id = oi.product_id
GROUP BY pr.product_id, pr.product_name, pr.category
ORDER BY total_revenue DESC
LIMIT 5;

-- -----------------------------------------------
-- Q42. Find the single best-selling product (by quantity)
-- Demonstrates: SUM, ORDER BY DESC, LIMIT 1
-- -----------------------------------------------
SELECT
    pr.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products pr
INNER JOIN order_items oi ON pr.product_id = oi.product_id
GROUP BY pr.product_id, pr.product_name
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- -----------------------------------------------
-- Q43. Find products with zero sales
-- Demonstrates: LEFT JOIN with IS NULL
-- -----------------------------------------------
SELECT
    pr.product_id,
    pr.product_name,
    pr.category,
    pr.price,
    pr.stock_quantity
FROM products pr
LEFT JOIN order_items oi ON pr.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- -----------------------------------------------
-- Q44. Find category-wise total sales (quantity and revenue)
-- Demonstrates: GROUP BY category with SUM
-- -----------------------------------------------
SELECT
    pr.category,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(pr.price * oi.quantity) AS total_revenue
FROM products pr
INNER JOIN order_items oi ON pr.product_id = oi.product_id
GROUP BY pr.category
ORDER BY total_revenue DESC;
