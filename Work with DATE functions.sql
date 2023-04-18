SELECT [BusinessEntityID]
, HireDate
, YEAR (HireDate) as HireYear
, MONTH(HireDate) as HireMonth
, DAY(HireDate) as HireDay
FROM [HumanResources].[Employee];

-- Group records based on year of hiredate
SELECT YEAR(HireDate) AS HireYear, COUNT(*) AS NewHires
FROM [HumanResources].[Employee]
GROUP BY YEAR(HireDate)

-- Current date and time
SELECT GETDATE()
FROM [HumanResources].[Employee];
-- How many days since emp was hired
SELECT [BusinessEntityID]
, [HireDate]
, DATEDIFF(day, HireDate, GETDATE()) as DaysSinceHire
FROM [HumanResources].[Employee]

-- How many years since emp was hired
SELECT [BusinessEntityID]
, [HireDate]
, DATEDIFF(year, HireDate, GETDATE()) as YearsSinceHire
, DATEADD(year, 10, HireDate) as AnniersaryDate -- 10 year anniversary since original hire
FROM [HumanResources].[Employee]


--GETUTCDATE() -- UTC FORMAT
