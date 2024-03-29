--Inventory Collect Query is like following, it will make your job very simplify when you connect to 
--any SQL Server database for the first time.

sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'Ole Automation Procedures', 1;
GO
RECONFIGURE;
GO
/*******************************************************/
SET NOCOUNT ON
DECLARE @hr int
DECLARE @fso int
DECLARE @drive char(1)
DECLARE @odrive int
DECLARE @TotalSize varchar(20) DECLARE @MB Numeric ; SET @MB = 1048576

CREATE TABLE #drives (drive char(1) PRIMARY KEY, FreeSpace int NULL,
TotalSize int NULL) INSERT #drives(drive,FreeSpace) EXEC
master.dbo.xp_fixeddrives EXEC @hr=sp_OACreate
'Scripting.FileSystemObject',@fso OUT IF @hr <> 0 EXEC sp_OAGetErrorInfo
@fso

DECLARE dcur CURSOR LOCAL FAST_FORWARD
FOR SELECT drive from #drives ORDER by drive
OPEN dcur FETCH NEXT FROM dcur INTO @drive

WHILE @@FETCH_STATUS=0
BEGIN
EXEC @hr = sp_OAMethod @fso,'GetDrive', @odrive OUT, @drive
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso EXEC @hr =
sp_OAGetProperty
@odrive,'TotalSize', @TotalSize OUT IF @hr <> 0 EXEC sp_OAGetErrorInfo
@odrive UPDATE #drives SET TotalSize=@TotalSize/@MB WHERE
drive=@drive FETCH NEXT FROM dcur INTO @drive
End
Close dcur
DEALLOCATE dcur

EXEC @hr=sp_OADestroy @fso IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso
--SELECT @@Servername
--SELECT
--drive, TotalSize as 'Total(MB)', FreeSpace as 'Free(MB)' FROM #drives
--ORDER BY drive

CREATE TABLE #CPUInfo
( Logical_CPU_Count bigint,
Hyperthread_Ratio bigint,
Physical_CPU_Count bigint,
Physical_Memory_MB bigint
)

INSERT INTO #CPUInfo(
Logical_CPU_Count,
Hyperthread_Ratio,
Physical_CPU_Count,
Physical_Memory_MB
)
SELECT 
cpu_count AS [Logical_CPU_Count] 
,hyperthread_ratio AS [Hyperthread_Ratio]
,cpu_count/hyperthread_ratio AS [Physical_CPU_Count]
, physical_memory_kb/1024 AS [Physical_Memory_MB]
FROM sys.dm_os_sys_info

CREATE TABLE #DatabaseInfo
( Machine_Name varchar(50),
Instance_Name varchar(50),
Sql_Server_Name varchar(50),
Total_Database_log_size_MB bigint,
Total_Database_log_used_MB bigint,
Total_Database_Data_File_Size_MB bigint
)
INSERT INTO #DatabaseInfo
(
Machine_Name,
Instance_Name,
Sql_Server_Name,
Total_Database_log_size_MB,
Total_Database_log_used_MB,
Total_Database_Data_File_Size_MB
)


select convert(varchar(50),serverproperty('MachineName')) 'Machine_Name'
,convert(varchar(50),isnull(serverproperty('InstanceName'),'mssqlserver')) 'Instance_Name'
,convert(varchar(50),@@SERVERNAME) 'Sql_Server_Name'
,sum(ls.cntr_value/1024) as [Total_Database_log_size_MB]
,sum(lu.cntr_value/1024)as [Total_Database_log_used_MB]
,sum(ds.cntr_value/1024) as [Total_Database_Data_File_Size_MB]
from sys.databases d
left outer join sys.dm_os_performance_counters as lu on lu.instance_name=d.name and lu.counter_name like N'Log File(s) Used Size (KB)%'
left outer join sys.dm_os_performance_counters as ls on ls.instance_name=d.name and ls.counter_name like N'Log File(s) Size (KB)%' and ls.cntr_value > 0
left outer join sys.dm_os_performance_counters as lp on lp.instance_name=d.name and lp.counter_name like N'Percent Log Used%'
left outer join sys.dm_os_performance_counters as ds on ds.instance_name=d.name and ds.counter_name like N'Data File(s) Size (KB)%'
where d.database_id>4; -- sistem database ler harc


WITH SizeDisc AS
( -- sunucu �zerindeki t�m drive size ve free size bilgisi
SELECT SUM(TotalSize) as 'TotalDiscSizeonServer(MB)', 
SUM(FreeSpace) as 'TotalFreeDiscSizeOnServer(MB)' 
FROM #drives
)
SELECT *
FROM #DatabaseInfo,#CPUInfo,SizeDisc

DROP TABLE #Drives 
DROP TABLE #DatabaseInfo
DROP TABLE #CPUInfo 
GO
/*******************************************************/
/* Disabling Ole Automation Procedures */
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'Ole Automation Procedures', 0;
GO
RECONFIGURE;
/*******************************************************/
GO