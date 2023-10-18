--===============================================================
--DVD rental for all films that we have rental for them
--===============================================================
With Temp_AllFilms
as
(
select * from category
join film_category on film_category.category_id = category.category_id
join film on film.film_id = film_category.film_id
join inventory ON inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
full join payment on payment.rental_id = rental.rental_id

)
--===============================================================
-- category of movies for rent in order of popularity
--===============================================================
select name as categoryname, count(name) RentalCount, sum(amount) as sumpayment
from Temp_AllFilms 
group by name
order by count(name)