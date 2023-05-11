-- Example uses a local variable @find to retrieve contact information 
-- for all last names beginning with Man

USE AdventureWorks2019;
GO

DECLARE @find varchar(30);
SET @find = 'Man%';

SELECT p.LastName, p.FirstName, 
ph.PhoneNumber
FROM Person.Person as p
JOIN Person.PersonPhone as ph 
ON p.BusinessEntityID = ph.BusinessEntityID
WHERE LastName LIKE @find;


-- Usecase 2: USING Declare with 2 variables
--retrieves the names of Adventure Works Cycles sales representatives who are located in the North American
--sales territory and have at least $2,000,000 in sales for the year.
USE AdventureWorks2019;
GO
SET NOCOUNT ON;
GO
DECLARE @Group nvarchar, @Sales MONEY;
set @Group = 'North America';
SET @Sales = 2000000;
SET NOCOUNT OFF;
SELECT FirstName, LastName, SalesYTD
FROM Sales.vSalesPerson
WHERE TerritoryGroup = @Group and SalesYTD >= @Sales;

