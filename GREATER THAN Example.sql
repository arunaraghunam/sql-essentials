SELECT [DepartmentID], [Name]
FROM [HumanResources].[Department]
WHERE [DepartmentID] > 13
ORDER BY DepartmentID;

-- Using > to compare two variables

DECLARE @a INT = 45, @b INT =40;
SELECT IIF(@a>@b, 'TRUE', 'FALSE') AS Result;