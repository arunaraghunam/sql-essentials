SELECT p.Name,
pod.DueDate,
pod.OrderQty,
pod.UnitPrice,
pod.LineTotal,
pod.ReceivedQty,
pod.RejectedQty,
pod.StockedQty

FROM [Purchasing].[PurchaseOrderDetail] pod
JOIN [Production].[Product] p ON pod.ProductID=p.ProductID

/* Ceiling - next whole number

0.1 -> 1
0.6 -> 1
0.9 -> 1
2 -> 2
2.1 -> 3

Round:
0.1 ->0
0.6 -> 1
0.9 -> 1
2 ->2
2.1 ->3

0 to 0.4 -> previous value
0.6 to 0.9 -> next value
*/

