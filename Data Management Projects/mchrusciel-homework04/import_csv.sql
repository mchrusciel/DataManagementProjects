-- write your COPY statement to import a csv here
COPY uniqlostocks(dates, open, High, Low, Close, Volume, StockTrading)
    FROM 'C:/Users/milko/Desktop/mchrusciel-homework05/UniqloStocks.csv'
    csv HEADER NULL AS 'N/A';