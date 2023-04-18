--Example 7: sp_refreshview to update the Metadata of a SQL VIEW

--Suppose we have a VIEW on a table that specifies select * statement to get all columns of that table.

CREATE VIEW DemoView
AS
SELECT *
FROM  [dbo].[MyTable]

--Let’s add a new column in the table using the Alter table statement.

Alter Table [AdventureWorks2019].[dbo].[MyTable] Add City nvarchar(50)


--By Default, SQL Server does not modify the schema and metadata for the VIEW. 
--We can use the system stored procedure sp_refreshview to refresh the metadata 
--of any view.

EXEC sp_refreshview DemoView

SELECT * FROM DemoView