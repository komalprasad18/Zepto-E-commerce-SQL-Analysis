# 🛒 Zepto E-commerce SQL Analysis Project

This is a complete, real-world **SQL Data Analyst portfolio project** based on an e-commerce inventory dataset scraped from **Zepto** — one of India’s fastest-growing quick-commerce startups.  
The project simulates **real analyst workflows**, from raw data ingestion to business-focused analysis using SQL Server.

---

## 📌 Project Overview

The goal of this project is to simulate how data analysts in **e-commerce and retail** use SQL to:

- ✅ Set up a messy, real-world e-commerce inventory database  
- ✅ Perform **Exploratory Data Analysis (EDA)** to understand categories, stock, and pricing  
- ✅ Apply **Data Cleaning** to handle nulls, invalid values, and currency inconsistencies  
- ✅ Write **business-driven SQL queries** to derive insights on pricing, discounts, inventory, and revenue  

---

## 📁 Dataset Overview

- **Source:** Kaggle (scraped from Zepto’s official product listings)
- **Granularity:** SKU-level (Stock Keeping Unit)

This dataset closely resembles a **real e-commerce catalog**, where:
- The same product can appear multiple times
- Variations exist due to different weights, package sizes, discounts, or categories

---

## 🧾 Dataset Columns

| Column Name | Description |
|------------|------------|
| `sku_id` | Unique identifier for each SKU (Synthetic Primary Key) |
| `name` | Product name as displayed on the app |
| `category` | Product category (Fruits, Snacks, Beverages, etc.) |
| `mrp` | Maximum Retail Price (originally in paise, converted to ₹) |
| `discountPercent` | Discount percentage applied on MRP |
| `discountedSellingPrice` | Final selling price after discount (₹) |
| `availableQuantity` | Units available in inventory |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Boolean flag indicating stock availability |
| `quantity` | Number of units per package |

---

## 🔧 Project Workflow

### 1️⃣ Database & Table Creation

A structured table was created in **SQL Server** with appropriate data types


---

## 2️⃣ Data Import

- Imported CSV data using **SQL Server Import Wizard / BULK INSERT**
- Verified row counts to ensure **successful data ingestion**
- Ensured correct:
  - Delimiter (`,` for CSV)
  - Encoding (UTF-8)
  - Column-to-schema mapping to avoid data type mismatches

---

## 3️⃣ 🔍 Exploratory Data Analysis (EDA)

Performed EDA to understand the **structure, consistency, and quality** of the dataset:

- Counted total records in the table
- Previewed sample rows to validate schema and values
- Audited **NULL and zero values** across numeric columns
- Identified **distinct product categories**
- Compared **in-stock vs out-of-stock** SKUs
- Detected **duplicate product names** representing multiple SKUs (different weights, prices, or discounts)

---

## 4️⃣ 🧹 Data Cleaning

- Removed rows with **invalid pricing**:
  - `MRP = 0`
  - `discountedSellingPrice = 0`
  - NULL pricing values
- Converted prices from **paise to rupees** for consistency and business readability
- Validated **realistic price ranges** after conversion
- Ensured a **clean, analysis-ready dataset**

---

## 5️⃣ 📊 Business Insights

Using **business-driven SQL queries**, the following insights were derived:

- Top 10 **best-value products** based on discount percentage
- **High-MRP products** currently out of stock (potential revenue leakage)
- Estimated **potential revenue by product category**
- Expensive products (`MRP > ₹500`) with **minimal discounts**
- Top 5 categories offering the **highest average discounts**
- **Price-per-gram analysis** to identify value-for-money products
- Product grouping by weight:
  - Low
  - Medium
  - Bulk
- Total **inventory weight per category** for logistics and supply-chain insights

---
## 🧠 Skills Demonstrated

- **SQL Server (T-SQL)**
- **Data Cleaning & Validation**
- **Exploratory Data Analysis (EDA)**
- **Business Insight Generation**
- **Real-world E-commerce Data Modeling**

---

## 📌 Future Enhancements

- **Power BI / Tableau dashboards** for visual analytics
- **Advanced SQL techniques** (CTEs, Window Functions)
- **Automated data quality checks**
- **Category-level KPI reporting**

---
