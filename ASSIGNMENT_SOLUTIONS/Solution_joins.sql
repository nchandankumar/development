-- 1. Display all employee details ACCCOUNTING AND RESEARCH department with having sal between 1000 and 5000
select * from emp e where e.DEPTNO IN (select deptno from dept where dname IN ('ACCOUNTING','RESEARCH')) and e.sal BETWEEN 1000 and 5000; 


-- 2. Display all employees of Grade 3 to 5 and working in location NEW YORK and CHICAGO

select * from emp e,SALGRADE s where e.deptno IN (select DEPTNO from dept where loc IN ('NEW YORK','CHICAGO')) and e.sal BETWEEN s.losal and s.HISAL and s.grade BETWEEN 3 and 5;

-- 3. Display all employees whose job is Manager and Experience is more than 30 years not belongs to grade 1

select * from emp e,SALGRADE s where e.job='MANAGER' and MONTHS_BETWEEN(sysdate,e.HIREDATE)/12 > 30 and e.sal BETWEEN s.LOSAL and s.HISAL and s.GRADE not in 1;

-- 4. Display distinct Jobs of Grade 3

select distinct e.job,s.GRADE from emp e,SALGRADE s where e.sal BETWEEN s.losal and s.HISAL and s.grade = 3;

-- 5. Display all employee details with their manager name where employees grade is 2 to 5 but his manager grade must be between 3 and 5.

SELECT 
E.EMPNO AS EMP_NO,
E.ENAME AS EMP_NAME,
E.SAL AS EMP_SAL,
S1.GRADE AS EMP_GRADE,
M.EMPNO AS MGR_ID,
M.ENAME AS MGR_NAME,
M.SAL AS MGR_SAL,
S2.GRADE AS MGR_GRADE
FROM EMP E,EMP M, SALGRADE S1,SALGRADE S2 WHERE E.MGR = M.EMPNO AND (E.SAL BETWEEN S1.LOSAL AND S1.HISAL AND S1.GRADE BETWEEN 2 AND 5) AND (M.SAL BETWEEN S2.LOSAL AND S2.HISAL AND S2.GRADE BETWEEN 3 AND 5);

-- 6. Display all employee details with their manager name where employees grade is 3 to 4 but his manager grade must be between 3 and 4 and working for accounting, sales departments only.

Select distinct e.*,e1.ename as manager_name,s.grade from emp e,emp e1,SALGRADE s where e.mgr = e1.empno and 
e.deptno in (select deptno from dept where dname IN ('ACCOUNTING','SALES')) and e.sal BETWEEN s.losal and s.HISAL and s.grade BETWEEN 3 and 4; 

--and e.sal BETWEEN s.losal and s.HISAL and s.grade BETWEEN 3 and 4 and e1.sal BETWEEN s.losal and s.HISAL and s.grade BETWEEN 3 and 4;

select * from SALGRADE;
-- 7. Display the name, location and the department of employees whose salary is greater than 1500.

select e.ename,d.loc,d.dname from emp e,dept d where e.deptno = d.deptno and e.sal > 1500;

-- 8. Display all the employees staying in Dallas.

select e.*,d.* from emp e, dept d where e.DEPTNO = d.DEPTNO and e.deptno = (select deptno from dept where loc ='DALLAS');

-- 9. Display ename, job, salary, grade and dname for everyone in the RESEARCH department except clerks, sort on salary, displaying the highest salary.

select e.ename,e.job,e.sal, s.grade,d.dname from emp e,SALGRADE s, dept d where e.deptno = d.DEPTNO and e.deptno = (Select deptno from dept where dname='RESEARCH') and e.job <> 'CLERK' and e.sal BETWEEN s.LOSAL and s.HISAL order by sal desc ;

-- 10. Display all employees who earn less than their managers.

select e.*,e1.ename as manager_name from emp e, emp e1 where e.mgr = e1.EMPNO and e.sal < e1.sal;

-- 11. Display all employees who earn more than their managers.

select e.*,e1.ename as manager_name from emp e, emp e1 where e.mgr = e1.EMPNO and e.sal > e1.sal;

-- 12. Find the department that has no employees.


select e.* from emp e, dept d where e.deptno = d.DEPTNO and e.DEPTNO not in (select deptno from dept);


select dname from dept d, emp e where d.DEPTNO = e.DEPTNO(+) and d.DEPTNO not in (select distinct deptno from emp);



-- 13.Display the details all Managers of Accounting Department. 

select  e.* from emp e where e.job='MANAGER' and  e.DEPTNO = (select deptno from dept where dname='ACCOUNTING');


-- 14.Display all the Salesman of sales dept who are receiving some commision
select e.* from emp e, dept d where e.deptno = d.deptno and e.job='SALESMAN' and e.COMM >0;
    

-- 15.Display all managers and analysts of both Accounting and Reasearch Department who annual salary morethan 20000

select e.* from emp e,DEPT d where e.deptno = d.deptno and e.job IN ('MANAGER','ANALYST') and e.deptno =(select deptno from dept where dname='RESEARCH') and e.sal*12 > 20000;

-- 16.Display all 1981 and 1982 employees joined in Newyork and Chicago with salary morethan 1250 joined under some manager.    


select * from emp where to_char(HIREDATE,'yyyy') BETWEEN 1981 and 1982 and deptno IN (select DEPTNO from dept where loc IN ('NEW YORK','CHICAGO')) and sal>1250 and mgr is not null;

-- 17.Display grade of Adams.

select grade from SALGRADE where (select sal from emp where ename='ADAMS') BETWEEN losal and hisal;

-- 18.Display all grade 2 Salesman.

select * from emp e, SALGRADE s where e.job = 'SALESMAN' and e.sal BETWEEN s.losal and s.HISAL and s.grade = 2;

-- 19.Display all grade 4 & 5 managers working under some manager having an experience not less thean 35 years.

select * from emp e, SALGRADE s where e.job = 'MANAGER' and e.mgr is not null and (MONTHS_BETWEEN(sysdate,e.HIREDATE)/12)>35 and e.sal BETWEEN s.losal and s.HISAL and s.grade In (4,5);


-- 20.Display the details of employees belongs to New York working as Managers beloging to grade 4 & 5.

select * from emp e,SALGRADE s where e.deptno = (select deptno from dept where dname='NEW YORK') and e.job='MANAGER' and e.sal BETWEEN s.losal and s.HISAL and s.grade In (4,5);

