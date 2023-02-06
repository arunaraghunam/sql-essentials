-- Example 10: SQL VIEW and Check Option

/*
We can use WITH CHECK option to check the conditions in VIEW are inline with the DML statements.

It prevents to insert rows in the table where the condition in the Where clause is not satisfied
If the condition does not satisfy, we get an error message in the insert or update statemen
*/

CREATE VIEW DemoView3
AS

SELECT * 
FROM [dbo].[MyTable]
WHERE [CodeOne] Like 'F%'
WITH CHECK OPTION;


--f we try to insert a value that does not match the condition,
--we get the error message.

INSERT INTO DemoView3 VALUES (5,'CC','Raj','Raj')

--attempted insert ot update failed because target view
--specifies WITH CHECK OPTION