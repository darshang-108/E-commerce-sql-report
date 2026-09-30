-- ============================================
-- E-Commerce SQL Report
-- File: 03_insert_data.sql
-- Purpose: Insert realistic sample data
-- Demonstrates: INSERT INTO
-- ============================================

USE ecommerce_db;

-- -----------------------------------------------
-- Insert Customers (20 records)
-- Note: customer 19 and 20 have NULL city
--       customer 18 and 19 and 20 will have no orders
-- -----------------------------------------------
INSERT INTO customers (first_name, last_name, email, city, signup_date) VALUES
('Aarav',    'Sharma',    'aarav.sharma@email.com',    'Mumbai',      '2024-01-15'),
('Priya',    'Patel',     'priya.patel@email.com',     'Delhi',       '2024-01-20'),
('Rohan',    'Gupta',     'rohan.gupta@email.com',     'Bangalore',   '2024-02-10'),
('Sneha',    'Reddy',     'sneha.reddy@email.com',     'Hyderabad',   '2024-02-14'),
('Vikram',   'Singh',     'vikram.singh@email.com',    'Mumbai',      '2024-03-01'),
('Ananya',   'Joshi',     'ananya.joshi@email.com',    'Pune',        '2024-03-10'),
('Arjun',    'Mehta',     'arjun.mehta@email.com',     'Delhi',       '2024-03-22'),
('Kavya',    'Nair',      'kavya.nair@email.com',      'Chennai',     '2024-04-05'),
('Rahul',    'Kumar',     'rahul.kumar@email.com',     'Bangalore',   '2024-04-18'),
('Diya',     'Verma',     'diya.verma@email.com',      'Kolkata',     '2024-05-02'),
('Aditya',   'Rao',       'aditya.rao@email.com',      'Hyderabad',   '2024-05-15'),
('Meera',    'Iyer',      'meera.iyer@email.com',      'Chennai',     '2024-06-01'),
('Karan',    'Malhotra',  'karan.malhotra@email.com',  'Mumbai',      '2024-06-20'),
('Pooja',    'Desai',     'pooja.desai@email.com',     'Pune',        '2024-07-08'),
('Nikhil',   'Kapoor',    'nikhil.kapoor@email.com',   'Delhi',       '2024-07-25'),
('Riya',     'Choudhury', 'riya.choudhury@email.com',  'Kolkata',     '2024-08-10'),
('Siddharth','Pandey',    'siddharth.pandey@email.com', 'Lucknow',    '2024-08-30'),
('Ishita',   'Bose',      'ishita.bose@email.com',     NULL,          '2024-09-12'),
('Tanvi',    'Saxena',    'tanvi.saxena@email.com',    NULL,          '2024-09-28'),
('Harsh',    'Agarwal',   'harsh.agarwal@email.com',   'Jaipur',      '2024-10-05');

-- -----------------------------------------------
-- Insert Products (20 records)
-- Categories: Electronics, Clothing, Books, Home & Kitchen, Sports
-- Note: products 18, 19, 20 will never be ordered
-- -----------------------------------------------
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse',       'Electronics',     599.00,   50),
('Bluetooth Headphones', 'Electronics',    1499.00,   30),
('USB-C Hub',            'Electronics',     899.00,   25),
('Laptop Stand',         'Electronics',    1299.00,   15),
('Men T-Shirt',          'Clothing',        499.00,   100),
('Women Kurti',          'Clothing',        799.00,   80),
('Running Shoes',        'Clothing',       2499.00,   40),
('Cotton Jacket',        'Clothing',       1999.00,   20),
('Python Programming',   'Books',           450.00,   60),
('SQL Fundamentals',     'Books',           350.00,   70),
('Data Structures',      'Books',           550.00,   45),
('Non-Stick Pan',        'Home & Kitchen',  699.00,   35),
('Electric Kettle',      'Home & Kitchen', 1099.00,   28),
('Dinner Set',           'Home & Kitchen', 1899.00,   12),
('Yoga Mat',             'Sports',          599.00,   55),
('Cricket Bat',          'Sports',         1799.00,   18),
('Badminton Racket',     'Sports',          899.00,   22),
('Fitness Tracker',      'Electronics',    3499.00,    5),
('Wool Sweater',         'Clothing',       1599.00,   10),
('Chess Board',          'Sports',          450.00,   30);

-- -----------------------------------------------
-- Insert Orders (30 records)
-- Statuses: Pending, Shipped, Delivered, Cancelled
-- customer 18, 19, 20 have no orders
-- Some customers have multiple orders
-- -----------------------------------------------
INSERT INTO orders (customer_id, order_date, status) VALUES
(1,  '2024-02-01', 'Delivered'),   -- order 1
(1,  '2024-03-15', 'Delivered'),   -- order 2
(2,  '2024-02-20', 'Delivered'),   -- order 3
(2,  '2024-04-10', 'Shipped'),     -- order 4
(3,  '2024-03-05', 'Delivered'),   -- order 5
(3,  '2024-05-20', 'Delivered'),   -- order 6
(4,  '2024-03-18', 'Shipped'),     -- order 7
(5,  '2024-04-01', 'Delivered'),   -- order 8
(5,  '2024-06-15', 'Pending'),     -- order 9
(6,  '2024-04-25', 'Delivered'),   -- order 10
(7,  '2024-05-05', 'Cancelled'),   -- order 11
(7,  '2024-05-30', 'Delivered'),   -- order 12
(8,  '2024-05-12', 'Delivered'),   -- order 13
(8,  '2024-07-01', 'Shipped'),     -- order 14
(9,  '2024-06-10', 'Delivered'),   -- order 15
(9,  '2024-08-05', 'Pending'),     -- order 16
(10, '2024-06-22', 'Delivered'),   -- order 17
(11, '2024-07-08', 'Shipped'),     -- order 18
(11, '2024-08-20', 'Delivered'),   -- order 19
(12, '2024-07-18', 'Cancelled'),   -- order 20
(12, '2024-08-10', 'Delivered'),   -- order 21
(13, '2024-08-01', 'Delivered'),   -- order 22
(14, '2024-08-15', 'Pending'),     -- order 23
(14, '2024-09-01', 'Shipped'),     -- order 24
(15, '2024-09-05', 'Delivered'),   -- order 25
(16, '2024-09-18', 'Pending'),     -- order 26
(16, '2024-10-01', 'Delivered'),   -- order 27
(17, '2024-10-10', 'Shipped'),     -- order 28
(1,  '2024-10-20', 'Pending'),     -- order 29
(5,  '2024-10-25', 'Cancelled');   -- order 30

-- -----------------------------------------------
-- Insert Order Items (45 records)
-- Each order has 1-3 items
-- Products 18, 19, 20 are never ordered (zero sales)
-- -----------------------------------------------
INSERT INTO order_items (order_id, product_id, quantity) VALUES
-- Order 1
(1,  1,  2),
(1,  9,  1),
-- Order 2
(2,  5,  3),
(2,  10, 1),
-- Order 3
(3,  2,  1),
(3,  6,  2),
-- Order 4
(4,  3,  1),
(4,  12, 1),
-- Order 5
(5,  7,  1),
(5,  11, 2),
-- Order 6
(6,  1,  1),
(6,  15, 2),
-- Order 7
(7,  4,  1),
(7,  13, 1),
-- Order 8
(8,  2,  1),
(8,  5,  2),
-- Order 9
(9,  16, 1),
-- Order 10
(10, 9,  2),
(10, 10, 1),
-- Order 11 (Cancelled)
(11, 8,  1),
-- Order 12
(12, 6,  1),
(12, 3,  1),
-- Order 13
(13, 14, 1),
(13, 12, 1),
-- Order 14
(14, 1,  3),
-- Order 15
(15, 7,  1),
(15, 5,  1),
-- Order 16
(16, 11, 1),
(16, 10, 2),
-- Order 17
(17, 13, 1),
(17, 15, 1),
-- Order 18
(18, 2,  1),
(18, 4,  1),
-- Order 19
(19, 9,  1),
(19, 17, 2),
-- Order 20 (Cancelled)
(20, 16, 1),
-- Order 21
(21, 6,  1),
(21, 14, 1),
-- Order 22
(22, 7,  1),
(22, 1,  1),
-- Order 23
(23, 3,  2),
-- Order 24
(24, 12, 1),
(24, 5,  2),
-- Order 25
(25, 2,  1),
(25, 11, 1),
-- Order 26
(26, 15, 1),
-- Order 27
(27, 8,  1),
-- Order 28
(28, 4,  1),
(28, 13, 1),
-- Order 29
(29, 10, 1),
(29, 17, 1),
-- Order 30 (Cancelled)
(30, 6,  2);

-- -----------------------------------------------
-- Insert Payments (25 records)
-- Statuses: Paid, Pending, Failed, Refunded
-- Cancelled orders get Refunded payments
-- Pending orders may have Pending/Failed payments
-- -----------------------------------------------
INSERT INTO payments (order_id, payment_date, amount, payment_status) VALUES
(1,  '2024-02-01', 1648.00,  'Paid'),
(2,  '2024-03-15', 1847.00,  'Paid'),
(3,  '2024-02-20', 3097.00,  'Paid'),
(4,  '2024-04-10', 1598.00,  'Paid'),
(5,  '2024-03-05', 3599.00,  'Paid'),
(6,  '2024-05-20', 1797.00,  'Paid'),
(7,  '2024-03-18', 2398.00,  'Paid'),
(8,  '2024-04-01', 2497.00,  'Paid'),
(9,  '2024-06-15', 1799.00,  'Pending'),
(10, '2024-04-25', 1250.00,  'Paid'),
(11, '2024-05-05', 1999.00,  'Refunded'),
(12, '2024-05-30', 1698.00,  'Paid'),
(13, '2024-05-12', 2598.00,  'Paid'),
(14, '2024-07-01', 1797.00,  'Paid'),
(15, '2024-06-10', 2998.00,  'Paid'),
(16, '2024-08-05', 1250.00,  'Failed'),
(17, '2024-06-22', 1698.00,  'Paid'),
(18, '2024-07-08', 2798.00,  'Paid'),
(19, '2024-08-20', 2248.00,  'Paid'),
(20, '2024-07-18', 1799.00,  'Refunded'),
(21, '2024-08-10', 2698.00,  'Paid'),
(22, '2024-08-01', 3098.00,  'Paid'),
(23, '2024-08-15', 1798.00,  'Pending'),
(25, '2024-09-05', 2049.00,  'Paid'),
(27, '2024-10-01', 1999.00,  'Paid');
