-- Using SELECT with simple CASE expression

USE AdventureWorks2012;
GO

SELECT [ProductNumber], Category =
CASE ProductLine
WHEN 'R' THEN 'Road'
WHEN 'M' THEN 'Mountain'
WHEN 'T' THEN 'Touring'
WHEN 'S' THEN 'Other sale items'
ELSE 'Not for sale'
END,
Name

FROM [Production].[Product]
order by [ProductNumber];
GO

-- Using SELECT with a searched CASE expression

SELECT [ProductNumber], [Name], ListPrice, "Price Range" = 
CASE
WHEN ListPrice = 0 THEN 'Mfg item - not for resale'
WHEN ListPrice < 50 THEN 'Under $50'
WHEN ListPrice >=50 and ListPrice < 250 THEN 'Under $250'
WHEN ListPrice >=250 and ListPrice <1000 THEN 'Under $1000'
ELSE 'Over $1000'
END
FROM Production.Product
ORDER BY ProductNumber;
GO

-- Using CASE in an ORDER BY clause  - Employees that have SalariedFlag set to 0 are returned
-- in order by the BusinessEntityID in ascending order

SELECT [BusinessEntityID], [SalariedFlag]
FROM [HumanResources].[Employee]
ORDER BY CASE SalariedFlag WHEN 1 THEN BusinessEntityID END DESC
, CASE WHEN SalariedFlag = 0 THEN BusinessEntityID END;
GO

-- Result set is ordered by column TerritoryName when the column CountryRegionName
-- equal to 'United States' and by CountryRegionName for all other rows

SELECT [BusinessEntityID], [LastName], [TerritoryName], [CountryRegionName]
FROM [Sales].[vSalesPerson]
WHERE TerritoryName IS NOT NULL
ORDER BY CASE CountryRegionName WHEN 'United States' THEN TerritoryName
ELSE CountryRegionName END;

-- Using CASE in UPDATE statement
UPDATE [HumanResources].[Employee]
SET VacationHours =
(CASE 
    WHEN(([VacationHours] - 10.00)<0) THEN VacationHours + 40
	ELSE (VacationHours + 20.00)
	END
	)
OUTPUT Deleted.BusinessEntityID, Deleted.VacationHours AS BeforeValue,
Inserted.VacationHours AS AfterValue
WHERE SalariedFlag = 0;


