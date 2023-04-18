SELECT  * FROM [dbo].[DimSales]

-- Maximum value from multiple columns
-- we can use CASE statment if less columns
-- Using derived table(user defined table) created using key word values
SELECT  Category,
(SELECT MAX(Sales)
FROM (VALUES([2015]), ([2016]),([2017]),([2018]),([2019]),([2020])) SalesTbl(Sales)) as MaxSales

FROM [dbo].[DimSales]

-- Table valued function
SELECT * FROM (VALUES (1), (2), (3), (4)) AS Tbl(A)

-- To find max of these values(using hard coded values)

SELECT MAX(A) FROM (VALUES (1), (2), (3), (4)) AS Tbl(A)
