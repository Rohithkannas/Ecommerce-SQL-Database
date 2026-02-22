USE INTERNPROJECTSQL;
GO

CREATE TRIGGER LogUserInsertions
ON Users
AFTER INSERT
AS
BEGIN
INSERT INTO AuditLog (TableName, ActionType, ActorID, NewValue)
SELECT 'Users', 'INSERT', NULL, 'New user added: ' + FullName
FROM inserted;
END;
GO


CREATE TRIGGER UpdateStockAfterOrders
ON OrderItems
AFTER INSERT
AS
BEGIN
UPDATE i
SET i.StockQty = i.StockQty - ins.Quantity,
i.LastUpdated = SYSDATETIME()
FROM Inventory i
JOIN inserted ins
ON i.ProductID = ins.ProductID;
END;

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES (2, 2, 1, 65000);

