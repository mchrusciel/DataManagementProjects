DROP TABLE IF EXISTS geographic_information;
DROP TABLE IF EXISTS listings;



CREATE TABLE listings(
        id integer primary key,
        name TEXT,
        neighborhood_group VARCHAR(255),
        neighborhood VARCHAR(255),
        room_type TEXT,
        price MONEY,
        minimum_nights INTEGER,
        number_reviews INTEGER,
        last_review DATE,
        reviews_per_month DECIMAL,
        availability INTEGER,
        host_id integer,
        host_name VARCHAR(255),
        calculated_host_list INTEGER
);



CREATE TABLE geographic_information(
        id integer primary key,
        longitude decimal,
        latitude decimal,
        Foreign Key(id) references listings(id)
);





INSERT INTO listings (id,
        name,
        neighborhood_group,
        neighborhood,
        room_type,
        price,
        minimum_nights ,
        number_reviews ,
        last_review,
        reviews_per_month,
        availability,
        host_id ,
        host_name ,
        calculated_host_list )

	SELECT id,
        name,
        neighborhood_group,
        neighborhood,
        room_type,
        price,
        minimum_nights ,
        number_reviews ,
        last_review,
        reviews_per_month,
         availability,
        host_id ,
        host_name ,
        calculated_host_listings FROM stagings_listings;


INSERT INTO geographic_information(
 id ,
longitude ,
        latitude )
SELECT id, longitude, latitude from stagings_listings;



