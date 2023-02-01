CREATE PROCEDURE usp_GetLastName(@eid int)
AS
BEGIN
SET NOCOUNT ON


SELECT [EmpName]
FROM Employees
WHERE [EmpID]=@eid

END

EXEC usp_GetLastName 1