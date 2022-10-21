use db;
-- Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000
select concat_ws(' ',first_name,last_name) as Employee_name, salary as salary from employees
where SALARY not between 10000 and 15000
order by first_name asc;

-- Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order
select concat_ws(' ',first_name,last_name) as Employee_name, department_id from employees
where department_id in (30,100)
order by DEPARTMENT_ID asc;

-- Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100
select concat_ws(' ',first_name,last_name) as Employee_name, salary as salary from employees
where SALARY not between 10000 and 15000 and department_id in (30,100);

-- Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987
select concat_ws(' ',first_name,last_name) as Employee_name,hire_date from employees
where year(hire_date) = 1987;

-- Write a query to display the first_name of all employees who have both "b" and "c" in their first name
select first_name from employees
where first_name like '%b%' and
first_name like '%c%';

-- Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000
select last_name,job_id,salary from employees
where job_id in ('IT_PROG','PU_CLERK') and salary not in ('4500','10000','15000');

-- Write a query to display the last name of employees whose names have exactly 6 characters
select last_name from employees
where length(last_name) = 6;

-- Write a query to display the last name of employees having 'e' as the third character
select last_name from employees
where last_name like '__e%';

-- Write a query to display the jobs/designations available in the employees table
select distinct(JOB_ID) from employees;

-- Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'
select * from employees
where last_name in ('BLAKE', 'SCOTT', 'KING','FORD');



