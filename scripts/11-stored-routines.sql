# jak reuzywalna funkcja w programowaniu

#stored routines:
# - stored procedures
# - functions - user defined and built-in (like count())

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


# check all monthly sales generated throught a calendar year
# return lowest of values
DROP PROCEDURE IF EXISTS get_average_salary_for_year;

DELIMITER $$
CREATE PROCEDURE get_average_salary_for_year(IN this_year varchar(5))
BEGIN
    select this_year, sum(salary) as sum
    from salaries
    where year(to_date) = this_year and year(from_date) = this_year
    group by year(to_date);
END$$
DELIMITER ;

call get_average_salary_for_year('1991');

