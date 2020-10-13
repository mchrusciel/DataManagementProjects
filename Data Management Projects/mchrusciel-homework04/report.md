# Overview
1. Name: Uniqlo (FastRetailing) Stock Price Prediction
2. Link to Data: https://www.kaggle.com/daiearth22/uniqlo-fastretailing-stock-price-prediction/download
3. Source / Origin: This was data taken from the Tokyo Stock Exchange on the Clothing Company Uniqlo - the title has prediction in it because this dataset was posted to kaggle for fintech hackathon participants to utilize - it looks like it was scraped from an open market data site http://k-db.com/, and then posted to kaggle
4. Motivation: I shop at Uniqlo regularly (great clothes), and I am interested in financial markets/analysis. Modeling this stock data could allow for insights to be made on trends and possibly even predictions if proper tools are applied.
5. Questions: What were the average high prices and average low prices of uniqlo stock prices? What is the variance and standard deviation on these same statistics? Overall, where does the stock seem to be going based on its prior trends?
6. Additionally, I should point out that the stock prices measured in this data is in Yen. Also, I have attachd an xlsx file that contains manual summary statistic calculations at the bottom of the dataset.

        
Below is organization of the data with data types


Date: Likely string, but can be converted to date type

Following Data are all ints
    Open Price
    High Price
    Low Price
    Closing Price
    Volume
    Stock trading



# Table Design

For deciding a primary key, may be able to use a date as the key, but I am going to use the serial type just ot be safe. 

Data types for the fields:

Date - maybe use just the date type

Open - will use an integer type
High - will use an integer type
Low - will use an integer type
Close - will use an integer type
Volume - will use an integer type

All of the above will be integer because I don't think they will need the extra 4 bytes big int provides

Stock Trading - this could be bigint (the numbers seem pretty large)



# Import
No issues encountered when importing


# Database Information


1. \l shows all databases in your postgres instance

                                                  List of databases
   Name    |  Owner   | Encoding |          Collate           |           Ctype            |   Access privileges
-----------+----------+----------+----------------------------+----------------------------+-----------------------
 homework4 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |
 postgres  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |
 template0 | postgres | UTF8     | English_United States.1252 | English_United States.1252 | =c/postgres          +
           |          |          |                            |                            | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_United States.1252 | English_United States.1252 | =c/postgres          +
           |          |          |                            |                            | postgres=CTc/postgres
           
           
2. /dt shows all tables in current database

             List of relations
 Schema |     Name     | Type  |  Owner
--------+--------------+-------+----------
 public | uniqlostocks | table | postgres


3.

For seeing individual columns, use SELECT column_name FROM uniqlostocks;

SELECT dates FROM uniqlostocks;

The above returns the entire dates column

Running \d uniqlostocks yields

  Column    |  Type   | Collation | Nullable |                 Default
--------------+---------+-----------+----------+------------------------------------------
 id           | integer |           | not null | nextval('uniqlostocks_id_seq'::regclass)
 dates        | date    |           |          |
 open         | integer |           |          |
 high         | integer |           |          |
 low          | integer |           |          |
 close        | integer |           |          |
 volume       | integer |           |          |
 stocktrading | bigint  |           |          |
 
 
 




# Query Results
-- 1. the total number of rows in the database

'''
count

-----
  1235
(1 row)




-- 2. show the first 15 rows, but only display 3 columns (your choice)

   dates    | high  |  low
------------+-------+-------
 2016-12-30 | 42330 | 41700
 2016-12-29 | 43220 | 42540
 2016-12-28 | 43970 | 43270
 2016-12-27 | 43700 | 43140
 2016-12-26 | 43660 | 43090
 2016-12-22 | 43840 | 43190
 2016-12-21 | 44370 | 43610
 2016-12-20 | 43630 | 42860
 2016-12-19 | 43150 | 42740
 2016-12-16 | 43550 | 42810
 2016-12-15 | 43880 | 42550
 2016-12-14 | 43440 | 42590
 2016-12-13 | 43300 | 42630
 2016-12-12 | 44000 | 42880
 2016-12-09 | 42970 | 41150
 
 
 
 
-- 3. do the same as above, but chose a column to sort on, and sort in descending order


dates    | high  |  low
------------+-------+-------
 2015-07-30 | 61970 | 60740
 2015-08-04 | 61830 | 60360
 2015-07-31 | 61650 | 60670
 2015-08-03 | 61280 | 60440
 2015-07-29 | 60460 | 59480
 2015-07-23 | 60000 | 58700
 2015-08-05 | 59960 | 58440
 2015-07-28 | 59460 | 57820
 2015-07-21 | 59280 | 57580
 2015-07-22 | 59180 | 58500
 2015-07-24 | 59080 | 58210
 2015-08-06 | 58900 | 56920
 2015-07-27 | 58610 | 57520
 2015-07-02 | 58400 | 57200
 2015-07-09 | 57460 | 54760
 
-- 4. add a new column without a default value



ALTER TABLE
 id |   dates    | open  | high  |  low  | close | volume  | stocktrading | rand
----+------------+-------+-------+-------+-------+---------+--------------+------
  1 | 2016-12-30 | 42120 | 42330 | 41700 | 41830 |  610000 |  25628028000 |
  2 | 2016-12-29 | 43000 | 43220 | 42540 | 42660 |  448400 |  19188227000 |
  3 | 2016-12-28 | 43940 | 43970 | 43270 | 43270 |  339900 |  14780670000 |
  4 | 2016-12-27 | 43140 | 43700 | 43140 | 43620 |  400100 |  17427993000 |
  5 | 2016-12-26 | 43310 | 43660 | 43090 | 43340 |  358200 |  15547803000 |
  6 | 2016-12-22 | 43660 | 43840 | 43190 | 43480 |  381600 |  16586491000 |
  7 | 2016-12-21 | 43900 | 44370 | 43610 | 44000 |  658900 |  28994316000 |
  8 | 2016-12-20 | 42910 | 43630 | 42860 | 43620 |  499400 |  21606102000 |
  9 | 2016-12-19 | 42790 | 43150 | 42740 | 43130 |  358700 |  15428531000 |
 10 | 2016-12-16 | 43350 | 43550 | 42810 | 43130 |  542000 |  23380606000 |
 11 | 2016-12-15 | 43440 | 43880 | 42550 | 43000 |  627400 |  27055034000 |
 12 | 2016-12-14 | 43300 | 43440 | 42590 | 43090 |  548800 |  23600236000 |
 13 | 2016-12-13 | 43130 | 43300 | 42630 | 43210 |  434500 |  18658982000 |
 14 | 2016-12-12 | 43950 | 44000 | 42880 | 43130 |  775300 |  33633233000 |
 15 | 2016-12-09 | 41700 | 42970 | 41150 | 42590 | 1975600 |  83251556000 |



-- 5. set the value of that new column


UPDATE 1226
 id |   dates    | open  | high  |  low  | close | volume  | stocktrading | rand
----+------------+-------+-------+-------+-------+---------+--------------+-------
  1 | 2016-12-30 | 42120 | 42330 | 41700 | 41830 |  610000 |  25628028000 | Hello
  2 | 2016-12-29 | 43000 | 43220 | 42540 | 42660 |  448400 |  19188227000 | Hello
  3 | 2016-12-28 | 43940 | 43970 | 43270 | 43270 |  339900 |  14780670000 | Hello
  4 | 2016-12-27 | 43140 | 43700 | 43140 | 43620 |  400100 |  17427993000 | Hello
  5 | 2016-12-26 | 43310 | 43660 | 43090 | 43340 |  358200 |  15547803000 | Hello
  6 | 2016-12-22 | 43660 | 43840 | 43190 | 43480 |  381600 |  16586491000 | Hello
  7 | 2016-12-21 | 43900 | 44370 | 43610 | 44000 |  658900 |  28994316000 | Hello
  8 | 2016-12-20 | 42910 | 43630 | 42860 | 43620 |  499400 |  21606102000 | Hello
  9 | 2016-12-19 | 42790 | 43150 | 42740 | 43130 |  358700 |  15428531000 | Hello
 10 | 2016-12-16 | 43350 | 43550 | 42810 | 43130 |  542000 |  23380606000 | Hello
 11 | 2016-12-15 | 43440 | 43880 | 42550 | 43000 |  627400 |  27055034000 | Hello
 12 | 2016-12-14 | 43300 | 43440 | 42590 | 43090 |  548800 |  23600236000 | Hello
 13 | 2016-12-13 | 43130 | 43300 | 42630 | 43210 |  434500 |  18658982000 | Hello
 14 | 2016-12-12 | 43950 | 44000 | 42880 | 43130 |  775300 |  33633233000 | Hello
 15 | 2016-12-09 | 41700 | 42970 | 41150 | 42590 | 1975600 |  83251556000 | Hello
 
 
 
 
-- 6. show only the unique (non duplicates) of a column of your choice


volume

---------
  697200
  384000
  910800
  464500
 1089400
 1321200
  502800
  618800
  483600
  619500
  263200
  610900
  556000
  521000
  733900
(15 rows)




-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 

 volume  |         avg
---------+---------------------
  697200 |  69120.000000000000
  384000 |  35970.000000000000
  910800 | 118400.000000000000
  464500 |  67410.000000000000
 1089400 |  57700.000000000000
 1321200 |  70350.000000000000
  502800 | 122190.000000000000
  618800 |  49620.000000000000
  483600 |  94675.000000000000
  619500 |  62895.000000000000
  263200 |  66220.000000000000
  610900 |  34010.000000000000
  556000 |  67300.000000000000
  521000 |  73930.000000000000
  733900 |  36920.000000000000
(15 rows)



-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups 



 volume  |         avg
---------+---------------------
  697200 |
  384000 |
  910800 | 118400.000000000000
  464500 |
 1089400 |
 1321200 |
  502800 | 122190.000000000000
  618800 |
  483600 |  94675.000000000000
  619500 |
  263200 |
  610900 |
  556000 |
  521000 |
  733900 |
(15 rows)


-- 9. Finding Max of High Values
max

-------
 61970
(1 row)



-- 10. Finding Max of Low Values
  max
  
-------
 60740
(1 row)


-- 11. Finding Min of High Values

  min
  
-------
 13840
(1 row)



-- 12. Finding Mean of High Values

avg

--------------------
 34178.784665579119
(1 row)







