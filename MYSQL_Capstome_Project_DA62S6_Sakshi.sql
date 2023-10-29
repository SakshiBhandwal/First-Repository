use sakila;
-- Task 1 --
select * from actor;
select concat(first_name,' ',last_name) as Full_Name from actor;

-- Task 2 --
-- 1 --
select first_name,count(first_name) as First_Name_Count from actor
group by first_name order by First_Name_Count desc;

-- 2 --
select first_name,count(first_name) as First_Name_Count from actor
group by first_name having First_Name_Count = 1;

-- Task 3 --
-- 1 --
select last_name,count(last_name) as Last_Name_Count from actor
group by last_name order by Last_Name_Count desc;

-- 2 --
select last_name,count(last_name) as Last_Name_Count from actor
group by last_name having Last_Name_Count =1;

-- Task 4 --
-- 1 --
select * from film;
select title as 'Film Title',rating from film where rating
in('R');

select * from customer;
-- 2 --
select title as 'Film Title', rating from film
where rating not in('R');

-- 3 --
select title as 'Film Title',rating from film where rating
in('PG','G');

-- Task 5 --
select * from film;
-- 1 --
select title,replacement_cost from film 
where replacement_cost <= 11;
-- 2 --
select title,replacement_cost from film 
where replacement_cost between 11 and 20;
-- 3 --
select title,replacement_cost from film 
order by replacement_cost desc;

-- Task 6 --
select * from actor;
select * from film_actor;
select f.title as MovieTitle, COUNT(fa.actor_id) AS ActorCount
from film f join film_actor fa 
on f.film_id = fa.film_id
group by f.film_id
order by ActorCount desc limit 3;

-- Task 7 -- 
use sakila;
select title from film where title like 'K%' or title like 'Q%';

-- Task 8 --
 select * from actor;
 select * from film_actor;
 
select a.first_name, a.last_name
from actor a join film_actor fa join film f
on a.actor_id = fa.actor_id and fa.film_id = f.film_id
where f.title = 'Agent Truman';

-- Task 9 --
select * from film;
select * from film_category;
select * from category;

select f.title as MovieTitle, c.name as Category
from film f join film_category fc join category c 
on f.film_id = fc.film_id and c.category_id = fc.category_id
where c.name = 'Family';

-- Task 10 --
select * from film;

select rating,max(rental_rate) as Max_Rate
from film group by rating order by Max_Rate;

select rating,min(rental_rate) as Min_Rate
from film group by rating order by Min_Rate;

select rating,avg(rental_rate) as Avg_Rate
from film group by rating order by Avg_Rate desc;

-- Task 10.2 --

select * from film;

select title as Film_Name, Rental_rate from film 
order by rental_rate desc;

-- Task 11 --

select * from film;
select * from category;
select * from film_category;

select c.name as Category_Name,avg(f.replacement_cost) as Avg_Replacement_Cost,
avg(rental_rate) as Avg_Rental_Cost, avg(f.replacement_cost)-avg(rental_rate) as Difference
from film_category fc join film f  join category c 
on f.film_id = fc.film_id and  c.category_id = fc.category_id
group by c.name having difference >=15;

-- Task 12 --

select * from film;
select * from category;
select * from film_category;

select c.name, count(f.film_id) as Film_Count
from film_category fc join film f  join category c 
on f.film_id = fc.film_id and  c.category_id = fc.category_id
group by c.name having Film_count > 70;