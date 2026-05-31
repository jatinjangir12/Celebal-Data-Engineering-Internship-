CREATE DATABASE ShopEaseDB;

USE ShopEaseDB;

CREATE TABLE customers ( 
    customer_id   INT           PRIMARY KEY, 
    first_name    VARCHAR(50)   NOT NULL, 
    last_name     VARCHAR(50)   NOT NULL, 
    email         VARCHAR(100)  UNIQUE NOT NULL, 
    city          VARCHAR(50)   NOT NULL, 
    state         VARCHAR(50)   NOT NULL, 
    join_date     DATE          NOT NULL, 
    is_premium    BOOLEAN       DEFAULT FALSE 
);

-- Index for filtering by city/state 
CREATE INDEX idx_customers_city ON customers(city); 
CREATE INDEX idx_customers_state ON customers(state);

-- ========== INSERT: customers ========== 
INSERT INTO customers VALUES 
(101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', 
TRUE), 
(102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', 
FALSE), 
(103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', 
TRUE), 
(104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', 
FALSE), 
(105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', 
TRUE), 
(106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', 
FALSE), 
(107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', 
TRUE), 
(108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', 
FALSE);

SELECT * FROM customers;

-- ----------------------------------------------------------------------------------------------

CREATE TABLE products ( 
    product_id    INT           PRIMARY KEY, 
    product_name  VARCHAR(100)  NOT NULL, 
    category      VARCHAR(50)   NOT NULL, 
    brand         VARCHAR(50)   NOT NULL, 
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0), 
    stock_qty     INT           NOT NULL  DEFAULT 0  CHECK (stock_qty >= 0) 
); 


 -- Index for filtering by category 
CREATE INDEX idx_products_category ON products(category);

-- ========== INSERT: products ========== 
INSERT INTO products VALUES 
(201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250), 
(202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500), 
(203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150), 
(204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120), 
(205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200), 
(206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300), 
(207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180), 
(208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400);

SELECT * FROM products;

-- ---------------------------------------------------------------------------------

CREATE TABLE orders ( 
    order_id      INT           PRIMARY KEY, 
    customer_id   INT           NOT NULL, 
    order_date    DATE          NOT NULL, 
    status        VARCHAR(20)   NOT NULL  DEFAULT 'Pending' 
    CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')), 
    total_amount  DECIMAL(12,2) NOT NULL  CHECK (total_amount >= 0), 
     
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
); 
 -- Index for date-based filtering and sorting 
CREATE INDEX idx_orders_date ON orders(order_date); 
CREATE INDEX idx_orders_status ON orders(status);


-- ========== INSERT: orders ========== 
INSERT INTO orders VALUES 
(1001, 101, '2024-08-01', 'Delivered',  4498.00), 
(1002, 102, '2024-08-03', 'Delivered',  799.00), 
(1003, 103, '2024-08-05', 'Shipped',    7498.00), 
(1004, 101, '2024-08-10', 'Delivered',  3499.00), 
(1005, 104, '2024-08-12', 'Cancelled',  2999.00), 
(1006, 105, '2024-08-15', 'Delivered',  5898.00), 
(1007, 106, '2024-08-18', 'Pending',    1299.00), 
(1008, 103, '2024-08-20', 'Delivered',  899.00), 
(1009, 107, '2024-08-25', 'Shipped',    6098.00), 
(1010, 108, '2024-08-28', 'Delivered',  1598.00);


SELECT * FROM orders;

-- -------------------------------------------------------------


CREATE TABLE order_items ( 
    item_id       INT           PRIMARY KEY, 
    order_id      INT           NOT NULL, 
    product_id    INT           NOT NULL, 
    quantity      INT           NOT NULL  CHECK (quantity > 0), 
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0), 
    discount_pct  DECIMAL(5,2)  DEFAULT 0 CHECK (discount_pct BETWEEN 0 AND 100), 
     
    FOREIGN KEY (order_id)   REFERENCES orders(order_id), 
    FOREIGN KEY (product_id) REFERENCES products(product_id)
    );
    
    
    -- ========== INSERT: order_items ========== 
INSERT INTO order_items VALUES 
(5001, 1001, 201, 2, 1499.00, 0), 
(5002, 1001, 207, 1, 899.00,  10), 
(5003, 1002, 202, 1, 799.00,  0), 
(5004, 1003, 203, 1, 2999.00, 0), 
(5005, 1003, 204, 1, 4599.00, 5), 
(5006, 1004, 205, 1, 3499.00, 0), 
(5007, 1005, 203, 1, 2999.00, 0), 
(5008, 1006, 201, 1, 1499.00, 10), 
(5009, 1006, 204, 1, 4599.00, 5), 
(5010, 1007, 206, 1, 1299.00, 0), 
(5011, 1008, 207, 1, 899.00,  0), 
(5012, 1009, 205, 1, 3499.00, 0), 
(5013, 1009, 208, 2, 599.00,  15), 
(5014, 1010, 206, 1, 1299.00, 0), 
(5015, 1010, 208, 1, 599.00,  0); 


SELECT * FROM order_items;


-- -----------------------------------------------------------

-- Q-1

SELECT * FROM customers ;

-- Q-2

SELECT first_name, last_name, city FROM customers;

-- Q-3

SELECT DISTINCT category FROM products;


-- Q-4

/*
PRIMARY KEY FOR EACH TABLE

1). customer_id INT PRIMARY KEY

2). order_id INT PRIMARY KEY

3). product_id INT PRIMARY KEY

4). order_item_id INT PRIMARY KEY

---------------------------------------------------------------

why a Primary Key must be unique and NOT NULL

Because :-
Ensures each record is unique
Prevents duplicate entries
Maintains data integrity
Helps create relationships between tables using Foreign Keys
Cannot contain NULL values because every record must be identifiable


*/

-- Q-5

/*
-- Constraints are applied to the email column in the customers table

VARCHAR(100)   UNIQUE NOT NULL

-- when insert a duplicate email

Duplicate entry 'rahul@gmail.com' for key 'email'

Prevents duplicate customer accounts
Maintains accurate customer data
Ensures every customer has a valid email record
Improves data integrity and reliability

*/

-- Q-6

INSERT INTO products
VALUES (209, 'USB Cable', 'Electronics', 'Mi', -50.00, 100);

-- Check constraint 'products_chk_1' is violated.

-- Because of CHECK (unit_price > 0)
-- unit_price must always be greater than 0
-- Negative values are not allowed
-- The database rejects invalid data automatically


-- Q-7

SELECT * FROM orders
WHERE status = "Delivered" ;

-- Q-8
SELECT * FROM products
WHERE category = "Electronics" AND unit_price > 2000;


-- Q-9

SELECT * FROM customers
WHERE state = "Maharashtra"
AND join_date BETWEEN "2024-01-01" AND "2024-12-31";

-- Q-10

SELECT * FROM orders
WHERE order_date BETWEEN "2024-08-10" AND "2024-08-25"
AND status != "Cancelled";


-- Q- 11

CREATE INDEX idx_orders_date 
ON orders(order_date);

SELECT * FROM orders
WHERE order_date BETWEEN "2024-08-10" AND "2024-08-15";

/*
Improves performance on large tables
Speeds up filtering and up sorting by date
without index SQL checks every row
with index SQL check data quickly

Because the query filters directly on order_date, the database can efficiently use idx_orders_date

*/
-- Q-12
SELECT * FROM customers
WHERE YEAR(join_date) = 2024;
-- Without indexes it checks full table and it is inefficient
-- It is Non-SARGable because it usues function YEAR()


SELECT * FROM customers
WHERE join_date >= "2024-01-01" AND join_date <= "2024-12-31";

-- It is more efficient with indexes and it is also follow SARGable

-- Q-13

SELECT COUNT(order_id)
FROM orders

-- Q-14

SELECT SUM(total_amount)
FROM orders
WHERE status = "Delivered" ;


-- Q-15

SELECT category, AVG(unit_price)
FROM products
GROUP BY category;

-- Q-16

SELECT status,COUNT(order_id), SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;

--Q-17

SELECT category, 
    MAX(unit_price) AS Expensive_product, 
    MIN(unit_price) AS Cheapest_product
FROM products
GROUP BY category;

-- Q-18

SELECT category, AVG(unit_price) AS avg_ut_price
FROM products
GROUP BY category
HAVING avg_ut_price >= 2000;


-- Q-19

--  order_id, order_date, first_name, last_name, total_amount
SELECT 
    orders.order_id,
    orders.order_date,
    customers.first_name,
    customers.last_name,
    orders.total_amount
FROM customers
INNER JOIN orders
ON orders.customer_id = customers.customer_id;


-- Q-20

SELECT * FROM customers
LEFT JOIN orders
ON orders.customer_id = customers.customer_id;


-- Q -21  Write a query using JOINs across three tables (orders → order_items → products) to show: order_id, 
-- product_name, quantity, unit_price, and discount_pct 

SELECT  orders.order_id,
        orders.order_date,
        products.product_name,
        order_items.unit_price,
        order_items.discount_pct
FROM orders
JOIN order_items
ON orders.order_id = order_items.order_id
JOIN products
ON products.product_id = order_items.product_id;

-- Q-22
/*
LEFT JOIN

All rows from the left table
Matching rows from the right table
NULL for right-table columns when no match exists
*/
SELECT *
FROM customers 
LEFT JOIN orders 
ON customers.customer_id = orders.customer_id;


/*
RIGHT JOIN

All rows from the right table
Matching rows from the left table
NULL for left-table columns when no match exists
*/



SELECT *
FROM customers 
RIGHT JOIN orders 
ON customers.customer_id = orders.customer_id;

/*
FULL OUTER JOIN

All rows from both tables
Matching rows are combined
Non-matching rows from either table appear with NULL values
*/
SELECT *
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id

UNION

SELECT *
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;



-- Q-23

-- These are the reference keys for the table

FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)

FOREIGN KEY (order_id)
REFERENCES orders(order_id)

FOREIGN KEY (product_id)
REFERENCES products(product_id)

--Example : What Happens if insert an Order with customer_id = 999

INSERT INTO orders
VALUES (1011, 999, CURDATE(), "Pending", 1598.00);

--Because an order with customer_id = 999 cannot be inserted unless a customer with ID 999 exists in the customers table.


-- Q-24  product_name, unit_price, price_tier
SELECT product_id, product_name, unit_price,
    CASE
        WHEN unit_price < 1000 THEN "Budget"
        WHEN unit_price BETWEEN 1000 AND 3000 THEN "Mid-Range"
        WHEN unit_price > 3000 THEN "Premium"
    END AS price_tier
FROM products;



-- Q-25

SELECT
    SUM(CASE WHEN status= "Delivered" THEN 1 ELSE 0 END) AS delivered,
    SUM(CASE WHEN status != "Delivered" THEN 1 ELSE 0 END) AS not_delivered
FROM orders;    

-- Q-26 
/*

Atomicity  = All or nothing 
Example = Either both debit and credit happen, or neither happens 

Consistency = Valid state to valid state   
Example = Total money remains unchanged after transfer

Isolation = Transactions don't interfere 
Example = Simultaneous withdrawals don't cause incorrect balances 

Durability = Committed data is permanent  
Example = Transfer remains saved even after a crash  

*/

-- Q-27

START TRANSACTION;

-- Insert order
INSERT INTO orders
VALUES (1011, 102, CURDATE(), 'Pending', 1598.00);

-- Insert order items
INSERT INTO order_items
VALUES (5016, 1011, 202, 1, 799.00, 0);

INSERT INTO order_items
VALUES (5017, 1011, 208, 1, 599.00, 0);

-- Update stock
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 202;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

COMMIT;

-- If any statement fails:
ROLLBACK;