CREATE temporary TABLE uniqlostocks( dates date, 
    open integer, 
    high integer, 
    low integer, 
    close integer, 
    volume integer, 
    stock_trading bigint);


COPY uniqlostocks(dates, open, high, low, close, volume, stock_trading)
    FROM 'C:/Users/milko/Desktop/mchrusciel-homework05/UniqloStocks.csv'
    csv HEADER NULL AS 'N/A';


INSERT INTO low_close_vol_trade (low, close, volume, stock_trading)
SELECT low, close, volume, stock_trading
FROM uniqlostocks;

INSERT INTO dates_open_high (dates, open, high)
SELECT dates, open, high
FROM uniqlostocks;


DROP table uniqlostocks;