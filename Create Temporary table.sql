-- Create temporary table in stored proc

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)