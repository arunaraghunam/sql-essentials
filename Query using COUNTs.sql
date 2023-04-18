USE [SampleDB]
-- Count all non null records in a column 

SELECT COUNT(LastName) FROM [dbo].[DimEmployee]
SELECT COUNT(DISTINCT LastName) FROM [dbo].[DimEmployee]


-- Count all records in table

SELECT COUNT(1) FROM [dbo].[DimEmployee]

SELECT (*) FROM  [dbo].[DimEmployee]


