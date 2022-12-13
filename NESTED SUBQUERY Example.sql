-- Totals more than 20000

SELECT SalesOrderID, SUM(LineTotal) AS OrderTotal
FROM [Sales].[SalesOrderDetail]
GROUP BY SalesOrderID
HAVING SUM(LineTotal)>20000;

-- Subquery - Average sales value in table

SELECT AVG(ResultTable.MyValues) AS AverageValue
FROM 
(SELECT SUM(LineTotal) AS MyValues
FROM [Sales].[SalesOrderDetail]
GROUP BY [SalesOrderID]) AS ResultTable

-- Total Sales > Average value using nested subqueries
SELECT SalesOrderID, SUM(LineTotal) AS OrderTotal
FROM [Sales].[SalesOrderDetail]
GROUP BY SalesOrderID
HAVING SUM(LineTotal)>
(SELECT AVG(ResultTable.MyValues) AS AverageValue
FROM 
(SELECT SUM(LineTotal) AS MyValues
FROM [Sales].[SalesOrderDetail]
GROUP BY [SalesOrderID]) AS ResultTable
);