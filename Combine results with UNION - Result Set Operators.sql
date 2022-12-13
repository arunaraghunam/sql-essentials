-- Combine results with UNION results combined. Number of columns and datatypes should be same

SELECT [ProductCategoryID]
, NULL AS ProductSubcategoryID
, Name
FROM [Production].[ProductCategory]

UNION


SELECT  ProductCategoryID
       ,[ProductSubcategoryID]
       , Name
FROM [Production].[ProductSubcategory];