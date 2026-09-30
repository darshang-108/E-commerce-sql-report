-- ============================================
-- E-Commerce SQL Report
-- File: 08_customer_spending.sql
-- SECTION E — Customer Spending Analysis
-- Demonstrates: SUM, GROUP BY, HAVING,
--   subqueries, ORDER BY with LIMIT
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q35. Calculate total amount spent by each customer
-- Demonstrates: SUM with GROUP BY and JOIN
-- -----------------------------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(SUM(p.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id AND p.payment_status = 'Paid'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- -----------------------------------------------
-- Q36. Find the customer with the highest total spending
-- Demonstrates: SUM with ORDER BY and LIMIT 1
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
ORDER BY total_spent DESC
LIMIT 1;

-- -----------------------------------------------
-- Q37. Find customers who spent more than ₹3000
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

-- -----------------------------------------------
-- Q38. Find the average spending per customer
-- Demonstrates: Subquery with AVG
-- -----------------------------------------------
SELECT ROUND(AVG(total_spent), 2) AS avg_spending_per_customer
FROM (
    SELECT
        c.customer_id,
        SUM(p.amount) AS total_spent
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    INNER JOIN payments p ON o.order_id = p.order_id
    WHERE p.payment_status = 'Paid'
    GROUP BY c.customer_id
) AS customer_totals;

-- -----------------------------------------------
-- Q39. Find each customer's number of orders and total spending
-- Demonstrates: COUNT(DISTINCT), SUM with GROUP BY
-- -----------------------------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COALESCE(SUM(CASE WHEN p.payment_status = 'Paid' THEN p.amount ELSE 0 END), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;
