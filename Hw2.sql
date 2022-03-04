--Question 1: List all customers who live in Texas (use JOINs)
SELECT  first_name, last_name, address, district
FROM address 
JOIN customer 
ON address.city_id = customer.customer_id
WHERE district = 'Texas'
ORDER BY customer.first_name, customer.last_name;
-- Answer: See the table below

--Question 2: Get all payments above $6.99 with the Customer’s full name
select * from payment; --  ';' bu olmadan error verdi
select * from customer; --  ';' ayni sey bunun icin de gecerli
select first_name, last_name, payment.amount from customer
join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;
-- Answer: See the table below

--Question 3: Show all customer names who have made payments over $175 (use subqueries)
select customer_id, first_name, last_name 
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) >175
	order by sum(amount) desc  -- burada sum(amount) degil de sadece amount yazinca error verdi
);
-- Acaba amount'u da gostermeli miyim?
-- Answer: See the table below

--Question 4: List all customers that live in Nepal (use the city table)
-- 2.soruda yaptiginin yanisini hepsinde yapacak sekilde
select * from customer;
select * from address;
select * from city;
select * from country;
select first_name, last_name, address.address, country from customer
join address
on customer.adress_id = address.address_id 
join city 
on adress.city_id = city.city_id 
join country
on city.country_id = country.country_id 
where country.country = 'Nepal'; -- '' bunu unutuyorsun bazen
--Answer: I can't figure out what I am doing wrong here

--Question 5: Which staff member had the most transactions?
select  staff_id , count(payment_id) as transactions
from payment
group by staff_id 
order by transactions desc 
-- Answer: Jon Stephens, staff_id: 2 with 2, 7304 transactions 

--Question 6: How many movies of each rating are there?
select rating, count(rating)
from film
group by rating 
order by count(rating) desc 
-- Answer: See the table below

--Question 7: Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	where amount > 6.99
);
-- Answer: See the table below

--Question 8: How many free rentals did our stores give away?
select count(payment_id)
from payment
where amount = 0;
-- Answer: 24 
