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
where avg_salary.avg_salary_val <= s.salary;


# find out how many male employees have never signed a contract with a
# salary value higher than or equal to the all-time company salary average
with avg_salary as (select avg(salary) as avg_salary_val from salaries)
select count(*)
from employees e
join salaries s on e.emp_no = s.emp_no and e.gender = 'M'
cross join avg_salary
where s.salary < avg_salary.avg_salary_val;

# how many female employees highest contract salary were higher than
# all time company salary average?

# 2 CTEs
with avg_salary as (select avg(salary) as avg_salary_val from salaries),
highes_contract_of_females as (
    select e.emp_no, max(s.salary) as salary
    from employees e
    join salaries s on e.emp_no = s.emp_no and e.gender = 'F'
    group by e.emp_no
)
select count(*)
from highes_contract_of_females
cross join avg_salary
where highes_contract_of_females.salary > avg_salary.avg_salary_val;

# same, but with info
with avg_salary as (select avg(salary) as avg_salary_val from salaries),
highes_contract_of_females as (
 select e.emp_no, max(s.salary) as salary
 from employees e
join salaries s on e.emp_no = s.emp_no and e.gender = 'F'
 group by e.emp_no
)
select sum(case when highes_contract_of_females.salary > avg_salary.avg_salary_val then 1 else 0 end) as avg,
       count(*) as total_female
from highes_contract_of_females
cross join avg_salary;

# get highest contract salary values for each employee hired in 2000 or later
with hired_in as (select emp_no from employees where hire_date > '2000-01-01'),
highest_salary as (
    select s.emp_no, s.salary, row_number() over (partition by s.emp_no order by s.salary desc) as rn
    from salaries s
    join hired_in hi on s.emp_no = hi.emp_no
)
select emp_no, salary
from highest_salary
where rn = 1;