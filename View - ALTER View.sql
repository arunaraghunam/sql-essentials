--Example 12: Alter a SQL VIEW

ALTER VIEW DemoView
AS

SELECT *
FROM [dbo].[MyTable]
WHERE [CodeOne] LIKE 'C%'
WITH CHECK OPTION;