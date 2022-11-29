-- Using Multiple CTE in a Query

GO
WITH
cte_Sales AS (
SELECT [ProductKey], [CustomerKey], SalesAmount
FROM [dbo].[FactInternetSales]),

CTE_Product AS (
SELECT [ProductKey], [EnglishProductName] AS ProductName
FROM [dbo].[DimProduct]),

CTE_Customer AS (
SELECT [CustomerKey], [FirstName], LastName
FROM [dbo].[DimCustomer])

SELECT FirstName, ProductName, SUM(SalesAmount) Total_salesAmount FROM 
cte_sales a
JOIN CTE_Product p on p.ProductKey = a.ProductKey
JOIN CTE_Customer c on c.CustomerKey= a.CustomerKey
GROUP BY FirstName, ProductName