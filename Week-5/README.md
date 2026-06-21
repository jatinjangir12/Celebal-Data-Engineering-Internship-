# Week 5 – PySpark Data Processing Using Superstore Dataset

## Objective

Understand Spark fundamentals and perform data cleaning, transformation, filtering, aggregation, and schema modifications using **PySpark DataFrames** on the Superstore dataset.

---

## Technologies Used

* Python 3
* PySpark
* Apache Spark
* Google Colab / Jupyter Notebook
* CSV Dataset

---

## Dataset

Dataset used:

`Superstore_dataset.csv`

The dataset contains sales-related information such as:

* Order ID
* Customer Name
* Region
* Category
* Sales
* Profit
* Quantity
* Discount
* Ship Mode

---

## Tasks Performed

### 1. Install PySpark and Required Libraries

Installed PySpark and imported required Spark libraries.

```python
!pip install pyspark

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, min, max, count
```

---

### 2. Create Spark Session

Created Spark session for distributed data processing.

```python
spark = SparkSession.builder \
    .appName("Superstore_Data_Processing") \
    .getOrCreate()
```

---

### 3. Load Dataset

Loaded CSV dataset into Spark DataFrame.

```python
df = spark.read.csv("Superstore_dataset.csv", header=True, inferSchema=True)
```

---

## Concepts Covered

### MapReduce vs Apache Spark

**MapReduce** is an older Big Data processing framework. It is slower because it repeatedly reads and writes data to disk after each processing step.

**Apache Spark** is much faster because of **in-memory processing**, where data is stored in RAM instead of disk. This improves performance significantly.

---

### Spark DataFrames

Spark stores structured data in **DataFrames**, similar to database tables with rows and columns.

#### Immutability

Spark DataFrames are immutable. Once created, they cannot be modified directly. Any transformation creates a new DataFrame.

---

## Data Cleaning

### Remove Duplicate Records

```python
df = df.dropDuplicates()
```

### Handle Null Values

```python
df = df.fillna(0)
```

### Handle Empty Values

Replaced empty values with default values.

---

## Filtering Operations

Applied filtering conditions on dataset based on:

* Region
* Category
* Sales Range

Example:

```python
filtered_df = df.filter(col("Region") == "West")
```

---

## Aggregation Functions

Used Spark aggregation functions:

* Count
* Sum
* Average
* Minimum
* Maximum

Example:

```python
df.select(
    count("Sales"),
    sum("Sales"),
    avg("Sales"),
    min("Sales"),
    max("Sales")
).show()
```

---

## GroupBy Operations

Grouped data based on region and category.

Example:

```python
df.groupBy("Region").sum("Sales").show()
```

Applied conditions on aggregated results similar to SQL HAVING.

---

## Wide Transformations and Shuffle

### Wide Transformations

When using operations like:

* groupBy()
* join()
* orderBy()

Spark needs data from multiple partitions.

These operations are called **Wide Transformations**.

### Shuffle

To perform wide transformations, Spark redistributes data across partitions over the network. This process is called **Shuffle**.

Shuffling is usually the most expensive operation in Spark.

---

## Schema Modification

Modified schema using:

### Casting

```python
df = df.withColumn("Sales", col("Sales").cast("double"))
```

### Renaming Columns

```python
df = df.withColumnRenamed("Order ID", "Order_ID")
```

---

## Handling Inconsistent Data

Handled:

* Null values
* Empty strings
* Incorrect schema
* Invalid rows
* Duplicate rows

---

## Complete Data Processing Pipeline

Pipeline followed:

```text
Load Data
   ↓
Clean Data
   ↓
Handle Nulls
   ↓
Fix Schema
   ↓
Filter Data
   ↓
Aggregate
   ↓
GroupBy Analysis
   ↓
Save Output
```

---

## Key Learnings

* Understanding Spark architecture
* Difference between MapReduce and Spark
* Spark DataFrame operations
* Data cleaning in PySpark
* Aggregation and grouping
* Wide transformations and shuffle
* Schema handling
* Building end-to-end data pipelines

---

## Conclusion

This project helped in understanding how Apache Spark processes large datasets efficiently using distributed computing and in-memory processing. PySpark DataFrames made data cleaning, transformation, and aggregation faster and scalable for big data workloads.

---

## Author
**Jatin Jangir**  