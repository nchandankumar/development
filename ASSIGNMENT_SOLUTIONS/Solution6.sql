-- 1)	Display the details all Managers of Accounting Department.
SELECT * from emp where job = 'MANAGER' AND DEPTNO = (select deptno from DEPT where dname = 'ACCOUNTING');

-- 2)	Display all the Salesman of sales dept who are receiving some commision

select * from emp where job ='SALESMAN' and DEPTNO = (select deptno from DEPT where dname = 'SALES') and comm > 0;

-- 3)	Display all managers and analysts of both Accounting and Reasearch Department who annual salary is ranging from 15000 to 40000 
--         in the descending order of sal.
select * from emp where job IN ('MANAGER','ANALYST') and deptno in (select deptno from DEPT where DNAME in ('ACCOUNTING','RESEARCH')) and ((sal+nvl(comm,0))*12) BETWEEN 15000 and 40000 order by sal desc;


-- 4) 	Display all 1981 and 1982 employees joined in Newyork and Chicago with salary morethan 1250 joined under some manager.     

select * from emp where to_char(HIREDATE,'yyyy') BETWEEN 1981 and 1982 and deptno IN (select DEPTNO from dept where loc IN ('NEW YORK','CHICAGO')) and sal>1250 and mgr is not null;

-- 5)	 Display grade of Adams.
select grade from SALGRADE where (select sal from emp where ename='ADAMS') BETWEEN losal and hisal;

-- 6) 	Disaply all grade 2 Salesman.

select * from emp e, SALGRADE s where e.job = 'SALESMAN' and e.sal BETWEEN s.losal and s.HISAL and s.grade = 2;

-- 7) 	Display all grade 4 & 5 managers working under some manager having an experience not less thean 35 years.

select * from emp e, SALGRADE s where e.job = 'MANAGER' and  e.mgr is not null and (MONTHS_BETWEEN(sysdate,e.HIREDATE)/12)>35 and e.sal BETWEEN s.losal and s.HISAL and s.grade In (4,5);

-- 8) 	Display the details of employees belongs to New York working as Managers beloging to grade 4 & 5.

select * from emp e,SALGRADE s where e.deptno = (select deptno from dept where dname='NEW YORK') and e.job='MANAGER' and e.sal BETWEEN s.losal and s.HISAL and s.grade In (4,5);


