--This script will help DBA for finding the SSIS packages in SQL Server.


SELECT  
	ssisp.name AS package_name
	,ssisp.description
	,ssispf.foldername as folder_name
	,CASE ssisp.packagetype
		WHEN 0 THEN 'Default client'
		WHEN 1 THEN 'I/O Wizard'
		WHEN 2 THEN 'DTS Designer'
		WHEN 3 THEN 'Replication'
		WHEN 5 THEN 'SSIS Designer'
		WHEN 6 THEN 'Maintenance Plan'
	ELSE 'Unknown'
	END AS package_type
	,c.name AS owner_name 
	,ssisp.createdate AS create_date 
	,DATALENGTH(ssisp.packagedata) AS package_size
FROM msdb.dbo.sysssispackages AS ssisp 
INNER JOIN msdb.dbo.sysssispackagefolders AS ssispf
	ON ssisp.folderid = ssispf.folderid
INNER JOIN sys.syslogins AS c 
	ON ssisp.ownersid = c.sid
ORDER BY ssisp.name