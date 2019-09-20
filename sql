-- SEE HOW MANY YOU CAN GET THROUGH BY 10am :) 

-- What's the title and ID of the longest film?
-- BONUS points if you use a subquery :)

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

-- What is the title and ID of the film with the lowest replacement cost?
-- BONUS points if you use a subquery :) 

-- What is the tile and ID of the film with the highest rental_rate?

-- Show the payment_id's of all transactions after or on May 1st 2007

-- Show all payment ID's and payment date's with a transaction amount less than $3.

-- Get the emails of all customers that shop at store 1 that are inactive (use 'active')

--How much have these customers spent? (Use code from the previous query to
-- make a subquery or a CTE to solve this one.)


  