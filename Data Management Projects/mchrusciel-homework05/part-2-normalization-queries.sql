

-- Aggregates all the distinct volumes this stock has reached and returns most recent date
SELECT
   low_close_vol_trade.id,
   low_close_vol_trade.volume,
   dates_open_high.dates
FROM
   low_close_vol_trade
INNER JOIN dates_open_high ON low_close_vol_trade .id = dates_open_high.t2;



-- Aggregates dates, opening prices, highs, and closing prices based on when opening prices were above 30000 - useful if you wanted to measure this metric

SELECT dates_open_high.dates, dates_open_high.open, dates_open_high.high, low_close_vol_trade.close
  FROM  dates_open_high FULL JOIN low_close_vol_trade 
    ON low_close_vol_trade.id = dates_open_high.t2
 WHERE open>30000;
 
 
 
 
 
 -- Joins dates and the maximum values of when Uniqlo's stocks were low
SELECT
    low_close_vol_trade.id,
    MAX(low_close_vol_trade.low)
FROM
   low_close_vol_trade
   

INNER JOIN dates_open_high ON low_close_vol_trade .id = dates_open_high.t2
 GROUP BY low_close_vol_trade.id;

 
 
 
 
 
 
 
 