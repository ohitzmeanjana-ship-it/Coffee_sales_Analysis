create database ecommerce_store;
use ecommerce_store;	
 
select * from salesdata;
#1
select productname,customername,shippingcost from salesdata order by shippingcost desc limit 10;
#2
select productname,productid,discount from salesdata order by discount desc limit 20; 

#3 high value products
select productname,productid,unitprice from salesdata order by unitprice desc limit 10;

#4 orders with higher quantites
select productname,productid,quantity from salesdata order by quantity desc limit 10;

#5 above 25 % discounted products
select productname,productid,discount from salesdata order by discount<0.25;
select productname,productid,discount from salesdata order by discount>0.05;

#6 high tax value 
select productid,productname ,tax from salesdata order by tax desc limit 50;

#7 toal revenue
select sum( totalamount) from salesdata ;

#8 most canceled product
select productname,productid,orderstatus from salesdata where orderstatus='cancelled';
select productname,productid,orderstatus from salesdata where orderstatus='delivered';
select productname,productid,orderstatus from salesdata where orderstatus='pending';

#9 highest quantity
select productname ,productid,quantity from salesdata order by quantity desc limit 10;
select productname ,productid,quantity from salesdata order by quantity asc limit 10;

#10 max n min sold product by country
select productname,productid, max(country ) from salesdata group by productname,productid ;
select productname,productid, min(country ) from salesdata group by productname,productid;

#11 max sold product by quantity
select productid,productname,sum(quantity) as total_quantity_sold from salesdata group by productid,productname order by total_quantity_sold desc limit 5;

#12 total sales by year
select year(orderdate) as sales_year,sum(quantity) as total_sales from salesdata group by year(orderdate) order by sales_year;

#13 Product with Highest Sales Revenue
select productid,productname,sum(totalamount) as total_sales_revenue from salesdata where orderstatus = 'Delivered' group by  productid, productName order by total_sales_revenue desc limit 5;

#14 Top 10 Customers by Total Spending
select customerid, customername, sum(totalamount) as total_spent from salesdata where orderstatus = 'Delivered' group by customerID, customerName order by total_spent desc limit 10;

#15 Top 10 Customers by Quantity
select customerid,customername, sum(quantity) as total_spent from salesdata where orderstatus = 'Delivered' group by customerid, customername order by total_spent desc limit 10;

#16 Seller with the Highest Revenue
select sellerid,sum(totalamount) as total_revenue from salesdata where orderstatus = 'Delivered' group by sellerid order by total_revenue desc limit 10;

#17 customers who spent more than 1000
select customerid,customername, sum(totalamount) as total_spent from salesdata group by customerid, customername having sum(totalamount) > 1000;

#18 sellers with more than 1500 orders
select productid,productname,count(orderid) as total_orders from salesdata group by productid, productname having count(orderid) > 1500;

#19 Find customers with names containing exactly 5 letters
select customerid, customername from salesdata where customername like '___';

#20 find products starting with s
select productid, productname from salesdata where productname like 's%';

#21 in 
select customername,customerid,country from salesdata where country in ('canada','india');

#22 null values 
select productname ,discount from salesdata where discount is null;

#23 #most used payment method
select paymentmethod, count(orderid) as total_orders from salesdata where orderstatus = 'Delivered' group by paymentmethod order by total_orders desc limit 1;

#24 highest taxable product
select productname,productid,max(tax) as max_taxbyproduct from salesdata group by productid,productname order by max_taxbyproduct desc limit 5;