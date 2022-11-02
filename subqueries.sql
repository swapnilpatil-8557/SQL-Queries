use db;

-- Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
select concat_ws(' ',first_name,last_name) as Employee_Name, salary from employees
where salary > (select salary from employees where last_name = 'Bull');

-- Write a query to find the name (first_name, last_name) of all employees who works in the IT department
select first_name,last_name,job_id from employees
where DEPARTMENT_ID in (select DEPARTMENT_ID from departments where DEPARTMENT_NAME = 'IT');

-- Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
select first_name,last_name from employees
where MANAGER_ID in 
(select MANAGER_ID from departments where location_id in
(select location_id from locations where country_id='US'));

-- Write a query to find the name (first_name, last_name) of the employees who are managers.
select first_name,last_name from employees
where job_id in (select distinct(manager_id) from employees);

-- . Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary. 
select first_name,last_name,salary from employees
where salary > (select avg(salary) from employees);

-- Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade
SELECT first_name, last_name, salary FROM employees 
WHERE salary in (SELECT min_salary FROM jobs
WHERE employees.job_id = jobs.job_id);

--  Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments
select first_name,last_name,salary from employees
where salary > (select avg(salary) from employees) and
department_id in (select department_id from departments where department_name like 'IT%');

-- Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
select first_name,last_name,salary from employees
where salary > (select salary from employees where last_name = 'Bell');

-- Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
select first_name,last_name,salary,department_id from employees
where salary > (select min(salary) from employees);

-- 10. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
select first_name,last_name,salary from employees 
where salary >  all (select avg(salary) from employees group by DEPARTMENT_ID);

-- 11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest
select first_name,last_name,salary from employees
where salary > all(select salary from employees where job_id='SH_CLERK')
order by salary asc;

-- 12. Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
select first_name,last_name,salary from employees
where salary not in (select salary from employees where MANAGER_ID=EMPLOYEE_ID);

-- 13. Write a query to display the employee ID, first name, last name, and department names of all employees.
select employee_id,first_name,last_name, departments.DEPARTMENT_NAME from employees left join departments
on employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;

-- 14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
create view avg_salary as
select employee_id,first_name,last_name,salary from employees as a
where salary > (select avg(salary) from employees as b where b.DEPARTMENT_ID=a.DEPARTMENT_ID);

select * from avg_salary;

-- 15. Write a query to fetch even numbered records from employees table.
set @i=0;
select i,EMPLOYEE_ID from
(select @i:=@i+1 as i,EMPLOYEE_ID from employees) as a
where mod(a.i,2)=0;

-- 16. Write a query to find the 5th maximum salary in the employees table. 
select distinct salary from employees
order by salary desc
limit 4,1;

select salary from employees as a
where 4 = (select count(distinct(salary)) from employees as b where b.salary>a.salary);

-- 17. Write a query to find the 4th minimum salary in the employees table.
select salary from employees
order by salary asc
limit 3,1;

select distinct salary from employees as a
where 3 = (select count(distinct(salary)) from employees as b where b.salary<a.salary);

-- 18. Write a query to select last 10 records from a table.
select * from (select * from employees order by EMPLOYEE_ID desc limit 10) as tbl
order by EMPLOYEE_ID asc;

-- 19. Write a query to list the department ID and name of all the departments where no employee is working.
select * from departments
where DEPARTMENT_ID not in (select DEPARTMENT_ID from employees);

-- 20. Write a query to get 3 maximum salaries.
select distinct salary from employees
order by salary desc
limit 0,3;

-- 21. Write a query to get 3 minimum salaries.
select distinct salary from employees
order by salary asc
limit 0,3;