--1a.select the first and last names as columns
select first_name, last_name FROM actor;

--1b.insert first and last name of each actor into single column capitalized
ALTER TABLE actor
ADD 'Actor Name' VARCHAR(30);
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS NAME FROM actor;
                    
--2a.find ID number of actor with first name, last name of actor with joe
SELECT actor_id, last_name, first_name from actor
WHERE first_name= 'joe';
                    
--2b.Find all actors with last name containing letters 'Gen'
SELECT * FROM actor
WHERE last_name LIKE '%Gen%';
                    
--2c.Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
SELECT last_name, first_name FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;  

--2d.display 'Country_ID' and 'Country' columns of Afghanistan, Bangladesh, China
Select country_ID FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China')
                    
--3a.Add column "description" to table "actors" and use the datatype "blob"
ALTER TABLE actor
ADD description BLOB;
                    
--3b.Delete the description column
ALTER TABLE actor
DROP COLUMN description;
                    
                    
--4a.List the last names of actors, as well as how many actors have that last name.
SELECT COUNT(last_name), last_name FROM actor
GROUP BY last_name;
                    
--4b.List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name, count(last_name) 
FROM actor
GROUP BY last_name
HAVING count(last_name)>1;

--4c.'HARPO WILLIAMS' WAS ACCIDENTALLY WRITTEN AS 'GROUCH WILLIAMS', FIX IT
UPDATE actor
set first_name = 'HARPO'
WHERE first_name = 'GROUCHO';
select first_name FROM Actor 
ORDER BY first_name ASC;
UPDATE actor
set first_name = 'GROUCHO'
WHERE first_name = 'HARPO'
select first_name FROM Actor 
ORDER BY first_name ASC;
		    
--4d. -- Revert the update on the schema
UPDATE actor
SET first_name = 'GROUCHO', last_name = 'WILLIAMS'  
WHERE (first_name = 'HARPO' AND last_name = 'WILLIAMS')

--5a.locate ADDRESS Schema Table
USE sakila;
SHOW CREATE TABLE address;

--6a.use Join to display first, last name, address- use tables staff and address
USE sakila;
SELECT first_name, last_name, address
FROM staff as s
INNER JOIN address as a
ON s.address_id = a.address_id;

--6b.Use `JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`.
USE sakila;
SELECT first_name, last_name, SUM(amount)
FROM staff as s
INNER JOIN payment as p
ON s.staff_id = p.staff_id
GROUP BY p.staff_id;
 
--6c.List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join.
 USE sakila;
 SELECT title, actor_id, COUNT(actor_id) 
 FROM film_actor 
 INNER JOIN film
 ON film_actor.film_id = film_actor.film_id;
 GROUP BY film.film_id;
 
--6d. How many copies of the film `Hunchback Impossible` exist in the inventory system?
 SELECT title, count(inventory_id)
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
WHERE title = "Hunchback Impossible"
GROUP BY title;

--6e.tables `payment` and `customer` and the `JOIN` command, list the total paid by each customer (list customers  last name alphabetical)
USE sakila;
SELECT first_name, last_name,amount SUM(amount)
FROM customer as c
INNER JOIN payment as p
ON c.customer_id = p.customer_id
GROUP by p.customer_id
ORDER by last_name;

--7a.Use subqueries to display the titles of movies starting with the letters `K` and `Q` whose language is English.
USE sakila;
SELECT title, name
FROM film as f
INNER JOIN language as l
ON f.language_id =l.language_id
WHERE title LIKE'%k%' AND title LIKE'%q%';

--7b. Use subqueries to display all actors who appear in the film `Alone Trip`.
SELECT first_name, last_name
FROM actor
WHERE actor_id IN(SELECT actor_id
				FROM film
				WHERE title = 'Alone Trip');
 
--7c.Canadian email addresses and names of Canadian customers
USE sakila;
SELECT first_name, last_name, email,co.country FROM customer as c
JOIN address as a
ON c.address_id=a.address_id
JOIN city as ci
ON a.city_id=ci.city_id
JOIN country as co
on ci.country_id=co.country_id
WHERE co.country_id=20;

--7d.Identify all movies categorized as _family_ films                    
USE sakila;
SELECT title, description, release_year,ca.name FROM film as f
JOIN film_category as fc
on f.film_id=fc.film_id
JOIN category as ca
ON fc.category_id=ca.category_id
WHERE ca.name="family";

--7e.Display the most frequently rented movies in descending order.
USE sakila;
SELECT f.film_id,title, COUNT(payment_id) as pi FROM film as f
JOIN inventory as i
ON f.film_id=i.film_id
JOIN rental as r
ON i.inventory_id=r.inventory_id
JOIN payment as p
ON r.rental_id=p.rental_id
GROUP BY f.film_id,f.title
ORDER BY pi DESC;
                    
--7f.Write a query to display how much business, in dollars, each store brought in.
SELECT store.store_id, SUM(amount)
FROM store
JOIN customer ON store.store_id = customer.store_id
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY store.store_id;

--7g.Write a query to display for each store its store ID, city, and country.                  
 SELECT store_id, location.city, location.country
FROM store
INNER JOIN(SELECT city, country, address_id
		   FROM address
		   INNER JOIN city ON address.city_id = city.city_id
           INNER JOIN country ON city.country_id = country.country_id) location            
ON location.address_id = store.address_id
GROUP BY store_id;
