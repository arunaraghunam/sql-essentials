-- Create values with constants - COLUMN OF VALUES WITH SELECT QUERY

SELECT Name, ProductNumber, 
'AdventureWorks' as Manufacturer,
ListPrice,
ListPrice * 0.85 AS SalePrice -- 15% DISCOUNT APPLIED
FROM Production.Product
WHERE ListPrice>0;

