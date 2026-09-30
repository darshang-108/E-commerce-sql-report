-- ============================================
-- E-Commerce SQL Report
-- File: 02_create_tables.sql
-- Purpose: Create all tables with constraints
-- Demonstrates: CREATE TABLE, PRIMARY KEY,
--   FOREIGN KEY, NOT NULL, UNIQUE, DEFAULT, CHECK
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Table 1: customers
-- Stores customer information
-- -----------------------------------------------
CREATE TABLE customers (
    customer_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    email         VARCHAR(100) UNIQUE,
    city          VARCHAR(50),
    signup_date   DATE
);

-- -----------------------------------------------
-- Table 2: products
-- Stores product catalog information
-- -----------------------------------------------
CREATE TABLE products (
    product_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_name   VARCHAR(100) NOT NULL,
    category       VARCHAR(50),
    price          DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0)
);

-- -----------------------------------------------
-- Table 3: orders
-- Stores order header information
-- -----------------------------------------------
CREATE TABLE orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE NOT NULL,
    status       VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- -----------------------------------------------
-- Table 4: order_items
-- Stores individual items within each order
-- -----------------------------------------------
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- -----------------------------------------------
-- Table 5: payments
-- Stores payment information for orders
-- -----------------------------------------------
CREATE TABLE payments (
    payment_id     INT AUTO_INCREMENT PRIMARY KEY,
    order_id       INT,
    payment_date   DATE,
    amount         DECIMAL(10, 2) CHECK (amount > 0),
    payment_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
