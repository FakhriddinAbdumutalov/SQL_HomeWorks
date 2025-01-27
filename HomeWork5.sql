use ForLesson5
go
--HomeWork Return people who get the 2nd highest salaries in each departments

create table employees (
    department_id int,
    employee_name varchar(50),
    salary decimal(10, 2)
);

insert into employees (department_id, employee_name, salary)
values 
(1, 'alice', 9000),
(1, 'bob', 8500),
(1, 'charlie', 8500),
(2, 'dave', 7000),
(2, 'eve', 6000),
(2, 'frank', 5000);

select * from employees

select department_id, employee_name, salary
from (
    select 
        department_id, 
        employee_name, 
        salary,
        dense_rank() over (partition by department_id order by salary desc) as rank
    from employees
) ranked_salaries
where rank = 2;

