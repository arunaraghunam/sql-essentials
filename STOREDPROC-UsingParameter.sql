USE [SQL Project]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 02/01/2025 12:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Temp_Employee]
@JobTitle nvarchar(100)
AS
Create Table  #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAg int,
AvgSalary int)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [SQL Project]..EmployeeDemographics emp
JOIN [SQL Project]..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
	WHERE JobTitle=@JobTitle
group by JobTitle

SELECT * FROM #temp_employee

EXEC Temp_Employee @JobTitle='Salesman'