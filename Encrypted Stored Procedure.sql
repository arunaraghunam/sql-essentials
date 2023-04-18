/*We can hide the source code in the stored procedure 
by creating the procedure with the “ENCRYPTION” option.*/
-- encrypted stored procedure

CREATE PROCEDURE GetEmployees
WITH ENCRYPTION
AS
BEGIN
SET NOCOUNT ON

SELECT EmpID, EmpName
FROM Employees

END

--view the code of the SQL Server stored procedure using sp_helptext,
sp_helptext GetEmployees