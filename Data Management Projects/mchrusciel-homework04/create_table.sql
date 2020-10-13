-- write your table creation sql here!
DROP TABLE IF EXISTS UniqloStocks;

CREATE TABLE UniqloStocks (
    id serial PRIMARY KEY, 
    Dates date, 
    Open integer, 
    High integer, 
    Low integer, 
    Close integer, 
    Volume integer, 
    StockTrading bigint
);


