-- write your queries underneath each number:
 
-- 1. the total number of rows in the database
SELECT COUNT(*)
FROM uniqlostocks;



-- 2. show the first 15 rows, but only display 3 columns (your choice)

SELECT dates, high, low
FROM uniqlostocks
LIMIT 15;


-- 3. do the same as above, but chose a column to sort on, and sort in descending order
SELECT dates, high, low
FROM uniqlostocks
ORDER BY high DESC
LIMIT 15;

-- 4. add a new column without a default value

ALTER TABLE uniqlostocks
ADD rand varchar(50);
    
SELECT * FROM uniqlostocks
LIMIT 15;
-- 5. set the value of that new column


UPDATE uniqlostocks
SET rand = 'Hello';
SELECT * FROM uniqlostocks
LIMIT 15;




-- 6. show only the unique (non duplicates) of a column of your choice
SELECT DISTINCT volume
FROM uniqlostocks
LIMIT 15;


-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 


SELECT volume, avg(high+low)
FROM uniqlostocks
WHERE volume>50000
GROUP BY volume
LIMIT 15;




-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups 
SELECT volume, avg(high+low)
FILTER (WHERE high > 37500)
FROM uniqlostocks
WHERE volume>50000
GROUP BY volume
LIMIT 15;



-- 9. Finding Max of High Values
SELECT MAX(high)
FROM uniqlostocks;

-- 10. Finding Max of Low Values
SELECT MAX(low)
FROM uniqlostocks;

-- 11. Finding Min of High Values
SELECT MIN(high)
FROM uniqlostocks;

-- 12. Finding Mean of High Values
SELECT AVG(high)
FROM uniqlostocks;

ALTER TABLE uniqlostocks
DROP COLUMN rand;
