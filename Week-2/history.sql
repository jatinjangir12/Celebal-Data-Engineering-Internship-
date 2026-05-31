/* 2026-05-30 20:45:46 [16 ms] */ 
SELECT * FROM superstore.superstore LIMIT 100;
/* 2026-05-30 20:57:16 [3 ms] */ 
USE superstore;
/* 2026-05-30 20:57:24 [21 ms] */ 
SELECT * FROM superstore LIMIT 100;
/* 2026-05-30 21:45:39 [33 ms] */ 
DESCRIBE superstore;
/* 2026-05-30 21:47:55 [10 ms] */ 
SELECT COUNT(*)
FROM superstore LIMIT 100;
/* 2026-05-30 21:48:27 [3 ms] */ 
SHOW COLUMNS 
FROM superstore;
/* 2026-05-30 21:52:29 [5 ms] */ 
SELECT region, category
FROM superstore
WHERE Sales > 100 LIMIT 100;
/* 2026-05-30 21:54:47 [4 ms] */ 
SELECT region, category, Sales
FROM superstore
WHERE Sales > 100 LIMIT 100;
/* 2026-05-30 21:55:05 [3 ms] */ 
SELECT region, category, Sales
FROM superstore
WHERE Sales > 200 LIMIT 100;
/* 2026-05-30 21:55:11 [18 ms] */ 
SELECT region, category, Sales
FROM superstore
WHERE Sales > 500 LIMIT 100;
/* 2026-05-30 21:59:28 [3 ms] */ 
SELECT City
FROM superstore
WHERE `Ship Mode`="Second Class" LIMIT 100;
/* 2026-05-30 21:59:45 [4 ms] */ 
SELECT City, Category
FROM superstore
WHERE `Ship Mode`="Second Class" LIMIT 100;
/* 2026-05-30 22:01:35 [3 ms] */ 
SELECT City, Category
FROM superstore
WHERE Region = "West" LIMIT 100;
/* 2026-05-30 22:01:55 [8 ms] */ 
SELECT * FROM superstore LIMIT 100;
/* 2026-05-30 22:04:04 [4 ms] */ 
SELECT `Customer ID`, `City`, `Category`
FROM superstore
WHERE Region = "West" LIMIT 100;
/* 2026-05-30 22:04:16 [4 ms] */ 
SELECT `Customer ID`,`Customer Name`, `City`, `Category`
FROM superstore
WHERE Region = "West" LIMIT 100;
/* 2026-05-30 22:05:41 [7 ms] */ 
SELECT City, Category
FROM superstore
WHERE Category = 'Technology' LIMIT 100;
/* 2026-05-30 22:07:20 [19 ms] */ 
SELECT 'City', `Region`
FROM superstore
WHERE Category = 'Technology' LIMIT 100;
/* 2026-05-30 22:07:56 [63 ms] */ 
SELECT *
FROM superstore
WHERE Category = 'Technology'
LIMIT 100;
/* 2026-05-30 22:09:25 [15 ms] */ 
SELECT * FROM superstore
WHERE 'Order_Date' BETWEEN '2017-01-01' AND '2017-12-31' LIMIT 100;
/* 2026-05-30 22:09:43 [22 ms] */ 
SELECT * FROM superstore
WHERE 'Order_Date' BETWEEN '2017-01-01' AND '2018-12-31' LIMIT 100;
/* 2026-05-30 22:09:51 [7 ms] */ 
SELECT * FROM superstore
WHERE Category = 'Technology'
LIMIT 100;
/* 2026-05-30 22:10:18 [22 ms] */ 
SELECT * FROM superstore
WHERE `Ship Date` BETWEEN '2017-01-01' AND '2018-12-31' LIMIT 100;
/* 2026-05-30 22:10:40 [15 ms] */ 
SELECT * FROM superstore
WHERE `Ship Date` = '2017-01-01' LIMIT 100;
/* 2026-05-30 22:11:49 [11 ms] */ 
SELECT *
FROM superstore
WHERE `Ship Date` >= '2018-01-01' LIMIT 100;
/* 2026-05-30 22:18:43 [16 ms] */ 
SELECT * FROM superstore
WHERE `Category` = "Furniture"
    AND `Region` = "East"
    AND `Sales` >= 1000 LIMIT 100;
/* 2026-05-30 22:24:48 [41 ms] */ 
SELECT count('sales')
FROM superstore LIMIT 100;
/* 2026-05-30 22:25:17 [17 ms] */ 
SELECT AVG('sales')
FROM superstore LIMIT 100;
/* 2026-05-30 22:25:36 [16 ms] */ 
SELECT SUM('sales')
FROM superstore LIMIT 100;
/* 2026-05-30 22:26:37 [25 ms] */ 
SELECT `Region`, SUM('sales')
FROM superstore
GROUP BY `Region` LIMIT 100;
/* 2026-05-30 22:27:01 [25 ms] */ 
SELECT `Region`, SUM('Sales')
FROM superstore
GROUP BY `Region` LIMIT 100;
/* 2026-05-30 22:27:19 [15 ms] */ 
SELECT `Region`, SUM(Sales)
FROM superstore
GROUP BY `Region` LIMIT 100;
/* 2026-05-30 22:29:19 [26 ms] */ 
SELECT * FROM superstore
WHERE `Category` = "Furniture"
AND `Region` = "East"
AND `Sales` >= 1000 LIMIT 100;
/* 2026-05-30 22:30:08 [22 ms] */ 
SELECT `Category`, AVG(`Profit`) 
FROM superstore
GROUP BY `Category` LIMIT 100;
/* 2026-05-30 22:34:24 [16 ms] */ 
SELECT `Region`, AVG(`Profit`) 
FROM superstore
GROUP BY `Region` LIMIT 100;
/* 2026-05-30 22:35:56 [24 ms] */ 
SELECT Region,
       SUM(Sales)  ,
       SUM(Quantity) ,
       SUM(Profit) 
FROM superstore
GROUP BY Region LIMIT 100;
/* 2026-05-30 22:38:45 [48 ms] */ 
SELECT Region,
       SUM(Sales)  ,
       SUM(Quantity) ,
       AVG(Profit) 
FROM superstore
GROUP BY Region LIMIT 100;
/* 2026-05-30 22:39:31 [22 ms] */ 
SELECT Category,
       SUM(Quantity)
FROM superstore
GROUP BY Category LIMIT 100;
/* 2026-05-30 22:39:39 [17 ms] */ 
SELECT Category, SUM(Quantity)
FROM superstore
GROUP BY Category LIMIT 100;
/* 2026-05-30 22:47:51 [23 ms] */ 
SELECT `Product Name`, SUM(`Sales`) AS totalsales
FROM superstore
GROUP BY `Product Name`
ORDER BY totalsales DESC
LIMIT 10;
/* 2026-05-30 22:50:31 [19 ms] */ 
SELECT `Category` ,SUM(`Sales`)
FROM superstore
GROUP BY `Category` LIMIT 100;
/* 2026-05-30 22:52:23 [21 ms] */ 
SELECT `Category` ,SUM(`Sales`) AS total_sales
FROM superstore
GROUP BY `Category`
ORDER BY total_sales DESC LIMIT 100;
/* 2026-05-30 23:43:44 [39 ms] */ 
select `Product Name`,Category from superstore
order by `Product Name` desc
limit 5;
/* 2026-05-30 23:44:29 [19 ms] */ 
SELECT `Category` ,SUM(`Quantity`) AS total_sales
FROM superstore
GROUP BY `Category`
ORDER BY total_sales DESC LIMIT 100;
/* 2026-05-30 23:45:05 [124 ms] */ 
SELECT `Category` ,SUM(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `Category`
ORDER BY total_quantity DESC LIMIT 100;
/* 2026-05-30 23:45:33 [96 ms] */ 
SELECT `Category` ,MAX(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `Category`
ORDER BY total_quantity DESC LIMIT 100;
/* 2026-05-30 23:46:10 [50 ms] */ 
SELECT `City` ,MAX(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `City`
ORDER BY total_quantity DESC LIMIT 100;
/* 2026-05-30 23:46:51 [26 ms] */ 
SELECT `Category` ,MAX(`Quantity`) AS total_quantity
FROM superstore
GROUP BY `Category`
ORDER BY total_quantity DESC LIMIT 100;
/* 2026-05-30 23:47:33 [29 ms] */ 
SELECT `Product Name`, SUM(`Sales`) AS totalsales
FROM superstore
GROUP BY `Product Name`
ORDER BY totalsales DESC
LIMIT 10;
/* 2026-05-30 23:52:58 [36 ms] */ 
SELECT `Customer Name`, SUM(`Sales`) AS t_sales 
FROM superstore
GROUP BY `Customer Name`
ORDER BY t_sales desc
LIMIT 10;
/* 2026-05-30 23:56:25 [30 ms] */ 
SELECT * FROM superstore
WHERE `Ship Date` >= '2018-01-01' LIMIT 100;
/* 2026-05-31 00:02:00 [219 ms] */ 
SELECT YEAR(`Ship Date`) AS  year , MONTH(`Ship Date`) AS month,
    SUM(`Profit`) 
 FROM superstore
 GROUP BY YEAR(`Ship Date`) , MONTH(`Ship Date`)
 ORDER BY year, month LIMIT 100;
/* 2026-05-31 00:03:47 [48 ms] */ 
SELECT `Order ID`,
       COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1 LIMIT 100;
/* 2026-05-31 00:04:03 [20 ms] */ 
SELECT `Order ID`,  COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1 LIMIT 100;
/* 2026-05-31 00:06:34 [338 ms] */ 
SELECT YEAR(`Order Date`) AS  year , MONTH(`Order Date`) AS month,
    SUM(`Profit`) 
 FROM superstore
 GROUP BY YEAR(`Order Date`) , MONTH(`Order Date`)
 ORDER BY year, month LIMIT 100;
/* 2026-05-31 00:12:55 [34 ms] */ 
SELECT YEAR((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))) AS  year , MONTH((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))) AS month,
    SUM(`Profit`) 
 FROM superstore
 GROUP BY YEAR((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))), MONTH((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))) 
 ORDER BY year, month LIMIT 100;
/* 2026-05-31 00:13:51 [15 ms] */ 
select month(STR_TO_DATE(`Order Date`, '%m/%d/%Y')), SUM(Sales) from superstore
group by  month(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) LIMIT 100;
/* 2026-05-31 00:15:18 [13 ms] */ 
SELECT COUNT(*) FROM superstore LIMIT 100;
/* 2026-05-31 00:15:46 [49 ms] */ 
SELECT COUNT(DISTINCT `Order ID`) 
FROM superstore LIMIT 100;
/* 2026-05-31 00:17:10 [17 ms] */ 
SELECT
    MIN(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Earliest_Order,
    MAX(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Latest_Order
FROM superstore LIMIT 100;
/* 2026-05-31 10:42:11 [86 ms] */ 
SELECT
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Null_Quantity
FROM superstore LIMIT 100;
/* 2026-05-31 10:44:40 [30 ms] */ 
SELECT YEAR((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))) AS  year , MONTH((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))) AS month,
    SUM(`Profit`) 
 FROM superstore
 GROUP BY YEAR((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))), MONTH((STR_TO_DATE(`Order Date`, '%Y-%m-%d'))) 
 ORDER BY year, month LIMIT 100;
/* 2026-05-31 10:45:59 [13 ms] */ 
SELECT
    MIN(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
    MAX(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
    COUNT(`Quantity`)
FROM superstore LIMIT 100;
/* 2026-05-31 10:47:23 [47 ms] */ 
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
    COUNT(Quantity) AS total_orders
FROM superstore
GROUP BY
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')),
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY year, month LIMIT 100;
