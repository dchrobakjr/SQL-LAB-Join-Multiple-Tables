# Lab Join Multiple Tables

use sakila;



 #1,
 
 
 
 
SELECT *
FROM sakila.store;

SELECT sakila.store.store_id, sakila.city.city, sakila.country.country
FROM sakila.store
join sakila.address
on sakila.store.address_id = sakila.address.address_id
join sakila.city
on sakila.address.city_id = sakila.city.city_id
join sakila.country
on sakila.city.country_id = sakila.country.country_id;


#2.



SELECT *
FROM sakila.payment;

SELECT *
FROM sakila.store;

SELECT *
FROM sakila.staff;

SELECT sum(sakila.payment.amount) as total, sakila.store.store_id
FROM sakila.store as store
join sakila.staff as staff
on staff.store_id = sakila.store.store_id
join sakila.payment as payment
on staff.staff_id = payment.staff_id
group by sakila.store.store_id;


# 3.



SELECT sakila.category.name, avg(sakila.film.length) as average_length
FROM sakila.film 
join sakila.film_category
on sakila.film.film_id = sakila.film_category.film_id
join sakila.category
on sakila.category.category_id = sakila.film_category.category_id
group by sakila.category.name
order by average_length desc;




# 4.



select category.name, avg(length)
from sakila.film join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by category.name
order by avg(length) desc;





-- 5





SELECT  count(*), sakila.film.title
FROM sakila.film
join sakila.inventory
on film.film_id = inventory.film_id
join sakila.rental
on sakila.inventory.inventory_id = sakila.rental.inventory_id
group by sakila.film.title;





-- 6




SELECT sakila.category.name, sum(sakila.payment.amount)
FROM sakila.category
join sakila.film_category 
on sakila.category.category_id = sakila.film_category.category_id
join sakila.film 
on sakila.film.film_id = sakila.film_category.film_id
join sakila.inventory 
on sakila.inventory.film_id = sakila.film.film_id
join sakila.rental 
on sakila.rental.inventory_id = sakila.inventory.inventory_id
join sakila.payment
on sakila.payment.rental_id = sakila.rental.rental_id
group by sakila.category.name;




-- 7




SELECT sakila.film.film_id, sakila.film.title, sakila.store.store_id, sakila.inventory.inventory_id
FROM sakila.inventory
join sakila.store
on sakila.inventory.store_id = sakila.store.store_id
join sakila.film 
on sakila.film.film_id  = sakila.inventory.film_id
where film.title = 'Academy Dinosaur' and store.store_id = 1;


SELECT * FROM sakila.inventory
join sakila.film on sakila.film.film_id = sakila.inventory.film_id
join sakila.store on sakila.store.store_id = sakila.inventory.store_id
where sakila.film.title = 'ACADEMY DINOSAUR' and sakila.store.store_id = 1;



















