CREATE PROCEDURE PersonName
AS
DECLARE @v_name varchar(25)
BEGIN
     SELECT @v_name = FirstName
	 FROM [Person].[Person]
	 WHERE [BusinessEntityID]=5
	 PRINT @v_name
END

GO