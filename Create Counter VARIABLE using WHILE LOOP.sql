-- Create a counter for a looping statement

DECLARE @Counter INT =1;

WHILE @Counter <=3

BEGIN
     SELECT @Counter AS CurrentValue -- return in value currentvalue
	 SET @Counter = @Counter+1  -- increment counter 
END

