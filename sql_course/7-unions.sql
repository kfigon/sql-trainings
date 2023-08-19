drop table if exists employees_dup;
create table employees_dup(
    emp_no int(11),
    birth_date date,
    first_name varchar(14),
    last_name varchar (16),
    gender enum('F','M'),
    hire_date date
);

insert into employees_dup
select e.* from employees e
limit 20;

# insert duplicate
insert into employees_dup values
(10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

#--------------------------------------------------------
# unions - unite identical organised tables

# Union all - combine few selects into single output
# same number, order, data types and name on columns
select e.emp_no, e.first_name, e.last_name,
       NULL AS dept_no, #dummy columns, so we ca union employees and managers
       NULL AS from_date
from employees_dup e
where e.emp_no=10001
union  all select
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
from dept_manager m;

# union - like union, but removes duplicates - distinct!
select e.emp_no, e.first_name, e.last_name,
       NULL AS dept_no, #dummy columns, so we ca union employees and managers
       NULL AS from_date
from employees_dup e
where e.emp_no=10001
union select
               NULL AS emp_no,
               NULL AS first_name,
               NULL AS last_name,
               m.dept_no,
               m.from_date
from dept_manager m;