/*Create Database*/
CREATE DATABASE [Ice-Cream Store]

/*Create Tables and Insert Data*/
USE [Ice-Cream Store]
GO

CREATE TABLE Product
(
ProductID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Title VARCHAR(50) NOT NULL,
[Description] VARCHAR(255) NOT NULL,
UnitPrice decimal(6,2) NOT NULL
)
GO
INSERT INTO Product(Title,[Description],UnitPrice)
VALUES('Ice-cream Cone', 'Ice cream dessert that typically consists of one or more scoops of ice cream topped with sauce or syrup and other toppings served in a cone', 8),
	('Ice-cream Cup', 'Ice cream dessert that typically consists of one or more scoops of ice cream topped with sauce or syrup and other toppings served in a cup',19),
	('Frozen Yogurt Cup', 'Frozen dessert made with yogurt and sometimes other dairy and non-dairy products', 27) ,
	('Ice-cream Cake', 'Cake with ice cream as the filling for a swiss roll or a layer cake',150) ,
	('Ice-Lollies', 'A confection in the form of a piece of flavoured ice or ice cream on a stick',13) ;

CREATE TABLE City
(
CityID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
CityName VARCHAR(50) NOT NULL
)
GO
INSERT INTO City(CityName)
VALUES('Pretoria'),
	  ('Cape Town'),
	  ('East London'),
	  ('Pietermaritzburg'),
	  ('Polokwane');
CREATE TABLE Supplier
(
SupplierID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
CompanyName VARCHAR(50) NOT NULL,
ContactName VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(10) NOT NULL,
CityID INT FOREIGN KEY(cityID)REFERENCES city(cityID)
)
GO
INSERT INTO Supplier(CompanyName,ContactName,PhoneNumber,CityID)
VALUES('Squeeze Mee','Philip Green','0837932923',1),
	('Wafer King','Benjamin James','0845105433',4) ,
	('Ice cream co','Walter Gonzales','0824542688',5) ,
	('Gatti Ice-cream','Wilson Riley','0859256712',1) ,
	('Polyyoak Packaging','Ashley Richardson', '0834453543',3) ,
	('Hermes Cones','Elmer Hudson','0848250397',2) ;
CREATE TABLE Ingredients
(
IngredientsID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
ProductID INT FOREIGN KEY(ProductID)REFERENCES Product(ProductID),
[Name] VARCHAR(50) NOT NULL
)
GO
INSERT INTO Ingredients(ProductID,[Name])
VALUES(1,'Ice-cream'),
(2,'Chocolate Ganache'),
(2,'Caramel Sauce'),
(4,'Whipped Cream'),
(2,'Cherries'),
(2,'Sprinkles'),
(1,'Flakes');
CREATE TABLE Employee
(
EmployeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
DateOfBirth DATE NOT NULL,
HireDate DATE NOT NULL,
PhoneNumber VARCHAR(10) NOT NULL
)
GO
INSERT INTO Employee(FirstName,LastName,DateOfBirth,HireDate,PhoneNumber)
VALUES ('Frank','Hemmings',' 1985-09-14', '2018-05-31', '0856891037'),
	   ('Christian','Lawrence', '2000-12-17','2023-02-27','0848748367'),
       ('Lauren','Jackson', '2004-11-19','2021-09-21','0839289155'),
       ('Kevin','Campbell','1999-06-26','2018-07-04','0847470096'),
       ('Gavin','Davidson','2002-05-28','2020-02-10','0829260330'),
       ('Evan','Bond', '1987-10-01','2019-06-05','0835943079'),
       ('Brian','Poole', '1993-01-12', '2022-07-20','0853568102'),
       ('Anne','Anderson', '2000-03-06','2020-12-29','0856311313'),
       ('Carolyn','Simpson', '1996-07-17','2021-11-15','0823910306'),
       ('Nicholas','Reid', '1983-04-20','2019-10-09','0857160391');
CREATE TABLE Customer
(
CustomerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
IDNumber VARCHAR(13) NOT NULL,
PhoneNumber VARCHAR(10) NOT NULL,
CityID INT FOREIGN KEY(cityID)REFERENCES City(CityID)
)
GO
INSERT INTO Customer (FirstName,LastName,IDNumber,PhoneNumber,CityID)
VALUES('Frank','Murray','8511303999088','0826362514',1),
	('Lauren','Rees','9512266883086','0851983766',3),
	('Thomas',' North','1101292502080','0841511596',5),
	('Victor','Clark','8612066831185','0858251342',1),
	('Benjamin','Ball','0612278808086','0841600157',2),
	('Gavin','Wright','6609292461086','0832031701',1),
	('Connor','Terry','9411285399085','0843122789',5),
	('Michelle','Lyman','0703259067085','0857822957',4),
	('Irene','Hudson','9803057482083','0837603756',2),
	('Gavin','Watson','9608063026182','0833780472',5),
	('Thomas',' Gray','7711057590080','0822672389',2),
	('Ruth','Anderson','0911275776084','0835322238',1),
	('Keith','Hudson','6802071661089','0853928162',4),
	('Yvonne','Paige','9505235572087','0835359750',5),
	('Wanda','North','8202215637087','0849997716',1),
	('Maxs','Morrison' ,'7812284220085','0838621892',5),
	('Adrian','Chapman', '9201316343081','0857298674',1),
	('Sam','Hughes', '0603044692185','0851700490',2),
	('Joanne','Forsyth','8110252833180','0835003263',1),
	('Jonathan','Coleman','8508221215084','0825906769',5),
	('Andrew','Lawrence','1101177761082','0843787885',3),
	('Tracey','Graham','7107187439183','0833535006',1),
	('Edward','Morgan','6404111103188','0846407348',2),
	('Molly','Thomson','0412159891180','0838081776',1),
	('Sean','Marshall','7506255937186','0856173528',5),
	('Simon','Gibson','7703183972183','0849769203',2),
	('Eric','Buckland','0308243061089','0828877759',3),
	('Dominic','Pullman','8901022237086','0847499886',1),
	('Michelle','Rutherford','0810068899089','0855310236',4),	
	('Victoria','Blake','8504168273087','0834229720',3);
CREATE TABLE Store
( 
StoreID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
StoreName VARCHAR(50) NOT NULL,
CityID INT FOREIGN KEY(cityID)REFERENCES city(CityID)
)
GO
INSERT INTO Store( StoreName, CityID)
VALUES('[Roomys Sprokie Nina Park]',1), 
	('[Roomys Sprokie Annlin]',1)	,
	('[Roomys Sprokie Clifton]',2),
	('[Roomys Sprokie Baysville]',3),
	('[Roomys Sprokie Wembley]',4) ,
	('[Roomys Sprokie Bendor]',5) ;
CREATE TABLE Orders
(
OrderID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
CustomerID INT FOREIGN KEY(CustomerID)REFERENCES Customer(CustomerID),
SupplierID INT FOREIGN KEY(SupplierID)REFERENCES Supplier(SupplierID),
StoreID INT FOREIGN KEY(StoreID)REFERENCES Store(StoreID),
OrderDate DATE NOT NULL
)
GO
INSERT INTO Orders(CustomerID,SupplierID,StoreID,OrderDate)
VALUES(1,3,1,'2023-03-10'),
	(11,4,3,'2023-03-11'),
	(26,5,5,'2023-03-14'),
	(30,6,6,'2023-03-17'),
	(17,4,1,'2023-03-18'),
	(14,3,3,'2023-03-21'),
	(16,4,4,'2023-03-22'),
	(24,1,1,'2023-03-23'),
	(12,5,2,'2023-03-24'),
	(20,1,6,'2023-03-25'),
	(17,3,1,'2023-03-27'),
	(25,4,4,'2023-03-28'),
	(12,1,3,'2023-03-29'),
	(24,5,6,'2023-03-30'),
	(16,4,3,'2023-03-31'),
	(24,1,5,'2023-04-01'),
	(6,5,1,'2023-04-03'),
	(23,2,2,'2023-04-04'),
	(5,6,6,'2023-04-05'),
	(9,3,1,'2023-04-06'),
	(24,6,3,'2023-04-07'),
	(18,2,1,'2023-04-08'),
	(27,4,5,'2023-04-10');
CREATE TABLE Product_ingredients
(
ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
ProductID INT FOREIGN KEY(ProductID)REFERENCES Product(ProductID),
IngredientsID INT FOREIGN KEY(IngredientsID)REFERENCES Ingredients(IngredientsID)
)
GO
INSERT INTO Product_Ingredients(ProductID,IngredientsID)
VALUES(1,7),
	(3,5),
	(5,3),
	(2,1),
	(4,2),
	(1,4),
	(5,7);
CREATE TABLE OrderDetails
(
O_DetailsID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
ProductID INT FOREIGN KEY(ProductID)REFERENCES Product(ProductID),
EmployeeID INT FOREIGN KEY(EmployeeID)REFERENCES Employee(EmployeeID),
Quantity INT NOT NULL
)
GO
INSERT INTO OrderDetails(ProductID,EmployeeID,Quantity)
VALUES(5,9,2),
	(4,3,5),
	(1,9,1),
	(3,6,2),
	(5,1,1),
	(2,2,4),
	(1,5,9),
	(4,7,3),
	(3,2,2),
	(1,3,4);
CREATE TABLE Payment
(
PaymentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
CustomerID INT FOREIGN KEY(CustomerID)REFERENCES Customer(CustomerID),
PaymentMethod VARCHAR(20) NOT NULL,
Amount DECIMAL(6,2) NOT NULL
)
GO
INSERT INTO Payment(CustomerID,PaymentMethod,Amount)
VALUES(25,'EFT',129),
	(3,'Credit Card',50),
	(10,'Cash',12),
	(7,'Debit Card',16),
	(4,'E-Wallet',24),
	(25,'EFT',159),
	(29,'Cash',219),
	(27,'Credit Card',31),
	(23,'EFT',80),
	(13,'Debit Card', 57),
	(19,'Cash',11),
	(27,'Debit Card',64),
	(12,'Cash',41),
	(15,'E-Wallet',73),
	(17,'Debit Card',63),
	(7,'EFT',98),
	(2,'Credit Card',75),
	(10,'Cash',54),
	(22,'EFT',107),
	(16,'Credit Card',224),
	(18,'Cash',17),
	(23,'Debit Card',90),
	(22,'Cash',17),
	(18,'Cash',20),
	(1,'Credit Card',50),
	(7,'EFT',98),
	(18,'E-Wallet',66),
	(5,'Debit Card',124),
	(27,'Debit Card',372),
	(16,'E-Wallet',180);
CREATE TABLE Promotions
(
PromotionID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
ProductID INT FOREIGN KEY(productID)REFERENCES product(ProductID),
[Name] VARCHAR(50) NOT NULL,
Discount DECIMAL(5,2) NOT NULL,
ExpiryDate DATE NOT NULL
)
GO
INSERT INTO Promotions(ProductID,[name],Discount,ExpiryDate)
VALUES(1,'Ice-cream Cone',0.20,'2023-04-30'),
	  (5,'Ice-Lollies',0.5,'2023-04-30'),
	  (2,'Ice-cream Cup',0.2,'2023-04-30'),
	  (3,'Frozen Yogurt',0.6,'2023-04-30'),
	  (4,'Ice-cream Cake',0.15,'2023-04-30');
CREATE TABLE Deliveries
(
DeliveryID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
OrderID INT  FOREIGN KEY(OrderID)REFERENCES Orders(OrderID),
ProductID INT  FOREIGN KEY(ProductID)REFERENCES Product(ProductID),
CustomerID INT  FOREIGN KEY(CustomerID)REFERENCES Customer(CustomerID),
[Date] DATE NOT NULL
)
GO
INSERT INTO Deliveries(OrderID,ProductID,CustomerID,Date)
VALUES(23,3,27,'2023/03/01'),
	(19,4,5,'2023/03/02'),
	(13,1,12,'2023/03/03'),
	(20,4,9,'2023/03/04'),
	(18,5,23,'2023/03/06'),
	(6,1,14,'2023/03/08'),
	(5,2,17,'2023/03/09'),
	(11,4,7,'2023/03/11'),
	(19,2,5,'2023/03/13'),
	(8,4,24,'2023/03/14'),
	(22,3,18,'2023/03/15'),
	(12,4,25,'2023/03/16'),
	(9,5,12,'2023/03/17'),
	(4,4,30,'2023/03/20'),
	(2,2,11,'2023/03/21'),
	(17,1,6,'2023/03/22'),
	(7,2,16,'2023/03/23'),
	(10,3,20,'2023/03/24'),
	(3,4,26,'2023/03/29'),
	(15,3,16,'2023/03/30'),
	(1,1,1,'2023/04/04'),
	(20,4,9,'2023/04/05'),
	(21,2,24,'2023/04/06');
CREATE TABLE Stock
(
StockID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Description]  VARCHAR(255) NOT NULL,
Price decimal(6,2) NOT NULL,
SupplierID INT FOREIGN KEY(SupplierID)REFERENCES Supplier(SupplierID)
)
GO
INSERT INTO Stock([Description],Price,SupplierID)
VALUES('Squeeze Mee Soft Serve Ice Cream Sachets',90,1) ,
	('Ice-cream Tubs',150,3),
	('Frozen Yogurt',9,4),
	('Cone',40,6),
	('Cups',465,5),
	('Chocolate syrup',54,2),
	('Toppings',561,2);

/*Queries*/
--show employee name, last name and age of all employees over the age of 20
SELECT FirstName,LastName, DATEDIFF(year,DateOfBirth,GETDATE()) - 1 AS Age
FROM Employee
WHERE DATEDIFF(year,DateOfBirth,GETDATE()) - 1 > 20

--show all customer details of customers who have placed orders
SELECT*
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Order.CustomerID

--show the number of orders placed by customers group by number of orders and arrange in descending order
SELECT COUNT(OrderID) AS [Number of Orders], CustomerID
FROM Orders
INNER JOIN Customer
ON Orders.CustomerID = Customer.CustomerID
GROUP BY COUNT(OrderID)
ORDER BY Desc

--show title of all products whose average price is greater than 100
SELECT Title, AVG(UnitPrice) AS [Average Price]
FROM Product
GROUP BY Title
HAVING AVG(UnitPrice)>100

--show all deliveries that were done before 1 April 2023
SELECT*
FROM Deliveries
WHERE DATE < '2023-04-01'

--find all stores have orders above 5
SELECT COUNT(OrderID) AS [Number of Orders], StoreName, CityName
FROM Store
INNER JOIN Orders
ON Store.StoreID = Orders.StoreID
INNER JOIN City
ON Store.CityID = City.CityID
GROUP BY StoreName,CityName
HAVING COUNT(OrderID) >= 5
ORDER BY COUNT(OrderID)

--using a CTE display, the average unit price for each product along with average quantity for each order
WITH Average_CTE(Title,[Average Unit Price],[Average Quantity])
AS
(
SELECT p.Title,AVG(UnitPrice) AS [Average Unit Price], AVG(Quantity) AS [Average Quantity]
FROM Product p
INNER JOIN OrderDetails od
ON  p.ProductID = od.ProductID 
GROUP BY P.Title
)

SELECT Title,[Average Unit Price],[Average Quantity]
FROM Average_CTE

--create a view for those customers whose payment method is cash and has placed an order, display their first name, last name and phone number
CREATE VIEW CustomerView
AS
SELECT FirstName, LastName,PhoneNumber
FROM Customer 
INNER JOIN Payment
ON Customer.CustomerID = Payment.CustomerID
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
WHERE PaymentMethod = 'Cash' AND Orders.CustomerID IS NOT NULL

--create a view for stock supplied by Gatti Ice-cream and whose price is below R100, display description, price and supplier id 
CREATE VIEW SupplierStockView
AS
SELECT Description, Price,Supplier.SupplierID
FROM 	Supplier 
INNER JOIN Stock
ON Supplier.SupplierID = Stock.SupplierID
WHERE CompanyName = 'Gatti Ice-cream' AND Price < 100

--Wrap any Transact-SQL statement of your choosing within a transaction. Make sure to rollback the transaction if there are any errors after the Transact-SQL statement
BEGIN TRY
BEGIN TRANSACTION
SELECT FirstName,LastName, DATEDIFF(year,DateOfBirth,GETDATE()) - 1 AS Age
FROM Employee
WHERE DATEDIFF(year,DateOfBirth,GETDATE()) - 1 > 20
COMMIT TRANSACTION
PRINT 'Transaction Completed'
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Transaction Failed'
END CATCH

/*Create Procedures*/
--A stored procedure to insert a new customer into the customers table
Use [Ice-Cream Store]
GO
CREATE PROCEDURE insert_customer(@Fname VARCHAR (50), @Lname VARCHAR (50), @contact_details VARCHAR (10), @cityID VARCHAR (50))
AS
BEGIN
  INSERT INTO Customer([firstName], lastName, [phoneNumber],CityID)
  VALUES (@Fname, @Lname, @contact_details, @cityID);
END;
GO
--A stored procedure to calculate the total sales for a given period of time
CREATE PROCEDURE calculate_total_sales(@start_date DATETIME, @end_date DATETIME)
AS
BEGIN
   SELECT SUM(p.amount)
   FROM Customer C
   INNER JOIN Payment P
   ON C.CustomerID = P.CustomerID
   INNER JOIN Orders O
   on C.CustomerID = O.CustomerID
   Where o.orderDate BETWEEN @start_date AND @end_date;
END;
GO
--A stored procedure to generate a report on the most popular products in each store location
CREATE PROCEDURE generate_popular_products_report(@city VARCHAR(50))
AS
BEGIN
  SELECT P.title as 'Name', COUNT(O.OrderID) AS total_sales
  FROM PRODUCT P 
  INNER JOIN details_prod dp
  ON P.ProductID = dp.productID
  INNER JOIN orderDetails OD
  ON OD.O_DetailsID = dp.orderDetailsID
  INNER JOIN Orders O
  ON O.OrderID = OD.O_DetailsID
  INNER JOIN Store S
  ON S.StoreID = O.StoreID
  INNER JOIN City C
  ON C.CityID = S.CityID
  WHERE C.CityName = @city
  GROUP BY p.title
  ORDER BY total_sales DESC;
END;
GO

/*Create Views*/
--A view to display customers and their orders
Use [Ice-Cream Store]
GO
CREATE VIEW customer_orders 
AS 
SELECT c.firstName, o.orderDate 
FROM Customer c
INNER JOIN Orders o
ON c.CustomerID = o.customerID;
GO
--A view to show the total of inventory in each store location
CREATE VIEW inventory_total 
AS
SELECT DISTINCT s.StoreName, I.Name, s.quantity
FROM Store s INNER JOIN stock st
ON b.ID = s.branchID 
INNER JOIN ingredients i
ON s.ingredientID = i.ID;
GO
--A view to display products, their ingredients, and suppliers
CREATE VIEW products_ingredients_suppliers
AS
SELECT DISTINCT p.title AS product_name, i.Name AS ingredient_name, s.CompanyName AS supplier_name
FROM Product p
INNER JOIN Product_ingredients ip
ON p.ProductID = ip.productID
INNER JOIN ingredients i
ON ip.IngredientsID = i.IngredientsID
INNER JOIN Deliveries d
ON p.ProductID = d.ProductID
INNER JOIN Orders O
ON O.OrderID = D.OrderID
INNER JOIN Supplier S
ON O.SupplierID = S.SupplierID;
GO

/*Create Login*/

--advanced database login to give full access to certain administrators 
CREATE LOGIN [lgnAdmin] WITH PASSWORD = 'admin';
GRANT ALL PRIVILEGES ON iceCream TO [lgnAdmin];
GO
--advanced database login to give limited access to certain customers
CREATE LOGIN [lgnEmployee] WITH PASSWORD = 'Employee';
GRANT SELECT, INSERT, UPDATE, DELETE ON iceCream TO [lgnEmployee];
GO

/*Create Function*/
--simple function to return total price of an order 

CREATE FUNCTION getTotalPrice(@quantity INT, @price DECIMAL)
RETURNS DECIMAL
BEGIN
	RETURN @quantity * @price;
END;
GO
--advanced function to calculate total discount of a product

CREATE FUNCTION getDiscount(@percentage INT, @Price DECIMAL)
RETURNS DECIMAL
BEGIN
	RETURN @percentage * @Price / 100;
END;

GO

/*Create Trigger*/
GO
--A trigger to update the customers table when a new order is placed
 
CREATE TRIGGER update_customers_trigger ON Orders
AFTER INSERT
AS
BEGIN
   UPDATE customer
   SET lastOrderDate = GETDATE()
   WHERE customer.CustomerID = (SELECT customerID FROM inserted);
END;

GO

/*Backups*/
--Full Backup
BACKUP DATABASE [Ice-creams Store]
TO DISK = 'C:\studentdatabase\Ice-Cream_Store.bak';
GO

--Differential Backup
BACKUP DATABASE [Ice-creams Store]
TO DISK = 'C:\studentdatabase\Ice-Cream_Store.bak'
WITH DIFFERENTIAL;

--Restore Database
RESTORE DATABASE [Ice-creams Store]
FROM DISK = 'C:\studentdatabase\Ice-Cream_Store.bak';