-- PIVOT  - rotate results so data is represented as individual rows/columns for better analysis

SELECT ProductLine, AVG(ListPrice) as AveragePrice
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine

SELECT M, R, S, T
FROM (SELECT ProductLine, ListPrice
FROM Production.Product) AS SourceData
PIVOT (AVG(ListPrice) FOR ProductLine IN (M,R,S,T)) AS PivotTable
-- for every product line M,R,S,T we are going to find average List Price

-- Adding Row Headers - cross tab format
SELECT 'Average List Price' AS 'Product Line',
M, R, S, T
FROM (SELECT ProductLine, ListPrice
FROM Production.Product) AS SourceData
PIVOT (AVG(ListPrice) FOR ProductLine IN (M,R,S,T)) AS PivotTable


