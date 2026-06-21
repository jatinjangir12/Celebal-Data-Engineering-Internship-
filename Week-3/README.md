# Week 3 – SQL Analysis Using Subqueries, CTEs, and Window Functions

## Objective

Analyze sales data from the Superstore dataset using advanced SQL concepts such as:

* Subqueries
* Common Table Expressions (CTEs)
* Window Functions

## Dataset

The Superstore dataset was imported into a table named:

```sql
superstore_raw
```

## Database Design

The raw dataset was normalized into the following tables:

### Customers

Stores customer-related information.

### Products

Stores product-related information.

### Orders

Stores order transaction details and references customers and products through foreign keys.

## Tasks Performed

### 1. Data Preparation

* Imported Superstore dataset into `superstore_raw`
* Created normalized tables:

  * customers
  * products
  * orders
* Inserted data using `SELECT DISTINCT`

### 2. SQL Analysis

Implemented business queries using:

#### Subqueries

* Finding customers with above-average sales
* Identifying top-selling products
* Comparing sales against category averages

#### Common Table Expressions (CTEs)

* Sales aggregation
* Customer-wise revenue analysis
* Category performance analysis

#### Window Functions

* Ranking products by sales
* Calculating running totals
* Finding top customers within regions
* Sales comparison using ROW_NUMBER(), RANK(), and DENSE_RANK()

## SQL Concepts Used

* SELECT DISTINCT
* INNER JOIN
* Aggregate Functions
* GROUP BY
* HAVING
* Subqueries
* WITH Clause (CTE)
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* SUM() OVER()
* AVG() OVER()

## Project Structure

```
Week-3/
│
├── README.md
├── superstore.sql
└── analysis_queries.sql
```

## Learning Outcomes

Through this assignment, I gained hands-on experience with:

* Data normalization
* Relational database design
* Advanced SQL querying
* Analytical reporting using SQL
* Business insights generation from transactional data

## Author

Jatin Jangir

Celebal Technologies – Data Engineering Internship
