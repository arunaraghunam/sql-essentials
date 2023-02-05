-- Example 5: View to fetch specific column

-- We can select few columns as well from a VIEW in SQL Server similar to a relational table.

--In the following query, we want to get only two columns name and contract type from the view.

SELECT Name,
ContactType
FROM [Sales].vStoreWithContacts