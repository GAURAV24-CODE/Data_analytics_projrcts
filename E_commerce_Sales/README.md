# 🛒 E-Commerce Sales & Customer Analytics

An end-to-end **PostgreSQL SQL analytics project** that analyzes e-commerce sales, customers, products, orders, payments, revenue trends, and customer behavior.

The project is designed to demonstrate practical SQL skills used by Data Analysts and Business Analysts to answer real-world business questions.

---

## 📌 Project Overview

E-commerce businesses generate large amounts of transactional data. The goal of this project is to transform that raw transactional data into useful business insights using PostgreSQL.

This project covers:

- Database design
- Relational data modeling
- Data insertion
- Data quality validation
- Business KPI analysis
- Customer analytics
- Product and category analysis
- Revenue trend analysis
- Advanced SQL analytics
- Window functions
- Customer segmentation

---

## 🎯 Business Objectives

The analysis focuses on answering questions such as:

1. What is the total revenue generated?
2. What is the total number of orders?
3. What is the Average Order Value (AOV)?
4. Which products generate the highest revenue?
5. Which categories perform best?
6. Who are the highest-value customers?
7. Which customers make repeat purchases?
8. What is the Customer Lifetime Value (CLV)?
9. How does revenue change month over month?
10. Which products rank highest within their categories?
11. What is the running cumulative revenue?
12. How can customers be segmented based on purchasing behavior?
13. Are orders and payments properly reconciled?
14. Are there duplicate, invalid, or inconsistent records?

---

## 🛠️ Tech Stack

- **PostgreSQL**
- **SQL**
- **pgAdmin 4**
- Git & GitHub

---

## 🗂️ Database Schema

The project uses six related tables:

```text
                    ┌──────────────┐
                    │  categories  │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   products   │
                    └──────┬───────┘
                           │
                           ▼
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  customers   │────▶│    orders    │────▶│ order_items  │
└──────────────┘     └──────┬───────┘     └──────┬───────┘
                             │                    │
                             ▼                    │
                       ┌──────────────┐           │
                       │   payments   │           │
                       └──────────────┘           │
                                                  │
                                                  ▼
                                             ┌──────────┐
                                             │ products │
                                             └──────────┘
```

### Tables

| Table | Purpose |
|---|---|
| `categories` | Stores product categories |
| `products` | Stores product information |
| `customers` | Stores customer information |
| `orders` | Stores order-level information |
| `order_items` | Stores products included in each order |
| `payments` | Stores payment information |

Primary keys and foreign keys are used to maintain relationships between tables.

---

## 📁 Project Structure

```text
E-Commerce-Sales-Analysis/
│
├── SQL/
│   ├── create_tables01.sql
│   ├── insert_product.sql
│   ├── insert_customers.sql
│   ├── insert_order.sql
│   ├── orders.sql
│   ├── payments_insert.sql
│   ├── business_analysis.sql
│   ├── advanced_analysis.sql
│   └── data_quality.sql
│
├── Screenshots/
│   ├── SQL query/result screenshots
│   └── Database analysis screenshots
│
├── README.md
└── requirements.txt
```

---

## 📊 Key Analysis Areas

### 1. Sales Performance

The project calculates important business KPIs such as:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue by month
- Revenue by category
- Revenue by product

### 2. Product Analysis

The project identifies:

- Top-selling products
- Highest-revenue products
- Product rankings
- Category-level product performance

### 3. Customer Analysis

Customer analytics includes:

- Total spending by customer
- Order frequency
- Repeat customers
- Customer Lifetime Value
- Customer segmentation

### 4. Time-Based Analysis

SQL date functions and window functions are used to analyze:

- Monthly revenue
- Month-over-Month revenue growth
- Cumulative revenue

### 5. Advanced SQL Analytics

The project demonstrates:

- `JOIN`
- `GROUP BY`
- `HAVING`
- `CASE WHEN`
- `CTE`
- `LAG()`
- `RANK()`
- Window functions
- Aggregate functions
- Date functions
- Subqueries

---

## 🧠 SQL Skills Demonstrated

### Basic SQL

```sql
SELECT
FROM
WHERE
ORDER BY
DISTINCT
```

### Aggregations

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
```

### Joins

```sql
INNER JOIN
LEFT JOIN
```

### Conditional Logic

```sql
CASE
    WHEN ...
    THEN ...
    ELSE ...
END
```

### Common Table Expressions

```sql
WITH customer_sales AS (
    SELECT ...
)
SELECT *
FROM customer_sales;
```

### Window Functions

Examples include:

```sql
LAG()
RANK()
SUM() OVER()
```

These are used for trend analysis, ranking, and cumulative calculations.

---

## 📈 Example Business Questions

### Total Revenue

```sql
SELECT SUM(total_amount) AS total_revenue
FROM orders;
```

### Average Order Value

```sql
SELECT AVG(total_amount) AS average_order_value
FROM orders;
```

### Revenue by Month

```sql
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY 1
ORDER BY 1;
```

### Customer Segmentation

Customers can be classified using purchasing behavior, for example:

```text
High Value
Medium Value
Low Value
```

using SQL `CASE` logic.

---

## 🔍 Data Quality Checks

A separate SQL script is included for validating the dataset.

Checks include:

- Duplicate records
- Missing values
- Invalid relationships
- Order/payment consistency
- Referential integrity
- Unexpected values

This ensures the analysis is based on reliable data.

---

## 🚀 How to Run the Project

### Step 1 — Install PostgreSQL

Install PostgreSQL and open **pgAdmin 4**.

### Step 2 — Create a Database

Create a database such as:

```text
ecommerce_sales
```

### Step 3 — Create Tables

Run:

```text
SQL/create_tables01.sql
```

### Step 4 — Insert Data

Run the insertion scripts:

```text
SQL/insert_product.sql
SQL/insert_customers.sql
SQL/insert_order.sql
SQL/orders.sql
SQL/payments_insert.sql
```

### Step 5 — Run Data Quality Checks

Run:

```text
SQL/data_quality.sql
```

### Step 6 — Run Business Analysis

Run:

```text
SQL/business_analysis.sql
```

### Step 7 — Run Advanced Analysis

Run:

```text
SQL/advanced_analysis.sql
```

---

## 💡 Business Insights

The project is structured to help a business understand:

- Overall sales performance
- Revenue trends
- Best-performing products
- Best-performing categories
- High-value customers
- Customer retention behavior
- Repeat purchasing behavior
- Revenue growth
- Customer value
- Payment consistency

These insights can support decisions related to:

- Marketing
- Product strategy
- Customer retention
- Revenue growth
- Inventory planning
- Customer segmentation

---

## 📸 Screenshots

The `Screenshots` folder contains query outputs and database analysis results from PostgreSQL/pgAdmin.

These screenshots provide evidence of the SQL analysis performed in the project.

---

## 🎓 What I Learned

Through this project, I strengthened my ability to:

- Design relational databases
- Write business-oriented SQL queries
- Work with multiple related tables
- Use joins effectively
- Perform data-quality checks
- Analyze customer behavior
- Calculate business KPIs
- Use SQL window functions
- Perform time-series revenue analysis
- Convert raw transactional data into business insights

---

## 🔮 Future Improvements

Possible future extensions:

- Build an interactive **Power BI dashboard**
- Add more realistic transaction data
- Perform cohort analysis
- Add customer retention analysis
- Build RFM customer segmentation
- Automate data loading
- Connect PostgreSQL directly to Power BI
- Add Python-based exploratory data analysis

---

## 👨‍💻 Author

**Gaurav Eknath Kumbhar**

Aspiring Data Analyst | AI/ML Engineer | MCA Student

Skills: Python • SQL • PostgreSQL • Pandas • Excel • Power BI • Machine Learning

---

## ⭐ Project Purpose

This project was created as part of my journey toward becoming a professional **Data Analyst / AI-ML Engineer**, with a focus on developing practical SQL and business analytics skills.

If you find this project useful, consider giving the repository a ⭐.
