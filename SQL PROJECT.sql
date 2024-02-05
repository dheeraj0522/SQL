
#a.CreateaschemanamedTravegoandcreatethetablesmentionedabovewiththementionedcolumnnames.Also,declaretherelevantdatatypesforeachfeature/columninthedataset.
create database Travego;
use Travego;

create table passenger(
passenger_id int,
passenger_name varchar(25),
category varchar(21),
gender varchar(15),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(25)
);

create table price(
passenger_id int,
bus_type varchar(25),
distance int,
price int
);

#Insert the data in the newly created tables.
insert into passenger values(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');


insert into price values(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

select * from passenger;
select * from price;

# 1) How many female passengers traveled a minimum distance of 600 KMs? 
select count(*) as minimum_distance  from passenger where distance < 600 and gender='F';

# 2) Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus?
select * from passenger where distance>500 and bus_type='Sleeper';

# 3)  Select passenger names whose names start with the character 'S'?
select * from passenger where passenger_name like "s%";

# 4) Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,Destination City, Bus type, 
# and Price in the output?

select  * from passenger left join price
on passenger.passenger_id=price.passenger_id;


# 5) What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? 
select * from price;
select passenger_name from passenger inner join price
on passenger.passenger_id = price.passenger_id
 where price.distance>1000 and price.bus_type='Sitting';
 



# 6) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select * from passenger left join price
on passenger.passenger_id = price.passenger_id
where passenger_name = "pallavi";



#  7) Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
set sql_safe_updates=0;
update passenger set category="NoN-AC" where bus_type = "Sleeper";
select * from passenger;



# 8) Delete an entry from the table where the passenger name is Piyush and commit this change in the database?
delete from passenger where passenger_name = "piyush";
select * from passenger;
commit;

# 9)  Truncate the table passenger and comment on the number of rows in the table (explain if required)?
truncate table passenger;
select * from passenger;
select count(*) from passenger;

# 10) Delete the table passenger from the database?
drop table  passenger;
select * from passenger;

#                                                         THANK YOU