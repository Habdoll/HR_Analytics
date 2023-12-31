CREATE DATABASE Project;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;
SELECT birthdate FROM hr;

SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE "%/%" THEN date_format(str_to_date(birthdate, "%m/%d/%Y"), "%Y-%m-%d")
    WHEN birthdate LIKE "%-%" THEN date_format(str_to_date(birthdate, "%m-%d-%Y"), "%Y-%m-%d")
    ELSE NULL 
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE "%/%" THEN date_format(str_to_date(hire_date, "%m/%d/%Y"), "%Y-%m-%d")
    WHEN hire_date LIKE "%-%" THEN date_format(str_to_date(hire_date, "%m-%d-%Y"), "%Y-%m-%d")
    ELSE NULL 
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT hire_date FROM hr;

UPDATE hr
SET termdate = date(str_to_date(termdate, "%Y-%m-%d %H:%i:%s UTC"))
WHERE termdate IS NOT NULL AND termdate != ('');

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

select
	min(age) as youngest, max(age) as oldest
from hr;

select count(*) from hr where age < 18;

SELECT birthdate, age FROM hr;
