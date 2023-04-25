--to find Estimated Finish Time for restoring the database in SQL Server.
/*When I am doing any act like backup and restore, every time I keen to know the estimated completion time.

This is also one of the valuable information for an organization and related clients to decide on the maintenance
time.

Using SQL Server sys.dm_exec_requests, we can estimate the finish time. We can also populate completed an 
estimated percentage.

You can execute below query while the Database Restore is running. You can find a record like RESTORE COMMAND.*/

SELECT 
	session_id
	,percent_complete AS CompletedPercent
	,DATEADD(MILLISECOND,estimated_completion_time,CURRENT_TIMESTAMP) AS EstimatedFinishTime
	,(total_elapsed_time/1000)/60 AS TotalElapsedTimeInMIN
	,DB_NAME(Database_id) AS DatabaseName 
	,command
	,sql_handle
FROM sys.dm_exec_requests 