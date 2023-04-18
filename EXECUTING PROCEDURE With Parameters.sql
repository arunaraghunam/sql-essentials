ALTER PROCEDURE PersonName(@p_id int)
AS
DECLARE
       @p_name varchar(25)
BEGIN
     SELECT @p_name = FirstName
	 FROM [Person].[Person]
	 WHERE [BusinessEntityID]=@p_id
	 PRINT @p_name

END

EXEC PersonName 5
EXEC PersonName 6