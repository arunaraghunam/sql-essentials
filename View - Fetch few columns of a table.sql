-- Example 2: SQL VIEW to fetch a few columns of a table

CREATE VIEW EmployeeRecords1
AS
SELECT [NationalIDNumber], [LoginID],[JobTitle]
FROM [HumanResources].[Employee];