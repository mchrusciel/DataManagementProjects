-- Write at least 4 sql statements to explore
-- the data in the staging table. Make sure to
-- write a comment above each statement... and
-- add the results of the query in your markdown
-- file.


-- 1. In trying to assess whether this dataset is in first normal form, I've noticed that in the terms column there
-- seem to be a lot of different types of medical conditions. It looks like the information in this column is not
-- at its most atomic level, and I could probably break this column into a separate table with separate conditions
SELECT terms FROM staging_caers_event;


-- 2. This data set decided to break up an age itself and the units of the age i.e. months, days, or years - so
-- if I ever wanted to explore some  aspects of the dataset concerning age, I would need to pay attention to both of these
-- columns
SELECT   patient_age, age_units FROM staging_caers_event;

-- 3. The created_date and event_date columns, both of the date type, are interesting especially once looking at the CAERS documentation
-- It seems as if an event date is not a necessary requirement for a created_date to be created - I'm thinking that if
-- the event date is left empty, there is a more than likely possibility that there isn't going to be patient info like
-- age or sex - it looks like it does occur sometimes but not all the time
SELECT * from staging_caers_event where event_date is null;

-- 4.Like the terms column, it looks like the description column is not at its most atomic level - could be broken out
-- into another table
SELECT description FROM staging_caers_event;

-- Add more if you'd like!

