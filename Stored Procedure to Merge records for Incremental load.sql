CREATE PROCEDURE [dbo].[LOAD_TARGET]
AS
BEGIN

MERGE dbo.TARGET AS T
USING dbo.SOURCE AS S
ON (T.EmployeeID = S.EmployeeID)
WHEN MATCHED THEN
     UPDATE SET T.EmployeeName = S.EmployeeName
WHEN NOT MATCHED THEN
     INSERT (EmployeeID, EmployeeName)
	 VALUES (S.EmployeeID, S.EmployeeName);
END
GO
