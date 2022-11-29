/*USE AdventureWorksDW2017
GO

SELECT top 3* FROM [dbo].[FactInternetSales] -- all sales recrds and reference keys

SELECT top 3* FROM DimProduct -- product list

SELECT top 3* FROM DimCustomer -- customer details 

SELECT top 3* FROM DimGeography -- from which place customer belongs being referenced in DimCustomer

GO */
/*CTE: Common Table Expression
-	It is a temporary record set in memory which remain available within the scope of query execution
WITH Expression (Column List)
AS (
CTE Definition
)
SELECT Query to use CTE Expression */

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



FROM [dbo].[FactInternetSales]




