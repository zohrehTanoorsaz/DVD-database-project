--==============================================================
--A: Films Counts grop by Actors
--==============================================================
with ActorProducts
as
(
select actor.actor_id,actor.first_name, actor.last_name, count(film.film_id) as countfilm 
from actor
join film_actor on film_actor.actor_id = actor.actor_id
join film on film.film_id = film_actor.film_id
	
group by actor.actor_id
order by count(film.film_id) desc
),
--==============================================================
--B: Films Counts are Rented and They Have Had payment group by Actors
--==============================================================
ProductsRental as
(
select actor.actor_id, count(film.film_id) as countfilmRented 
from actor
join film_actor on film_actor.actor_id = actor.actor_id
join film on film.film_id = film_actor.film_id
join inventory on inventory.film_id = film.film_id	
	
join rental ON rental.inventory_id = inventory.inventory_id
join payment on payment.rental_id = rental.rental_id
	
group by actor.actor_id
order by count(film.film_id) desc

)
--==============================================================
--Result: All Actors Films with count of rents
--==============================================================
select ActorProducts.actor_id
,ActorProducts.first_name
,ActorProducts.last_name
,ActorProducts.countfilm
,ProductsRental.countfilmRented
from ActorProducts join ProductsRental on ActorProducts.actor_id=ProductsRental.actor_id
