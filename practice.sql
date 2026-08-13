create database practice

use practice

create table order_data(
name varchar(50),
roll_no int not null,
sunbject varchar(50) );

insert into order_data values('rupali',103,'maths')
insert into order_data(name,roll_no,sunbject) values('rupali',103,'maths'),('sunil',101,'english'),('mummy',102,'science');


--alter table order_data
--change column sunbject subject varchar(50);
EXEC sp_rename 'order_data.sunbject', 'subject', 'column';

EXEC sp_rename 'order_data.sunbject', 'subject', 'COLUMN';


--drop column
alter table order_data
drop column sunbject;
--drop table order_data;


select * from order_data;


select top 1 name from order_data;

select top 2 * from order_data
order by roll_no desc


select * from order_data
where roll_no between 102 and 103

select * from order_data
where name like '_u%'

select max(roll_no) from order_data

create table return_data(
roll_no int ,
order_name varchar(50) not null);

insert into return_data(roll_no,order_name) values(101,'pen'),(103,'pencil'),(101,'book');

select * from return_data;


--joins

select * from order_data o
inner join return_data r
on o.roll_no=r.roll_no
where o.roll_no=101


