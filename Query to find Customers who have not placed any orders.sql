SELECT * FROM Customers

SELECT * FROM Orders

-- Customers who have placed orders

SELECT c.CustomerID, c.Name
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID

-- Method 1 Using Left Join Customers who have not placed any orders

SELECT * FROM Customers c 
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

--Method 2 using Correlated sub query

SELECT * FROM Customers c
WHERE 0 = (SELECT COUNT(*) FROM Orders o
WHERE c.CustomerID =o.CustomerID)

-- Method 3: using NOT EXISTS

SELECT * FROM customers c 
WHERE NOT EXISTS (SELECT * FROM Orders o
WHERE c.CustomerID = o.CustomerID)