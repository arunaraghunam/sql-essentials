USE master
GO
	   DROP SQLTest
	   GO

--Restore Database

RESTORE DATABASE SQLTest
	FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Hello.bak'
	GO


