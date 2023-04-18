-- ORDER BY follows WHERE clause and specify order/predictable sequence

SELECT * 
FROM [HumanResources].[Department]
ORDER BY [GroupName] DESC

-- Sort on multiple columns
SELECT * 
FROM [HumanResources].[Department]
ORDER BY [GroupName] DESC, DepartmentID;
