select * from emp;

select e1.emp_id,e1.emp_name,e1.salary as employee_salary, e2.salary as manager_salary, e2.emp_name as manager_name
from emp e1
join emp e2
on e1.manager_id = e2.emp_id
where e1.salary > e2.salary
order by e1.emp_id asc


