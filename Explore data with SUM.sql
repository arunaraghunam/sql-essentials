/*Aggregate Functions
Added to the column list in a query's SELECT clause
FunctionName(TableColumn)
Add a descriptive alias with AS 
- COUNT - will count duplicate and NULL values
- COUNT(DISTINCT column) - to count non NULL values and unique
- COUNT_BIG(Column) - >2 billion items
- SUM(Column) - total values ignoring values
AVG(Column)
MIN, MAX - also work with text data
statistical functions:
STDEV
VAR
VARP - Variance for population
APPROX_COUNT_DISTINCT - for approximate values i big data applications
*/

/* Total profit for week, 
month, in sales region
No ofitems order contained
No of Unique items
which order was most valuable
*/
SELECT [SalesOrderID], SUM([LineTotal]) OrderTotal,
SUM([OrderQty]) NumberOfItems,
COUNT(DISTINCT ProductID) AS UniqueItems
FROM [Sales].[SalesOrderDetail]
GROUP BY [SalesOrderID]
ORDER BY OrderTotal DESC;

SELECT * FROM Sales.SalesOrderDetail;

-- Popularity of products sold and name of product along with totalqtysold

SELECT sod.ProductID, 
p.Name,
SUM([OrderQty]) as TotalQtySold
FROM [Sales].[SalesOrderDetail] sod
JOIN [Production].[Product] p ON sod.ProductID=p.ProductID
GROUP BY sod.[ProductID], p.Name
ORDER BY TotalQtySold DESC
