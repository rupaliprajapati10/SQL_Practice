--------RANK(), DENSE_RANK(), ROW_NUMBER()---------------

USE [SQL Pratice]


with cte as (select *,
RANK() over(partition by ManagerId order by Salary desc) as rn,
dense_rank() over(partition by ManagerId order by Salary desc) as dense_rn,
ROW_NUMBER() over(partition by ManagerId order by Salary desc) as row_no
from Employee)

select * from cte
where row_no=1;


-----------LEAD/LAG-----------

SELECT * from Orders


with year_sales as (
select  DATEPART(MONTH,OrderDate) as order_month,
SUM(Amount) as Sum_Amount,
Region
from Orders
group by Region, DATEPART(MONTH,OrderDate) )

select * ,
lead(Sum_Amount,2,0) over(order by order_month ) as next_year_amount,
lag(Sum_Amount,2,0) over(order by order_month ) as prev_year_amount,
lead(Sum_Amount,2,0) over(partition by region order by order_month ) as prev_year_amount_2
from year_sales
order by order_month




------SELF JOIN -------------------
select e.EmployeeID,e.Name,m.Name as manager_name,e.Salary,m.Salary as manager_salary
from Employee e
inner join Employee m
on e.ManagerID=m.EmployeeID
where e.Salary>m.Salary




---------INTERVIEW QUESTION--------------

create table t1(id int);
create table t2(id int);

insert into t1 values(null);
insert into t2 values(null);

select * from t1
select * from t2


---inner join----
select t1.id as id1,t2.id as id2 from t1
inner join t2
on t1.id=t2.id;


------left join--------
select t1.id as id1,t2.id as id2 from t1
left join t2
on t1.id=t2.id;


----right join ---
select t1.id as id1,t2.id as id2 from t1
right join t2
on t1.id=t2.id;

----full outer join ---------
select t1.id as id1,t2.id as id2 from t1
full outer join t2
on t1.id=t2.id;