# 1
select d.dept_name, e.gender, avg(s.salary)
from salaries s
join employees e on s.emp_no = e.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no=de.dept_no
group by e.gender, d.dept_name
order by dept_name, gender;

# 2
select MIN(dept_no), max(dept_no) from dept_emp;

# 3
select e.emp_no,
       (
           select min(de.dept_no)
           from dept_emp de
           where de.emp_no = e.emp_no
        ) as lowest_dept_no,
       case
           when e.emp_no <= 10020 then 110022
           when e.emp_no > 10020 and e.emp_no <= 10040 then 110039
       end as manager
from employees e
where e.emp_no <= 10040;

# 3 inaczej
select e.emp_no,
       min(de.dept_no) as lowest_dept_no,
       case
           when e.emp_no <= 10020 then 110022
           when e.emp_no > 10020 and e.emp_no <= 10040 then 110039
           end as manager
from employees e
join dept_emp de on de.emp_no=e.emp_no
where e.emp_no <= 10040
group by e.emp_no, manager;

# 4
select * from employees where year(hire_date) = '2000';

# 5
select e.emp_no, t.title
from employees e
join titles t on e.emp_no = t.emp_no
where t.title like '%engineer%';

# 6
select e.emp_no, d.dept_name, max(de.from_date)
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
group by e.emp_no, d.dept_name;

# 6 z subquery
select e.emp_no, d.dept_name, de.from_date
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
where
    de.from_date = (
        select max(de.from_date)
        from departments de
        where de.emp_no= e.emp_no
    )
order by e.emp_no;

# 7
select count(*)
from salaries s
where s.salary > 100000
and ((to_date - from_date) >= (60 * 60 * 24 * 7 * 52));