use db;
select * from employees;

select max(salary),department_id from employees group by department_id;

-- maximum salary as per department_id using window
select e.*, max(salary) over (partition by department_id) as Max_salary from employees e;

-- fetch the first two employees from each department to join the company.
-- Row_Number window function
select * from 
(select e.*,
row_number() over(partition by DEPARTMENT_ID order by EMPLOYEE_ID asc) as Serial_No 
from employees e) tb
where serial_no<3;

-- fetch the top 3 employees in each department having the max salary.alter
-- Rank Window Function
select * from (
select e.*, 
rank() over (partition by department_id order by salary desc) as max_salary 
from employees e) as ts
where ts.max_salary <20;

-- fetch the salary of employee from previous employee.
-- lag window function
select e.*,
lag(salary) over (order by salary asc) as prev_salary 
from employees e;

-- lead window function
select e.*,
lead(salary) over (order by salary asc) as prev_salary 
from employees e;


-- displat the salary of employee if higher,lower,same than the previous employee.
select e.*,
lag(salary) over (order by salary asc) as prev_salary, 
case 
	when e.salary > lag(salary) over (order by salary asc) then 'Higher than previous' 
    when e.salary < lag(salary) over (order by salary asc) then 'lower than previous' 
    when e.salary = lag(salary) over (order by salary asc) then 'same as the previous' 
end as salary_range   
from employees e;

use weather;
use db;
select e.* from employees e;

-- first value window function
select e.* from employees e;

-- display the name of employee who has max salary accrding to department_id.
select e.*,
first_value(first_name) over (partition by department_id order by salary desc) as emp_having_max_salary from employees e;

-- last value window function
-- display the name of employee who has min salary accrding to department_id.
select e.*,
last_value(first_name) over (partition by department_id order by salary desc) as emp_having_max_salary 
from employees e;
-- alternate way to write the windwo function
select e.*,last_value(first_name) over w as emp_having_max_salary from employees e
window w as (partition by department_id order by salary desc);


-- NTH value window function
-- display the name of employee who has 3rd most highest salary accrding to department_id.
select e.*,
nth_value(salary,3) over w  as third_highest_salary
from employees e
window w as (partition by department_id order by salary desc);

-- NTILE WINDOW FUNCTION
-- Display the buckets/clusters of salaries of employee whos job_id = ST_CLERK
select e.*,
ntile(3) over(order by salary desc) as clusters from employees e
where job_id= 'ST_CLERK';

-- comments the clusters as per the salary as low,med,high.
select x.*,
case
	when x.clusters = 1 then 'ST_CLERK WITh HIGH PACKAGE'
    when x.clusters = 2 then 'ST_CLERK WITh MEDIUM PACKAGE'
    when x.clusters = 3 then 'ST_CLERK WITh LOW PACKAGE'
end as comments
from
(select e.*,
ntile(3) over(order by salary desc) as clusters from employees e
where job_id= 'ST_CLERK') as x;

-- cum_dist window function
select e.*,
cume_dist() over (order by salary desc) as cum_distribution,
round(cume_dist() over (order by salary desc),2)*100 as cum_perc
from employees e;

-- display the 50% of the distributed data.
select *
from (
select e.*,
cume_dist() over (order by salary desc) as cum_distribution,
round(cume_dist() over (order by salary desc),2)*100 as cum_perc
from employees e) as p
where cum_perc < 50;


-- percent_rank window function
select e.*,
percent_rank() over(order by salary) as per_raw_data,
round(percent_rank() over(order by salary),2)*100 as percent_data
from employees e;

select c.first_name,last_name,c.salary,c.percent_data
from(
select e.*,
percent_rank() over(order by salary) as per_raw_data,
round(percent_rank() over(order by salary),2)*100 as percent_data
from employees e) as c
where employee_id = '189';
-- it gives that employee_id 189 has 36% salary that the lowest salary.

