use [SQL Pratice]

----------without CTE-------------

select * from Employee
where Salary>(select avg(Salary) from Employee)

-----------with CTE------------
with avg_salary as (select avg(Salary)as avg_sal from Employee)

select avg_sal from Employee
inner join avg_salary
on Salary>avg_sal;

---------Aggregation-------------
select SUM(Salary) from Employee

select ManagerID,sum(Salary)
from Employee
group by ManagerID


-----------over------------
select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(partition by ManagerID )
from Employee


select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(order by EmployeeID )
from Employee


select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(partition by ManagerID order by EmployeeID )
from Employee





------------------Rows Between-----------------
----preceding and current row----
select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(order by EmployeeID rows between 2 preceding and current row)
from Employee


---preceding and preceding---
select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(order by EmployeeID rows between 2 preceding and 1 preceding)
from Employee

---preceding+current+following
select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(order by EmployeeID rows between 2 preceding and 1 following)
from Employee


----unbounded and current----
select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(order by EmployeeID rows between unbounded preceding and current row)
from Employee


---using partition by----
select EmployeeID,Name,Salary, ManagerID,
SUM(Salary) over(partition by ManagerID  order by EmployeeID rows between 1preceding and current row)
from Employee