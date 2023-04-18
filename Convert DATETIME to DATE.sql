-- Convert datetime to date using CONVERT() function:

SELECT CONVERT(DATE, GETDATE()) date;

-- Convert datetime to date using TRY_CONVERT function:

SELECT TRY_CONVERT(DATE,GETDATE())date