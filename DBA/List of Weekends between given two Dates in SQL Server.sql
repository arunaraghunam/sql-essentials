--script to find a list of Weekends between given two Dates in SQL Server.

/*If you are a database developer and reading this post, you should know about the life of DBA.
Database Administrator life is for 24*7 and they have to also set few maintenance tasks over the weekends and holidays.

This script helps to DBA for finding available weekends between the dates so they can set auto-schedule for database maintenance.*/

DECLARE @beginDate DATE = '20230502'
DECLARE @endDate DATE = '20230531'  
 
DECLARE @Weekend TABLE
(
	Weekend DATE PRIMARY KEY
	,IsWeekend BIT
)
 
WHILE @beginDate <= @endDate 
BEGIN 
INSERT INTO @Weekend 
SELECT 
	@beginDate AS Weekend 
	,(CASE WHEN DATEPART(WEEKDAY, @beginDate) In (7, 1) THEN 1 ELSE 0 END) AS IsWeekend 
	SET @beginDate = DateAdd(Day, 1, @beginDate) 
END
 
SELECT Weekend FROM @Weekend WHERE IsWeekend = 1