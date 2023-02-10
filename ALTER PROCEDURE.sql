ALTER PROCEDURE myfirstproc
AS
DECLARE @v_int int
BEGIN
     SET @v_int = 10
	 PRINT @v_int
END

EXEC myfirstproc