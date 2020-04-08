use employees;
select first_name, last_name from employees;

select * from employees
where gender='M' and first_name='Denis';

# sql wykonuje najpierw AND, potem OR, wiec zlapalo wszystkie kobiety
# kolejnosc warunkow nie ma znaczenia
select * from employees
where first_name='Denis' and gender='M' or gender='F';

select * from employees
where first_name IN ('Cathie', 'Mark', 'Nathan');

