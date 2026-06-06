-- Active: 1779902359276@@127.0.0.1@3306@superstore_raw
-- Use Subqueries, CTEs, and Window Functions to analyze sales data from the Superstore dataset
-- Step: 1.Load dataset into a SQL database. 

-- First create schema of superstore_raw 
-- Table is imported using table Data import wizart
-- Select your CSV file and click Next
-- creating table using superstore_raw table
-- customer table, products table, orders table

USE superstore_raw;
SELECT * FROM superstore_raw ;

------------------------------------------------------
-- customer table

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);


INSERT INTO customers (customer_id, customer_name, segment)
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    `Segment`
FROM superstore_raw;


---------------------------------------------------------
-- products table
CREATE TABLE products(
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);


INSERT INTO products 
(product_id, product_name, category, sub_category)
SELECT product_id, product_name, category, sub_category
FROM (SELECT
        `Product ID`   AS product_id,
        `Product Name` AS product_name,
        `Category`     AS category,
        `Sub-Category` AS sub_category,
        ROW_NUMBER() OVER (PARTITION BY `Product ID` ORDER BY `Product Name`) AS row_no
    FROM superstore_raw
) ranked
WHERE row_no = 1;

-----------------------------------------------------------
-- orders table

CREATE TABLE orders(
    row_num INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    sales DOUBLE,
    quantity INT,
    discount DOUBLE,
    profit DOUBLE,
    PRIMARY KEY (order_id, product_id, row_num),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO orders
(row_num, order_id, order_date, ship_date, ship_mode, customer_id, product_id, sales, quantity, discount, profit)
SELECT 
    ROW_NUMBER() OVER (PARTITION BY `Order ID`, `Product ID` ORDER BY `Sales`) AS row_num,
    `Order ID`,
    STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
    STR_TO_DATE(`Ship Date`, '%m/%d/%Y'),
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    `Sales`,
    `Quantity`,
    `Discount`,
    `Profit`
    FROM superstore_raw;

SELECT* FROM customers;

SELECT* from products;

SELECT * FROM orders;



--  Apply subqueries to filter data (above average sales, highest order per customer)

SELECT c.customer_name,
    SUM(o.sales) AS total_sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING total_sales > (
    SELECT AVG(cust_total_sales) AS cust_total_sales
    FROM(
        SELECT SUM(sales) AS cust_total_sales 
        FROM orders
        GROUP BY customer_id
    )avg_sales
)


SELECT c.customer_name,
    o.order_id,
    o.sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.sales =
(
    SELECT MAX(o2.sales)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
)  ;  


-- Use CTEs to compute aggregations (total sales per customer)

WITH customer_total_sales AS(
    SELECT c.customer_name,
    SUM(o.sales) AS total_sales
FROM orders o 
JOIN customers c
on o.customer_id = c.customer_id
GROUP BY c.customer_name
)SELECT * 
From customer_total_sales;


-- Apply window functions (ROW_NUMBER, RANK) for ranking and analysis

SELECT c.customer_name,
    SUM(o.sales) AS total_sales,
    RANK() OVER(ORDER BY SUM(o.sales) DESC) AS sales_rank
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
;


SELECT 
    c.customer_name,
    o.customer_id,
    o.order_id,
    ROW_NUMBER() OVER(PARTITION BY c.customer_name ORDER BY o.order_id ) AS row_num
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
; 

--  Combine JOIN + CTE + Window Functions for final result (customer, total sales, rank)

WITH total_sales_rank AS(
    SELECT c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales,
        RANK() OVER(ORDER BY SUM(o.sales) DESC) AS sales_rank
    FROM orders o
    JOIN customers c
    ON o.customer_id= c.customer_id
    GROUP BY c.customer_id, customer_name
) 
SELECT * FROM total_sales_rank;

-- Solve business queries (top customers, low customers, single-order customers, above-average sales)

-- top customers
WITH total_sales_rank AS(
    SELECT c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales,
        RANK() OVER(ORDER BY SUM(o.sales) DESC ) AS sales_rank
    FROM orders o
    JOIN customers c
    ON o.customer_id= c.customer_id
    GROUP BY c.customer_id, customer_name
) 
SELECT * FROM total_sales_rank
WHERE sales_rank <= 10;


-- low customers
WITH total_sales_rank AS(
    SELECT c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales,
        RANK() OVER(ORDER BY SUM(o.sales) ASC ) AS sales_rank
    FROM orders o
    JOIN customers c
    ON o.customer_id= c.customer_id
    GROUP BY c.customer_id, customer_name
) 
SELECT * FROM total_sales_rank
WHERE sales_rank <= 10;


-- single order customer

SELECT c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id= c.customer_id
GROUP BY c.customer_id,c.customer_name
HAVING total_orders = 1;

-- above-average sales

SELECT c.customer_name,
    Sum(o.sales) AS total_sales
    FROM orders o
    JOIN customers c
    on o.customer_id= c.customer_id
    GROUP BY c.customer_name
    HAVING Sum(o.sales) > (
        SELECT AVG(total_cust_sales) 
        FROM (
            SELECT SUM(sales) AS total_cust_sales
            FROM orders
            GROUP BY customer_id
        )avg_sales
    );


/*
Brief Insights
Customer Analysis
Top-ranked customers contribute a significant portion of total revenue.
Bottom-ranked customers generate minimal sales and may require targeted marketing efforts.
Order Analysis
Some customers place only one order, indicating opportunities for customer retention programs.
High-value customers often place multiple orders and generate repeat business.
Sales Analysis
Customers with above-average sales are key revenue drivers.
Ranking customers helps identify VIP customers and prioritize engagement strategies.
SQL Concepts Demonstrated
Subqueries for filtering and comparisons.
CTEs for reusable aggregated datasets.
Window Functions (RANK, ROW_NUMBER) for analytical reporting.
JOINs for combining normalized tables.
Business Analytics Queries for customer segmentation and performance analysis.

*/