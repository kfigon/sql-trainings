# wirtualna tabela
# odpowiednio przeksztalcona tabela fizyczna

# wygodny skrot do tworzenia konkretnych selectow
# popularne operacje, zawsze up to date.

# praca jak na tabeli, mozna joinowac itd. Funkcja daje okreslony output, a view
# daje "tabele"

create or replace view v_dept_emp_latest_date AS
select emp_no, MAX(from_date) as from_date, max(to_date) as to_date
from dept_emp
group by emp_no;

select * from v_dept_emp_latest_date;


#Create a view that will extract the average salary of all managers
# registered in the database.
# Round this value to the nearest cent.
#If you have worked correctly, after executing
# the view from the “Schemas” section in Workbench,
# you should obtain the value of 66924.27.

create or replace view v_average_salary_of_managers AS
select round(avg(s.salary),2) as average_salary
from salaries s
join dept_manager dm on s.emp_no = dm.emp_no;

select *
from v_average_salary_of_managers;