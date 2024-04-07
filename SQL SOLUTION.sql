select sum(total_price) as total_revenue from pizza_sales
select sum(total_price)/COUNT(distinct order_id) as Avg_order from pizza_sales
select sum(quantity)as total_quantity from pizza_sales
select COUNT(distinct order_id) as Avg_order from pizza_sales
select sum(quantity) / count (distinct order_id) as Avg_per_oder from pizza_sales

select DATENAME(DW, order_date) as order_day ,COUNT(distinct order_id) as Total_order 
from pizza_sales
group by DATENAME(DW, order_date)

select DATENAME(MONTH, order_date) as order_monthly ,COUNT(distinct order_id) as Total_order 
from pizza_sales
group by DATENAME(MONTH, order_date)
order by Total_order desc

select pizza_category,sum(total_price)as total_sales ,sum(total_price)* 100 /
(select sum(total_price) from pizza_sales where month(order_date) =1) as Percentage
from pizza_sales
where month(order_date) =1
group by pizza_category

select pizza_size,cast(sum(total_price) as decimal (10,2))as total_sales ,cast(sum(total_price)* 100 /
(select sum(total_price) from pizza_sales ) as decimal(10,2)) as Percentage
from pizza_sales
group by pizza_size
order by Percentage desc

select  top 5 pizza_name ,sum(total_price) Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue desc

select  top 5 pizza_name ,sum(total_price) Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue asc

select  top 5 pizza_name ,sum(quantity) Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity desc 

select  top 5 pizza_name ,sum(quantity) Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity asc

select  top 5 pizza_name ,count(distinct order_id) Total_order from pizza_sales
group by pizza_name
order by Total_order desc 

select  top 5 pizza_name ,count(distinct order_id) Total_order from pizza_sales
group by pizza_name
order by Total_order asc 