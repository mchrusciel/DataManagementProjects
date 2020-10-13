SELECT customer_first_name, customer_last_name FROM Customer
    WHERE flag = '1';
    
    
SELECT * FROM Scooter
    WHERE taken = '0';
    
    
   
SELECT
   Customer.customer_first_name,
   Customer.customer_last_name,
   Rental.rental_id,
   Rental.manufacturer_id,
   Rental.model_number,
   Rental.return_time
   FROM
   Rental
INNER JOIN Customer ON Rental.rental_id = Customer.rental_id
ORDER BY rent_time DESC;

SELECT
   Customer.customer_first_name,
   Customer.customer_last_name,
   Rental.manufacturer_id,
   Rental.model_number
   FROM
   Rental
INNER JOIN Customer ON Rental.rental_id = Customer.rental_id
WHERE late = '1';
   
   
   
SELECT customer_first_name, customer_last_name, COUNT(Referral.referral_id)
FROM Customer
INNER JOIN Referral ON Customer.referral_id = Referral.referral_id
GROUP BY customer_first_name, customer_last_name
ORDER BY COUNT(Referral.referral_id) DESC
LIMIT 5;


SELECT
   Customer.customer_first_name,
   Customer.customer_last_name,
   Rental.rent_date
   FROM
   Rental
INNER JOIN Customer ON Rental.rental_id = Customer.rental_id


WHERE customer_first_name = 'steve' AND customer_last_name = 'smith';

SELECT
   Customer.customer_first_name,
   Customer.customer_last_name,
   Rental.late_payment,
   Damages.damage_money
   FROM
   Rental
INNER JOIN Customer ON Rental.rental_id = Customer.rental_id
INNER JOIN Rental ON Damages.damage_id = Rental.damage_id


WHERE customer_first_name = 'steve' AND customer_last_name = 'smith';

    
SELECT * FROM Manufacturer;