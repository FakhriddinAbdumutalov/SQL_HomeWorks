use W3Resource
go
--HomeWork Return people who get the 2nd highest salaries in each departments

--create table employees (
--    department_id int,
--    employee_name varchar(50),
--    salary decimal(10, 2)
--);

--insert into employees (department_id, employee_name, salary)
--values 
--(1, 'alice', 9000),
--(1, 'bob', 8500),
--(1, 'charlie', 8500),
--(2, 'dave', 7000),
--(2, 'eve', 6000),
--(2, 'frank', 5000);

select * from hr.Employees

select department_id, first_name, salary
from (
    select 
        department_id, 
        first_name, 
        salary,
        dense_rank() over (partition by department_id order by salary desc) as rank
    from hr.Employees
) ranked_salaries
where rank = 2; --this is for the second highest salary 

--partition by means the employees ranked among it is department only and we already know order by
--over is as it is name, ranks over some sample code 
/*
What I found is that the code dense_rank is used 
if maltiple employees have the same salary it ensures 
they are all included with the same rank
/*
