select 
customer.customer_id,
concat(customer.first_name,' - ',customer.last_name) CustomerFullname, 
STRING_AGG(category.name, ' === ') favoritescategory

from category
join film_category on film_category.category_id = category.category_id
join film on film.film_id = film_category.film_id
join inventory on inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
join customer on customer.customer_id = rental.customer_id

group by customer.customer_id,concat(customer.first_name,' - ',customer.last_name)
order by customer.customer_id,concat(customer.first_name,' - ',customer.last_name)