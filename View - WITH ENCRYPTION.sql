--Example 8: SQL VIEW ENCRYPTION

/*
We can encrypt the VIEW using the WITH ENCRYPTION clause. Previously, we checked users can see the view definition using the sp_helptext command. 
If we do not want users to view the definition, we can encrypt it.
*/

CREATE VIEW DemoView2
WITH ENCRYPTION
AS
SELECT [TableId], [ForeignID], [Value], [CodeOne]
FROM [dbo].[MyTable]

-- if you run the sp_helptext command to view the definition, you get the following error message.

EXEC sp_helptext DemoView2

