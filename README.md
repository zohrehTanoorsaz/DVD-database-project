# DVD database project
 DVD database project
DVD Rental

 
**Can Tek** <br />
**Data Analysis**<br />
**Instructor: Will Edward**<br />

**SQL Project**<br />
**Database: DVD Rental**<br />
**Platform: PostgreSQL**<br />

**Zohreh Tanoorsaz**<br />
**October 16, 2023**<br />

 
**Introduction to the SQL Project - DVD Rental Database**

The SQL project at hand revolves around a comprehensive database for DVD rentals. This project focuses on the management of DVD rental activities through an SQL database, and it encompasses ten distinct queries designed to interact with this dataset.

**Project Specifications:**

Database Description: The project centers on a DVD rental database, which is designed to store and manage essential data related to DVD rentals. It includes information about customers, DVDs available for rent, and rental transactions. This database acts as a central repository for efficiently managing rental operations.

Ten SQL Queries: The core of this project involves ten predefined SQL queries, each serving a unique purpose. These queries are meticulously crafted to extract and analyze data from the DVD rental database. They allow you to retrieve information, generate insights, and optimize decision-making based on the available data.

**The Ten Queries:**

1.	DVD Rental and Payment Statistics in Each Country
2.	DVD Rental Statistics in Each Country and City
3.	Popularity of Movie Categories Available for Rent
4.	Count of Rentals for Films Starring Actors
5.	Count of Actors in Each Film
6.	Analysis of DVD Rental Durations
7.	Analysis of Customer Counts by Country
8.	Analysis of Film Types in the Database
9.	Customer's Favorite Film Categories
10.	Analysis of Films with female-centric (Woman) stories

**Query 01 Description: DVD Rental and Payment Statistics in Each Country**

This SQL query is designed to provide comprehensive statistics on DVD rentals and payments within each country. To achieve this, it leverages a temporary table, "Temp_Rental," that consolidates data from various related tables. The query combines information from the "country," "city," "address," "customer," "rental," and "payment" tables, linking them through a series of JOIN operations.
Here's a breakdown of what the query accomplishes:

1.	Temporary Table (Temp_Rental): This section sets up a temporary table by pulling together essential details related to DVD rentals and payments. The selected data includes the country and city information, customer names, rental details (such as rental ID, rental date, and return date), and payment amounts. This consolidation streamlines subsequent analysis.
2.	Main Query: The primary objective of this query is to provide statistics for DVD rentals and payments within each country. It groups the data in the "Temp_Rental" table by the unique country identifiers (country_id) while also retaining the country name. The query then calculates two essential statistics for each country:
•	Country Count: This represents the total number of DVD rentals made in each country.
•	Sum Payment: This reflects the cumulative payment amount collected from DVD rentals in each country.
3.	Sorting and Presentation: The results are presented in descending order based on the "Country Count." This means that countries with the highest number of DVD rentals will appear at the top of the list.

In summary, this query provides an insightful overview of DVD rental and payment statistics, allowing you to identify which countries have the most active DVD rental markets, as well as the total revenue generated from these rentals. These insights can be valuable for decision-making, resource allocation, and marketing strategies in the context of DVD rental services.


**Query 02 Description: DVD Rental Statistics in Each Country and City**

This SQL query is an in-depth analysis of DVD rental statistics, providing insights into the popularity of renting movies in different countries and cities. To achieve this, it uses a series of temporary tables and consolidates data from various related tables. Here's a step-by-step explanation of what the query accomplishes:

1.	Temporary Table (Temp_Rental): The query begins by creating a temporary table, "Temp_Rental," which combines data from multiple tables, including "country," "city," "address," "customer," "rental," and "staff." This consolidation brings together information about the country, city, address, customer names, rental details, and staff details.
2.	Temporary Table (Temp_CountryRental): This section further refines the data by creating another temporary table, "Temp_CountryRental." It calculates the number of DVD rentals for each country. The table includes the country's unique identifier, name, and the count of rentals. The results are sorted in descending order of rental count.
3.	Temporary Table (Temp_CityRental): Similarly, a temporary table, "Temp_CityRental," is created to calculate the number of DVD rentals in each city within a country. It includes the country identifier, city identifier, city name, and the count of rentals. Like the previous table, the results are sorted in descending order of rental count.
4.	Main Query: This section provides the main query results by combining information from "Temp_CountryRental" and "Temp_CityRental." It pairs each country with its corresponding city's rental statistics, allowing you to identify the most popular cities within countries for DVD rentals.

Additionally, this query includes a descriptive comment that provides an overview of the countries with significant movie rental interest, such as India, China, and the United States, and countries with less interest, like American Samoa, Afghanistan, and Tonga. These comments offer a qualitative perspective on the data.
The query concludes by presenting the combined results, showing the countries with the highest DVD rental counts and the cities with the most rental activity within those countries. This information can be invaluable for tailoring marketing strategies and understanding where DVD rentals are most popular.

**Query 03 Description: Popularity of Movie Categories Available for Rent**


This SQL query focuses on analyzing the popularity of different movie categories available for rent. To achieve this, it utilizes a temporary table, "Temp_AllFilms," which consolidates data from several interconnected tables. Here's a step-by-step explanation of the query:
1.	Temporary Table (Temp_AllFilms): The query begins by creating a temporary table, "Temp_AllFilms," which consolidates data from multiple tables, including "category," "film_category," "film," "inventory," "rental," and "payment." This consolidation brings together information about film categories, films within those categories, rental transactions, and payment details.
2.	Main Query: The primary purpose of this query is to identify the popularity of movie categories based on rental activity. It groups the data in the "Temp_AllFilms" table by the category name and calculates two key statistics:
•	Rental Count: This represents the total number of times movies from each category have been rented.
•	Sum Payment: This shows the cumulative payment amount collected from rentals in each category.
The results are then presented in ascending order, sorted by the rental count, which enables you to identify the most popular movie categories for rentals.
In summary, this query provides a valuable insight into which movie categories are in high demand for rental services. It helps to assess customer preferences and aids in making informed decisions regarding inventory, marketing, and promotions tailored to popular movie genres.

**Query 04 Description: Count of Rentals for Films Starring Actors**


This SQL query focuses on determining the count of film rentals for each actor based on their involvement in various films. To achieve this, it uses two sets of temporary tables, "ActorProducts" and "ProductsRental," which consolidate data from actor, film_actor, film, inventory, rental, and payment tables. Here's a step-by-step explanation of the query:
1.	Temporary Table (ActorProducts): The first temporary table, "ActorProducts," is established by selecting data about actors, including their unique identifiers (actor_id), first names, last names, and the count of films they've appeared in. It does so by joining the "actor," "film_actor," and "film" tables and grouping the results by actor_id. The data is sorted in descending order of the film count, allowing you to identify actors with the most film appearances.
2.	Temporary Table (ProductsRental): The second temporary table, "ProductsRental," focuses on determining the count of film rentals involving the same actors. It calculates the rental count by joining the "actor," "film_actor," "film," "inventory," "rental," and "payment" tables. Like the previous table, the results are grouped by actor_id and ordered in descending order of rental count.
3.	Main Query: This section of the query combines data from the "ActorProducts" and "ProductsRental" temporary tables to present a comprehensive view of actors and their film involvement, including:
•	Actor ID: The unique identifier of the actor.
•	First Name: The actor's first name.
•	Last Name: The actor's last name.
•	Count of Films: The total number of films the actor has appeared in.
•	Count of Films Rented: The number of films featuring the actor that have been rented.
This combined data allows for an assessment of an actor's popularity and the rental activity related to the films they've starred in. It can be a valuable resource for both performance analysis and understanding audience preferences.

**Query 05 Description: Count of Actors in Each Film**

This SQL query focuses on determining the count of actors for each film in the database. To accomplish this, it leverages a combination of data from the "film," "film_actor," and "actor" tables. Here's a step-by-step explanation of the query:

1.	Select Distinct Films: The query starts by selecting distinct films from the "film" table. This ensures that each film is included only once in the result set, eliminating duplicates.
2.	Count of Actors (Window Function): A key feature of this query is the use of a window function to count the actors for each film. It uses the COUNT function combined with the OVER (PARTITION BY) clause to calculate the count of actors for each film. The PARTITION BY clause ensures that the count is calculated separately for each film. The result is displayed as "SumofActors."
3.	Join Operations: The query performs join operations to connect the "film," "film_actor," and "actor" tables. It matches films to actors based on the "film_id" and "actor_id" relationships.
4.	Ordering Results: The final result set is ordered by the "film_id," which organizes the films in ascending order. This arrangement allows for easy navigation and reference.

In summary, this query provides information on the number of actors featured in each film, allowing you to identify films with larger or smaller casts. This data can be valuable for various purposes, such as understanding the complexity of film productions and analyzing audience preferences for films with varying numbers of actors.


**Query 06 Description: Analysis of DVD Rental Durations**

This SQL query is designed to analyze the durations of DVD rentals, providing insights into how long customers rent films. Here's a step-by-step explanation of the query:
1.	Selection of Data: The query starts by selecting a set of relevant data for analysis. It includes the rental ID, customer ID, customer's full name (combining first and last names), film title, rental date, return date, and the calculated length of the rental period.
2.	Join Operations: The query performs several join operations to connect data from multiple tables. It links the "rental" table with the "customer" table using the "customer_id" as the common identifier. It then links the "inventory" table with the "rental" table using the "inventory_id," and finally, it connects the "film" table with the "inventory" table using the "film_id."
3.	Filtering Data: The "WHERE" clause is used to filter out rentals where the return date is not null, ensuring that only completed rentals are considered for analysis.
4.	Grouping Data: The query groups the selected data by rental ID, customer ID, customer's full name, and film title. This grouping ensures that the analysis is performed on unique rental instances.
5.	Calculation of Rental Duration: The query calculates the length of the rental period using the EXTRACT function. It determines the number of days between the maximum return date and the minimum rental date, providing a measure of how long the DVD was rented.
6.	Ordering Results: The final result set is ordered based on three criteria:
•	"Length_of_Rent" in descending order: This orders the rentals by the duration of the rental period, with longer rentals appearing first.
•	"Customerfullname" in descending order: This orders the rentals by customer name in reverse alphabetical order.
•	"Filmtitle" in ascending order: This orders rentals by film title in alphabetical order.
7.	Limiting Results: To manage the size of the result set, the query limits the output to the top 100 records.

In summary, this query provides valuable insights into the rental durations of DVDs, allowing you to identify the longest rentals, customer preferences, and the most popular film titles for extended rentals. This information can be used for inventory management and tailoring rental services to customer needs.


**Query 07 Description: Analysis of Customer Counts by Country**

This SQL query is designed to analyze the number of customers from each country, specifically focusing on countries with a minimum of 10 customers. Here's a step-by-step explanation of the query:
1.	Selection of Data: The query starts by selecting the "country" column from the "customer" table, along with a count of the number of customers in each country. The count is aliased as "customercountrynumber."
2.	Join Operations: The query performs a series of join operations to link data from various tables. It connects the "customer" table with the "address" table using the "address_id" as the common identifier. It then links the "address" table with the "city" table using the "city_id," and finally, it connects the "city" table with the "country" table using the "country_id."
3.	Grouping Data: The query groups the selected data by the "country" column. This grouping allows for the calculation of the count of customers in each country.
4.	Filtering Data (HAVING Clause): The "HAVING" clause is used to filter the results based on a specific condition. In this case, it ensures that only countries with a count of customers equal to or greater than 10 are included in the results.
5.	Ordering Results: The final result set is ordered in descending order based on the "customercountrynumber." This organizes the countries by the number of customers, with the countries having the most customers appearing at the top.

In summary, this query provides a clear overview of the number of customers from each country, focusing on countries with a substantial customer base. The results help identify countries with significant customer presence and can be used for market analysis and targeted marketing strategies.


**Query 08 Description: Analysis of Film Types in the Database**

This SQL query focuses on analyzing the types of films in the database based on their descriptions. The query creates temporary tables for specific film types and calculates the count of each type. Here's a step-by-step explanation of the query:
1.	Temporary Tables: The query creates temporary tables for four specific film types: "Documentary," "Drama," "Panorama," and "Story." Each temporary table is populated with films whose descriptions contain the respective type keyword. For example, the "DocumentaryFilms" table contains films with "Documentary" in their description.
2.	Film Type Counts: The query then creates a temporary table, "FilmTypeTemp," to calculate the counts of films for each film type. It uses a series of "UNION" statements to combine the counts for each film type. The result provides a summary of how many films fall into each type category.
3.	Ordering Results: The "ORDER BY" clause orders the results in descending order based on the count of films. This organizes the film types by the number of films within each category.
4.	Dense Ranking: The query employs the "DENSE_RANK()" window function to calculate a rank for each film type based on the count of films. The ranks are determined in descending order of film count.

In summary, this query provides an overview of the number of films in different categories based on their descriptions. It also assigns a ranking to each film type to identify the most prevalent film types in the database. This information can be valuable for content analysis and marketing strategies, as it helps identify the popularity of specific film types.


**Query 09 Description: Customer's Favorite Film Categories**

This SQL query is designed to identify and list the favorite film categories for each customer based on their rental history. It uses the STRING_AGG function to concatenate the names of categories that the customer has rented films from. Here's a step-by-step explanation of the query:
1.	Selection of Data: The query selects three main pieces of information:
•	customer.customer_id: The unique identifier of the customer.
•	concat(customer.first_name, ' - ', customer.last_name): The full name of the customer, formed by concatenating the first name and last name with a hyphen for readability.
•	STRING_AGG(category.name, ' === ') favoritescategory: This is the core of the query. It uses the STRING_AGG function to aggregate the names of film categories (from the "category" table) that the customer has rented films from. The function concatenates the category names with ' === ' as the separator.
2.	Join Operations: The query connects multiple tables through a series of join operations. It links the "category" table to the "film_category" table using the "category_id." It then links the "film_category" table to the "film" table using the "film_id." Subsequently, the "film" table is joined with the "inventory" table via the "film_id." The "inventory" table is linked to the "rental" table using the "inventory_id," and finally, the "rental" table is connected to the "customer" table through the "customer_id."
3.	Grouping Data: The query groups the results by the unique customer identifier (customer.customer_id) and their full name. This grouping ensures that the final list includes unique customers and their favorite film categories.
4.	Ordering Results: The final result set is ordered primarily by the customer's ID (customer.customer_id) and, as a secondary sorting criterion, by the customer's full name (concat(customer.first_name, ' - ', customer.last_name)). This arrangement helps maintain a structured and easily readable list.

In summary, this query provides insights into the favorite film categories of each customer based on their rental history. It helps identify customer preferences and can be valuable for tailoring movie recommendations, marketing, and other customer-centric strategies in the context of a DVD rental service.

**Query 10 Description: Analysis of Films with female-centric (Woman) stories**


This SQL query is designed to analyze films with the word "Woman" in their description. It provides information about the film's ID, title, the number of rentals it has received, the total rental revenue it generated, and its full text description. Here's a step-by-step explanation of the query:
1.	Selection of Data: The query selects the following data for analysis:
•	film.film_id: The unique identifier of the film.
•	film.title: The title of the film.
•	count(film.film_id) SumofRent: The count of rentals for the film.
•	sum(amount) sumofamount: The total rental revenue generated by the film.
•	film.Fulltext: The full text description of the film.
2.	Join Operations: The query performs a series of join operations to connect data from multiple tables. It links the "film" table with the "inventory" table using the "film_id." The "inventory" table is then connected to the "rental" table using the "inventory_id," and the "rental" table is linked to the "payment" table through the "rental_id."
3.	Filtering Data (WHERE Clause): The "WHERE" clause is used to filter the results. Films are included in the analysis if their full text description, when converted to text (fulltext::text), contains the keyword "Woman" (case-insensitive), as specified by the ILIKE operator.
4.	Grouping Data: The query groups the selected data by the film's unique identifier (film.film_id), title (film.title), and full text description (film.Fulltext). This grouping ensures that each film is included only once in the result set.
5.	Ordering Results: The final result set is ordered in descending order based on two criteria:
•	sumofamount in descending order: This organizes the films by the total rental revenue generated, with films that earned the most appearing at the top.
•	SumofRent (number of rentals) in ascending order: This orders films by the count of rentals in ascending order.
In summary, this query provides valuable insights into films with "Woman" in their descriptions (female-centric stories). It offers details on rental counts and rental revenue, allowing you to identify popular films related to this keyword. This information can be used for content analysis, marketing, and inventory management in a DVD rental service.


**Conclusion:**

These SQL queries provide a comprehensive analysis of DVD rental data, covering various aspects such as rental and payment statistics by country and city, actor film counts, movie category popularity, customer preferences, rental durations, and customer demographics. The results offer valuable insights into rental patterns, film genres, and customer behavior, aiding in content analysis, marketing strategies, and service optimization for a DVD rental business.



