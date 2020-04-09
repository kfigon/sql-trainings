insert into  employees
(emp_no, birth_date, first_name, last_name, gender, hire_date) values
(9999999, current_date, 'Jane', 'Doe', 'F', current_date+1);

select * from employees order by emp_no desc;


select * from departments;

create table departments_duplicate(
    dept_no char(4) not null,
    dept_name varchar(40) not null
);

# insert into select!
insert into departments_duplicate
(dept_no, dept_name)
select dept_no, dept_name
from departments
where dept_no >='d005';

select * from departments_duplicate;

