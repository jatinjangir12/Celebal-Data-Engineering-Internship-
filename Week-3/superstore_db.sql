-- WEEK 3 - ASSIGNMENT 
-- Objective: 
-- Use Subqueries, CTEs, and Window Functions to analyze sales data from the Superstore dataset. 


-- Load dataset into a SQL database. 

-- First create schema of superstore_raw 
-- Table is imported using table Data import wizart
-- Select your CSV file and click Next

-- step 1
-- Q 1. Import the Superstore dataset into a table named superstore_raw. 
USE superstore_raw;
SELECT * FROM superstore_raw ;

------------------------------------------------------
-- Q 1 and 2
-- 2. Create these 3 tables from it:  
-- a. customers  
-- b. orders  
-- c. products  
-- 3. Insert data into these tables using SELECT DISTINCT. 

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

--------------------------------------------------------------------------------

-- Step 2
-- Q-1

SELECT * FROM orders
WHERE sales > 
(SELECT AVG(sales)
FROM orders);

-- Q-2

SELECT c.customer_name,
    o.customer_id,
    o.order_id,
    o.sales
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
WHERE o.sales = (
    SELECT MAX(orders.sales)
    FROM orders 
    WHERE orders.customer_id = o.customer_id
);



------------------------------------------------------------
-- Q-3

WITH total_sales AS (
    SELECT c.customer_name,
        SUM(o.sales) AS total_sales
    FROM orders AS o
    JOIN customers c 
    ON o.customer_id = c.customer_id
    GROUP BY customer_name   
)SELECT * FROM
    total_sales;



-- Q-4

WITH customers_avg_sales AS(
    SELECT c.customer_name,
        SUM(o.sales) AS total_sales
    FROM orders AS o
    JOIN customers AS c
    ON o.customer_id = c.customer_id
    GROUP BY c.customer_name   
)
SELECT customer_name,
    total_sales
    FROM customers_avg_sales
    WHERE total_sales >
    (SELECT AVG(total_sales)
    FROM customers_avg_sales) ;


-- Q-5

SELECT c.customer_name,
    SUM(o.sales) AS total_sales,
    RANK() OVER(ORDER BY SUM(o.sales) DESC) AS sales_rank
FROM orders AS o 
JOIN customers AS c  
ON o.customer_id = c.customer_id 
GROUP BY c.customer_name;

-- Q-6

SELECT c.customer_name,
    o.order_id,
    o.sales,
    ROW_NUMBER() OVER(PARTITION BY c.customer_name ORDER BY o.order_date) AS row_num
FROM orders AS o 
JOIN customers AS c  
ON o.customer_id = c.customer_id 
;


-- Q-7

SELECT * FROM
    (
        SELECT
            customer_id,
            SUM(sales) AS total_sales,
            RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rank
        FROM orders
        GROUP BY customer_id
    ) ranked_customer
WHERE sales_rank < 4;


-----------------------------------------------------------------------
-- step 3

WITH ranked_customer AS
(
    SELECT customer_name,
    SUM (o.sales) AS total_sales,
    RANK() OVER(ORDER BY SUM(o.sales) DESC) as sales_rank
    FROM orders AS o
    JOIN customers AS c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_name
)
SELECT * FROM ranked_customer;      


-------------------------------------------------------------------
-- Mini Project: Customer Sales Insights 

-- 1
SELECT c.customer_name,
    SUM(o.sales) AS total_sales
FROM orders AS o
JOIN customers AS c
on o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC LIMIT 5;

-- 2 
SELECT c.customer_name,
    SUM(o.sales) AS total_sales
FROM orders AS o
JOIN customers AS c
on o.customer_id = c.customer_id 
GROUP BY c.customer_name
ORDER BY total_sales ASC LIMIT 5;


-- 3
SELECT c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_order
FROM orders AS o
JOIN customers AS c
on o.customer_id = c.customer_id 
GROUP BY c.customer_name
HAVING COUNT(DISTINCT o.order_id) =1;


-- 4

SELECT c.customer_name,
    SUM(o.sales) AS total_sales
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(o.sales) >
(
    SELECT AVG(c_t_sales) AS avg_sales
    FROM(SELECT
            SUM(sales) AS c_t_sales
            FROM orders
            GROUP BY customer_id
    )avg_sales
);


-- 5

SELECT c.customer_name,
    MAX(o.sales) AS highest_order_value
FROM orders AS o
JOIN customers AS c
on o.customer_id = c.customer_id 
GROUP BY c.customer_name
ORDER BY highest_order_value DESC;