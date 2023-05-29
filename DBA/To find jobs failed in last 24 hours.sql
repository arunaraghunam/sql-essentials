

--You can use below script to find jobs failed in last 24 hours:

-- Variable Declarations 
DECLARE @FinalDate INT;
SET @FinalDate = CONVERT(int
    , CONVERT(varchar(10), DATEADD(DAY, -1, GETDATE()), 112)
    ) -- Yesterday's date as Integer in YYYYMMDD format

-- Final Logic 

SELECT  j.[name],  
        s.step_name,  
        h.step_id,  
        h.step_name,  
        h.run_date,  
        h.run_time,  
        h.sql_severity,  
        h.message,   
        h.server  
FROM    msdb.dbo.sysjobhistory h  
        INNER JOIN msdb.dbo.sysjobs j  
            ON h.job_id = j.job_id  
        INNER JOIN msdb.dbo.sysjobsteps s  
            ON j.job_id = s.job_id 
                AND h.step_id = s.step_id  
WHERE    h.run_status = 0 -- Failure  
         AND h.run_date > @FinalDate  
ORDER BY h.instance_id DESC;