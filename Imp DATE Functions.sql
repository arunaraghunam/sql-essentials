-- To get End of month
SELECT EOMONTH('2011-05-23')

-- To get start of month

SELECT  DATEFROMPARTS(YEAR(EOMONTH('2011-05-01')), MONTH(EOMONTH('2011-05-31')),1)AS FirstDayOfMonth;

-- End of Month of Previous Month
SELECT EOMONTH(DATEADD(month, -1, '2011-05-31'))

-- Firstday of the month
SELECT  DATEFROMPARTS(YEAR(EOMONTH(DATEADD(month, -1, '2011-05-31'))), 
MONTH(EOMONTH('2011-05-31')),1)AS FirstDayOfMonth;