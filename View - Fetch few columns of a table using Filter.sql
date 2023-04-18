--Example 3: SQL VIEW to fetch a few columns of a table and 
--filter results using WHERE clause

--Suppose we want to get EmployeeRecords with Martial status ‘M’.

CREATE VIEW EmployeeRecords2
AS
SELECT [NationalIDNumber],
[LoginID],
[JobTitle],
[MaritalStatus]
FROM [HumanResources].[Employee]
WHERE MaritalStatus = 'M';