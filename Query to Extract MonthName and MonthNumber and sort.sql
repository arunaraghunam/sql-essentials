/*Order by DateName sorts Month's alphabetically */

SELECT DateName(Month, Date) as MonthName,
Month(Date) as MonthNumber, Sales
FROM [dbo].[Sales_Detail]
ORDER BY DateName(Month, Date)

/*Order by Month gives correct order*/
SELECT DateName(Month, Date) as MonthName,
Month(Date) as MonthNumber, Sales
FROM [dbo].[Sales_Detail]
ORDER BY Month(Date)