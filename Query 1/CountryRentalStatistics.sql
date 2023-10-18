--===============================================================
--All DVD Rentals and Payments
--===============================================================
with Temp_Rental
as
(select 
country.country_id, country.country
, city.city_id,city.city
, address.address_id, address.address, address.postal_code
,concat(customer.first_name ,'-', customer.last_name) as Customer_Fullname
, rental.rental_id
,rental.rental_date
,rental.return_date
,payment.amount
from country 
join city on city.country_id = country.country_id
join address on address.city_id = city.city_id
join customer ON customer.address_id = address.address_id
join rental on rental.customer_id = customer.customer_id
join payment on payment.rental_id = rental.rental_id
)
--===============================================================
--DVD rental and payment statistics in each country
--===============================================================
select country_id,country,count(country) as CountryCount,sum(amount) as SumPayment from Temp_Rental 
group by country_id,country
order by count(country) desc