--Window Functions: ROWNUMBER, RANK and DENSE_RANK
-- Rank Number for rows

--1)Use of ROW_NUMBER() -- Ranking function

-- Disadvantage is if 2 rows have same totaldue amounts then ranking will be different if we use ROW_NUMBER

SELECT 
ROW_NUMBER() OVER(ORDER BY SOH.TotalDue DESC) AS ROW_NUMBER
,SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue,
ISNULL(PP.FirstName + ' ','')+ISNULL(PP.LastName+' ','') AS SALES_PERSON,
ST.[Name] as Territory
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN [Person].[Person] PP
ON PP.BusinessEntityID=SOH.SalesPersonID
INNER JOIN [Sales].[SalesTerritory] ST
ON ST.TerritoryID = SOH.TerritoryID
ORDER BY SOH.TotalDue DESC
-- ORDER BY ST.[Name] ASC


-- 2) Using RANK function ( If 2 rows have same TotalDue amounts they are given same ranking and next row will be replaced with rank+1
-- we want to give awards based on rank and we see just 1,2,3,4,4,6 instead of 5
--in that situation we use DENSE_RANK)
SELECT 
RANK() OVER(ORDER BY SOH.TotalDue DESC) AS RANKING
,SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue,
ISNULL(PP.FirstName + ' ','')+ISNULL(PP.LastName+' ','') AS SALES_PERSON,
ST.[Name] as Territory
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN [Person].[Person] PP
ON PP.BusinessEntityID=SOH.SalesPersonID
INNER JOIN [Sales].[SalesTerritory] ST
ON ST.TerritoryID = SOH.TerritoryID
ORDER BY SOH.TotalDue DESC

--3) DENSE_RANK
-- here we get ranking without gaps 1,2,3,4,4,5,6..

SELECT 
DENSE_RANK() OVER(ORDER BY SOH.TotalDue DESC) AS DENSE_RANKING
,SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue,
ISNULL(PP.FirstName + ' ','')+ISNULL(PP.LastName+' ','') AS SALES_PERSON,
ST.[Name] as Territory
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN [Person].[Person] PP
ON PP.BusinessEntityID=SOH.SalesPersonID
INNER JOIN [Sales].[SalesTerritory] ST
ON ST.TerritoryID = SOH.TerritoryID
ORDER BY SOH.TotalDue DESC

4) --OVER clause: determines partitioning and ordering of a rowset before associated window function
--is applied.
-- OVER CLAUSE APPLIES TO ANY RANKING FUNCTION



5) -- PARTITION 
SELECT 
RANK() OVER(PARTITION BY ST.[Name] ORDER BY SOH.TotalDue DESC) AS RANKING
,SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue,
ISNULL(PP.FirstName + ' ','')+ISNULL(PP.LastName+' ','') AS SALES_PERSON,
ST.[Name] as Territory
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN [Person].[Person] PP
ON PP.BusinessEntityID=SOH.SalesPersonID
INNER JOIN [Sales].[SalesTerritory] ST
ON ST.TerritoryID = SOH.TerritoryID
ORDER BY SOH.TotalDue DESC

--6) USE OF MULTIPLE PARTITIONS
-- partition resets itself for new sales person
SELECT 
RANK() OVER(PARTITION BY ST.[Name], SOH.SalesPersonID ORDER BY SOH.TotalDue DESC) AS RANK
,SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue,
ISNULL(PP.FirstName + ' ','')+ISNULL(PP.LastName+' ','') AS SALES_PERSON,
ST.[Name] as Territory
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN [Person].[Person] PP
ON PP.BusinessEntityID=SOH.SalesPersonID
INNER JOIN [Sales].[SalesTerritory] ST
ON ST.TerritoryID = SOH.TerritoryID
ORDER BY ST.Name ASC, SOH.SalesPersonID ASC, SOH.TotalDue DESC

--8) OVER CLAUSE APPLIES TO ANY RANKING FUNCTION
SELECT 
DENSE_RANK() OVER(PARTITION BY ST.[Name], SOH.SalesPersonID ORDER BY SOH.TotalDue DESC) AS DENSE_RANK
,SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue,
ISNULL(PP.FirstName + ' ','')+ISNULL(PP.LastName+' ','') AS SALES_PERSON,
ST.[Name] as Territory
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN [Person].[Person] PP
ON PP.BusinessEntityID=SOH.SalesPersonID
INNER JOIN [Sales].[SalesTerritory] ST
ON ST.TerritoryID = SOH.TerritoryID
ORDER BY ST.Name ASC, SOH.SalesPersonID ASC, SOH.TotalDue DESC
