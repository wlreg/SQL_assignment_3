--Question #1
-- I couldn't find a table that had column for different states, all that was available in test_db was address, city, and country tables.
-- Was not sure which table to reference to get data for 'list all customers who live in state of Texas' as questioned asked

--Question #2
--Get all payments above $6.99 with the customers full name 
select customer.first_name, customer.last_name, amount
from payment
left join customer 
on customer.customer_id = payment.customer_id 
where amount > 6.99
order by amount desc;

--Question #3
--Show all customers who have made payments over $175
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
)
group by first_name, last_name;

--Question #4
--List all customers that live in Nepal
select customer.first_name, customer.last_name, customer.email, country 
from customer 
inner join address 
on customer.address_id = address.address_id 
inner join city 
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id 
where country = 'Nepal';

--Question #5
--Which staff member had the most transactions
select staff.staff_id, staff.first_name, staff.last_name, COUNT(rental_id)
from payment 
inner join staff 
on staff.staff_id = payment.staff_id 
group by staff.staff_id 
order by COUNT(rental_id) desc 
limit 1;


--Question #6
--How many movies of each rating are there
select rating, COUNT(film_id)
from film 
group by rating
order by COUNT(film_id) desc;

--Question #7
--Show all customers who have made a single payment over $6.99
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	where amount > 6.99 
)
group by first_name, last_name;



--Question #8
--How many free rentals did the stores give away
select COUNT(rental_id)
from payment
where amount = 0; 








