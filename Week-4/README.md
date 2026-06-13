# Azure Cloud Fundamentals and Data Pipeline Implementation using ADF

## Project Overview
This project demonstrates the implementation of an end-to-end data pipeline using Microsoft Azure services, including Azure Storage Account, Blob Storage, and Azure Data Factory (ADF).

The objective of this project is to understand Azure cloud concepts and build a pipeline that reads a CSV file from Blob Storage, validates metadata, and copies the file to a destination location.

---

## Objective
- Understand Azure cloud services and portal navigation
- Create and manage Azure resources
- Build an ETL/data pipeline using Azure Data Factory
- Validate source data using metadata
- Transfer data from source to destination storage
- Manage access using IAM roles

---

## Tools & Services Used
- Microsoft Azure Portal
- Azure Resource Group
- Azure Storage Account
- Azure Blob Storage
- Azure Data Factory (ADF)
- CSV Dataset (`superstore_data.csv`)

---

## Project Architecture
```text
Blob Storage (Source CSV)
        ↓
Azure Data Factory
        ↓
 Get Metadata Activity
        ↓
  Copy Data Activity
        ↓
Destination Blob Storage
```

---

## Implementation Steps

### Task 1: Azure Portal Setup
- Logged into Azure Portal
- Created Resource Group: `rg-week4-jatin`

### Task 2: Storage Setup
- Created Storage Account: `jatinstorage2026`
- Created Blob Container: `superstore-data`
- Uploaded CSV dataset: `superstore_data.csv`

### Task 3: Azure Data Factory Setup
- Created Data Factory: `adf-jatin-week4`
- Explored ADF UI:
  - Author
  - Monitor
  - Manage

### Task 4: Linked Services & Datasets
Created Linked Service:
- `AzureBlobStorage1`

Created Datasets:
- Source Dataset: `source_dataset`
- Destination Dataset: `destination_dataset`

### Task 5: Metadata Validation
Added **Get Metadata** activity to retrieve:
- File Exists
- File Size
- Last Modified Date

### Task 6: Pipeline Development
Created pipeline:
- `pipeline_superstore`

Activities used:
- Get Metadata
- Copy Data

Pipeline Flow:
```text
Get Metadata → Copy Data
```

### Task 7: Pipeline Execution
Executed pipeline using:
- Debug
- Trigger Now

Result:
- Pipeline Status: **Succeeded**

### Task 8: IAM Role Assignment
Assigned roles:
- Reader
- Contributor

---

## Output
- CSV file successfully read from source blob storage
- Metadata validated successfully
- Data copied to destination storage
- Pipeline executed without errors

---

## Result Summary
The Azure Data Factory pipeline successfully validated metadata and copied the CSV dataset from source Blob Storage to destination Blob Storage. All assignment tasks were completed successfully.

---

## Author
**Jatin Jangir**  

