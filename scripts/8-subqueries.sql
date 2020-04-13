# sql odpala inner, potem outer

# subsquery, inner query, nested query, inner select
# outer query/outer select
select * from dept_manager;
select * from employees_dup;

select e.first_name, e.last_name
from employees e
where e.emp_no IN (
    select dm.emp_no
    from dept_manager dm
);

# Extract the information about all
# department managers who were hired between the
# 1st of January 1990 and the 1st of January 1995.
select e.emp_no, e.last_name, e.first_name, e.hire_date
from dept_manager dm
join employees e on dm.emp_no = e.emp_no
where e.hire_date between '1990-01-01' and '1995-01-01';

select *
from dept_manager dm
where dm.emp_no IN (
        select e2.emp_no from employees e2
        where e2.hire_date between '1990-01-01' and '1995-01-01'
    )
