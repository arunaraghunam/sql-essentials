/* Comparison Operators

Standard =, <, >, <=, >=
Non Standard !=, !< not less than, !> not more than*/

SELECT Name, [TaxRate]
FROM [Sales].[SalesTaxRate]
WHERE TaxRate = 7.25;

SELECT Name, [TaxRate]
FROM [Sales].[SalesTaxRate]
WHERE TaxRate >= 7.25;

--Taxrate bETWEEN 2 ranges
SELECT Name, [TaxRate]
FROM [Sales].[SalesTaxRate]
WHERE (TaxRate > 7) AND (TaxRate <10);

-- For inclusive range use >= <= symbols
SELECT Name, [TaxRate]
FROM [Sales].[SalesTaxRate]
WHERE (TaxRate > 7) AND (TaxRate <10);




