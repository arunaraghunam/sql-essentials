-- FORMAT date and times d- days9 1d, 1 digit, dd - day of week abbr, ddd- mon,tue), M-month, Y - year

SELECT [BusinessEntityID]
, [HireDate]
, FORMAT(HireDate, 'dddd, MMMM dd, yyyy') AS FormattedDate
FROM [HumanResources].[Employee]

SELECT [BusinessEntityID]
, [HireDate]
, FORMAT(HireDate, 'd-MMM') AS FormattedDate
FROM [HumanResources].[Employee];