-- Use T-SQL sript to backup database

BACKUP DATABASE SQLTest
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Hello.bak'
  WITH FORMAT,
       NAME ='full Backup of TestDB',
	   MEDIANAME = 'TestDB1',
	   DESCRIPTION = 'This is backup file of TestDB database'