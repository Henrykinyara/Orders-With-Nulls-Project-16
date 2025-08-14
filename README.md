# End-to-End BI Project – Orders Data with Nulls

##  Project Overview
This project demonstrates an **end-to-end Business Intelligence (BI) pipeline** using the **Order-With_Nulls** Excel dataset.  
The workflow includes:
- Loading the Excel file into a SQL Server database 
- Creating a table `Orders_with_nulls`
- Creating a view `vw_orders` and a stored procedure `sp_orders`
- Using both to load data into a Power BI data model
- Designing Power BI reports for business insights

---

## Dataset Description
The dataset  contains order data with missing (`NULL`) values.  
**Example fields include**:
- OrderID  
- CustomerName  
- ProductName  
- OrderDate  
- Quantity  
- Price  
- Region  

---

##  ETL Process
1. **Extract**  
   - Source: `Order-With_Nulls.xlsx`
   - Location: Provided as project input

2. **Transform**  
   - Handle NULL values (replace, drop, or impute as needed)  
   - Standardize date formats, text casing, and numerical precision  
   - Validate data for duplicates or inconsistencies

3. **Load**  
   - Load cleaned data into SQL Server table `Orders_with_nulls`

---

## 🗄 Database Objects
- **Table:** `Orders_with_nulls` – Raw/Cleaned order data  
- **View:** `vw_orders` – Clean curated view for reporting  
- **Stored Procedure:** `sp_orders` – Retrieves aggregated/filterable data

** SQL Structures:**
```sql
CREATE TABLE Orders_with_nulls (
    OrderID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    ProductName NVARCHAR(100),
    OrderDate DATE,
    Quantity INT,
    Price DECIMAL(10,2),
    Region NVARCHAR(50)
);

CREATE VIEW vw_orders AS
SELECT OrderID, CustomerName, ProductName, OrderDate, Quantity, Price, Region
FROM Orders_with_nulls;


CREATE PROCEDURE sp_orders
AS
BEGIN
    SELECT * FROM vw_orders;
END;
