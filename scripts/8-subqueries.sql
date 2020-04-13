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