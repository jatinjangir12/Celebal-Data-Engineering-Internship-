# Week 7 – Incremental Data Processing using Delta Lake

## Objective

Perform incremental data processing using Delta Lake with PySpark by loading a dataset into a Delta table, cleaning the data, simulating incremental records, applying the MERGE operation, validating the results, and exporting the final dataset.

---

## Tools & Technologies

- Python
- PySpark
- Delta Lake
- Databricks
- Apache Spark SQL

---

## Dataset

- Sample - Superstore.csv

---

## Steps Performed

### 1. Load Dataset
- Loaded the Superstore CSV file into a Spark DataFrame.
- Verified schema and previewed the dataset.

### 2. Data Cleaning
- Checked for missing values.
- Removed null records using `dropna()`.
- Removed duplicate records using `dropDuplicates()`.
- Renamed column names by replacing spaces with underscores for easier SQL operations.

### 3. Create Delta Table
- Stored the cleaned dataset as a Delta table named `superstore_delta`.

### 4. Simulate Incremental Data
- Created an incremental dataset containing:
  - Updated records (existing Row_ID values)
  - New records (new Row_ID values)

### 5. MERGE Operation
- Used Delta Lake `MERGE` to:
  - Update existing records
  - Insert new records

### 6. Validation
- Verified total row count.
- Checked for duplicate Row_ID values.
- Displayed the final Delta table.

### 7. Export
- Saved the processed dataset as the final output.

---

## MERGE Logic

```sql
MERGE INTO superstore_delta AS target
USING incremental_data AS source
ON target.Row_ID = source.Row_ID

WHEN MATCHED THEN
UPDATE SET
    target.Order_ID = source.Order_ID,
    target.Order_Date = source.Order_Date,
    target.Ship_Date = source.Ship_Date,
    target.Ship_Mode = source.Ship_Mode,
    target.Customer_ID = source.Customer_ID,
    target.Customer_Name = source.Customer_Name,
    target.Segment = source.Segment,
    target.Country = source.Country,
    target.City = source.City,
    target.State = source.State,
    target.Postal_Code = source.Postal_Code,
    target.Region = source.Region,
    target.Product_ID = source.Product_ID,
    target.Category = source.Category,
    target.Sub_Category = source.Sub_Category,
    target.Product_Name = source.Product_Name,
    target.Sales = source.Sales,
    target.Quantity = source.Quantity,
    target.Discount = source.Discount,
    target.Profit = source.Profit

WHEN NOT MATCHED THEN
INSERT *
```

---

## Output

- Delta Table (`superstore_delta`)
- Updated Dataset
- Final CSV Output
- Jupyter/Databricks Notebook
- Screenshots of execution

---

## Results

- Successfully loaded the dataset into a Delta table.
- Cleaned the dataset by removing null values and duplicates.
- Simulated incremental data.
- Updated existing records using MERGE.
- Inserted new records using MERGE.
- Validated row count and duplicate records.
- Displayed the final processed dataset.

---

## Learning Outcomes

- Working with Delta Lake tables.
- Performing incremental ETL processing.
- Using MERGE for UPSERT operations.
- Validating transformed data.
- Managing Delta tables in Databricks.
