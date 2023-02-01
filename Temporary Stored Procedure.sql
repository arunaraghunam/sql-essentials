-- Creating Temporary Procedure

/*Like the temporary table, we can create temporary procedures as well. 
There are two types of temporary procedures, 
one is a local temporary stored procedure and another 
one is a global temporary procedure.

Local temporary SQL Server stored procedures: These are created with # as prefix 
and can be accessed only in the session where it created. 
This procedure is automatically dropped when the connection is closed.*/

CREATE PROCEDURE #Temp
AS
BEGIN
PRINT 'Local temp procedure'
END

/*Global temporary SQL Server stored procedure: These procedures are created with ## as prefix 
and can be accessed on the other sessions as well. This procedure is 
automatically dropped when the connection which is used to create 
the procedure is closed.*/

CREATE PROCEDURE ##TEMP
as
BEGIN
PRINT 'Global temp procedure'
END


