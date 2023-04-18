-- Common SQL Date Functions

SELECT GETDATE() AS currentdate;

-- GETDATE() returns current date, then DATEPART operates on that value
SELECT DATEPART(MONTH,GETDATE()) AS [Month],
DATEPART(YEAR, GETDATE()) AS [Year],
DATEPART(WEEKDAY, GETDATE()) AS [weekday]

SELECT OrderDate, DATEPART(MONTH, OrderDate) as OrderMonth
FROM Sales.SalesOrderHeader
--Month(Getdate()),Year(Getdate()),
--DATEPART function is more flexible as it can also return the week number, quarter number, and other related things

SELECT DAY(OrderDate) as [Day],
MONTH(OrderDate) as [Month],
YEAR(OrderDate) as [Year],
OrderDate
FROM Sales.SalesOrderHeader

--extract all of the data with an order date year of 2014
SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2014


-- DATEADD adds a number on a specified date part of a date.
-- DATEADD(datepart, number, date)

SELECT DATEADD(MONTH, 1, GETDATE()), GETDATE()

SELECT DATEADD(YEAR, 1, OrderDate) NextYear, OrderDate
FROM Sales.SalesOrderHeader

-- DATEDIFF : function gets difference between 2 dates

SELECT DATEDIFF(DAY, OrderDate, ShipDate) as Daystoship,
OrderDate, ShipDate
FROM Sales.SalesOrderHeader

-- IFF function - returns value depending on whether condition is TRUE or FALSE
--IFF(boolean_expression, true_value, false_value)

SELECT IIF(FirstName = 'Catherine', 'Catherine','Not Catherine') as IsCatherine,
FirstName
FROM Person.Person

-- Concatenating values of different datatypes
-- CAST function to convert data type of BusinessEntityID from int to CHAR
SELECT FirstName + CAST(BusinessEntityID AS CHAR)
FROM Person.Person


-- FORMAT function to format a date

SELECT FORMAT(OrderDate, 'yyyy/MM')
FROM Sales.SalesOrderHeader



