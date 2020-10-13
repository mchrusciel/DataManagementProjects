-- Feel free to use the sql in the slides to 
-- construct your staging table. The code
-- sourced from the slides is below.
DROP TABLE IF EXISTS staging_caers_event;
CREATE TABLE staging_caers_event 
(
	-- artificial primary key
    caers_event_id serial primary key,

	-- note that there are dup report_id's
    report_id varchar(255),

	-- used some loose types for the text
	-- fields, but these can be tightened
	-- up in the eventual target tables
    created_date date,
    event_date date,
    product_type text,
    product text,
    product_code text,
    description text,
    patient_age integer,
    age_units varchar(255),
    sex varchar(255),
    terms text,
    outcomes text
);
