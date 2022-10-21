use db;
select * from countries;
select * from employees;
select first_name as First_Name,last_name as Last_Name from employees;
select distinct employee_id from employees;
select * from employees
order by first_name asc;

select concat_ws(' ',first_name,last_name) as Employee_Name,Salary,Salary*0.15 as PF from employees;

-- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary
select employee_id,concat_ws('-',first_name,last_name) as Employee_Name, salary from employees
order by salary asc; 

-- Write a query to get the total salaries payable to employees
select sum(salary) from employees;

-- Write a query to get the maximum and minimum salary from employees table.
select max(salary) as Max_Salary, min(salary) as Min_Salary from employees;

-- Write a query to get the average salary and number of employees in the employees table
select avg(salary) as Average_Salary, count(employee_id) as Total_Employees from employees;

-- Write a query to get the number of employees working with the company
select count(*) from employees;

-- Write a query to get the number of jobs available in the employees table
select count(distinct(JOB_ID)) as Number_of_Jobs from employees;

-- Write a query get all first name from employees table in upper case
select upper(first_name) from employees;

-- Write a query to get the first 3 characters of first name from employees table
SELECT left(FIRST_NAME,3) FROM employees;

-- Write a query to calculate 171*214+625
SELECT 171*214+625;

-- Write a query to get first name from employees table after removing white spaces from both side.
SELECT	TRIM(FIRST_NAME) FROM employees;

-- Write a query to get the length of the employee names (first_name, last_name) from employees table
SELECT char_length(FIRST_NAME) AS FIRST_LEN,char_length(LAST_NAME) AS LST_LEN FROM employees;

-- Write a query to check if the first_name fields of the employees table contains numbers.
select first_name from employees where first_name like '%[0-9]%';

-- Write a query to select first 10 records from a table
select * from employees
limit 10;

-- Write a query to get monthly salary (round 2 decimal places) of each and every employee

select concat_ws(' ',first_name,last_name) as Employee_Name, round(salary,2) as salary from employees;
