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
DESC[db_sakila]table_address;
