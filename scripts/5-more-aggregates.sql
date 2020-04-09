select count(distinct from_date)
from salaries;

#count(*) will include nulls, count(from_date) does not!

select sum(salary) as totalSalaries from salaries;

select sum(salary)
from salaries
where from_date > '1997-01-01';

select max(salary) as maxSalaryWeOffer from salaries;

select avg(salary) from salaries;
select round(avg(salary),2) as roundedToTwoPlaces from salaries;

# allow nulls
ALTER TABLE departments_duplicate
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

INSERT INTO departments_duplicate(dept_no)
VALUES ('d010'), ('d011');

ALTER TABLE departments_duplicate
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

#ifnull - provides default
select dept_no,
       ifnull(dept_name, 'Department name not provided') as dept_name
from departments_duplicate;

# ifnull == coalesce z dwoma parametrami
# coalesce - ifnull with more parameters allowed
# will provide single value, first non null value from list (from left to right)
#  NIE ZMIENIA DANYCH
select dept_no,
       coalesce(dept_name, 'Department name not provided') as dept_name
from departments_duplicate;

select dept_no,
       dept_name, # not needed for working, just for visualisation
       coalesce(dept_manager, dept_name, 'N/A') as dept_manager
# takes dept_manager, if null, then dept_name, if null - N/A
from departments_duplicate;

select dept_name, dept_no,
       coalesce('department manager value') as fake_column
from departments_duplicate;

