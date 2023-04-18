--Example 1: SQL VIEW to fetch all records of a table
CREATE VIEW EmployeeRecords
AS

SELECT *
FROM [HumanResources].[Employee]

--Once a VIEW is created, you can access it like a SQL table.

SELECT * FROM EmployeeRecords