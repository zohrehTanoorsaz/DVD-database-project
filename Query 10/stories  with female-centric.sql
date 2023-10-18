--select Film_Id,title,Fulltext from film
--where fulltext::text Ilike '%Woman%'
--=====================================================
-- Sum of Payment for stories with female-centric 
--=====================================================
select 
 film.film_id
,film.title
,count(film.Film_Id) SumofRent
,sum(amount) sumofamount 
,film.Fulltext 

from film
join inventory on film.film_id=inventory.film_id
join rental on rental.inventory_id=inventory.inventory_id
join payment on payment.rental_id=rental.rental_id

where fulltext::text Ilike '%Woman%'
group by  film.film_id,film.title,film.Fulltext
order by sumofamount desc,SumofRent