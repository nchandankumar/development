-- 1) Display highest paid employee details for each grade by deptno.

select * from emp where sal in (select max(e.Sal) from emp e,SALGRADE s where e.sal BETWEEN s.LOSAL and s.HISAL group by e.DEPTNO,s.grade) ;



-- 2) Display Senior most employee of each location.

select e.*,months_between(sysdate,HIREDATE)/12 from emp e where months_between(sysdate,HIREDATE)/12 IN (select max(months_between(sysdate,e.HIREDATE)/12) from emp e,dept d where e.deptno = d.DEPTNO group by d.loc);
-- 3) Display Senior most employee working as Manager for each Deptno.

select e.*,months_between(sysdate,HIREDATE)/12 from emp e where months_between(sysdate,HIREDATE)/12 IN (select max(months_between(sysdate,e.HIREDATE)/12) from emp e,dept d where e.deptno = d.DEPTNO group by d.deptno);


-- 4) Display lowest paid employee for each Job by Deptno


select * from emp e where (e.sal,e.job,e.DEPTNO) IN (
select min(sal),job,deptno from emp group by job,deptno
) order by DEPTNO;

-- 5) Display employees who are earning morethan average salary of their own Job and Deptno combination.

select e.* from emp e where e.sal > (select avg(sal) from emp e1 where e1.job = e.job) and e.sal >(select avg(sal) from emp e2 where e2.deptno = e.deptno);


-- 6) Display year wise highest paid employees.

select * from emp e where sal in (select max(sal) from emp e1 WHERE TO_CHAR(e1.HIREDATE,'YYYY') = TO_CHAR(E.HIREDATE, 'YYYY')) order by HIREDATE;

-- 7) Display year wise highest paid employees BY DEPTNO.

select * from emp e where sal in (select max(Sal) from emp e1 where e1.DEPTNO = e.DEPTNO and TO_CHAR(e1.HIREDATE,'YYYY') = TO_CHAR(E.HIREDATE, 'YYYY')) order by deptno;

-- 8) Display year wise highest paid employees BY LOCATION.

SELECT * FROM EMP E,DEPT D WHERE SAL IN (SELECT MAX(SAL) FROM EMP E1,DEPT D1 WHERE D1.LOC = D.LOC AND E1.DEPTNO = D1.DEPTNO AND TO_CHAR(e1.HIREDATE,'YYYY') = TO_CHAR(E.HIREDATE, 'YYYY')) ORDER BY LOC;


-- 9) Display MGR wise highest paid employees.

SELECT * FROM EMP E WHERE SAL IN (SELECT MAX(SAL) FROM EMP E1 WHERE E1.MGR = E.MGR) ORDER BY MGR;


-- 10) Display first employee joined for each manager.

select e1.* from emp e1 where e1.hiredate in (select min(e2.hiredate) from emp e2 where e2.mgr = e1.mgr) ORDER BY E1.MGR;



--11) List down ,the employees whose salary is greater than the avg of their department

select e.* from emp e where e.sal > (select avg(e1.Sal) from emp e1 where e.deptno = e1.deptno) order by deptno;



select substr('chandan',2) from dual;


select INSTR('chandan','a',2,2) from dual;



select TO_CHAR(sysdate,'cc') from dual;

select * from emp where to_char(HIREDATE,'yyyy') BETWEEN 1981 and 1982 and deptno IN (select DEPTNO from dept where loc IN ('NEW YORK','CHICAGO')) and sal>1250 and mgr is not null;
