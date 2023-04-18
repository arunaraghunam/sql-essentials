-- Example shows queries to find employees of departments that start with 'P'

SELECT p.FirstName, p.LastName, e.JobTitle
FROM [Person].[Person] p
JOIN [HumanResources].[Employee] AS e
ON e.BusinessEntityID = p.BusinessEntityID
WHERE EXISTS
( SELECT  *
FROM [HumanResources].[Department] AS d
JOIN [HumanResources].[EmployeeDepartmentHistory] AS edh
ON d.DepartmentID = edh.DepartmentID
WHERE e.BusinessEntityID=edh.BusinessEntityID
AND d.[Name] LIKE 'P%')

-- Using IN to find same results

SELECT p.FirstName, p.LastName, e.JobTitle
FROM [Person].[Person] p JOIN [HumanResources].[Employee] e
ON e.BusinessEntityID = p.BusinessEntityID
JOIN [HumanResources].[EmployeeDepartmentHistory] edh
ON e.BusinessEntityID = edh.BusinessEntityID
WHERE edh.DepartmentID IN(SELECT [DepartmentID]
FROM [HumanResources].[Department]
WHERE Name LIKE 'P%');
GO