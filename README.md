# 💳 Fraud Detection Analysis (SQL + Power BI)

## 📌 Overview
This project focuses on analyzing transaction data to identify fraud patterns using SQL and Power BI. The goal is to uncover key insights such as high-risk categories, customer behavior, and transaction trends.

---

## 🛠️ Tools & Technologies
- SQL Server (SSMS)
- Power BI
- DAX
- Power Query

---

## 📊 Dataset Features
The dataset contains transaction-level data with the following columns:

- Step (time sequence)
- Customer ID
- Age (categorical groups)
- Gender
- Merchant
- Category
- Transaction Amount
- Fraud (0 = Normal, 1 = Fraud)
- Customer & Merchant Zipcodes

---

## 📈 Key KPIs
- Total Transactions: 594K+
- Total Fraud Transactions: 7,200
- Fraud Rate: 1.21%
- Total Transaction Amount: $22.53M

---

## 🔍 Key Insights

- 📌 Fraud rate is relatively low (~1.21%) but significant in volume
- 🛍️ Highest fraud observed in categories like:
  - `es_leisure`
  - `es_travel`
  - `es_sportsandtoys`
- 👩 Female customers account for ~66% of fraud cases
- 💰 Most fraud transactions occur in **low amount ranges**
- 🧓 Adult and senior age groups are more affected
- 🌍 Majority of fraud occurs when **customer and merchant locations match**

---

## 📊 Dashboard Features

### 1. KPI Cards
- Total Transactions
- Fraud Transactions
- Fraud Rate %
- Total Transaction Amount

### 2. Visual Analysis
- Fraud by Category (Fraud %)
- Fraud by Amount Range
- Top Fraud Merchants
- Victims by Gender
- Fraud by Location (Match vs Mismatch)
- Victims by Age Group

---

## 🧠 Data Processing

- Cleaned dataset using **Power Query**
- Removed unwanted characters (e.g., quotes)
- Converted data types for analysis
- Created calculated columns:
  - Age Group Mapping
  - Amount Range Classification
  - Location Mismatch Indicator

---

## 📐 DAX Measures Used

```DAX
Total Transactions = COUNTROWS(bs140513_032310)

Total Fraud = SUM(bs140513_032310[fraud])

Fraud Rate % = 
DIVIDE([Total Fraud], [Total Transactions], 0) * 100
