--===============================================================
--All DVD Rentals 
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
,staff.staff_id
,staff.active
,concat(staff.first_name ,'-', staff.last_name) as Staff_Fullname

from country 
join city on city.country_id = country.country_id
join address on address.city_id = city.city_id
join customer ON customer.address_id = address.address_id
join rental on rental.customer_id = customer.customer_id
join staff on staff.staff_id = rental.staff_id
)
--===============================================================
--DVD rental statistics in each country
--===============================================================
,Temp_CountryRental
as
(
select country_id,country,count(country) as CountryCount from Temp_Rental 
group by country_id,country
order by count(country) desc
)
--===============================================================
--DVD rental statistics in each City 
--===============================================================
,Temp_CityRental
as
(
select country_id,city_id,city,count(city) as Citycount from Temp_Rental 
group by country_id,country,city_id,city
order by count(city) desc
)
--===============================================================
--Statistics of the most DVD rentals in each country by city

--The countries of "India", "China" and the "United States" are among the biggest fans of renting movies.
--"American Samoa", "Afghanistan" and "Tonga" countries are seen with less interest in movie rentals.
--===============================================================
select Temp_CountryRental.country,CountryCount,city_id,city,Citycount 
from Temp_CountryRental join Temp_CityRental on Temp_CountryRental.country_id=Temp_CityRental.country_id
order by CountryCount desc,Citycount desc


