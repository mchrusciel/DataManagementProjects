
COPY stagings_listings (
	id,name,host_id,host_name,neighborhood_group,neighborhood,latitude,longitude,room_type,price,minimum_nights,number_reviews,last_review,reviews_per_month,calculated_host_listings,availability)
    FROM 'C:\Users\milko\Desktop\mchrusciel-mini-project\SingaporeListings.csv'
    (FORMAT CSV, HEADER, ENCODING 'UTF8');

