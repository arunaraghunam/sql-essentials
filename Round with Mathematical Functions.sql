-- To format financial data/statistical data 

SELECT [BusinessEntityID]
, [SalesYTD]
, ROUND ([SalesYTD], 2) AS Round2
, ROUND ([SalesYTD], -2) AS RoundHundreds -- 5 and above round to next highest value, 4 and below next lowest value
, CEILING(SalesYTD) AS RoundCeiling -- rounds to highest integer
, FLOOR(SalesYTD) AS RoundFloor -- rounds to Lowest integer
FROM [Sales].[SalesPerson]