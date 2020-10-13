
CREATE EXTENSION IF NOT EXISTS tablefunc;

-- First, I was curious to see what the most expensive neighborhoods are as well as the types of rooms that could command the highest price
select neighborhood, neighborhood_group, room_type, price from listings
where price = (SELECT MAX(price) from listings)
;


--Further investigation could show that some of the more expensive neighborhoods include those in the west region and the central region of singapore
select neighborhood, neighborhood_group, room_type, price from listings
where price > money(6000)
;


--Calculating the total cost of all listings in singapore - using a function

CREATE OR REPLACE FUNCTION totalPrice()
RETURNS money as $tot$
declare
    tot money;
BEGIN
    Select sum(price) into tot FROM listings;
    return tot;
END;
$tot$ LANGUAGE plpgsql;

Select totalPrice();



--View for a query that looks at price, neighborhoods, and hosts
Drop view listing_view;
CREATE OR REPLACE VIEW listing_view AS

    SELECT
        neighborhood, neighborhood_group,  price, host_id, host_name, room_type,  name
FROM listings;

SELECT * FROM listing_view;



--Below is some extra pieces of tech that we did not cover in class
-- Utilized a cross tab here to help visualize the total prices of properties by the different neighborhood gorups of East, North-east, Central, and West
SELECT *
FROM crosstab(
  'select distinct neighborhood_group, neighborhood, sum(price)
   from listings

   group by  neighborhood_group, neighborhood

  Order BY neighborhood Limit(4)', 'select distinct neighborhood from listings order by 1
                          limit(4)'
   ) AS ct(neighborhood_group varchar(255), sum1 Money,  sum2 Money, sum3 Money, sum4 Money);

