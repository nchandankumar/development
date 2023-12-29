-- 1)	Calculate the job and the average salary for each of different job.

select job,avg(sal) from emp group by job;

-- 2)	Display the average monthly salary bill for each job type with in a department.

select job,deptno,avg(sal) from emp group by job,DEPTNO order by deptno;

-- 3)	Find the maximum salary of each job.

select job,max(sal) from emp group by job;
-- 4)	Find the minimum salary of each department.

select deptno,min(sal) from emp group by DEPTNO;

-- 5)	Find average salary for all department having more than 3 employees

with cte as(
  select deptno,count(*) as emp_cnt from emp group by DEPTNO
)

select deptno,avg(sal) from emp where deptno In (select deptno from cte where emp_cnt >3) group by DEPTNO;

----------------------------------------------------------------
select deptno, avg(sal) from emp group by DEPTNO having count(*) >3;
-- 6)	Find all the jobs where the maximum salary of greater or equal to 3000.


select job,sal from emp group by job,sal having max(sal) >=3000;

-- 7)	Find the department and the average salary of each department if it is greater than 2000.

select deptno,avg(sal) as avg_sal from emp group by deptno having avg(sal)>=2000;

-- 8)	Find the minimum salary of all the employees.

select min(sal) from emp;

-- 9)	Find the maximum, minimum and average salary of all employees.

select max(sal) as max_sal, min(sal) as min_sal,avg(sal) as avg_sal from emp;

-- 10)	Find the maximum, minimum and average salary for each job type.
select job,max(sal) as max_sal, min(sal) as min_sal,avg(sal) as avg_sal from emp group by job;

-- 11)	Find how many managers are there in the employee table.

select count(*) as manager_count from emp where job='MANAGER';


-- 12)	Find out the difference of the highest and lowest salary.

select max(sal)-min(sal) as diff_sal from emp;
-- 13)	Find the departments having more than 3 employees.

select d.dname,e.deptno, count(*) as emp_cnt from emp e, dept d where e.deptno = d.deptno group by d.dname,e.deptno having count(*) > 3;

---------------------------------------------------------
select deptno,count(*) from emp group by DEPTNO having count(*) > 3;