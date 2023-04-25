/*I am sharing the script to hide all databases from the all public logins in SQL Server Management Studio.

We are hiding all databases for security reasons. Using below script, you can hide all databases for all user logins.

Once you execute below script, you will not be able to see any databases in SQL Server Management Studio. Only the sysadmin login 
or owner of the database can see the databases in SQL Server Management Studio.*/

USE MASTER
GO
DENY VIEW ANY DATABASE TO PUBLIC
GO