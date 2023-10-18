select 
rental_id,
Customer.Customer_id,
concat(Customer.first_name,' _ ',customer.last_name) as Customerfullname,
film.title as FilmTitle,
rental_date,
return_date,
EXTRACT(DAY FROM MAX(return_date)-MIN(rental_date)) AS Length_of_Rent

from rental join customer on customer.customer_id = rental.customer_id
join inventory on inventory.inventory_id = rental.inventory_id
join film on film.film_id = inventory.film_id

where return_date is not null

group by 
rental_id,
Customer.Customer_id,
concat(Customer.first_name,' _ ',customer.last_name) ,
film.title
order by Length_of_Rent desc, Customerfullname desc, filmtitle asc
limit 100