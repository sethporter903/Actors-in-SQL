--select the first and last names as columns
select first_name, last_name FROM actor;
--insert first and last name of each actor into single column capitalized
ALTER TABLE actor
ADD 'Actor Name' VARCHAR(30);
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS NAME FROM actor;
--find ID number of actor with first name, last name of actor with joe
SELECT actor_id, last_name, first_name from actor
WHERE first_name= 'joe';
--Find all actors with last name containing letters 'Gen'
SELECT * FROM actor
WHERE last_name LIKE '%Gen%';
--fHELP- SEE IF ANSWER IS RIGHT Find all actors with last name letters containing 'LI', order rows by last then first names
SELECT last_name, first_name FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;  
display 'Country_ID' and 'Country' columns of Afghanistan, Bangladesh, China
Select country_ID FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China')
--Add column "description" to table "actors" and use the datatype "blob"
ALTER TABLE actor
ADD description BLOB;
--Delete the description column
ALTER TABLE actor
DROP COLUMN description;
--List last name of actors and how many actors have specific last name
SELECT last_name FROM actor
--HELP-- IT SHOWS THE COUNT OF DISTINCT LAST NAMES BUT WON'T SHOW THEM
SELECT COUNT(last_name), last_name FROM actor
GROUP BY last_name;
--HELP HELPList last name of actors and the number of actors who have that last name but only for names that share 2 lat names
SELECT COUNT(last_name), last_name FROM actor
GROUP by last_name HAVING COUNT(last_name) >1;


--'HARPO WILLIAMS' WAS ACCIDENTALLY WRITTEN AS 'GROUCH WILLIAMS', FIX IT
--NOTHING IS CHANGED- SAYS I HAVE TO DISABLE SAFE MODE
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
--Create ADDRESS Schema Table
USE sakila;
SHOW CREATE TABLE address;
--use Join to display first, last name, address- use tables staff and address
USE sakila;
SELECT first_name, last_name, address
FROM staff as s
INNER JOIN address as a
ON s.address_id = a.address_id;
--Use `JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`.
USE sakila;
SELECT first_name, last_name, SUM(amount)
FROM staff as s
INNER JOIN payment as p
ON s.staff_id = p.staff_id
GROUP BY p.staff_id;
 --List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join.
 USE sakila;
 SELECT title, actor_id, COUNT(actor_id) 
 FROM film_actor 
 INNER JOIN film
 ON film_actor.film_id = film_actor.film_id;
 GROUP BY film.film_id;
 --6d. HELPPP How many copies of the film `Hunchback Impossible` exist in the inventory system?
 USE sakila;
 SELECT title, COUNTHunchback Impossible';
--tables `payment` and `customer` and the `JOIN` command, list the total paid by each customer (list customers  last name alphabetical)
--I got initial amount by each customer-- but how do I group the sum payments together properly??
USE sakila;
SELECT first_name, last_name,amount SUM(amount)
FROM customer as c
INNER JOIN payment as p
ON c.customer_id = p.customer_id
GROUP by p.customer_id
ORDER by last_name;
--Use subqueries to display the titles of movies starting with the letters `K` and `Q` whose language is English.
USE sakila;
SELECT title, name
FROM film as f
INNER JOIN language as l
ON f.language_id =l.language_id
WHERE title LIKE'%k%' AND title LIKE'%q%';
7b. Use subqueries to display all actors who appear in the film `Alone Trip`.
 