USE INTERNPROJECTSQL;
GO

INSERT INTO Users (FullName, Email, Phone) VALUES
('Rohit Sharma', 'rohit@gmail.com', '9876543210'),
('Virat Kohli', 'kohli@gmail.com', '9876500001'),
('Rishabh Pant', 'pant@gmail.com', '9876500002'),
('Sachin Tendulkar', 'sachin@gmail.com', '9876500003'),
('Ranbir Kapoor', 'ranbir@gmail.com', '9876500004'),
('Ranvir Singh', 'ranveer@gmail.com', '9876500005');

INSERT INTO Roles (RoleName) VALUES
('Admin'),
('Customer'),
('Supplier');

INSERT INTO UserRoles (UserID, RoleID) VALUES
(1, 1), -- Admin
(2, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 2);

INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Electronic devices and gadgets'),
('Books', 'Educational and reference books'),
('Clothing', 'Men and women apparel');

INSERT INTO Suppliers 
(SupplierName, ContactEmail, ContactPhone, City, State, Country, PostalCode)
VALUES
('TechDistributors', 'tech@suppliers.com', '9000011111', 'Chennai', 'TN', 'India', '600082'),
('BookWorld', 'books@suppliers.com', '9000022222', 'Mumbai', 'MH', 'India', '600056'),
('FashionHub', 'fashion@suppliers.com', '9000033333', 'Hyderabad', 'TS', 'India', '600099');

INSERT INTO Products
(ProductName, CategoryID, SupplierID, Price, Description, Size, Colour, Weight, Brand)
VALUES
('Laptop', 1, 1, 65000, '15-inch laptop', '15', 'Black', 1.5, 'HP'),
('Smartphone', 1, 1, 35000, 'Android smartphone', '6.5', 'Blue', 0.18, 'Samsung'),
('SQL Guide Book', 2, 2, 800, 'Beginner SQL book', NULL, NULL, NULL, 'OReilly'),
('T-Shirt', 3, 3, 1200, 'Cotton T-shirt', 'L', 'White', 0.25, 'Puma'),
('Jeans', 3, 3, 2200, 'Slim fit jeans', '32', 'Blue', 0.75, 'Levis');

INSERT INTO Inventory (ProductID, StockQty) VALUES
(1, 20),
(2, 30),
(3, 50),
(4, 40),
(5, 25);

INSERT INTO Orders (UserID, OrderStatus) VALUES
(2, 'PLACED'),
(3, 'PLACED'),
(4, 'SHIPPED'),
(5, 'PAID'),
(6, 'PLACED');

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 65000),
(1, 3, 2, 800),
(2, 2, 1, 35000),
(3, 4, 3, 1200),
(4, 5, 1, 2200);

INSERT INTO Payments (OrderID, Amount, PaymentMethod, PaymentStatus) VALUES
(1, 66600, 'UPI', 'SUCCESS'),
(2, 35000, 'CARD', 'SUCCESS'),
(3, 3600, 'CASH', 'SUCCESS'),
(4, 2200, 'UPI', 'SUCCESS');

INSERT INTO Reviews (UserID, ProductID, OrderID, Rating, Comment) VALUES
(2, 1, 1, 5, 'Excellent laptop'),
(3, 2, 2, 4, 'Good phone for the price'),
(4, 3, 1, 5, 'Very helpful book'),
(5, 4, 3, 3, 'Quality is okay'),
(6, 5, 4, 4, 'Comfortable jeans');

INSERT INTO AuditLog (TableName, ActionType, ActorID, NewValue) VALUES
('Users', 'INSERT', 1, 'User Rohith added'),
('Orders', 'INSERT', 2, 'Order placed'),
('Payments', 'INSERT', 2, 'Payment successful'),
('Inventory', 'UPDATE', 1, 'Stock reduced'),
('Reviews', 'INSERT', 3, 'Review added');

SELECT * FROM Users;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Payments;
SELECT * FROM Reviews;
SELECT * FROM Inventory;