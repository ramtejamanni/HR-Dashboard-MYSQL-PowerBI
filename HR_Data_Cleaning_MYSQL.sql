create database project;
use project;

CREATE TABLE hr2
LIKE hr1;


SELECT *
FROM hr2;

INSERT hr2
SELECT *
FROM hr1;

select * from hr2;

alter table hr2
change column ï»¿id emp_id varchar(20) null;

describe hr2;

SELECT birthdate
FROM hr2;

SELECT birthdate, TRIM(birthdate)
FROM hr2;

UPDATE hr2
SET birthdate = TRIM(birthdate);
set sql_safe_updates = 0;
UPDATE hr2
SET birthdate =
    CASE
        WHEN birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
        when birthdate like '%/%' then date_format(str_to_date(birthdate, '%Y/%m/%d'), '%Y-%m-%d')
        when birthdate like '%-%' then date_format(str_to_date(birthdate, '%Y-%m-%d'), '%Y-%m-%d')
        else null
    END;
alter table hr2
modify column birthdate date;
SELECT birthdate FROM hr2;

SELECT hire_date
FROM hr2;

SELECT hire_date, TRIM(hire_date)
FROM hr2;

UPDATE hr2
SET hire_date = TRIM(hire_date);
UPDATE hr2
SET hire_date =
    CASE
        WHEN hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
        WHEN hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
        when hire_date like '%/%' then date_format(str_to_date(hire_date, '%Y/%m/%d'), '%Y-%m-%d')
        when hire_date like '%-%' then date_format(str_to_date(hire_date, '%Y-%m-%d'), '%Y-%m-%d')
        else null
    END;
alter table hr2
modify column hire_date date;
SELECT hire_date FROM hr2;

select * from hr2;

UPDATE hr2
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate FROM hr2;

SET sql_mode = 'ALLOW_INVALID_DATES';

alter table hr2
modify column termdate date;

alter table hr2 add column age int;

select * from hr2;

update hr2
set age = timestampdiff(YEAR, birthdate, curdate());

select birthdate, age from hr2;

select  min(age) as youngest, max(age) as oldest from hr2;


 
 






