-- Procedures
USE AdventureWorks2019
GO

CREATE PROCEDURE myfirstproc
AS
DECLARE
       @v_int int
BEGIN
     SET @v_int =5
	 PRINT @v_int
END

EXEC myfirstproc