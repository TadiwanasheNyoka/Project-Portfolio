--Tadiwanashe Nyoka 577633
--Question 1
USE AdventureWorks2019
SELECT HumanResources.Employee.BusinessEntityID , NationalIDNumber, FirstName, LastName,HumanResources.Department.Name AS Department,JobTitle
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN HumanResources.Employee
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID
WHERE OrganizationLevel = 1 AND EndDate IS NULL
ORDER BY HumanResources.Employee.BusinessEntityID

--Question 2
USE AdventureWorks2019;
WITH Purchase_CTE(ShipMethodID,Name,TotalPurchases)
AS
(

SELECT ps.ShipMethodID,ps.Name, ROUND(SUM(TotalDue),2) AS TotalPurchases
FROM  Purchasing.ShipMethod ps
LEFT JOIN Purchasing.PurchaseOrderHeader p 
ON  ps.ShipMethodID = p.ShipMethodID 
GROUP BY ps.ShipMethodID, ps.Name
),

Sales_CTE(ShipMethodID ,Name,TotalSales)
AS
(
SELECT ps.ShipMethodID, ps.Name,ROUND(SUM(TotalDue),2) AS TotalSales
FROM  Purchasing.ShipMethod ps
LEFT JOIN sales.SalesOrderHeader s
ON ps.ShipMethodID = s.ShipMethodID 
GROUP BY  ps.ShipMethodID, ps.Name
)

SELECT pc.ShipMethodID,pc.Name,TotalSales,TotalPurchases
FROM Purchase_CTE pc
INNER JOIN Sales_CTE sc
ON pc.ShipMethodID = sc.ShipMethodID
ORDER BY pc.Name

--Question 3
USE AdventureWorks2019
SELECT Title, FirstName,LastName,
CASE
WHEN PersonType = 'SC' THEN 'Store Contact'
WHEN PersonType = 'IN' THEN 'Individual Customer'
WHEN PersonType = 'SP' THEN 'Sales Person'
WHEN PersonType = 'EM' THEN 'Employee'
WHEN PersonType = 'VC' THEN 'Vendor Contact'
WHEN PersonType = 'CG' THEN 'General Contact'
END AS 'Person Type'
FROM Person.Person

--Question 4
USE AdventureWorks2019
GO
DECLARE
@ProductNumber NVARCHAR(25),
@Name NVARCHAR(50),
@StartDate DATE,
@EndDate DATE,
@Description NVARCHAR(255);

DECLARE cursor_product CURSOR
FOR SELECT
  ProductNumber, Name, StartDate, EndDate, Description
FROM Sales.SpecialOfferProduct
INNER JOIN Production.Product
ON Sales.SpecialOfferProduct.ProductID = Production.Product.ProductID
INNER JOIN Sales.SpecialOffer
ON Sales.SpecialOfferProduct.SpecialOfferID = Sales.SpecialOffer.SpecialOfferID
WHERE Sales.SpecialOfferProduct.ProductID = 707


OPEN cursor_product;
FETCH NEXT FROM cursor_product INTO
@ProductNumber,
@Name,
@StartDate,
@EndDate,
@Description;
PRINT 'Product Number: ' + @ProductNumber;
PRINT 'Name: ' + @Name ;
PRINT 'Special Offer: '

WHILE @@FETCH_STATUS = 0
BEGIN

PRINT Cast(@StartDate AS VARCHAR) + ' ' + 'to' + ' ' + Cast(@EndDate AS VARCHAR) + ' ' + @Description 
  
FETCH NEXT FROM cursor_product 
INTO @ProductNumber, @Name, @StartDate, @EndDate, @Description
END
CLOSE cursor_product;
DEALLOCATE cursor_product;

--Question 5
USE AdventureWorks2019
GO
CREATE VIEW [vwStoreSales]
AS
SELECT Sales.SalesOrderHeader.CustomerID, Name AS [Store Name], Year(OrderDate) AS Year,ROUND(SUM(TotalDue),2) AS YearSales
FROM Sales.SalesOrderHeader 
INNER JOIN Sales.Store
ON Sales.SalesOrderHeader.SalesPersonID = Sales.Store.SalesPersonID
INNER JOIN Sales.Customer
ON Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
GROUP BY Sales.SalesOrderHeader.CustomerID, Name,Year(OrderDate)
HAVING ROUND(SUM(TotalDue),2) > 100000

GO
SELECT*
FROM [vwStoreSales]
ORDER BY CustomerID Asc, Year Desc;