--Inventory Collect Query is like following, it will make your job very simplify 
--when you connect to any SQL Server database for the first time.

 

select getdate() Date_Collected
	  ,serverproperty('MachineName') 'Machine_Name'
	  ,isnull(serverproperty('InstanceName'),'mssqlserver') 'Instance_Name'
	  ,@@SERVERNAME 'Sql_Server_Name'
	  ,SERVERPROPERTY('productversion') Product_Version 
	  ,SERVERPROPERTY ('productlevel') Product_Level 
	  ,SERVERPROPERTY ('edition') 'Edition'
	  ,d.name 'database_name'
	  ,suser_sname(d.owner_sid) 'owner'
	  ,ls.cntr_value as [log_size_kb]
	  ,lu.cntr_value as [log_used_kb]
	  ,lp.cntr_value as [percent_log_used]
	  ,ds.cntr_value as [data_files_size_kb]
from sys.databases d
	 left outer join sys.dm_os_performance_counters as lu on lu.instance_name=d.name and lu.counter_name like N'Log File(s) Used Size (KB)%'
	 left outer join sys.dm_os_performance_counters as ls on ls.instance_name=d.name and ls.counter_name like N'Log File(s) Size (KB)%' and ls.cntr_value > 0
	 left outer join sys.dm_os_performance_counters as lp on lp.instance_name=d.name and lp.counter_name like N'Percent Log Used%'
	 left outer join sys.dm_os_performance_counters as ds on ds.instance_name=d.name and ds.counter_name like N'Data File(s) Size (KB)%'
order by d.name;