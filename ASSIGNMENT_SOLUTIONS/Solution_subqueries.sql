
-- ~~~~~~~~~~SUBQUERIES~~~~~~~~~~
-- 1.Display the details of employees whose salary more than james salary and less than kings salary but should not equal to sal of miller and adams in the descending order of salary.

select * from emp where sal > (select sal from emp where ename='JAMES') and sal < (select sal from emp where ENAME='KING') and sal not in  (select sal from emp where ENAME IN ('MILLER','ADAMS'))  order by sal desc;

-- 2.Display the jobs that are same as the jobs of employees of newyork but don't display newyork's jobs.

select distinct job from emp where deptno <> (select deptno from dept where loc='NEW YORK');
-- 3.Display all grade 2,3 employees belongs to the department of King.

select * from emp where DEPTNO = (select deptno from emp where ename = 'KING') and sal BETWEEN (select LOSAL from SALGRADE where grade = 2) and (select HISAL from SALGRADE where grade =3);

select e.*,s.GRADE from emp e, SALGRADE s where DEPTNO = (select deptno from emp where ename = 'KING') and e.sal BETWEEN s.losal and s.hisal and s.grade in (2,3);

-- 4.Display the details of highest paid employees.
SELECT * FROM emp WHERE sal = (SELECT MAX(sal) FROM emp);

-- 5.Display the details of highest paid employee of accounting department.
SELECT * FROM emp WHERE sal = (SELECT MAX(sal) FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE DNAME = 'ACCOUNTING'));

-- 6.Display the highest salary of accounting department.
select max(sal) from emp where deptno = (select deptno from dept where dname = 'ACCOUNTING');
-- 7.Display the details of highest paid employee of grade 3.
select * from emp where sal = (select max(e.sal) from emp e, SALGRADE s where e.sal BETWEEN s.LOSAL and s.HISAL and s.grade = 3);

-- 8.Display the details of senior most employee of grade 4.

select  e.* from emp e where  (MONTHS_BETWEEN(sysdate,e.HIREDATE)/12) = (select max(MONTHS_BETWEEN(sysdate,e.HIREDATE)/12) from emp e,SALGRADE s where e.sal BETWEEN s.LOSAL and s.HISAL and s.grade = 4); 
-- 9.Display the details of senior most employee of accounting department.

select e.* from emp e where (MONTHS_BETWEEN(sysdate,e.HIREDATE)/12) = (select MAx(MONTHS_BETWEEN(sysdate,HIREDATE)/12) from emp where DEPTNO = (select deptno from dept where dname='ACCOUNTING'));

-- 10.Display the details of all employees of Research department except lowest paid employee of that department.


select e.* from emp e where e.DEPTNO = (select deptno from dept where dname='RESEARCH') and e.sal > (select min(Sal) from emp where DEPTNO = (select deptno from dept where dname='RESEARCH'));

-- 11.Display the details of senior most employee who is manager to other.
select e.* from emp e where (MONTHS_BETWEEN(sysdate,e.HIREDATE)/12) = (select MAx(MONTHS_BETWEEN(sysdate,HIREDATE)/12) from emp where job = 'MANAGER'); 

-- 12.Display the details of lowest paid grade 4 employees.

select e.* from emp e where e.sal = (select min(e.sal) from emp e, salgrade s  where e.sal BETWEEN s.LOSAL and s.HISAL and s.GRADE = 4);

-- 13.Display lowest paid employee of each job group.

select e.* from emp e where (e.job,e.sal) in (select job,min(sal) from emp group by job);

-- 14.Find out employees who joined 5th in company based in hiredate.
select ename,hiredate from emp order by hiredate desc 
;
-- 15.Find out top paid employee with annual salary.
select e.*, e.sal*12 as annual_sal from emp e where e.sal = (select max(sal) from emp);

select e.*,(sal+nvl(comm,0)) * 12 annual_salary from emp e where 
e.empno = (select empno from emp where (sal+nvl(comm,0)) * 12 = (select max((sal+nvl(comm,0)) * 12) from emp));

-- 16.Display department wise first joined employee based on the job.

select * from emp where empno In(select empno from emp where (deptno,hiredate) In (select deptno,min(HIREDATE) from emp group by DEPTNO));


-- 17.Display all odd rows.

select * from (select e.*,rownum rn from emp e) where mod(rn,2)<>0;

-- 18.Display all even rows.
select * from (select e.*,rownum rn from emp e) where mod(rn,2)=0;

-- 19.Display the departments where there are atleast 2 grade 1,2 employees.

with cte as (
  select e.deptno,count(*) as emp_cnt from emp e,salgrade s where e.sal BETWEEN s.LOSAL and s.hisal and s.grade in (1,2) group by e.deptno
)
select dname from dept where deptno IN (select deptno from cte where emp_cnt >= 2); 

-- 20.Display the department that has highest number of employees

with cte as (
  select deptno, count(*) as cnt from emp group by deptno
)
select deptno,cnt from cte where cnt = (select max(cnt) from cte);
-------------------------------------------------------------
select * from (select deptno,count(*) as cnt from emp group by deptno) where cnt = (select max(cnt) from (select count(*) as cnt from emp group by DEPTNO));
------------------------------------------------------------------
select dname from dept where deptno In (select deptno from emp group by DEPTNO order by count(*) desc offset 0 rows fetch next 1 row only);
-------------------------------------------------------------------
-- 21.Display details of the departments where there are employees with 2 'A''s in their ename.

select dname from dept where deptno = (select deptno from emp where (length(ename) - length(replace(ename,'A',''))) = 2);

select dname from dept where deptno in (select deptno from emp where ename like'%A%A%' group by deptno);
-- 22.Display departments where there are employees joined in the month of december.

select deptno,dname from dept where DEPTNO IN (select deptno from emp where to_char(HIREDATE,'mm')=12);
