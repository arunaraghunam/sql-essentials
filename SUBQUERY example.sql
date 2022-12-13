-- Highest sales figure
SELECT TOP 1 SalesYTD
FROM Sales.SalesPerson
ORDER BY SalesYTD DESC

SELECT MAX(SalesYTD)
FROM Sales.SalesPerson

SELECT [BusinessEntityID]
, [SalesYTD]
, (SELECT MAX(SalesYTD)
FROM Sales.SalesPerson) AS HighestSalesYTD
FROM [Sales].[SalesPerson]
ORDER BY SalesYTD DESC;

-- How each sales person performs reltive to every other person

SELECT [BusinessEntityID]
, [SalesYTD]
, (SELECT MAX([SalesYTD])
FROM [Sales].[SalesPerson]) AS HighestSalesYTD,
(SELECT MAX([SalesYTD]) FROM [Sales].[SalesPerson])-[SalesYTD] AS SalesGap 
FROM [Sales].[SalesPerson]

