-- PROCEDURE WITH CURSOR

CREATE PROCEDURE price_range_proc
(@p_minprice int, @p_maxprice int)
AS
DECLARE
     products_range_cur CURSOR FOR
	 SELECT [Name], ListPrice
	 FROM [Production].[Product]
	 WHERE ListPrice BETWEEN @p_minprice AND @p_maxprice
DECLARE @v_listprice INT,
        @v_productName varchar(25)

BEGIN
     OPEN products_range_cur

	 FETCH NEXT FROM products_range_cur INTO @v_listprice, @v_productName 
	 WHILE @@FETCH_STATUS = 0
	 BEGIN
	      PRINT @v_productName + ' '+ CAST (@v_listprice as varchar)
		  FETCH NEXT FROM prodcuts_range_cur INTO @v_productName
END

CLOSE products_range_cur
DEALLOCATE products_range_cur
END

EXEC price_range_proc 50,51