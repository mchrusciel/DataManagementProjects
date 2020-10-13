DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Referral;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS Addresses;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Scooter;
DROP TABLE IF EXISTS Damages;
DROP TABLE IF EXISTS Manufacturer;
DROP TABLE IF EXISTS Notes;
DROP TABLE IF EXISTS Texts;



CREATE TABLE Addresses(
    address_id serial PRIMARY KEY,
    street_name VARCHAR(100),
    number VARCHAR(30),
    zip VARCHAR(20));
    
CREATE TABLE Contact(
    contact_id serial PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    cell_phone VARCHAR(20) NOT NULL,
    address_id SERIAL REFERENCES Addresses(address_id));
                                                       
 
CREATE TABLE Referral(
    referral_id serial PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30)); 
                      
CREATE TABLE Payment(
    payment_id serial PRIMARY KEY);
                                                       
                
CREATE TABLE Manufacturer(
    manufacturer VARCHAR(100) PRIMARY KEY,
    country varchar(40));

CREATE TABLE Texts(
  text_id serial PRIMARY KEY,
  content TEXT);              
                    
CREATE TABLE Notes(
    notes_id serial PRIMARY KEY,
    text_id serial   REFERENCES Texts(text_id),
    category VARCHAR(40));
                     
CREATE TABLE Damages(
    damage_id serial PRIMARY KEY,
    damage_money MONEY);
    
CREATE TABLE Scooter(
    manufacturer VARCHAR(100)  REFERENCES Manufacturer(manufacturer),
    model_number BIGINT,
    range_in_km BIGINT,
    weight BIGINT,
    condition VARCHAR(255),
    taken BOOL,
    PRIMARY KEY (manufacturer,model_number));
                
                      
                      
CREATE TABLE Rental(
    rental_id serial PRIMARY KEY,
    manufacturer_id VARCHAR(100) NOT NULL,
    model_number SMALLINT NOT NULL,
    rent_date DATE NOT NULL,
    return_date DATE NOT NULL,
    rent_time TIMESTAMP NOT NULL,
    return_time TIMESTAMP NOT NULL,
    hours TIMESTAMP NOT NULL,
    late BOOL,
    damage_id serial   REFERENCES Damages(damage_id),
    prepay BOOL,
    payment MONEY,
    notes_id serial   REFERENCES Notes(notes_id),
    late_payment MONEY,
    CONSTRAINT man_mod FOREIGN KEY (manufacturer_id, model_number) REFERENCES Scooter(manufacturer, model_number));                        
                      
                      
                      
                      

CREATE TABLE Customer(
    customer_id serial PRIMARY KEY,
    customer_first_name VARCHAR(30) NOT NULL,
    customer_last_name VARCHAR(30) NOT NULL,
    first_date DATE NOT NULL,
    referral_id SERIAL   REFERENCES Referral(referral_id),
    rental_id SERIAL   REFERENCES Rental(rental_id),
    contact_id SERIAL   REFERENCES Contact(contact_id),
    payment_id SERIAL   REFERENCES Payment(payment_id),
    flag BOOL);
                     