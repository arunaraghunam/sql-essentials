/*Example 8: Schema Binding a SQL VIEW
In the previous example, we modify the SQL table to add a 
new column. Suppose in the production instance, and you have 
a view in the application. You are not aware of the changes 
in the table design for the new column. We do not want any 
changes to be made in the tables being used in the VIEW. 
We can use SCHEMABINDING option to lock all tables used in 
the VIEW and deny any alter table statement against those tables.*/


CREATE VIEW DemoView1
WITH SCHEMABINDING
AS

SELECT * FROM 
[AdventureWorks2019]].[DBO].[MyTable]

--It gives an error message.

--Msg 1054, Level 15, State 6, Procedure DemoView, Line 4 [Batch Start Line 2]
--Syntax ‘*’ is not allowed in schema-bound objects.

--We cannot call all columns (Select *) in a VIEW with SCHEMABINDING option.
--Let’s specify the columns in the following query and execute it again.


CREATE VIEW DemoView1
WITH SCHEMABINDING
AS
     SELECT TableID, ForeignID ,Value, CodeOne
     FROM [AdventureWorks2019].[dbo].[MyTable];

	 /*Msg 4512, Level 16, State 3, Procedure DemoView, Line 5 [Batch Start Line 1]
Cannot schema bind VIEW ‘DemoView’ because of the name ‘AdventureWorks2017.dbo.MyTable’ is invalid for schema binding.
Names must be in a two-part format, and an object cannot reference itself.*/

CREATE VIEW DemoView1
WITH SCHEMABINDING
AS
     SELECT TableID, ForeignID ,Value, CodeOne
     FROM [dbo].[MyTable];

	 --Once you have created a VIEW with SCHEMABINDING option, 
	 --try to add a modify a column data type using Alter table command.

	 ALTER TABLE dbo.MyTable ALTER COLUMN ForeignID BIGINT;

	 --We need to drop the VIEW definition itself along with other dependencies on that table before making a change to the existing table schema.