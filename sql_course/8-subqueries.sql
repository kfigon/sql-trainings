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
    );

select e.first_name, e.last_name
from employees e
where exists(
    select *
    from dept_manager m
    where m.emp_no = e.emp_no
    );


# Select the entire information for all employees whose
# job title is “Assistant Engineer”.
select *
from employees e
where exists(
    select * from titles t
    where t.emp_no=e.emp_no and t.title='Assistant Engineer'
);

# subquery as part of select
select e.emp_no,
       (
           select dm.emp_no
           from dept_manager dm
           where dm.emp_no=110022
       ) as manager_id
from employees e;

# assign employee number 110022 as a manager to all employees
# from 10001 to 10020, and employee number 110039 as a manager to all
# employees from 10021 to 10040
select e.emp_no,
       110022 as manager_id
from employees e
where e.emp_no between 10001 and 10020
union
select e.emp_no,
       110039 as manager_id
from employees e
where e.emp_no between 10021 and 10040;

# albo inaczej, subquery as part of from:
select A.*
from
     (
        select e.emp_no,
            (
                select dm.emp_no
                from dept_manager dm
                where dm.emp_no=110022
            ) as manager_id
        from employees e
        where e.emp_no between 10001 and 10020
     ) as A

UNION
select B.*
from
    (
        select e.emp_no,
               (
                   select dm.emp_no
                   from dept_manager dm
                   where dm.emp_no=110039
               ) as manager_id
        from employees e
        where e.emp_no between 10021 and 10040
    ) as B;


# (A) UNION (B) UNION (C) UNION (D);
#
# A and B should be the same subsets used in the last lecture
# (SQL Subqueries Nested in SELECT and FROM). In other words,
# assign employee number 110022 as a manager to all employees
# from 10001 to 10020 (this must be subset A),
# and employee number 110039 as a manager to all employees
# from 10021 to 10040 (this must be subset B).
#
# Use the structure of subset A to create subset C,
# where you must assign employee number 110039 as a manager to employee 110022.
#
# Following the same logic, create subset D.
# Here you must do the opposite - assign employee 110022
# as a manager to employee 110039.
#
# Your output must contain 42 rows.


select A.*
from (select e.emp_no,
       110022 as manager_id
from employees e
where e.emp_no between 10001 and 10020) as A

union
select B.*
from (select e.emp_no,
       110039 as manager_id
from employees e
where e.emp_no between 10021 and 10040) as B

union
select C.*
from (select e.emp_no,
             110039 as manager_id
      from employees e
      where e.emp_no =110022 ) as C

union
select D.*
from (select e.emp_no,
             110022 as manager_id
      from employees e
      where e.emp_no =110039 ) as D