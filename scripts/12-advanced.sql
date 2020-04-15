#session variable - w trakcie zestawionego polaczenia z baza
SET @variable = 3; # @ is important!

#global variable, all connections within server
# can set only system variables, such as max_connections etc.
SET @@variable2 = 1;
SET GLOBAL variable3 = 1;

# triggers - procedury ktore maja byc wykonane np. przed insertem do tabeli
# mozna np. formatowac dane w odpowiedni sposob albo dodawac kolumny (data edycji) itd.

# indexy - struktura danych zeby bylo czytac szybko, ale zapisy wolniejsze
create INDEX moj_index ON salaries(salary);
# mozna wiele kolumn laczyc
# wtedy bedzie szybciej TYLKO gdy sa OBA z nich

# standardowe indexy - klucze glowne/obce, unique

# case:
select first_name, last_name,
       CASE
           WHEN gender = 'M' THEN 'MALE'
           ELSE 'FEMALE'
        END as gender
from employees;

select first_name, last_name,
       CASE gender
           WHEN 'M' THEN 'MALE'
           ELSE 'FEMALE'
           END as gender
from employees;

select first_name, last_name,
       if(gender = 'M', 'Male', 'Female') as gender
from employees;

select
    salary,
    CASE
        WHEN salary > 75000 THEN 'RICH'
        WHEN salary > 70000 THEN 'MEDIUM'
        ELSE 'POOR'
    END as rich
from salaries;