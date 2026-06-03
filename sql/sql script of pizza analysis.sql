create database pizza_db;
use pizza_db;

drop table  if exists pizza_orders;

CREATE TABLE pizza_orders (
    pizza_id INT PRIMARY KEY,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(6,2),
    total_price DECIMAL(8,2),
    pizza_size VARCHAR(10),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);
select * from pizza_orders;

-- what is the total revenue?
select sum(quantity* unit_price) as revenue from pizza_orders;

-- what is average order value 
select sum(total_price)/count(distinct order_id) as AOV from pizza_orders;

-- total pizza_sold
select * from pizza_orders;

select sum(quantity) as total_pizza_sold  from pizza_orders; 

-- total orders;
select  count(distinct order_id) as total_orders from pizza_orders;

-- what is average pizzas per orders
select * from pizza_orders;

select sum(quantity)/ count(distinct order_id) as avg_pizza_per_orders from pizza_orders;  

/* charts Requirement 
Daily trend for  total orders*/

select * from pizza_orders;

select dayname(order_date) as day_name,count(distinct order_id) as total_orders
from pizza_orders
group by 1
order by 1 ;

-- monthly trend for total_orders
select monthname(order_date) as month_name, year(order_date )as year,count(distinct order_id) as total_orders
from pizza_orders
group by 1,2
order by 1;

-- percentage of sales by pizza category
select * from pizza_orders;

select pizza_category,sum(total_price) as tot_sale ,(sum(total_price)/sum(sum(total_price))over()) *100 as percentage
from pizza_orders
where month(order_date) = 1
group by 1;

-- 4 percentage of sales by pizza size
select * from pizza_orders;

select pizza_size,sum(total_price) as tot_rev,round(sum(total_price) * 100 / sum(sum(total_price)) over(),2) as percentage
from pizza_orders 
group by 1;

-- quater 1
select pizza_size,sum(total_price) as tot_rev,round(sum(total_price) * 100 / sum(sum(total_price)) over(),2) as percentage
from pizza_orders 
where quarter(order_date) = 1
group by 1;

-- 5 Total pizza sold by pizza category
 select * from pizza_orders;
 
 select pizza_category ,count(quantity) as tot_pizza
 from pizza_orders
 group by 1;
 
 -- 6 top 5 best sellers by revenue,total quantity and total orders
 select * from pizza_Orders;
 
 select pizza_name,sum(total_price) as tot_rev
 from pizza_orders
 group by 1
 order by 2 desc
 limit 5;
 
 select pizza_name,sum(quantity) as tot_qty
 from pizza_orders
 group by 1
 order by 2 desc
 limit 5;
 
 select pizza_name,count(distinct order_id) as tot_orders
 from pizza_orders
 group by 1
 order by 2 desc
 limit 5;
 
 
 -- 7 bottom 5 best sellers by revenue,total quantity and total orders
 select pizza_name,sum(total_price) as tot_rev
 from pizza_orders
 group by 1
 order by 2 
 limit 5;
 
 select pizza_name,sum(quantity) as tot_qty
 from pizza_orders
 group by 1
 order by 2 
 limit 5;
 
 select pizza_name,count(distinct order_id) as tot_orders
 from pizza_orders
 group by 1
 order by 2 
 limit 5;
 