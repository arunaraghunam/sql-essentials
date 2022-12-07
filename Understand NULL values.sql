
-- NULL does not behave well with not equal to <> operator
SELECT [WorkOrderID], [ScrappedQty], [ScrapReasonID]
FROM [Production].[WorkOrder]
WHERE ScrapReasonID <> NULL;

-- Use this instead
SELECT [WorkOrderID], [ScrappedQty], [ScrapReasonID]
FROM [Production].[WorkOrder]
WHERE ScrapReasonID IS NOT NULL;

-- To return NULL records

SELECT [WorkOrderID], [ScrappedQty], [ScrapReasonID]
FROM [Production].[WorkOrder]
WHERE ScrapReasonID IS NULL;

-- ISNULL Function takes 2 parameters  1 - column name, 2- value we want to return if column is null
SELECT [WorkOrderID], [ScrappedQty], ISNULL([ScrapReasonID], 99) AS ScrapReason
FROM [Production].[WorkOrder];


