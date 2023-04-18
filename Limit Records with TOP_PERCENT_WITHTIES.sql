-- TOP N -- returns top N records need to be paired with ORDER BY to return predictable results

-- Highest 3 taxrates

SELECT TOP 3 [TaxRate], Name
FROM [Sales].[SalesTaxRate]
ORDER BY TaxRate DESC;

SELECT TOP 3 [TaxRate], Name
FROM [Sales].[SalesTaxRate]
ORDER BY TaxRate ASC;

-- TOP 5 records

SELECT TOP 5 [TaxRate], Name
FROM [Sales].[SalesTaxRate]
ORDER BY TaxRate 

-- Top 50% 
SELECT TOP 50 PERCENT [TaxRate], Name
FROM [Sales].[SalesTaxRate]
ORDER BY TaxRate;

SELECT TOP 5 [TaxRate], Name
FROM [Sales].[SalesTaxRate]
ORDER BY TaxRate;

-- WITH TIES - query to return more than 5 rows if there are 
--more than 5 rows that tie for last position in the list
SELECT TOP 5 WITH TIES TaxRate, Name
FROM Sales.SalesTaxRate