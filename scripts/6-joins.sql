select dep.dept_no, dep.dept_name, manager.emp_no
from departments dep # 9 wierszy. Brak nulli
join dept_manager manager on manager.dept_no=dep.dept_no; #24, nie ma nulli. Wziete wszystko i zmatchowane

# Extract a list containing information about all
# managers’ employee number, first and last name,
# department number, and hire date.

select man.emp_no, man.dept_no, e.first_name, e.last_name, e.hire_date
from dept_manager man
join employees e on man.emp_no = e.emp_no;

# duplicate rows - mozna zgrupowac po wartosci po ktorej joinowalismy

# left join = left outer join
select dep.dept_no, dep.dept_name, manager.emp_no
from departments dep
left join dept_manager manager on manager.dept_no=dep.dept_no
order by dep.dept_no; # order po tym co we from!


#czesc zewnetrzna joina, where prawy null
select dep.dept_no, dep.dept_name, manager.emp_no
from departments dep
left join dept_manager manager on manager.dept_no=dep.dept_no
where manager.dept_no IS NULL;


# Join the 'employees' and the 'dept_manager'
# tables to return a subset of all the employees
# whose last name is Markovitch.
# See if the output contains a manager with that name.
select *
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no
where e.last_name='Markovitch'
#and dm.emp_no is null # prawa strona

select e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary > 145000;

# Select the first and last name, the hire date,
# and the job title of all employees whose first name
# is “Margareta” and have the last name “Markovitch”.
select e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t on e.emp_no = t.emp_no
where e.first_name='Margareta' and e.last_name='Markovitch';

# cross join - will take values from certain table
# and connect with all values from another
# connect all, not only which matches.
# cartesian product of values of sets
# good for not connected tables.
# wypisuje kombinacje
select * from dept_manager dm
cross join departments d;

# can be done with old join syntax:
select * from dept_manager dm, departments d;
# or even join without join condition
select * from dept_manager dm join departments d;

# kazdy z kazdym dep + (deptmanager + emplo)
select * from departments d
 cross join dept_manager dm
 join employees e on dm.emp_no = e.emp_no;

# average salaries of man end women in the company
select e.gender, avg(s.salary)
from salaries s
join employees e on s.emp_no = e.emp_no
group by e.gender;

# names of managers, hire date, date of promotion to manager and dept name
select e.first_name, e.last_name, e.hire_date, dm.from_date, d.dept_name
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no;

# Select all managers’ first and last name,
# hire date, job title, start date, and department name.
select e.first_name, e.last_name, e.hire_date, t.title, dm.from_date, d.dept_name
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join titles t on e.emp_no = t.emp_no and t.from_date=dm.from_date
join departments d on dm.dept_no = d.dept_no;

# average salaries of managers in each dept
select d.dept_name, avg(s.salary) as average_salary
from salaries s
join dept_manager dm on s.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
group by d.dept_name
having average_salary > 70000
order by average_salary;

# how many male and how many female
# managers do we have in the ‘employees’ database?
select e.gender, count(dm.emp_no) #count(*) to samo
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
group by e.gender;