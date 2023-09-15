-- Use the sakila database to do the following tasks:

-- 1. Show all tables.

SHOW tables FROM sakila;

-- 2. Retrieve all the data from the tables actor, film and customer.
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;
SELECT * FROM sakila.customer;
-- 3. Retrieve the following columns from their respective tables:

-- 3.1 Titles of all films from the film table
SELECT title FROM sakila.film;

-- 3.2. List of languages used in films, with the column aliased as language from the language table
SELECT name as language from sakila.language;
-- 3.3 List of first names of all employees from the staff table
SELECT first_name FROM sakila.staff;
-- 4. Retrieve unique release years.
SELECT distinct(release_year) as Unique_years FROM sakila.film;
SELECT count(distinct(release_year)) as Unique_years FROM sakila.film;
-- 5.Counting records for database insights:

-- 5.1 Determine the number of stores that the company has.
SELECT count(store_id) as Number_of_Stores From sakila.store;

-- 5.2 Determine the number of employees that the company has.
SELECT count(staff_id) as Number_of_employees from sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT count(inventory_id) as Number_of_films from sakila.inventory;
SELECT count(distinct(inventory_id)) as Number_of_films from sakila.inventory;
SELECT count(distinct(film_id)) as Number_of_films from sakila.inventory;
SELECT count(film_id) as Number_of_films from sakila.inventory;
SELECT count(rental_id) as Number_of_rentals from sakila.rental;
SELECT count(inventory_id) as Number_of_rentals from sakila.rental;


-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT count((last_name)) as Actors_last_names from sakila.actor;
SELECT count(distinct(last_name)) as Actors_last_names from sakila.actor;

-- 6. Retrieve the 10 longest films.
SELECT title, length as Duration_in_minutes from sakila.film
ORDER BY length desc
LIMIT 10;

-- 7. Use filtering techniques in order to:

-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name from sakila.actor_info
WHERE (first_name = 'SCARLETT');

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT length as Duration, title from sakila.film
WHERE (title LIKE '%ARMAGEDDON%') AND (length > 100);

-- Hint: use LIKE operator. More information here.
-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT count(title), count(special_features) from sakila.film
WHERE (special_features LIKE '%Behind%');