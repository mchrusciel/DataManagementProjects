-- Again, this import is sourced from the slides.
-- Feel free to use this as-is. However, you'll
-- have to modify the path to the csv file.
COPY staging_caers_event (
	report_id, created_date, event_date,
	product_type, product, product_code,
	description, patient_age, age_units,
	sex, terms, outcomes)
    FROM 'C:\Users\milko\Desktop\mchrusciel-homework06\CAERSASCII 2014-20190331.csv'
    (FORMAT CSV, HEADER, ENCODING 'LATIN1');
