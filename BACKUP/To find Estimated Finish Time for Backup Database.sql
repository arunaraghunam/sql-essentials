-- SQL Script to find Estimated Finish Time for the action of the SQL Server Backup Database
/*Using SQL Server sys.dm_exec_requests, we can estimate the finish time. 
We can also populate completed and estimated percentage.

You can execute below query while the Database Backup is running. You can find a record like BACKUP COMMAND.*/
SELECT 
	session_id
	,percent_complete AS CompletedPercent
	,DATEADD(MILLISECOND,estimated_completion_time,CURRENT_TIMESTAMP) AS EstimatedFinishTime
	,(total_elapsed_time/1000)/60 AS TotalElapsedTimeInMIN
	,DB_NAME(Database_id) AS DatabaseName 
	,command
	,sql_handle
FROM sys.dm_exec_requests 
WHERE command LIKE '%BACKUP DATABASE%'