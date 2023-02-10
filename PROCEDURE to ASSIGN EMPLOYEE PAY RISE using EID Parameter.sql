SELECT * FROM [Person].[Person]
GO

CREATE PROCEDURE person_for_raise_proc(@p_id int)
AS
DECLARE
       @p_city varchar(25),
	   @p_name varchar(25)
BEGIN
      SELECT 
	  --@p_city = city, 
	  @p_name =lastname
	  FROM [Person].[Person]
	  WHERE BusinessEntityID=@p_id

	  IF @p_id = 1
	  PRINT 'This person is up for raise'
	  ELSE
	  PRINT 'This employee is not up for a raise'

	  END

	  EXEC person_for_raise_proc 5

	  EXEC person_for_raise_proc 1