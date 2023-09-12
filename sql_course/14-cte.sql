-- common table expressions - get intermediate results from some query

-- get salary contracts signed by female employees have been valued
-- above all time average salary in the company

# 63761.2043
select avg(salary) from salaries;

# this is wrong!!!
select
    e.emp_no,
    s.salary,
    avg(s.salary) over () as avg_salary # window without partition - but these are already females!
from employees e
join salaries s on e.emp_no = s.emp_no
where e.gender='F';

# store avg as a cte
with avg_salary as (select avg(salary) as avg_salary_val from salaries)
select e.emp_no, s.salary, avg_salary.avg_salary_val
from employees e
join salaries s on e.emp_no = s.emp_no and e.gender = 'F'
cross join avg_salary # add cte to all rows (join without 'on')
where avg_salary.avg_salary_val <= s.salary;

# just count them
with avg_salary as (select avg(salary) as avg_salary_val from salaries)
select count(*)
from employees e
join salaries s on e.emp_no = s.emp_no and e.gender = 'F'
cross join avg_salary
where avg_salary.avg_salary_val <= s.salary
