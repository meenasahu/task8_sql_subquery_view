
create view sales_customer_product_details as 
select s.product_id , p.product_name, s.customer_id ,  c.customer_name ,
sum(s.sales) as "sum_of_sales", sum(s.profit) as "sum_of_profit", sum(s.quantity) as "sum_of_quantity",
sum(s.discount) as "sum_of_discount"
from sales as s
inner join customer as c
on s.customer_id = c.customer_id
inner join product as p
on s.product_id = p.product_id
group by s.product_id , p.product_name, s.customer_id ,  c.customer_name 
order by sum(sales)

select * from sales_customer_product_details

--alter, drop
	
alter table sales_customer_product_details drop column customer_id

--delete
	
delete from sales_customer_product_details where customer_id ='ZC-21910'


--subquery--

select order_line,sales ,customer_name from sales as s 
inner join customer as c 
on c.customer_id=s.customer_id  

select order_line, sales,(select customer_name from customer as c where c.customer_id=s.customer_id)from sales as s 

select * from customer
	
select sum(sales), product_id,
	(select product_name from product as p where p.product_id = s.product_id)
	from sales as s group by product_id having sum(sales)>1.6 

