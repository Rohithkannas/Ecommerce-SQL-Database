# 🛒 E-Commerce Database Management System

A fully normalized relational database system built using **Microsoft SQL Server (T-SQL)**, simulating the backend data infrastructure of an e-commerce platform. This project covers end-to-end database design including schema creation, data insertion, stored procedures, triggers, views, and role-based access control.

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `Creation.sql` | Database creation and recovery configuration |
| `Schemas.sql` | Table definitions with constraints and relationships |
| `Insert_Data.sql` | Sample data population for all tables |
| `Views.sql` | Aggregate views for reporting and analytics |
| `Stored_Procedures.sql` | Reusable procedures for user and order management |
| `Triggers.sql` | Automated triggers for inventory and audit logging |
| `Securities.sql` | Role-based access control (RBAC) configuration |
| `SQLQuery8.sql` | Server configuration and connection diagnostics |

---

## 🗄️ Database Schema

The database consists of **11 relational tables** organized around the core e-commerce entities:

```
Users ──< UserRoles >── Roles
Users ──< Orders ──< OrderItems >── Products ──< Categories
                                               └── Suppliers
Orders ──< Payments
Products ──< Inventory
Users ──< Reviews >── Products
AuditLog
```

### Tables Overview

| Table | Purpose |
|-------|---------|
| `Users` | Stores customer and admin profiles |
| `Roles` | Defines system roles (Admin, Customer, Supplier) |
| `UserRoles` | Many-to-many mapping of users to roles |
| `Categories` | Product category classification |
| `Suppliers` | Supplier contact and location details |
| `Products` | Product catalog with pricing and metadata |
| `Inventory` | Real-time stock quantity per product |
| `Orders` | Order records with status tracking |
| `OrderItems` | Line items linking orders to products |
| `Payments` | Payment records per order |
| `Reviews` | User ratings and comments per product |
| `AuditLog` | System-wide action audit trail |

---

## ⚙️ Features

### ✅ Data Modeling & Normalization
- Fully normalized schema (3NF) with clearly defined primary keys, foreign keys, and unique constraints
- CHECK constraints on critical fields like `OrderStatus`, `PaymentStatus`, and `Rating`
- `IDENTITY` columns for auto-incrementing primary keys across all major tables

### ✅ Stored Procedures
- **`AddUser`** — Inserts a new user into the system
- **`GetUserByID`** — Fetches a user record by ID
- **`AddOrder`** — Creates a new order for a given user
- **`SearchProducts`** — Keyword-based product search using `LIKE`

### ✅ Triggers
- **`LogUserInsertions`** — Automatically logs every new user insert into `AuditLog`
- **`UpdateStockAfterOrders`** — Deducts stock from `Inventory` in real time after an order item is inserted

### ✅ Views
- **`SalesSummary`** — Aggregates total units sold and revenue per product
- **`CustomerOrderOverview`** — Provides a full order summary per customer including totals and status
- **`ProductPerformanceView`** — Combines product, category, supplier, sales, and stock data for performance analysis

### ✅ Role-Based Access Control (RBAC)
- `db_reader` role — Granted SELECT access on Users, Products, Orders, and SalesSummary
- `db_writer` role — Granted INSERT/UPDATE access on Orders, OrderItems, and Payments

### ✅ Audit Logging
- Every significant action (INSERT, UPDATE) is tracked in the `AuditLog` table with the actor, table name, action type, and timestamp

---

## 🚀 Getting Started

### Prerequisites
- Microsoft SQL Server (2019 or later recommended)
- SQL Server Management Studio (SSMS)

### Setup Instructions

1. **Create the database**
   ```sql
   -- Run Creation.sql
   CREATE DATABASE INTERNPROJECTSQL;
   ```

2. **Create the schema**
   ```sql
   -- Run Schemas.sql
   -- Creates all 11 tables with constraints and relationships
   ```

3. **Insert sample data**
   ```sql
   -- Run Insert_Data.sql
   -- Populates all tables with realistic test data
   ```

4. **Create views**
   ```sql
   -- Run Views.sql
   ```

5. **Create stored procedures**
   ```sql
   -- Run Stored_Procedures.sql
   ```

6. **Create triggers**
   ```sql
   -- Run Triggers.sql
   ```

7. **Apply security roles**
   ```sql
   -- Run Securities.sql
   ```

> Run the files in the order listed above to avoid foreign key dependency errors.

---

## 📊 Sample Queries

```sql
-- View sales performance ranked by revenue
SELECT * FROM SalesSummary ORDER BY TotalRevenue DESC;

-- View all customer orders with totals
SELECT * FROM CustomerOrderOverview ORDER BY OrderTotal DESC;

-- View product performance across categories
SELECT * FROM ProductPerformanceView ORDER BY RevenueGenerated DESC;

-- Search for a product
EXEC SearchProducts @Keyword = 'Laptop';

-- Add a new user
EXEC AddUser @FullName = 'John Doe', @Email = 'john@gmail.com', @Phone = '9876512345';
```

---

## 🧱 Tech Stack

| Layer | Technology |
|-------|------------|
| Language | T-SQL |
| Database | Microsoft SQL Server (MSSQL) |
| Tool | SQL Server Management Studio (SSMS) |
| Concepts | Relational DB Design, Normalization, DDL, DML, RBAC, Triggers, Stored Procedures, Views, Audit Logging |

---

## 👤 Author

Developed as part of an internship project to demonstrate practical skills in database design, data modeling, and SQL Server development.
