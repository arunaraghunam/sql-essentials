--T-SQL script to find all Databases from the all the SQL Server Instances.

/*This script is very helpful for Database Administrators, who is managing different instances of SQL Server.

Using this single T-SQL script, we can get the all Databases from all the running SQL Server Instances.*/

DECLARE @InstanceName NVARCHAR(128)
 
CREATE TABLE #Databases 
(
	[ServerName] VARCHAR(128)
	,[DatabaseName] VARCHAR(128)
)
 
DECLARE SQLCur CURSOR
FOR
SELECT NAME
FROM sys.servers
 
OPEN SQLCur
FETCH NEXT
FROM SQLCur
INTO @InstanceName
WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @SQL VARCHAR(MAX) = NULL
	SET @SQL = 
	'
		INSERT INTO #Databases
		([ServerName],[DatabaseName])      
		SELECT ''' + @InstanceName + '''
		,name FROM  [' + @InstanceName + '].master.Sys.Databases 
		WHERE database_id > 4
	'
	EXEC (@SQL)
	FETCH NEXT
	FROM SQLCur
	INTO @InstanceName
END
CLOSE SQLCur
 
DEALLOCATE SQLCur
SELECT 
	ServerName
    ,DatabaseName
    ,(
        SELECT count(*) AS DBCount
        FROM #Databases AS I
        WHERE I.ServerName = O.ServerName
     ) AS InstanceDBCont
FROM #Databases O
GO
 
DROP TABLE #Databases
GO