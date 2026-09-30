-- ============================================
-- E-Commerce SQL Report
-- File: 04_basic_queries.sql
-- SECTION A — Basic SELECT / Filtering
-- Demonstrates: SELECT, WHERE, ORDER BY,
--   DISTINCT, LIMIT, comparison operators
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Q1. Display all customers
-- Demonstrates: Basic SELECT
-- -----------------------------------------------
SELECT * FROM customers;

-- -----------------------------------------------
-- Q2. Display all products
-- Demonstrates: Basic SELECT
-- -----------------------------------------------
SELECT * FROM products;

-- -----------------------------------------------
-- Q3. Display products priced above ₹1000
-- Demonstrates: WHERE with comparison operator
-- -----------------------------------------------
SELECT product_name, category, price
FROM products
WHERE price > 1000
ORDER BY price;

-- -----------------------------------------------
-- Q4. Display products from the 'Electronics' category
-- Demonstrates: WHERE with string comparison
-- -----------------------------------------------
SELECT product_name, price, stock_quantity
FROM products
WHERE category = 'Electronics';

-- -----------------------------------------------
-- Q5. Display customers from Mumbai
-- Demonstrates: WHERE with city filter
-- -----------------------------------------------
SELECT first_name, last_name, email
FROM customers
WHERE city = 'Mumbai';

-- -----------------------------------------------
-- Q6. Display all distinct cities
-- Demonstrates: DISTINCT
-- -----------------------------------------------
SELECT DISTINCT city
FROM customers
WHERE city IS NOT NULL
ORDER BY city;

-- -----------------------------------------------
-- Q7. Display products sorted by price (high to low)
-- Demonstrates: ORDER BY DESC
-- -----------------------------------------------
SELECT product_name, category, price
FROM products
ORDER BY price DESC;

-- -----------------------------------------------
-- Q8. Display the 5 cheapest products
-- Demonstrates: ORDER BY ASC with LIMIT
-- -----------------------------------------------
SELECT product_name, category, price
FROM products
ORDER BY price ASC
LIMIT 5;

-- -----------------------------------------------
-- Q9. Display the 5 most expensive products
-- Demonstrates: ORDER BY DESC with LIMIT
-- -----------------------------------------------
SELECT product_name, category, price
FROM products
ORDER BY price DESC
LIMIT 5;

-- -----------------------------------------------
-- Q10. Display products with low stock (less than 20)
-- Demonstrates: WHERE with less-than comparison
-- -----------------------------------------------
SELECT product_name, category, stock_quantity
FROM products
WHERE stock_quantity < 20
ORDER BY stock_quantity;
