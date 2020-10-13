

DROP TABLE IF EXISTS stagings_listings;

CREATE TABLE stagings_listings(
        id integer primary key,
        name TEXT,
        host_id integer,
        host_name VARCHAR(255),
        neighborhood_group VARCHAR(255),
        neighborhood VARCHAR(255),
        latitude DECIMAL,
        longitude DECIMAL,
        room_type TEXT,
        price MONEY,
        minimum_nights INTEGER,
        number_reviews INTEGER,
        last_review DATE,
        reviews_per_month DECIMAL,
        calculated_host_listings INTEGER,
        availability INTEGER
);