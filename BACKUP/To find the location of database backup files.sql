--SQL Server DBA Script to find the location of database backup files.
/*This script is handy to the Database Administrator because sometimes DBAs are finding all different locations of
database backup files.

In our organization, I found that many of database developers and junior database administrators are taking backup 
in a different location so I always wonder about those areas of the Database Backup file.

We should also remove old backup files.
I am fetching this location details from MSDB database.*/

SELECT Distinct physical_device_name 
FROM msdb.dbo.backupmediafamily