--Using the below script, you can find the status of running database backup:


SELECT 
	A.NAME AS DatabaseName
	,B.TOTAL_ELAPSED_TIME/60000 AS Running
	,B.ESTIMATED_COMPLETION_TIME/60000 AS Remaining
	,B.PERCENT_COMPLETE 
	,(SELECT TEXT FROM sys.dm_exec_sql_text(B.SQL_HANDLE)) AS SQLCommand 
FROM MASTER..SYSDATABASES A, sys.dm_exec_requests B
WHERE A.DBID=B.DATABASE_ID 
   AND B.COMMAND LIKE '%BACKUP%'
ORDER BY B.PERCENT_COMPLETE  DESC
	,B.TOTAL_ELAPSED_TIME/60000 DESC