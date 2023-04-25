-- scripts to find when was the SQL Server restarted.
/*
The DBAs must know about this because they have to make sure about data consistency.

For example: when SQL Server restarted because of power failure, system failure, update failure or any 
other reason, We must check the last restarted time of SQL Server. Because from that time, we have to 
restore data from our backup disks to the actual disk.

When SQL Server restarted, few transactions also rollback. We have to also identify these transactions 
by knowing the correct time when SQL Server actually restarted.*/

--Using sys.dm_exec_sessions:

SELECT login_time FROM sys.dm_exec_sessions WHERE session_id = 1
GO
--Using sys.dm_os_sys_info:

SELECT sqlserver_start_time FROM sys.dm_os_sys_info
GO 
--Using sys.databases:

SELECT create_date FROM sys.databases WHERE name = 'tempdb' 
GO
--Using sys.traces:

SELECT start_time FROM sys.traces WHERE is_default = 1  
GO
--Using sysdatabases:

