-- Query to test Incremental Load transformation in SSIS

USE [SSIS]

SELECT * FROM SOURCE
SELECT * FROM [TARGET]
GO

INSERT INTO [dbo].[SOURCE] ([EmployeeID] ,[EmployeeName])
VALUES (100, 'Kate')
INSERT INTO [dbo].[SOURCE] ([EmployeeID] ,[EmployeeName])
VALUES (101, 'Chris')
INSERT INTO [dbo].[SOURCE] ([EmployeeID] ,[EmployeeName])
VALUES (102, 'helo')
GO

UPDATE SOURCE
SET EmployeeName = 'bobby'
WHERE EmployeeID = 103

