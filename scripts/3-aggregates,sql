# counts number of non-null records in a column
select count(emp_no) from employees;

# distinct names - inside count
select count(distinct first_name) from employees;

select count(*) from salaries where salary>=100000;

select count(*) from titles where title like '%manager%';

# same as select distinct first_name from employees
select first_name from employees group by first_name;

# group by some aggregate
# group splits results into groups
# always add field from group in select
select first_name, count(first_name) as names_count from employees group by first_name;

select salary, count(emp_no) as emps_with_same_salary
from salaries
where salary >= 80000
group by salary
order by salary;

# having - where dla grup. mozna robic warunki dla funkcji agregujacych,
# czego where nie potrafi
# where daje warunki na pojedyncze wiersze. Warunki sa nadane przed grupowaniem
# having robi sie na grupach
select first_name, count(*) as howManyNameOccurances
from employees
group by first_name
having howManyNameOccurances > 250;
#albo tak:  having count(*) > 250

# pracownicy ze srednia wyplata wieksza niz 120000
# gdyby byl where - wzieloby ludzi tylko z kontraktami wiekszymi
# niz 120000 i wtedy policzylo avg, to nie to samo!
select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary) > 120000;

#extract list of all names that are encourtered less than 200 times
# let the data refer to people hired after 01.01.1999
select first_name, count(*) as names_count # == count(first_name)
from employees
where hire_date > '1999-01-01'
group by first_name
having names_count < 200;

# Select the employee numbers of all individuals who have
# signed more than 1 contract after the 1st of January 2000.
# table - dept_emp
select emp_no, count(*) as how_many_contracts
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(*) > 1;

select *
from salaries
order by salary desc
limit 10;

