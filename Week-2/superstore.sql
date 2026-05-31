-- Step: 1.Load dataset into a SQL database. 

-- First create schema of superstore 
-- Table is imported using table Data import wizart
-- Select your CSV file and click Next

USE superstore;
SELECT * FROM superstore ;


--  step: 2.Explore table (schema, sample data).
DESCRIBE superstore;

SELECT COUNT(*)
FROM superstore;


--  3.Apply WHERE filters (region, category, date, sales)

SELECT * FROM superstore
WHERE `Ship Date` >= '2018-01-01';


SELECT region, category, Sales
FROM superstore
WHERE Sales > 500;

SELECT * FROM superstore
WHERE Category = 'Technology'
LIMIT 100;


SELECT `Customer ID`,`Customer Name`, `City`, `Category`
FROM superstore
WHERE Region = "West";

-- combine all the filters with WHERE

SELECT * FROM superstore
WHERE `Category` = "Furniture"
AND `Region` = "East"
AND `Sales` >= 1000;


-- 4.Use GROUP BY for aggregations (sales, quantity, averages)

SELECT `Region`, SUM(Sales)
FROM superstore
GROUP BY `Region`;

SELECT Category, SUM(Quantity)
FROM superstore
GROUP BY Category;

SELECT `Region`, AVG(`Profit`) 
FROM superstore
GROUP BY `Region`;

SELECT Region,
       SUM(Sales)  ,
       SUM(Quantity) ,
       AVG(Profit) 
FROM superstore
GROUP BY Region;


-- 5.Sort and limit results (top products, top categories)


SELECT `Product Name`, SUM(`Sales`) AS totalsales
FROM superstore
GROUP BY `Product Name`
ORDER BY totalsales DESC
LIMIT 10;

SELECT `Category` ,MAX(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `Category`
ORDER BY total_quantity DESC;


--  6.Solve use cases (monthly trends, top customers, duplicates)

SELECT `Customer Name`, SUM(`Sales`) AS t_sales 
FROM superstore
GROUP BY `Customer Name`
ORDER BY t_sales desc
LIMIT 10;



SELECT YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
COUNT(Quantity) AS total_orders FROM superstore
GROUP BY
YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')),
MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY year, month;



SELECT `Order ID`,  COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1;



--  7.Validate results (row counts, data quality)

SELECT COUNT(*) FROM superstore;


SELECT COUNT(DISTINCT `Order ID`) 
FROM superstore;


-- Misiing values 
SELECT
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Null_Quantity
FROM superstore;


--first and last date

SELECT
    MIN(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Earliest_Order,
    MAX(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Latest_Order
FROM superstore;




/*brief insights
Sales Performance

Technology category generates the highest average revenue.
Certain products dominate overall sales.


Customer Analysis
Top 10 customers contribute a large percentage of total sales.
Customer-focused marketing can increase repeat purchases.


Regional Analysis
West and East regions typically show stronger sales performance.
Regional strategies can improve profitability.


Data Quality
Row counts validated successfully.
Duplicate checks performed.
Missing-value analysis completed.

*/