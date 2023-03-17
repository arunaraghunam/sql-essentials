-- Most frequently purchased items by customer

SELECT O1.ProductID, O2.ProductID FROM CustOrders O1
INNER JOIN CustOrders O2
ON O1.CustomerID = O2.CustomerID
AND O1.OrderID = O2.OrderID
AND O1.ProductID < O2.ProductID

-- How mnay times this combination is bought together
SELECT O1.ProductID, O2.ProductID
, COUNT(*) AS PurchaseFrequency
 FROM CustOrders O1
INNER JOIN CustOrders O2
ON O1.CustomerID = O2.CustomerID
AND O1.OrderID = O2.OrderID
AND O1.ProductID < O2.ProductID
GROUP BY O1.ProductID, O2.ProductID
ORDER BY PurchaseFrequency DESC

-- Top 2 most frequently purchased items together
SELECT TOP 2 O1.ProductID, O2.ProductID
, COUNT(*) AS PurchaseFrequency
 FROM CustOrders O1
INNER JOIN CustOrders O2
ON O1.CustomerID = O2.CustomerID
AND O1.OrderID = O2.OrderID
AND O1.ProductID < O2.ProductID
GROUP BY O1.ProductID, O2.ProductID
ORDER BY PurchaseFrequency DESC
