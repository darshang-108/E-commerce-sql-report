# E-Commerce SQL Report

## Project Overview

This is a beginner-friendly SQL project that builds an **E-Commerce database** and creates a collection of **52 SQL queries** to answer common business questions.

The project simulates a simple online store with customers, products, orders, order items, and payments. It demonstrates how SQL can be used to extract meaningful insights from relational data — such as identifying top-spending customers, best-selling products, revenue analysis, and more.

---

## Objectives

This project demonstrates the following SQL concepts:

- **DDL** — CREATE DATABASE, CREATE TABLE, ALTER TABLE
- **Constraints** — PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, DEFAULT, CHECK
- **DML** — INSERT, UPDATE, DELETE
- **SELECT** — Basic data retrieval
- **Filtering** — WHERE, comparison operators
- **Sorting** — ORDER BY (ASC / DESC)
- **Aggregation** — COUNT, SUM, AVG, MIN, MAX
- **Grouping** — GROUP BY, HAVING
- **JOINs** — INNER JOIN, LEFT JOIN, Multiple-table JOINs
- **NULL Handling** — IS NULL, IS NOT NULL, COALESCE
- **Conditional Logic** — CASE WHEN
- **Subqueries** — Nested SELECT statements
- **Business Analysis** — Customer spending, top products, revenue reports

---

## Database Schema

The database `ecommerce_db` contains **5 tables**:

| Table | Description | Records |
|-------|-------------|---------|
| `customers` | Stores customer details (name, email, city) | 20 |
| `products` | Stores product catalog (name, category, price, stock) | 20 |
| `orders` | Stores order information (customer, date, status) | 30 |
| `order_items` | Stores items within each order (product, quantity) | 45 |
| `payments` | Stores payment records (amount, status) | 25 |

### Table Details

**customers**
| Column | Type | Constraints |
|--------|------|-------------|
| customer_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| first_name | VARCHAR(50) | NOT NULL |
| last_name | VARCHAR(50) | NOT NULL |
| email | VARCHAR(100) | UNIQUE |
| city | VARCHAR(50) | — |
| signup_date | DATE | — |

**products**
| Column | Type | Constraints |
|--------|------|-------------|
| product_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| product_name | VARCHAR(100) | NOT NULL |
| category | VARCHAR(50) | — |
| price | DECIMAL(10,2) | NOT NULL, CHECK (price > 0) |
| stock_quantity | INT | DEFAULT 0, CHECK (stock_quantity >= 0) |

**orders**
| Column | Type | Constraints |
|--------|------|-------------|
| order_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| customer_id | INT | FOREIGN KEY → customers |
| order_date | DATE | NOT NULL |
| status | VARCHAR(20) | DEFAULT 'Pending' |

**order_items**
| Column | Type | Constraints |
|--------|------|-------------|
| order_item_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| order_id | INT | FOREIGN KEY → orders |
| product_id | INT | FOREIGN KEY → products |
| quantity | INT | NOT NULL, CHECK (quantity > 0) |

**payments**
| Column | Type | Constraints |
|--------|------|-------------|
| payment_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| order_id | INT | FOREIGN KEY → orders |
| payment_date | DATE | — |
| amount | DECIMAL(10,2) | CHECK (amount > 0) |
| payment_status | VARCHAR(20) | DEFAULT 'Pending' |

---

## Relationships

```
customers ──(1:N)──→ orders
orders    ──(1:N)──→ order_items
products  ──(1:N)──→ order_items
orders    ──(1:N)──→ payments
```

- A **customer** can place many **orders**.
- An **order** can contain many **order items**.
- A **product** can appear in many **order items**.
- An **order** can have one or more **payment** records.

---

## SQL Concepts Demonstrated

| Concept | Examples |
|---------|----------|
| DDL | CREATE DATABASE, CREATE TABLE, ALTER TABLE, DROP COLUMN |
| Constraints | PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, DEFAULT, CHECK |
| DML | INSERT, UPDATE, DELETE |
| Filtering | WHERE, IN, comparison operators |
| Sorting | ORDER BY ASC/DESC |
| Limiting | LIMIT |
| Distinct | DISTINCT |
| Aggregates | COUNT, SUM, AVG, MIN, MAX |
| Grouping | GROUP BY, HAVING |
| Joins | INNER JOIN, LEFT JOIN, Multi-table JOINs |
| NULL Handling | IS NULL, IS NOT NULL, COALESCE |
| Conditional | CASE WHEN ... THEN ... END |
| Subqueries | Nested SELECT in FROM clause |
| Aliases | Column and table aliases |

---

## Example Business Questions Answered

1. **Who are the highest-spending customers?** → Customer spending analysis
2. **What are the top-selling products?** → Top products by quantity and revenue
3. **Which products have never been ordered?** → LEFT JOIN with IS NULL
4. **How many orders are pending?** → COUNT with WHERE filter
5. **What is the total revenue?** → SUM of paid payments
6. **Which categories generate the most revenue?** → Category-wise sales
7. **Which customers have never placed an order?** → LEFT JOIN with IS NULL
8. **What is the average spending per customer?** → Subquery with AVG
9. **How are products distributed across price ranges?** → CASE expression
10. **Which cities have the most customers?** → GROUP BY with COUNT

---

## Project Structure

```
E-commerce sql report/
│
├── README.md
│
└── sql/
    ├── 01_create_database.sql    → Create the database
    ├── 02_create_tables.sql      → Create all 5 tables with constraints
    ├── 03_insert_data.sql        → Insert sample data (140 records)
    ├── 04_basic_queries.sql      → Section A: Basic SELECT / Filtering (Q1-Q10)
    ├── 05_aggregate_queries.sql  → Section B: Aggregate Functions (Q11-Q18)
    ├── 06_groupby_having.sql     → Section C: GROUP BY / HAVING (Q19-Q26)
    ├── 07_joins.sql              → Section D: JOINs (Q27-Q34)
    ├── 08_customer_spending.sql  → Section E: Customer Spending (Q35-Q39)
    ├── 09_top_products.sql       → Section F: Top Products (Q40-Q44)
    ├── 10_null_case.sql          → Section G: NULL / CASE (Q45-Q48)
    └── 11_ddl_dml.sql            → Section H: DDL / DML (Q49-Q52)
```

---

## How to Run

### Prerequisites
- **MySQL 8.0+** installed
- **MySQL Workbench** (or any MySQL client)

### Steps

1. Open **MySQL Workbench** and connect to your MySQL server.
2. Open and run `sql/01_create_database.sql` — creates the database.
3. Open and run `sql/02_create_tables.sql` — creates all 5 tables.
4. Open and run `sql/03_insert_data.sql` — inserts all sample data.
5. Open and run the query files (`04` through `11`) one at a time to see the results.

> **Tip:** Run the files in order (01 → 02 → 03 → then any query file). Each query file starts with `USE ecommerce_db;` so you can run them independently after the data is loaded.

---

## Project Highlights

- ✅ **5 tables** with proper relationships and constraints
- ✅ **140 sample records** (20 customers + 20 products + 30 orders + 45 order items + 25 payments)
- ✅ **52 SQL queries** organized into 8 sections
- ✅ Covers **DDL, DML, SELECT, JOINs, Aggregation, GROUP BY, HAVING, NULL handling, CASE, and Subqueries**
- ✅ Every query has a **comment explaining what it demonstrates**
- ✅ Realistic Indian e-commerce sample data
- ✅ Pure SQL — no external tools or frameworks required

---

## Author

Built as a SQL learning and interview preparation project.
