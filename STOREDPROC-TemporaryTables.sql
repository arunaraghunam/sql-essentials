CREATE PROCEDURE Temp_Employee
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
group by JobTitle

select * from #temp_employee

EXEC Temp_Employee