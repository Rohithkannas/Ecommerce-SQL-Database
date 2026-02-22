USE INTERNPROJECTSQL;
GO

CREATE VIEW SalesSummary
AS
SELECT p.ProductID, p.ProductName,
   SUM(oi.Quantity) AS TotalUnitsSold,
   SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
   FROM Products p
   JOIN OrderItems oi
   ON p.ProductID = oi.ProductID
   GROUP BY p.ProductID, p.ProductName;
   GO

SELECT * FROM SalesSummary ORDER BY TotalRevenue DESC;

CREATE OR ALTER VIEW CustomerOrderOverview
AS
SELECT
    o.OrderID,
    u.UserID,
    u.FullName,
    u.Email,
    o.OrderDate,
    o.OrderStatus,
    SUM(oi.Quantity) AS TotalItems,
    SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
FROM Orders o
JOIN Users u
    ON o.UserID = u.UserID
LEFT JOIN OrderItems oi
    ON o.OrderID = oi.OrderID
GROUP BY
    o.OrderID,
    u.UserID,
    u.FullName,
    u.Email,
    o.OrderDate,
    o.OrderStatus;
GO

SELECT *
FROM CustomerOrderOverview
ORDER BY OrderTotal DESC;

EXEC sp_help OrderItems;

CREATE VIEW ProductPerformanceView
AS
SELECT
    p.ProductID,
    p.ProductName,
    p.Brand,
    c.CategoryName,
    s.SupplierName,
    ISNULL(SUM(oi.Quantity), 0) AS UnitsSold,
    ISNULL(SUM(oi.Quantity * oi.UnitPrice), 0) AS RevenueGenerated,
    i.StockQty AS CurrentStock
FROM Products p
LEFT JOIN OrderItems oi
    ON p.ProductID = oi.ProductID
LEFT JOIN Inventory i
    ON p.ProductID = i.ProductID
LEFT JOIN Categories c
    ON p.CategoryID = c.CategoryID
LEFT JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Brand,
    c.CategoryName,
    s.SupplierName,
    i.StockQty;
GO

SELECT *
FROM ProductPerformanceView
ORDER BY RevenueGenerated DESC;
