-- Syntax to create or Alter : No longer need to check if stored procedure exists

CREATE OR ALTER PROCEDURE EmpProc
AS
BEGIN
SELECT [FirstName],[MiddleName],[LastName] FROM [dbo].[DimEmployee]
END
GO