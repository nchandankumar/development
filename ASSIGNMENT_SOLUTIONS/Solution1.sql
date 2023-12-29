-- 1)  Find employee name, his salary and comm.

select * from emp;

select ename,sal,comm from emp;

-- 2)  Find employee name, his annual salary and comm.

select ename,sal*12 annual_sal,comm from emp;

-- 3)  Find the employee code and his name together

select empno || ',' || ename as empno_ename from emp;

-- 4)  Retrieve the records as specified below from the EMP table.
--     Employee                        works                        deptno
--     7369-scott                 works in department       10

select empno || '-'|| ename || ' works in department ' || deptno from emp;
-- 5)  Find the employee number, name, monthly salary (sal+comm.).

select empno,ename,sal+comm as mon_sal from emp;
-- 6)  Repeat the question with NVL.

select empno,ename, nvl(sal,0)+nvl(comm,0) as mon_sal from emp;


-- 7)  Find all the department numbers.

select deptno from emp;

-- 8)  Find distinct departments numbers from EMP.

select distinct deptno from emp;
-- 9)  Find distinct deptno and job.

SELECT DISTINCT DEPTNO,job from emp;
-- 10)	Find empname, annual salary and deptno in the ascending order of ename.

SELECT ename,sal*12 as annual_sal, DEPTNO from emp order by ename asc;

-- 11)	Find empname, job, hiredate in the descending order of hiredate.

select ename,job,hiredate from emp order by HIREDATE desc;
-- 12) 	Find the deptno, job and his name in the ascending order of deptno and desc of job.

SELECT deptno, job, ename
FROM emp
ORDER BY deptno ASC, job DESC;

-- ~~~~~~~~~~BASIC SQL STATEMENTS~~~~~~~~~~
-- 1.Display employee details in the order of their hiredate.
SELECT * FROM emp ORDER BY hiredate;
-- 2.Display employee details in descending order of their experience.

SELECT * FROM emp order by round(months_between(sysdate,hiredate)/12) desc;

-- 3.Display department number, job, employee number, name from employee table in the ascending order of department number and descending order of job.

select deptno,job,empno,ename from emp order by deptno ASC,job desc;

-- 4.Display all the departments with job combination.
select deptno,job from emp; --confused in the ques
-- 5.Display employee name, number, total number of years of experience in the ascending order of department number and descending order of experience.

select ename,EMPNO,round(months_between(sysdate,hiredate)/12),deptno as years_of_exp from emp order by deptno asc,years_of_exp desc;
-- 6.Write a query to display employee number, name, job, salary per month, comm per month, salary per day, comm per day, salary per year, comm per year, 
--gross salary per year in the ascending order of job, gross salary and descending order of monthly salary.

select 
empno,
ename,
job,
nvl(sal,0) as sal_per_mon,
nvl(comm,0) as com_per_mon,
round(nvl(sal/30,0)) as sal_per_day, 
round(nvl(comm/30,0)) as com_per_day,
round(nvl(sal,0)*12) as sal_per_year,
round(nvl(comm,0)*12) as com_per_year,
sal*12 as gross_Sal_year from EMP order by job asc,gross_Sal_year  asc,sal desc;
