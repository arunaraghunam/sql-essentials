--T-SQL Script to take full backup for all the 
--databases of SQL Server.
--You can change the path name (‘C:\TempBackup\’) and replace with your path name.

DECLARE @dbName	NVARCHAR (255); 
DECLARE @SQL NVARCHAR(4000); 
 
DECLARE DBBackupCur 
CURSOR FOR 
    SELECT name FROM sys.databases WITH (NOLOCK) 
    WHERE name NOT IN ('master','model','msdb','tempdb')  
    OPTION (RECOMPILE); 
 
OPEN DBBackupCur;     
FETCH NEXT FROM DBBackupCur INTO @dbName 
WHILE (@@fetch_status <> -1) 
BEGIN 
    IF (@@fetch_status <> -2) 
    BEGIN 
        SET @SQL = N'BACKUP DATABASE [' + @dbName + N'] TO DISK = ''C:\TempBackup\' + @dbName + N'.bak'''; 
        EXECUTE sp_executesql @SQL 
        PRINT N'Backup completed: ' + @dbName 
    END; 
    FETCH NEXT FROM DBBackupCur INTO @dbName; 
END; 
CLOSE DBBackupCur; 
DEALLOCATE DBBackupCur; 
GO