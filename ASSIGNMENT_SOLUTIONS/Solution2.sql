
-- 13)	 Find the employee details name, his number, his job, deptno of all clerks.

SELECT ename,empno,job,deptno from emp where lower(trim(job))='clerk';


-- 14)	 Find the department details for all the whose deptno>20
--query for emp table
SELECT * FROM emp WHERE deptno > 20;
--query for department table

SELECT * FROM dept WHERE deptno > 20;

-- 15)	 Find the empno, name, salary and comm. where Sal>comm.
SELECT empno,ename,sal,comm FROM emp WHERE sal > comm;

-- 16)	 Find ename, empno, sal of employee earning between 1000 and 2000.
SELECT ename, empno, sal FROM emp WHERE sal BETWEEN 1000 AND 2000;


-- 17)	 Find EMP details (name, number, sal and mgr of employees working under the managers with mgr 7902 or 7566 or 7788.
select ename,empno,sal,mgr from emp where mgr IN (7902,7566,7788);

-- 18)	Find the emp names whose name starts with ‘S’

select ename from emp where ename like 'S%';

-- 19)	Find the EMP name of size 4.

select ename from emp where LENGTH(trim(ename))=4;

-- 20)	Find the employees not working under any managers.

select ename from emp where mgr is null;


-- 21)	Find the employees who are not working between 1000 and 2000 salary.
select * from emp where sal NOT BETWEEN 1000 AND 2000;


-- 22)	Find all the employees who are not managers.
select * from emp where lower(trim(job)) <> 'manager';

-- 23)	Find all the managers who are working under some manager.
select * from emp where lower(trim(job)) = 'manager' and mgr is not null;
-- 24)	Find the EMP details like name,number, job, salary earning between 1000 and 2000 and who are also clerk

select ename,empno,job,sal from emp where (sal BETWEEN 1000 and 2000) and lower(trim(job))='clerk';

-- 25)	Find the emp details like name.number,job,salary who are either earning between 1000  and 2000 or job=’clerk’

select ename,empno,job,sal from emp where (sal BETWEEN 1000 and 2000) or lower(trim(job))='clerk';

-- 26)	Find all the employees who are all managers and earn above 1500 

select * from emp where lower(trim(job)) = 'manager' and sal>1500;

-- 27)	Find all the mangers and salesman with salaries over 1500.
select * from emp where lower(trim(job)) in ('manager','salesman') and sal>1500;


-- 28)	Find all the information from the salary grade.

select * from salgrade;

-- 29)	Find the employee and the department they are working in the ascending order of deptno.

select e.*,d.dname from emp e left join dept d on e.deptno=d.deptno order by e.DEPTNO;

-- 30)	Find all the different types of jobs.
select distinct job from emp;

-- 31)	Find all the employees working in deptno 10 or 20 in the alphabet order of name.
select * from emp where deptno in (10,20) order by ename asc;


-- 32)	Find all the details of the clerks of deptno 20
select * from emp where deptno=20 and job='CLERK';


-- 33)	Find all the employees who have ‘TH’ or ‘TL’ in their names.
select * from emp where ename like '%TH%' or ename like '%TL%';


-- 34)	Find all the employee names and their annual salary.

select ename,sal*12 as annual_salary from emp;



-- 35)	Find all the employees hired during 1983.
select * from emp where to_char(hiredate,'yyyy') = '1983';


-- 36)	Find all the employee names their annual salary of all sales people whose monthly salary >comm. 
--the output should be ordered by salary highest first of two more employees 
-- have the same salary sort by their names with the highest salary in order.
select ename,sal from emp order by sal desc, ename asc;

select ename,job,sal*12 as annual_salary from emp where job like '%SALES%'and sal>comm order by sal desc,ename asc;

-- 37)	Find all the employees details in the following format.

-- Who                                           what                                         when
-- SMITH                          HELD POSITION OF CLERK IN DEPT 20                                      SINCE 13-JUN-83

SELECT ename || ' HELD POSITION OF '|| job || ' IN DEPT ' || DEPTNO || ' SINCE ' || HIREDATE from emp;

-- 38)	Find the ename, deptno and annual salary where the job of the employee is entered by user at runtime.


select ename,DEPTNO, sal*12 as annual_salary from emp where job = :JOB;
select ename,DEPTNO, sal*12 as annual_salary from emp where job = &JOB;


-- 39)	Repeat the same query using the ‘&&’ command.

select ename,DEPTNO, sal*12 as annual_salary from emp where job = &&JOB;

-- 40)	Find the annual salary and find the ename,job and the annsal salary in the decreasing order by the annsal

SELECT ename,job,sal*12 as annual_salary from emp order by annual_salary desc;