-- Sort data by month

SELECT * from [dbo].[Sales]
ORDER BY MonthName

-- Using CASE gives Month in correct order 

SELECT * from [dbo].[Sales]
ORDER BY CASE WHEN MonthName = 'January' THEN 1
WHEN MonthName = 'February' THEN 2
WHEN MonthName = 'March' THEN 3
WHEN MonthName = 'April' THEN 4
 WHEN MonthName = 'May' THEN 5
WHEN MonthName = 'June' THEN 6
WHEN MonthName = 'July' THEN 7
WHEN MonthName = 'August' THEN 8
 WHEN MonthName = 'September' THEN 9
WHEN MonthName = 'October' THEN 10
WHEN MonthName = 'November' THEN 11
WHEN MonthName = 'December' THEN 12
else NULL END


