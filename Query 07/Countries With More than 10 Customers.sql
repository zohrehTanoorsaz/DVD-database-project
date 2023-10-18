select country, count(*) as customercountrynumber
from customer
join address on customer.address_id = address.address_id
join city on city.city_id = address.city_id
join country on country.country_id = city.country_id
group by country
Having count(*) >=10
order by customercountrynumber desc