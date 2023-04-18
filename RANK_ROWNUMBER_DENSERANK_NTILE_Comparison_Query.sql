-- Compare ROW_NUMBER, RANK and DENSE_RANK

SELECT SOD.ProductID, SOH.SalesOrderID,
FORMAT(SOH.[OrderDate], 'yyyy-MM-dd') AS OrderDate,
ROW_NUMBER() OVER(PARTITION BY SOD.ProductID ORDER BY SOH.SalesOrderID) as RowNumber,
RANK() OVER(PARTITION BY SOD.ProductID ORDER BY SOH.SalesOrderID) as [Rank],
DENSE_RANK() OVER(PARTITION BY SOD.ProductID ORDER BY SOH.SalesOrderID) AS [DenseRank]
FROM [Sales].[SalesOrderHeader] SOH
JOIN [Sales].[SalesOrderDetail] SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
WHERE SOD.ProductID BETWEEN 710 AND 720
ORDER BY SOD.ProductID, SOH.SalesOrderID;

-- Non-Unique ORDER BY
-- multiple orders for product on same day, RANK and DENSE_RANK return repeated values
-- diff orders on same date so rank is 1,1,1 followed by 4 which is 4th row, rank skips numbers
-- dense_Rank does not catch up with row_numbers and uses all numbers. doesn't skip numbers as rank 
-- it returns rank of unique value of ORDERBY column 
SELECT SOD.ProductID, SOH.SalesOrderID,
FORMAT(SOH.[OrderDate], 'yyyy-MM-dd') AS OrderDate,
ROW_NUMBER() OVER(PARTITION BY SOD.ProductID ORDER BY SOH.OrderDate) as RowNumber,
RANK() OVER(PARTITION BY SOD.ProductID ORDER BY SOH.OrderDate) as [Rank],
DENSE_RANK() OVER(PARTITION BY SOD.ProductID ORDER BY SOH.OrderDate) AS [DenseRank]
FROM [Sales].[SalesOrderHeader] SOH
JOIN [Sales].[SalesOrderDetail] SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
WHERE SOD.ProductID BETWEEN 710 AND 720
ORDER BY SOD.ProductID, SOH.SalesOrderID;

-- NTILE
-- returns value that divides row into buckets
-- inner query returns count of sales group by product ID

WITH Sales AS(
SELECT SOD.ProductID,
COUNT(*) AS OrderCount
FROM [Sales].[SalesOrderHeader] SOH
JOIN [Sales].[SalesOrderDetail] SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY SOD.ProductID)

-- return 10 buckets
-- lowest count of orders in bucket 1, next set in bucket 2 etc

SELECT ProductID, OrderCount,
      NTILE(10) OVER(ORDER BY OrderCount) AS Bucket
	  FROM Sales;


