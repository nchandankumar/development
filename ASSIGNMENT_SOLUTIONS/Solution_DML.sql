-- ~~~~~~~~~~DML~~~~~~~~~~
-- 1.Change the name of the employee james to upper case.
update emp_practice set ename=upper(ename) where ename='JAMES'; 

-- 2.Increment the salaries of all employees by 20%.
update emp_practice set sal = sal+sal*0.2;

-- 3.Transfer all the clerks of department 20 to 10 by incrementing the salary with 500 and changing their manager to 7839. 

update emp_practice set DEPTNO =10,sal=sal+500,mgr=7839 where job='CLERK' and DEPTNO=20;

-- 4.Replace the century component where ever it is 20 to 19.
UPDATE EMP_PRACTICE set hiredate = add_months(hiredate,-1200) where to_char(hiredate, 'CC') = 20;

-- 5.Increment the salaries of all grade 3 employees by 10%.
update  emp_practice set sal=sal+(sal*0.1) where empno in (select e.empno from emp e, SALGRADE s where e.sal BETWEEN s.losal and s.HISAL and s.grade = 3);

update EMP_PRACTICE set sal = sal+(sal*0.1) where sal between(select losal from salgrade where grade = 3) and (select hisal from salgrade where grade = 3);

-- 6.Transfer all clerks of research department to sales department by incrementing the salary 10%.

update EMP_PRACTICE set DEPTNO = (select deptno from dept_practice where dname='SALES'),sal = sal +(sal*0.1) where deptno = (select deptno from dept_table where dname = 'RESEARCH') and job = 'CLERK';

-- 7.Replace the lowest paid employees salary with average salary of employee table which is rounded to nearest rupee.
update EMP_PRACTICE set sal = (select round(avg(sal)) from EMP_PRACTICE) where sal = (select min(sal) from EMP_PRACTICE);


-- 8.Replace the salaries of all the employees of department 10 with the average salary of department 10 itself wherever employees are receiving less than average salary 
--  of department 10 itself.
update EMP_PRACTICE set sal = (select round(avg(sal)) from EMP_PRACTICE where deptno=10) where deptno = 10 and sal < (select round(avg(sal)) from EMP_PRACTICE where deptno=10);

-- 9.Replace the salary of highest paid employee of grade 2 with lowest paid employee of grade 3.

update emp_practice set sal = (select min(sal) from EMP_PRACTICE 
where sal between (select losal from salgrade where grade = 3) and (select hisal from salgrade where grade = 3))
where sal = (select max(sal) from EMP_PRACTICE where sal between (select losal from salgrade where grade = 2) and (select hisal from salgrade where grade = 2));

-- 10.Replace the salaries of all the employees whose salary is less than the average salary of their own grade with the average salary of their own grade.
update EMP_PRACTICE e 
set e.sal = (select avg(s.losal + s.hisal)from salgrade s where e.sal between s.losal and s.hisal)
where e.sal < (select avg(s.hisal + s.losal) from salgrade s where e.sal between s.losal and s.hisal);
-- 11.Delete the record of blake.

delete from EMP_PRACTICE where ename = 'BLAKE';
-- 12.Delete all the employees working under the manager 7839 except jones.
delete from EMP_PRACTICE where mgr = 7839 and ename <> 'JONES';
-- 13.Delete all the employees belongs to second and fourth quarter of 1981 and 1983 joined under manager 7566.
delete from EMP_PRACTICE where (to_char(hiredate,'Q') = 2 or to_char(hiredate,'Q') = 4 and (to_char(hiredate,'YYYY') = 1981 or to_char(hiredate,'YYYY') = 1983 )) and mgr = 7566;

-- 14.Delete all employees of sales department working as salesman.
delete from EMP_PRACTICE where deptno = (select deptno from dept where dname = 'SALES') and job = 'SALESMAN';

-- 15.Delete all grade 3 employees working as clerks.

delete from EMP_PRACTICE where sal between (select losal from salgrade where grade = 3) and (select hisal from salgrade where grade = 3) and job = 'CLERK';

-- 16.Delete all employees working as managers to others with annual salary ranging from 2400 to 42000.

delete from EMP_PRACTICE where job = 'MANAGER' and sal*12 between 2400 and 42000;

-- 17.Delete all employees working for the department where blake's manager is working.
delete from EMP_PRACTICE where deptno = (select deptno from EMP_PRACTICE where empno=(select mgr from EMP_PRACTICE where ename = 'BLAKE'));

-- 18.Delete the details of all the employees whose salary is less than average salary of all the employees.

delete from emp_practice where sal < (select avg(sal) from emp_practice);
-- 19.Delete those employees where less than 4 employees are working for their department.
delete from emp_practice where deptno in(select deptno from (select deptno,count(*) cnt from emp_practice group by deptno order by count(*)) where cnt < 4);
-- 20.Delete the details of employees who belongs to department where minimum number of employees are working.
delete from EMP_PRACTICE where deptno in(select deptno from EMP_PRACTICE group by deptno order by count(*) offset 0 rows fetch next 1 row only);
-- 21.Delete all employees whose salary is less than the average salary of their own department.
delete  EMP_PRACTICE e where e.sal < (select avg(e2.sal) from EMP_PRACTICE e2 where e.deptno =e2.deptno);

-- 22.Delete all emplpoyees.

delete from EMP_PRACTICE;


-----------------------
drop table emp_practice;

create table emp_practice as select * from emp;

create table dept_practice as select * from dept;

select * from dept_practice;