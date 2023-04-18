CREATE PROCEDURE check_price_proc(@p_productID int)
AS
DECLARE 
        @v_ListPrice int,
		@v_productName varchar(25)
BEGIN
     SELECT @v_ListPrice = ListPrice,
	 @v_productName = [Name]
	 FROM [Production].[Product]
	 WHERE ProductID = @p_productID

	 PRINT 'Current ListPrice is : ' + CAST(@v_ListPrice AS VARCHAR)

	 IF @v_ListPrice > 50
	 PRINT 'Greater than 50'
	 ELSE IF @v_ListPrice = 50
	 PRINT 'Equal to 50'
	 ELSE
	 BEGIN
	      PRINT 'Less than 50'
		  UPDATE [Production].[Product]
		  SET ListPrice = ListPrice * 1.1 
		  WHERE ProductID = @p_productID

		  -- print new price

		  SELECT @v_ListPrice=ListPrice,
		  @v_productName=[Name]
		  FROM [Production].[Product]
		  WHERE ProductID = @p_productID
		  PRINT 'Current ListPrice is : ' + CAST(@v_ListPrice AS VARCHAR)
END
END

EXEC check_price_proc 316

SELECT ProductID, ListPrice FROM [Production].[Product]
WHERE ListPrice < 50