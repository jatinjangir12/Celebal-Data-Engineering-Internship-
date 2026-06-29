# Week 6 — PySpark Data Processing Pipeline (Retail Sales Dataset)

## Objective

The objective of this assignment is to understand Apache Spark fundamentals and build a complete data processing pipeline using PySpark. The pipeline includes loading data, applying transformations, cleaning records, filtering useful data, and saving processed output in optimized file formats.

---

## Technologies Used

* Python 3
* PySpark
* Google Colab / Jupyter Notebook
* Apache Spark

---

## Dataset

Dataset used: **Retail Sales Dataset**

### Schema

```text
root
 |-- Transaction ID: integer (nullable = true)
 |-- Date: date (nullable = true)
 |-- Customer ID: string (nullable = true)
 |-- Gender: string (nullable = true)
 |-- Age: integer (nullable = true)
 |-- Product Category: string (nullable = true)
 |-- Quantity: integer (nullable = true)
 |-- Price per Unit: integer (nullable = true)
 |-- Total Amount: integer (nullable = true)
```

---

## Steps Performed

### 1. Setup Spark Session

Installed PySpark and created SparkSession.

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("week_6_pipeline") \
    .getOrCreate()
```

---

### 2. Load Dataset

Loaded CSV file using Spark DataFrame.

```python
df = spark.read.csv(path, header=True, inferSchema=True)
```

Used:

* `show(5)` → preview first 5 rows
* `printSchema()` → inspect column types

---

### 3. Data Transformation

Performed multiple transformations:

#### Selected Required Columns

Kept only important columns:

* Transaction ID
* Customer ID
* Age
* Quantity
* Price per Unit
* Total Amount

#### Renamed Columns

Renamed columns with spaces for easier processing.

Example:

* Transaction ID → `transaction_id`
* Customer ID → `customer_id`
* Price per Unit → `price_per_unit`
* Total Amount → `total_amount`

#### Cast Numeric Columns

Converted:

* `price_per_unit` → double
* `Quantity` → integer

#### Calculated Final Amount

Created new column:

```text
calculated_total_amount = Quantity × Price per Unit
```

---

### 4. Data Cleaning

Removed rows containing null values in important columns:

```python
dropna(subset=["customer_id", "calculated_total_amount"])
```

This ensures cleaner and more reliable data.

---

### 5. Filtering Data

Applied filters to analyze useful records.

Conditions:

* Age ≥ 25
* Quantity > 1

This helps focus on meaningful customer purchases.

---

### 6. Save Processed Data

Saved final processed dataset in two formats:

### CSV Format

```python
write.csv()
```

### Parquet Format

```python
write.parquet()
```

---

# Spark Architecture

## Driver

The Driver acts as the brain of Spark. It runs the main PySpark code, creates SparkSession, and coordinates task execution. It also collects results from executors.

## Cluster Manager

The Cluster Manager allocates resources such as CPU and memory across the cluster.

## Executors

Executors are worker processes that perform computations and store intermediate data in memory.

---

# DAG (Directed Acyclic Graph)

Spark transformations are **lazy**.

When transformations like:

* `select()`
* `filter()`
* `withColumn()`

are applied, Spark does not execute them immediately.

Instead, it builds a **DAG (Directed Acyclic Graph)**, which represents all operations as an execution plan.

Spark executes this plan only when an **Action** is called, such as:

* `show()`
* `count()`
* `collect()`

This allows Spark to optimize execution for better performance.

---

# Performance & Best Practices

## CSV

* Row-based storage
* Human readable
* Slow for big data
* Larger storage size
* Schema is not preserved

Spark must scan the entire file even if only a few columns are needed.

---

## Parquet

* Column-based storage
* Highly compressed
* Fast read/write
* Preserves schema
* Supports Predicate Pushdown

Spark reads only required columns, improving performance significantly.

---

## Avoid collect()

`collect()` transfers the entire dataset from executors to the driver.

This can cause:

* Memory overflow
* Slow execution
* Application crash

Use only for very small datasets.

---

## Prefer show()

Use:

```python
show(5)
```

instead of `collect()` for quick previews.

It fetches only limited rows and is much safer for large datasets.

---

# Conclusion

This assignment helped in understanding:

* Spark DataFrames
* Transformations and Actions
* Data Cleaning
* Filtering
* Spark Architecture
* DAG Optimization
* Storage Formats (CSV vs Parquet)
* Performance Best Practices

PySpark makes big data processing efficient through distributed computation and in-memory processing.

--------------------------------------------------------------------------------------------------------------
## Author
**Jatin Jangir**  
