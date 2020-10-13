------------------------------
-- populating caers_event --
------------------------------
INSERT INTO caers_event (report_id, created_date, event_date, description,
	patient_age, age_units,
	sex, outcomes)

	SELECT report_id, created_date, event_date, description,
	patient_age, age_units,
	sex, outcomes FROM staging_caers_event;

------------------------------
-- populating products  --
------------------------------
INSERT INTO products ( product_type, product_code, product)
SELECT product_type, product_code, product FROM staging_caers_event;


------------------------------
-- populating caers_terms  --
------------------------------
INSERT INTO caers_terms(caers_event_id)
select caers_event_id from caers_event;
------------------------------
-- populating terms  --
------------------------------
INSERT INTO terms( terms )
SELECT terms FROM staging_caers_event;

Select * FROM terms;