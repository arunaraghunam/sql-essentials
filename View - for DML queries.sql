-- Example 9: SQL VIEW for DML (Update, Delete and Insert) queries

/*We can use SQL VIEW to insert, update and delete data in a single SQL table. We need to note the following things regarding this.

We can use DML operation on a single table only
VIEW should not contain Group By, Having, Distinct clauses
We cannot use a subquery in a VIEW in SQL Server
We cannot use Set operators in a SQL VIEW
*/

--Use the following queries to perform DML operation using VIEW in SQL Server.

INSERT INTO DemoView values (4, 'CC','KK','RR')

DELETE FROM DemoView WHERE TableID = 7

UPDATE DemoView
SET Value = 'Raj'
WHERE TableID =5

