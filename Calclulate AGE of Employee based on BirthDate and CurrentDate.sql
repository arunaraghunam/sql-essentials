-- To calculate age of Employees

SELECT FirstName, LastName, BirthDate
FROM [dbo].[DimEmployee]

-- substract birthdate from currentdate ot get age

SELECT FirstName, LastName, BirthDate,
DATEDIFF(YY, BirthDate, getdate()) as Age
FROM [dbo].[DimEmployee]
WHERE Month(BirthDate) = 03

-- age is set based on current date

SELECT
CASE 
WHEN DATEADD(YEAR, DATEDIFF(YY, BirthDate, getdate()), BirthDate)>getdate()
THEN DATEDIFF(YY, BirthDate, getdate()) - 1
ELSE
DATEDIFF(YY, BirthDate, getdate()) END AS AGE
FROM [dbo].[DimEmployee]
WHERE MONTH(BirthDate) = 03

