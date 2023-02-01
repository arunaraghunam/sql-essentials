-- Stored Procedure with output parameter

CREATE TABLE Employees(EmpID int identity(1,1), EmpName varchar(100))

CREATE PROCEDURE ins_NewEmp_with_outputparameters
(@ename varchar(50),
@eid int output)
AS
BEGIN
SET NOCOUNT ON

INSERT INTO Employees(EmpName) values (@ename)

SELECT @eid = SCOPE_IDENTITY()

END

--Executing the stored procedures with output parameters
--is bit different. We must declare the variable to store the 
--value returned by the output parameter.

declare @empid int

EXEC ins_NewEmp_with_outputparameters 'Andrew', @empid OUTPUT

SELECT @empid AS EmployeeID

declare @empid2 int

EXEC ins_NewEmp_with_outputparameters 'James', @empid2 OUTPUT

SELECT @empid2 as EmployeeID

