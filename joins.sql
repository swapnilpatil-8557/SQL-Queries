use db;

-- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London. Go to the editor
select e.first_name,e.last_name,d.DEPARTMENT_NAME,j.JOB_TITLE from employees as e
inner join jobs as j on e.JOB_ID=j.JOB_ID
inner join departments as d on d.DEPARTMENT_ID = e.DEPARTMENT_ID
inner join locations as l on d.location_id=l.location_id
where l.city = 'london';

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select e1.employee_id as 'Emp_ID',e1.last_name as 'Emp_Name',e2.EMPLOYEE_ID as 'Manager_ID',e2.last_name as 'Manager_Name' 
from employees e1 JOIN employees e2
on (e1.MANAGER_ID = e2.EMPLOYEE_ID);

-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'
select first_name,last_name, hire_date from employees where
hire_date > (select hire_date from employees where last_name = 'Jones');

-- 6. Write a query to get the department name and number of employees in the department.
select count(employee_id) as Num_of_Employee,d.department_name from employees
join departments d on employees.department_id=d.department_id
group by department_name
order by Num_of_Employee desc;

-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
select jh.employee_id,j.job_title,(jh.end_date - jh.start_date) as No_of_Days from job_history jh
join jobs j on jh.job_id=j.job_id
where jh.department_id=90;

-- 8. Write a query to display the department ID and name and first name of manager. 
select e.first_name,e.last_name,e.department_id,d.department_name from employees e
inner join departments d on d.manager_id=e.employee_id;

-- 9. Write a query to display the department name, manager name, and city
select e.first_name,e.last_name,d.department_name,l.city from employees e
join departments d on d.manager_id=e.employee_id
join locations l on d.location_id=l.location_id;

-- 10. Write a query to display the job title and average salary of employees.
select j.job_title,avg(e.salary) from employees e
join jobs j using(job_id)
group by e.job_id;

-- 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
select e.first_name,j.job_title,(e.salary - j.min_salary) as Diff_Salary from employees e
join jobs j using(job_id);

-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary
select jh.*,e.salary,e.first_name from job_history jh
left join employees e using(employee_id)
where e.salary > 10000;

-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
select e.employee_id,d.department_name,e.first_name,e.last_name,e.salary,e.hire_date,datediff(now(),e.hire_date)/365 as Tenure from employees e
join departments d on d.manager_id=e.employee_id
having tenure>15;

select*from job_history;
select*from jobs;
select*from departments;
select*from employees;