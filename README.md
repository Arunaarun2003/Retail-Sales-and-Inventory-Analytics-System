Retail Sales & Inventory Analytics System (MySQL)
Project Overview
The Retail Sales & Inventory Analytics System is a database-driven analytics project built entirely using MySQL.
It helps retail businesses store, manage, and analyze sales and inventory data using SQL queries, views, and reports.
This project focuses on data modeling, SQL analytics, and business insights without using any programming language or BI tools.

Objectives
Design a structured retail database using MySQL
Store sales and inventory data efficiently
Analyze sales performance using SQL queries
Track inventory levels and stock movement
Generate business insights using SQL reports

Technology Used
Database: MySQL
Query Language: SQL
Tool: MySQL Workbench

Database Schema
Tables Used
customers
products
categories
sales
inventory
Suppliers

Database Structure
Retail_Sales_Inventory_DB
│
├── customers
├── categories
├── products
├── suppliers
├── inventory
└── sales

📋 Table Design
📁 customers
Column	Type
customer_id	INT (PK)
customer_name	VARCHAR(100)
city	VARCHAR(50)
📁 categories
Column	Type
category_id	INT (PK)
category_name	VARCHAR(50)
📁 products
Column	Type
product_id	INT (PK)
product_name	VARCHAR(100)
category_id	INT (FK)
price	DECIMAL(10,2)
📁 suppliers
Column	Type
supplier_id	INT (PK)
supplier_name	VARCHAR(100)
contact	VARCHAR(50)
📁 inventory
Column	Type
inventory_id	INT (PK)
product_id	INT (FK)
stock_quantity	INT
reorder_level	INT
📁 sales
Column	Type
sale_id	INT (PK)
product_id	INT (FK)
customer_id	INT (FK)
quantity	INT
sale_date	DATE
total_amount	DECIMAL(10,2)

🔗 Relationships
products.category_id → categories.category_id
inventory.product_id → products.product_id
sales.product_id → products.product_id
sales.customer_id → customers.customer_id

Key Performance Indicators (KPIs)
Total Revenue
Monthly Sales Growth
Top 5 Products
Inventory Stock Status
Reorder Level Alerts

Inventory Management Logic
Stock is reduced after each sale
Reorder alerts generated using SQL queries
Inventory status tracked using JOIN operations

Future Enhancements
Stored procedures for sales entry
Triggers to auto-update inventory
Views for reports
User roles & access control
