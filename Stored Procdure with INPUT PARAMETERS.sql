-- Create Stored Procedure with input parameters, Updating salary based on Empid parameter

CREATE PROC sp_UpdateSalary(@Empid int, @Salary int)
AS
BEGIN

UPDATE Employee
SET Salary = @Salary
WHERE Empid = @Empid

END

-- Execute Stored Proc

select * from Employee

exec sp_UpdateSalary 1, 250