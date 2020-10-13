---------------------
-- Views and Index --
---------------------

-- 1. Views

-- 2. Index

-------------
-- Queries --
-------------

-- 1. Yogurt


select caers_event.caers_event_id,
       caers_event.patient_age,
       caers_event.age_units,
        product_type,
        product_code,
        product

       From caers_event

inner join products on products.caers_event_id = caers_event.caers_event_id
where upper(product) like '%YOGURT%'  and age_units like '%year%'
Order By patient_age desc LIMIT 5;




-- 2. Nightmares

select distinct on (product)
        product_code,
        terms.terms,
        product

From terms

inner join products on products.caers_event_id = terms.terms_id
where upper(terms) like '%NIGHTMARE%'
LIMIT 5;



-- 3. Comma Separated Symptoms

-- 4. Product Name or Not
select caers_event.caers_event_id,
       caers_event.event_date,
       caers_event.report_id,
        product

       From caers_event

inner join products on products.caers_event_id = caers_event.caers_event_id
WHERE EXTRACT(MONTH FROM event_date) = 9 and EXTRACT(YEAR FROM event_date) = 2013
ORDER BY report_id asc;

-- 5. Most Recent

SELECT DISTINCT ON (event_date)
       report_id, event_date, product
FROM   caers_event
inner join products on products.caers_event_id = caers_event.caers_event_id
ORDER  BY event_date DESC NULLS LAST;


-- 6. Event with Most Symptoms

-- 7. Most Common Symptoms

-- 8. Youngest
select caers_event.report_id, product, product_code, CASE
    WHEN age_units like 'year%' THEN patient_age
    WHEN age_units like 'month%' THEN round(patient_age:: decimal / 12, 2)
    WHEN age_units like 'day%' THEN round(patient_age:: decimal / 365, 2)
    ELSE null
END AS age
FROM caers_event
Inner join products on products.caers_event_id = caers_event.caers_event_id
WHERE patient_age is not null
ORDER BY age asc Limit 4;
