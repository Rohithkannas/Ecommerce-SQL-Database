USE INTERNPROJECTSQL;
GO

/* Stored Procedures - Adding users */
CREATE PROCEDURE AddUser
   @FullName NVARCHAR(100),
   @Email NVARCHAR(100),
   @Phone NVARCHAR(15)
   AS
   BEGIN
   INSERT INTO Users (FullName, Email, Phone)
   VALUES (@FullName, @Email, @Phone);
   END;
GO

EXEC AddUser @FullName = 'Chris Gayle',
@Email = 'Gayle@gmail.com',
@Phone = '9876516775';

/* Stored Procedures - Fetch users*/
CREATE OR ALTER PROCEDURE GetUserByID
   @UserID INT
   AS
   BEGIN
   SET NOCOUNT ON;
   SELECT * FROM Users
   WHERE UserID = @UserID;
   END;
GO

EXEC GetUserByID 2;

/* Stored Procedure - Add Orders*/
CREATE OR ALTER PROCEDURE AddOrder
@UserID INT
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Orders (UserID, OrderStatus)
VALUES (@UserID, 'PLACED');
END;
GO

EXEC AddOrder 2;

/* Stored Procedures - Search Products*/
CREATE OR ALTER PROCEDURE SearchProducts
@Keyword NVARCHAR(100)
AS
BEGIN
SELECT ProductID, ProductName, Price
FROM Products
WHERE ProductName LIKE '%' + @Keyword + '%';
END;
GO

EXEC SearchProducts @Keyword = ' Guide';

