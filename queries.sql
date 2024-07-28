-- SQLite
select * from pizza_sales
--Revenue
select sum(total_price) as total_revenue from pizza_sales

--Average Order Value
select sum(total_price)/count(DISTINCT order_id) as avg_order_value from pizza_sales

--Total Pizza sold
Select sum(quantity) as total_pizza_sold from pizza_sales

--Total Orders
select count(DISTINCT order_id) as total_orders from pizza_sales

--Avg Pizza per Order
SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS avg_pizza_per_order
FROM pizza_sales;

--Daily trend for total orders
select date(order_date) as order_day, count(DISTINCT order_id) as total_orders from pizza_sales group by date(order_date)

--Monthly trend for total orders
select datename(month,order_date) as month_name, count(distinct order_id) as Total_orders from pizza_sales group by  datename(month,order_date) order by Total_orders DESC

--percentage sales by pizza category
select pizza_category ,sum(total_price) as total_sales,sum(total_price) *100 /(select sum(total_price) from pizza_sales) as sales_percent 
from pizza_sales  group by pizza_category

--percentage sale by month by pizza category
select pizza_category ,sum(total_price) as total_sales,sum(total_price) *100 /(select sum(total_price) from pizza_sales where month(order_date)=2) as sales_percent 
from pizza_sales where month(order_date)=2 group by pizza_category

--%age sale by piza size
select pizza_size ,sum(total_price) as total_sales,sum(total_price) *100 /(select sum(total_price) from pizza_sales where month(order_date)=2) as sales_percent 
from pizza_sales where month(order_date)=2 group by pizza_size order by sales_percent desc

--top 5 pizza by revenue
select top 5 pizza_name ,sum(total_price) as total_sales from pizza_sales group by pizza_name
order by total_sales desc

--bottom 5 pizza by revenue
select top 5 pizza_name ,sum(total_price) as total_sales from pizza_sales group by pizza_name
order by total_sales asc 

--top 5 pizza by quantity
select top 5 pizza_name ,sum(quantity) as total_quantity from pizza_sales group by pizza_name
order by total_quantity desc

--bottom 5 pizza by quantity
select top 5 pizza_name ,sum(quantity) as total_quantity from pizza_sales group by pizza_name
order by total_quantity