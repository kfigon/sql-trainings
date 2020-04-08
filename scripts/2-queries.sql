use employees;
select first_name, last_name from employees;

select * from employees where gender='M' and first_name='Denis';

# sql wykonuje najpierw AND, potem OR, wiec zlapalo wszystkie kobiety
# kolejnosc warunkow nie ma znaczenia
select * from employees where first_name='Denis' and gender='M' or gender='F';

select * from employees where first_name IN ('Cathie', 'Mark', 'Nathan');

select * from employees where first_name not in ('John','Marc','Jacob');

# case insensitive
select * from employees where first_name like 'Mar%';

select first_name, last_name, hire_date from employees where hire_date like '2000%';

# substitute only one character
select * from employees where first_name like 'Mar_';

select * from employees where emp_no like '1000__';

select * from employees where hire_date between '1990-01-01' and '1992-01-01';

select * from salaries where salary between 66000 and 70000;

select * from employees where first_name is not null;

#  not equal operators: <> !=
select * from employees where hire_date > '2000-01-01';

#  no duplicates
select distinct gender from employees;

select * from employees where gender='F' order by first_name;