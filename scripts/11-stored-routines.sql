# jak reuzywalna funkcja w programowaniu

#stored routines:
# - stored procedures - selects or DML. return value is optional
# - functions - only selects. Return is mandatory

# to avoid confusion we need temporary set a delimiter different than ';'
DROP PROCEDURE IF EXISTS get_thousand_employees;

DELIMITER $$
CREATE PROCEDURE get_thousand_employees()
BEGIN
    select * from employees
    limit 1000;
END$$
DELIMITER ;

call get_thousand_employees();


# check summed salary for year
# return lowest of values
DROP PROCEDURE IF EXISTS get_sum_salary_for_year;

DELIMITER $$
CREATE PROCEDURE get_sum_salary_for_year(IN this_year varchar(5))
BEGIN
    select this_year, sum(salary) as sum
    from salaries
    where year(to_date) = this_year and year(from_date) = this_year
    group by year(to_date);
END$$
DELIMITER ;

call get_sum_salary_for_year('1991');


# select * into
DROP PROCEDURE IF EXISTS emp_avg_salary;
DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN emp_number integer, out average_salary decimal(10,2))
BEGIN
    select avg(s.salary) INTO average_salary
    from salaries s
    where s.emp_no = emp_number
    group by s.emp_no;
END$$
DELIMITER ;

# using output param
SET @zmienna = 0;
call emp_avg_salary(11300, @zmienna); # albo zawolac z gui
select @zmienna;

# funkcje:
DROP FUNCTION IF EXISTS emp_avg_salary_fun;

DELIMITER $$
CREATE FUNCTION emp_avg_salary_fun(emp_number integer) RETURNS decimal(10,2)
BEGIN
    declare average_salary DECIMAL(10,2);

    select avg(s.salary) INTO average_salary
    from salaries s
    where s.emp_no = emp_number
    group by s.emp_no;

    return average_salary;
END$$
DELIMITER ;

select emp_avg_salary_fun(11300);