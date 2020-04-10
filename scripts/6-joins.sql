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