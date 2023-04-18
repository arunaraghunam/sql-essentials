-- Script shows use of LAG Window function
USE PL_SampleData;
GO


SELECT TickerSymbol, TradeDate, ClosePrice
FROM dbo.StockHistory
ORDER BY TickerSymbol, TradeDate

-- To see how close price from one day compares with close price of next we use LAG function

SELECT [TickerSymbol], [TradeDate], [ClosePrice],
ClosePrice-LAG([ClosePrice]) OVER(PARTITION BY TickerSymbol ORDER BY TradeDate)AS Dif
FROM [dbo].[StockHistory]
ORDER BY TickerSymbol, TradeDate;

