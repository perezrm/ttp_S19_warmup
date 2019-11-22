-- SEE HOW MANY YOU CAN GET THROUGH BY 10am :) 

--1 What's the title and ID of the longest film?
-- BONUS points if you use a subquery :)
/*
     title     | film_id | length 
---------------+---------+--------
 Chicago North |     141 |    185
(1 row)
**/
SELECT title, film_id, length 
FROM film
WHERE length > (SELECT AVG(length) AS avg_length 
                FROM film)
ORDER BY length DESC
LIMIT 1;


--2 What is the title and ID of the film with the lowest replacement cost?
-- BONUS points if you use a subquery :)
/*
title            | film_id | replacement_cost 
-----------------------------+---------+------------------
 Sting Personal              |     846 |             9.99
 Factory Dragon              |     299 |             9.99
 Gunfighter Mussolini        |     389 |             9.99
 Sun Confessions             |     863 |             9.99
 Papi Necklace               |     656 |             9.99
*/
SELECT title, film_id, replacement_cost
FROM film
ORDER BY replacement_cost;


-- Subquery Corrected --
SELECT title, film_id, replacement_cost
FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film);


-- AB Subquery Missing information--
SELECT title, film_id
FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film);


--3 What is the tile and ID of the film with the highest rental_rate?

SELECT title, film_id, rental_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

--4 Show the payment_id's of all transactions after or on May 1st 2007

SELECT payment_id
FROM payment
WHERE payment_date >= '05/01/2007';


--5 Show all payment ID's and payment date's with a transaction amount less than $3.

SELECT payment_id, payment_date, amount
FROM payment
WHERE amount < '3';

/*********** Finish the above in an hour ******************/


--6 Get the emails of all customers that shop at store 1 that are inactive (use 'active')
/*
 store_id |                email                | inactive 
----------+-------------------------------------+----------
        1 | sheila.wells@sakilacustomer.org     |        0
*/
SELECT store_id, email, active AS "inactive"
FROM customer
WHERE store_id = 1 AND active = 0;


/*** AB Answer ***/
SELECT customer_id, email, active
From customer
WHERE store_id = 1 AND active = 0
ORDER BY last_update;


--7 How much have these customers spent?
-- (Use code from the previous query to make a subquery or a CTE to solve this one.)

/******  CTE Syntax

[ WITH <common_table_expression> [ ,...n ] ]  
  
<common_table_expression>::=  
    expression_name [ ( column_name [ ,...n ] ) ]  
    AS  
    ( CTE_query_definition )
 */

 /*
 customer_id |  sum   
-------------+--------
         406 | 121.69
         271 |  56.84
         124 |  57.86
         482 | 125.74
         592 | 111.71
         558 | 135.72
         368 | 139.69
         534 |  81.78
(8 rows)
*/

SELECT customer_id, SUM(amount)
FROM payment 
WHERE customer_id IN
(SELECT customer_id,
From customer
WHERE store_id = 1 AND active = 0
ORDER BY last_update)
GROUP BY customer_id;


SELECT store_id, email, active AS "inactive"
FROM customer
WHERE store_id = 1 AND active = 0;


SELECT title, film_id, replacement_cost
FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film);























  