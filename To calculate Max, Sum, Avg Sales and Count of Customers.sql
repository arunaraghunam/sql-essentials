/* Window aggregation functions to find maximum sales
, Sum of Sales, Average sales and number of customers by year and month from 
 Sales Orderheader table between previous month's start and end dates*/

 USE [AdventureWorks2019]

SELECT DISTINCT 
YEAR(OrderDate) as Year,
MONTH(OrderDate) as MONTH,
MAX(TotalDue) OVER (PARTITION BY YEAR(OrderDate), MONTH(OrderDate)) as MaxSales,
SUM(TotalDue) OVER (PARTITION BY YEAR(OrderDate), MONTH(OrderDate)) as SumSales,
AVG(TotalDue) OVER (PARTITION BY YEAR(OrderDate), MONTH(OrderDate)) as AvgSales,
COUNT(CustomerID) OVER (PARTITION BY YEAR(OrderDate), MONTH(OrderDate)) AS custcnt

FROM Sales.SalesOrderHeader SOH

WHERE OrderDate BETWEEN '2011-05-01' and '2011-05-31'

ORDER BY YEAR(OrderDate),
         MONTH(OrderDate)
