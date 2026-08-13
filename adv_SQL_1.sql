use [SQL Pratice]

select * from Employee

----find the avg salary by managerId-----------
select ManagerID, AVG(Salary) as avg_salary
from Employee
group by ManagerID;


-----------salary more that their department salary  (independent Query)---------------

select e.*, d.avg_salary
from Employee e
inner join (select ManagerID,AVG(Salary) as avg_salary  from Employee group by ManagerID) d
on e.ManagerID=d.ManagerID
where e.Salary>d.avg_salary;


----------correlated query-------------

select * from Employee e1
where Salary>(select avg(e2.Salary) from Employee e2 where e1.ManagerID=e2.ManagerID);

