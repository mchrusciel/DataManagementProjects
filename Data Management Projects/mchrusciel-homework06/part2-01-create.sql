
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS terms;
DROP TABLE IF EXISTS caers_terms;
DROP TABLE IF EXISTS caers_event;


CREATE table products(
    caers_event_id SERIAL PRIMARY KEY,
    product_type text,
    product_code text,
    product text,
    Foreign Key(caers_event_id) references caers_event(caers_event_id)

);


CREATE table terms(
terms_id SERIAL,
terms text,
Foreign Key(terms_id) references caers_terms(terms_id)
);

CREATE Table caers_terms(
    caers_event_id SERIAL,
    terms_id SERIAL PRIMARY KEY,
    Foreign Key(caers_event_id) references caers_event(caers_event_id)

);

CREATE table caers_event
(

    -- artificial primary key
    caers_event_id Serial,

	-- note that there are dup report_id's
    report_id varchar(255),

	-- used some loose types for the text
	-- fields, but these can be tightened
	-- up in the eventual target tables
    created_date date,
    event_date date,
    description text,
    patient_age integer,
    age_units varchar(255),
    sex varchar(255),
    outcomes text,
    Primary Key(caers_event_id)
);





Select * from caers_event;
Select * from caers_event;

