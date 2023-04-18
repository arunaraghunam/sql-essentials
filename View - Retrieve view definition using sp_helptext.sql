--Example 6: Use Sp_helptext to retrieve VIEW definition

--We can use sp_helptext system stored procedure to get VIEW definition. It returns the complete definition of a SQL VIEW.

--For example, let’s check the view definition for EmployeeRecords VIEW.

sp_helptext 'EmployeeRecords2'

--We can use SSMS as well to generate the script for a VIEW. Expand database -> Views -> Right click and go to Script view as -> Create To -> New Query Editor Window.