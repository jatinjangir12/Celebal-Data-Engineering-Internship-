
# Week 8 – E-Commerce Order Analytics Pipeline

## Objective

Build an end-to-end analytics pipeline for an e-commerce dataset by cleaning raw data, creating a relational SQLite database, and performing SQL-based business analysis to generate actionable insights.

---

## Project Workflow

```text
Raw CSV Files
      │
      ▼
Notebook 1
Data Cleaning & Validation
      │
      ▼
Cleaned CSV Files
      │
      ▼
Notebook 2
SQLite Database Creation & Data Loading
      │
      ▼
E-commerce Database
      │
      ▼
Notebook 3
SQL Business Analysis & Reporting
```

---

## Repository Structure

```text
Week-8/
├── 01.ipynb        # Data Cleaning & Preprocessing
├── 02.ipynb        # SQLite Database Creation
├── 03.ipynb        # SQL Analytics
├── data/
├── database/
└── README.md
```

---

# Notebook 1 – Data Cleaning & Preprocessing

### Tasks Performed
- Imported required Python libraries.
- Loaded Customers, Products, Orders, and Order Items datasets.
- Explored dataset shape and schema.
- Previewed sample records.
- Checked missing values.
- Cleaned and standardized datasets.
- Saved cleaned datasets for downstream processing.

### Technologies
- Python
- Pandas
- NumPy

---

# Notebook 2 – Database Creation

### Tasks Performed
- Connected to SQLite.
- Created relational tables:
  - Customers
  - Products
  - Orders
  - Order Items
- Loaded cleaned CSV files into the database.
- Established primary and foreign key relationships.

### Technologies
- SQLite
- SQL
- Pandas

---

# Notebook 3 – Business Analytics

### Analysis Performed
- Category-wise sales analysis
- Customer revenue analysis
- Monthly order trends
- Customers without orders
- Product return analysis
- Regional sales performance using SQL queries and CTEs

### SQL Concepts Used
- JOIN
- GROUP BY
- Aggregate Functions
- CASE Statements
- CTEs
- Date Functions

---

# Technologies Used

- Python
- Pandas
- NumPy
- SQLite
- SQL
- Jupyter Notebook

---

# Learning Outcomes

- Data cleaning and preprocessing
- Relational database design
- SQL query development
- Business analytics
- End-to-end data pipeline implementation

---

## Author

**Jatin Jangir**

Data Engineering Intern

Celebal Technologies Internship Program
