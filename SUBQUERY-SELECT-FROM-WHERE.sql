-- SUBQUERY

Select * From [dbo].[EmployeeSalary]

Select EmployeeID, Salary,
(select AVG(Salary) FROM EmployeeSalary)
From [dbo].[EmployeeSalary]

--- Using Partition By

Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary`
Group By EmployeeID, Salary
Order By 1,2

-- Subquery in From

Select a.EmployeeID, AllAvgSalary
From(Select [EmployeeID], [Salary], AVG([Salary]) over() as AllAvgSalary
From EmployeeSalary)a

-- Subquery in where
