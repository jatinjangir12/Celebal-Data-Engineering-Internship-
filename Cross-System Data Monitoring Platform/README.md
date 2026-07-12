# Cross-System Data Drift & Trust Monitoring Platform

## Project Overview

This project implements a Cross-System Data Drift & Trust Monitoring Platform using PySpark, Delta Lake, and Databricks-style Medallion Architecture.

The platform compares data across CRM, Billing, and Analytics systems to detect inconsistencies, identify missing and duplicate records, monitor data drift, and calculate a Trust Score for overall data quality.

---

## Tech Stack

- Python 3.11
- Apache Spark 3.5.1
- PySpark
- Delta Lake
- SQL
- Pandas
- Matplotlib
- Jupyter Notebook

---

## Project Architecture

```
                CRM Dataset
                     │
             Billing Dataset
                     │
            Analytics Dataset
                     │
                     ▼
          1_Data_Ingestion.ipynb
                     │
                     ▼
              Bronze Layer
                     │
                     ▼
          2_Data_Cleaning.ipynb
                     │
                     ▼
              Silver Layer
                     │
                     ▼
         3_Data_Validation.ipynb
                     │
                     ▼
      Missing / Duplicate Detection
                     │
                     ▼
      4_Data_Drift_Detection.ipynb
                     │
                     ▼
            Drift Report
                     │
                     ▼
          5_Trust_Score.ipynb
                     │
                     ▼
            Trust Score
                     │
                     ▼
         6_Dashboard_Data.ipynb
                     │
                     ▼
          Dashboard Dataset
                     │
                     ▼
          7_Visualization.ipynb
```

---

## Project Structure

```text
Cross-System-Monitoring/
│
├── data/
│   ├── crm_dataset.csv
│   ├── billing_dataset.csv
│   └── analytics_dataset.csv
│
├── bronze/
│   ├── crm/
│   ├── billing/
│   └── analytics/
│
├── silver/
│   ├── crm/
│   ├── billing/
│   └── analytics/
│
├── gold/
│   ├── missing_records/
│   ├── duplicates/
│   ├── drift_report/
│   ├── trust_score/
│   └── dashboard_data/
│
├── notebook/
│   ├── 1_Data_Ingestion.ipynb
│   ├── 2_Data_Cleaning.ipynb
│   ├── 3_Data_Validation.ipynb
│   ├── 4_Data_Drift_Detection.ipynb
│   ├── 5_Trust_Score.ipynb
│   ├── 6_Dashboard_Data.ipynb
│   └── 7_Visualization.ipynb
│
├── dashboard/
│   └── dashboard.csv
│
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

## Features

- Multi-System Data Comparison
- Bronze, Silver and Gold Data Layers
- Delta Lake Storage
- Missing Record Detection
- Duplicate Record Detection
- Cross-System Validation
- Data Drift Detection
- Trust Score Calculation
- Dashboard Metrics
- Interactive Data Visualization

---

## Workflow

### Notebook 1
- Read CRM, Billing and Analytics datasets
- Store raw data in Bronze Layer

### Notebook 2
- Data Cleaning
- Null Handling
- Duplicate Removal
- Store cleaned data in Silver Layer

### Notebook 3
- Cross-System Validation
- Missing Record Detection
- Duplicate Detection
- Mismatch Detection

### Notebook 4
- Data Drift Detection

### Notebook 5
- Trust Score Calculation

### Notebook 6
- Dashboard Metrics Generation

### Notebook 7
- Dashboard Visualization

---

## Trust Score Formula

```
Trust Score = 100 −
(Missing + Duplicate + Drift Records)
÷ Total Records × 100
```

---

## Installation

Clone the repository

```bash
git clone https://github.com/jatinjangir12/Celebal-Data-Engineering-Internship-.git
```

Move into the project

```bash
cd Cross-System Data Monitoring Platform
```

Install dependencies

```bash
pip install -r requirements.txt
```

Run Jupyter Notebook

```bash
jupyter notebook
```

---

## Future Enhancements

- Spark Structured Streaming
- Real-Time Alerts
- Email Notifications
- Power BI Dashboard
- ML-based Anomaly Detection
- Azure Data Factory Integration
- Databricks Deployment

---

## Author

**Jatin Jangir**

B.Tech (AI & ML)

Data Engineering Project

2026