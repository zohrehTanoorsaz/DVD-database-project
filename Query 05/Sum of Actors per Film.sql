SELECT distinct
  film.film_id,
  title,
  count(actor.actor_id) OVER (PARTITION BY film.film_id) AS "SumofActors"
FROM film join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id = film_actor.actor_id
order by film.film_id



