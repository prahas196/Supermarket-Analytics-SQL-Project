# Supermarket-Analytics-SQL-Project
SQL-based retail sales analytics project using Microsoft SQL Server. Built a star schema to analyze sales, profit, discounts, and customer behavior. Derived insights on top products, regional trends, and profit margins using advanced SQL queries and data-driven analysis.
# Retail Sales Analytics Using SQL Server

## Project Overview
This project is an end-to-end SQL-based data analytics case study using Microsoft SQL Server.  
It focuses on analyzing global retail sales data to uncover insights about product performance, regional profitability, customer behavior, discount impact, and shipping efficiency.

A star schema data warehouse was designed to connect multiple dimension tables — Products, Categories, Customers, Regions, Orders, and Shipping Modes — to a central fact table (FactSales).  
The goal is to transform raw transactional data into actionable business insights that support decision-making and performance tracking.

---

## Schema Overview
- Fact Table:FACTSALES  
- Dimension Tables:PRODUCTDIM, CATEGORYDIM, SUBCATEGORYDIM, CUSTOMERDIM, SEGMENTDIM, ORDERDIM, SHIPMODEDIM, REGIONDIM, COUNTRYDIM, STATEDIM, CITYDIM, GEOGRAPHYDIM  

The schema supports multi-dimensional analysis such as sales by product, region, and time, as well as profitability and customer segmentation insights.

---

## Business Analysis Questions

1. Which top 10 products generated the highest total sales?  
2. Which categories contribute most to total profit?  
3. What is the average profit margin (%) by category and subcategory?  
4. Which products have low sales but high profit (potential marketing focus)?  
5. What is the sales-to-profit ratio for each category?  
6. Which products experienced losses (negative profit)?  
7. Which regions and countries generate the most revenue?  
8. Which cities have the highest average sales per order?  
9. Compare region-wise sales vs. profit — which region is most efficient?  
10. What is the average discount percentage by country or region?  

---

## Tools and Technologies
- Microsoft SQL Server  
- Transact-SQL (T-SQL)  
- SQL Server Management Studio (SSMS)  
- Star Schema Data Modeling  
- Power BI (for optional visualization)

---

## Key Insights
- Identified top-performing products and categories by total sales and profit.  
- Found regions where high discounts led to lower profitability.  
- Detected low-selling but high-profit products for targeted marketing.  
- Measured customer segment profitability and order patterns.  
- Evaluated shipping modes for cost and delivery efficiency.

---

## Key Skills Demonstrated
- SQL Query Optimization  
- Data Cleaning and Validation  
- Business Analytics and KPI Analysis  
- Star Schema Design and Implementation  
- Data Storytelling through SQL

---

## Next Steps
- Integrate this SQL analysis with Power BI for interactive dashboards.  
- Automate reports using SQL stored procedures and scheduled tasks.  
- Expand analysis with time-series and trend forecasting.

---

*This project demonstrates the use of SQL for end-to-end data analytics, from data modeling and exploration to generating insights that inform strategic business decisions.*
