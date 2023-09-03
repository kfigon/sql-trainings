# similar to aggregate functions but on every row
# it does not reduce like group by.

# aggregate window functions - aggregates in context of window
# nonaggregate (ranking and value)

select
    emp_no,
    salary,
    ROW_NUMBER() over(partition by emp_no) as rn # rank each entry for each employee
from salaries;

select
    emp_no,
    salary,
    ROW_NUMBER() over(partition by emp_no order by salary asc) as salary_change_num
from salaries;


# find duplicates of by emp_no and salary, get the most recent one
select *
from (select emp_no,
             salary,
             ROW_NUMBER() over (partition by emp_no, salary order by salary desc ) as salary_change_num
      from salaries) as sal
where sal.salary_change_num = 1

select *, row_number() over (partition by first_name order by last_name asc ) as rn
from employees;

# same but maybe cleaner if using the same window many times:

select *, row_number() over w as rn
from employees
window w as (partition by first_name order by last_name asc)
