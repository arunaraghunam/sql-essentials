-- Using CTE with another table

WITH CTE  AS
(SELECT
[ProductKey],
[OrderDateKey] AS OrderDate,
[ShipDateKey] AS ShipDate,
[SalesAmount]
FROM FactInternetSales
)
-- to find maximum sales
SELECT MAX(SalesAmount)
FROM CTE
GO

WITH myCTE AS(

SELECT
C.CustomerKey,
C.FirstName,
C.LastName,
C.MaritalStatus,
C.YearlyIncome,
G.City,
G.EnglishCountryRegionName AS Country
FROM DimCustomer C
JOIN DimGeography G ON C.GeographyKey=G.GeographyKey
)

-- country wise total sales
SELECT
     Country,
	 SUM([SalesAmount]) Total_Sales
	 	 FROM [dbo].[FactInternetSales] S
	 JOIN MyCTE Cte ON cte.CustomerKey = S.CustomerKey
	 GROUP BY Country