use db;

-- Write a query to list the number of jobs available in the employees table
select count(distinct(job_id)) from employees;

-- Write a query to get the total salaries payable to employees.
select sum(salary) from employees;

-- Write a query to get the maximum salary of an employee working as a Programmer
select max(salary) from employees
where JOB_ID = 'IT_PROG';

-- Write a query to get the average salary and number of employees working the department 90
select avg(salary),count(EMPLOYEE_ID) from employees
where DEPARTMENT_ID = '90';

-- Write a query to get the highest, lowest, sum, and average salary of all employees.
select avg(salary),max(salary),min(salary),sum(salary) from employees;

-- Write a query to get the number of employees with the same job
select JOB_ID,count(job_id) from employees
group by JOB_ID;

-- Write a query to get the difference between the highest and lowest salaries.
select	(max(salary)-min(salary)) as salary from employees;

-- Write a query to find the manager ID and the salary of the lowest-paid employee for that manager
select first_name,EMPLOYEE_ID,min(salary) from employees;

-- Write a query to get the department ID and the total salary payable in each department
select department_id,sum(salary) from employees
group by DEPARTMENT_ID;

-- Write a query to get the average salary for each job ID excluding programmer
select avg(salary),job_id from employees
where JOB_ID <> 'IT_PROG'
group by job_id;

-- Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
select sum(salary),max(salary),min(salary),avg(salary), job_id from employees
where DEPARTMENT_ID = '90'
group by job_id;

-- Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000
select job_id,max(salary) from employees
group by job_id
having(max(salary))>='4000';

-- Write a query to get the average salary for all departments employing more than 10 employees.
select DEPARTMENT_ID,avg(salary) from employees
group by DEPARTMENT_ID
having(count(EMPLOYEE_ID))>10;

