-- Filter groups with HAVING always follws GROUP BY clause

-- How many products we have with each color

SELECT [Color], COUNT(*) as NumberOfProducts
FROM [Production].[Product]
WHERE Color IS NOT NULL
GROUP BY Color

-- To filter entire group from results use HAVING clause

SELECT [Color], COUNT(*) as NumberOfProducts
FROM [Production].[Product]
WHERE Color IS NOT NULL
GROUP BY Color
HAVING COUNT(*) >25;