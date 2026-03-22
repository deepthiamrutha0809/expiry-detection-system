# Expiry Detection System

## Project Overview

The Expiry Detection System is a data analysis project developed to monitor pharmaceutical inventory and identify expired and soon-to-expire medicines. It helps improve inventory management, reduce financial losses, and ensure safety in healthcare environments.

## Objectives

* Detect expired medicines automatically
* Identify medicines that are close to expiry
* Analyze inventory based on quantity and value
* Support better decision-making in stock management

## Technologies Used

* MySQL
* SQL (DATEDIFF, STR_TO_DATE, CASE statements)
* Data visualization tools (such as Power BI, if used)

## Core Logic

The system processes expiry data by converting it into a standard date format and comparing it with a reference date. Based on this comparison, medicines are categorized into three groups:

* Expired
* Expiring Soon (within 60 days)
* Safe

### Sample SQL Logic

```sql
CASE 
WHEN STR_TO_DATE(CONCAT('01-', expiry), '%d-%b-%y') < '2025-01-01' 
THEN 'Expired'

WHEN DATEDIFF(
    STR_TO_DATE(CONCAT('01-', expiry), '%d-%b-%y'),
    '2025-01-01'
) <= 60 
THEN 'Expiring Soon'

ELSE 'Safe'
END AS status;
```

## Features

* Inventory classification based on expiry status
* Identification of high-risk medicines
* Value-based analysis of inventory
* Query-based insights for decision-making

## Project Structure

expiry-detection-system/
│── expiry_analysis.sql
│── dashboard_screenshots/
│── README.md

## How to Run

1. Import the dataset into MySQL
2. Execute the SQL queries provided in the project
3. Review the results for expiry classification
4. Optionally, connect the data to a visualization tool for dashboards

## Use Cases

* Pharmacy inventory management
* Hospital stock monitoring
* Medical supply chain analysis

## Future Improvements

* Real-time expiry alerts
* Integration with billing or inventory systems
* Automated reporting
* Predictive analysis for demand forecasting

## Author

Deepthi Amrutha B.V

