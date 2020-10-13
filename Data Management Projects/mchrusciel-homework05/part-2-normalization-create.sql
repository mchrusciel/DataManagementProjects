-- write your table creation sql here!
DROP TABLE IF EXISTS dates_open_high;
DROP TABLE IF EXISTS low_close_vol_trade;

CREATE TABLE low_close_vol_trade(
    id serial PRIMARY KEY,
    low integer, 
    close integer, 
    volume integer, 
    stock_trading bigint);

CREATE TABLE dates_open_high (
    id serial PRIMARY KEY, 
    dates date, 
    open integer, 
    High integer,
    t2 serial REFERENCES low_close_vol_trade(id));
    
                                         
                                             


