create database project;
use project;
create table customers(
    customer_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    city varchar(50)not null,
    signup_date date
  );
  create table products(
  product_id int primary key auto_increment,
  product_name varchar(100) not null,
  price bigint
  );
  create table orders(
    order_id int primary key auto_increment,
    order_date date,
     customer_id int ,
  foreign key (customer_id) references customers (customer_id)
  );
 create table order_details(
    order_id int,
    product_id int,
    quantity int,
    primary key(order_id, product_id),
    foreign key(order_id) references orders(order_id),
    foreign key(product_id) references products(product_id)
);
  ALTER TABLE products
MODIFY COLUMN price DECIMAL(10,2);
ALTER TABLE order_details
ADD PRIMARY KEY (order_id, product_id);
 ALTER TABLE order_details
MODIFY COLUMN quantity int;

insert into customers(first_name ,last_name,city,signup_date)
values('Rahul','Sharma','Delhi','2024-01-10'),
('Amit','Verma','Mumbai','2024-02-15'),
('Priya','Singh','Kolkata','2024-03-05'),
('Neha','Gupta','Delhi','2024-01-25'),
('Arjun','Mehta','Bangalore','2024-02-20'),
('Sneha','Kapoor','Mumbai','2024-03-12'),
('Rohit','Yadav','Delhi','2024-01-30'),
('Karan','Malhotra','Chandigarh','2024-02-28'),
('Pooja','Agarwal','Kolkata','2024-03-18'),
('Vikas','Saini','Jaipur','2024-01-22'),
('Ankit','Jain','Delhi','2024-02-01'),
('Simran','Kaur','Amritsar','2024-02-05'),
('Manish','Pandey','Lucknow','2024-02-10'),
('Deepak','Chopra','Delhi','2024-02-12'),
('Riya','Das','Kolkata','2024-02-18'),
('Nikhil','Bansal','Jaipur','2024-02-22'),
('Kavita','Mishra','Varanasi','2024-02-25'),
('Suresh','Reddy','Hyderabad','2024-03-01'),
('Meena','Iyer','Chennai','2024-03-03'),
('Aditya','Roy','Kolkata','2024-03-06'),
('Pankaj','Tiwari','Delhi','2024-03-08'),
('Divya','Shukla','Lucknow','2024-03-10'),
('Harsh','Patel','Ahmedabad','2024-03-12'),
('Alok','Srivastava','Kanpur','2024-03-14'),
('Tanvi','Joshi','Pune','2024-03-16'),
('Ramesh','Nair','Kochi','2024-03-18'),
('Sunita','Chauhan','Delhi','2024-03-20'),
('Gaurav','Kumar','Patna','2024-03-22'),
('Isha','Saxena','Noida','2024-03-24'),
('Varun','Thakur','Shimla','2024-03-26');

insert into products(product_name,price)
values('Laptop',60000),
('Smartphone',25000),
('Headphones',2000),
('Keyboard',1500),
('Mouse',800),
('Monitor',12000),
('Tablet',18000),
('Charger',500),
('Speaker',3000),
('Webcam',2500),
('Smartwatch',7000),
('Printer',15000),
('Router',3500),
('External Hard Drive',5000),
('USB Flash Drive',700),
('Gaming Chair',12000),
('Microphone',4000),
('Graphics Card',45000),
('SSD 1TB',8000),
('Cooling Pad',1200);

insert into orders( customer_id,order_date)
values(1,'2024-03-01'),
(2,'2024-03-02'),
(3,'2024-03-03'),
(4,'2024-03-04'),
(5,'2024-03-05'),
(6,'2024-03-06'),
(7,'2024-03-07'),
(8,'2024-03-08'),
(9,'2024-03-09'),
(10,'2024-03-10'),
(11,'2024-03-11'),
(12,'2024-03-12'),
(13,'2024-03-13'),
(14,'2024-03-14'),
(15,'2024-03-15'),
(16,'2024-03-16'),
(17,'2024-03-17'),
(18,'2024-03-18'),
(19,'2024-03-19'),
(20,'2024-03-20'),
(21,'2024-03-21'),
(22,'2024-03-22'),
(23,'2024-03-23'),
(24,'2024-03-24'),
(25,'2024-03-25'),
(26,'2024-03-26'),
(27,'2024-03-27'),
(28,'2024-03-28'),
(29,'2024-03-29'),
(30,'2024-03-30');

insert into order_details(order_id,product_id,quantity)
 values
(1,1,1),(1,3,2),
(2,2,1),
(3,4,1),(3,5,2),
(4,6,1),
(5,7,1),(5,8,2),
(6,2,2),
(7,9,1),
(8,10,1),(8,3,2),
(9,1,1),
(10,5,3),
(11,6,1),
(12,7,2),
(13,8,1),
(14,9,2),
(15,10,1),
(16,2,1),(16,4,1),
(17,3,2),
(18,1,1),
(19,5,2),
(20,6,1),
(21,7,1),
(22,8,3),
(23,9,1),
(24,10,2),
(25,1,1),
(26,2,2),
(27,3,1),
(28,4,2),
(29,5,1),
(30,6,1);

-- queries
-- 1.list all customers from delhi
select * from customers where city="Delhi";
-- 2. list all products sorted by price 
select*from products order by price desc;
-- 3.find total number of customers
select count(*)from customers;
-- 4. find total number of orders
select count(*) from orders;
-- 5. show all orders placed after 2024-03-10
select *from orders where order_date>"2024-03-10";
-- 6. show all customers who placed more than one order
  select c.first_name , c.last_name,count(od.quantity)as Total_orders
from customers c join orders o on c.customer_id=o.customer_id
join order_details od on o.order_id=od.order_id
group by c.customer_id , c.first_name ,c.last_name 
having count(o.order_id)>1;

-- 7.show customers name with their order date   
select c.first_name,c.last_name,o.order_date from customers c 
inner join orders o on c.customer_id=o.customer_id;
-- 8. find total revenue 
select sum(price*quantity) as Total_Revenue
from order_details od join products p on od.product_id=p.product_id;
-- 9.find total quantity sold for each product
select p.product_name,  sum(od.quantity)as Total_quantity_sold
from products p join  order_details od on p.product_id = od.product_id 
group by  p.product_id,p.product_name;
-- 10.find total orders placed by each customers
select c.first_name , c.last_name,count(od.quantity)as Total_orders
from customers c join orders o on c.customer_id=o.customer_id
join order_details od on o.order_id=od.order_id
group by c.customer_id , c.first_name ,c.last_name;

-- 11.find top three customers who spend most money
select c.first_name , c.last_name,sum(p.price*od.quantity)as Total_money
from customers c join orders o on c.customer_id=o.customer_id
join order_details od on o.order_id=od.order_id
join products p on od.product_id=p.product_id
group by c.customer_id,c.first_name,c.last_name order by Total_money desc limit 0,3;

-- 12. find the most sold product
select p.product_name ,sum(od.quantity) as Total_piece_sold
from products p join order_details od on p.product_id=od.product_id
group by p.product_name order by Total_piece_sold desc  ;

-- 13. find revenue generated by each city 
select c.city,sum(p.price*od.quantity)as Total_revenue_city
from customers c join orders o on c.customer_id=o.customer_id
join order_details od on o.order_id=od.order_id
join products p on od.product_id=p.product_id
group by c.city order by Total_revenue_city desc ;
-- 14.first month sales revenue 
select month(o.order_date) as Month ,
sum(p.price*od.quantity)as Total_sale_month
from orders o join order_details od on o.order_id=od.order_id
join products p on od.product_id=p.product_id 
WHERE MONTH(o.order_date) =3
GROUP BY MONTH(o.order_date);
 -- 15. find  the average items per day
 select o.order_date ,Avg(quantity)as average_orders
 from orders o join order_details od on o.order_id=od.order_id
 group by order_date order by average_orders desc;
 
 -- 16.find avrage order value
 SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT o.order_id,
    SUM(p.price * od.quantity) AS order_total
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS temp;

-- 17. find top 5 produccts byy revenue
select p.product_name,  sum(od.quantity*price)as Total_revenue_per_piece
from products p join  order_details od on p.product_id = od.product_id 
group by  p.product_id,p.product_name order by  Total_revenue_per_piece desc limit 5;

-- 18. repeat customers
SELECT c.first_name,c.last_name, COUNT(o.order_i) AS orders_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1; 





  
