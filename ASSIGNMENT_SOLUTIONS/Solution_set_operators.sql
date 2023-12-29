-- ~~~~~~~~~~JOINS, GROUP FUNCTIONS~~~~~~~~~~
-- 1.Display department wise, average salary where average salary ranging between 1000-3000.


select e.deptno,d.dname,avg(sal) from emp e,dept d where e.DEPTNO = d.DEPTNO  group by e.DEPTNO, d.DNAME having avg(sal) BETWEEN 1000 and 3000;

-- 2.Display grade wise, location wise, count of employees where count of employees =2.

select s.grade,d.loc,count(*) from emp e,dept d, SALGRADE s where e.DEPTNO = d.DEPTNO and e.sal between s.LOSAL and s.HISAL group by s.GRADE,d.loc having  count(*) > 2;


-- 3.Display department name wise, job wise, sum of annual salary where annual salary between 20000 to 40000 for year 1980,81,82.

select d.dname,e.job,sum(e.sal*12) from emp e, dept d where e.DEPTNO = d.DEPTNO(+) and to_char(E.HIREDATE,'YYYY') IN (1980,1981,1982) group by d.dname,e.job having sum(e.sal*12) BETWEEN 20000 and 40000;

-- 4.Display location wise, count of employees, average salaries for location new york, chicago and dallas.
select d.loc,count(*),avg(e.sal) from emp e, dept d where e.deptno = d.deptno and e.DEPTNO in (select deptno from dept where loc in ('NEW YORK','CHICAGO','DALLAS')) group by d.loc;

-- 5.Display year wise count of employees where count is more than 3.

select to_char(HIREDATE,'YYYY'),count(*) from emp group by to_char(HIREDATE,'YYYY') having count(*) >3;

-- 6.Display mgr wise sum of all mgr salaries whose sum of employee salaries ranging between 3000 to 30000.

select mgr,sum(sal) from emp group by mgr having sum(sal) BETWEEN 3000 and 30000;



-- 7.Display month wise employees joined in every department.

select d.dname,e.deptno, to_char(e.HIREDATE,'mon'),count(*) from emp e,dept d where e.DEPTNO = d.DEPTNO(+)group by e.deptno,to_char(e.HIREDATE,'mon'),d.dname order by deptno;


-- 8.Display department number wise, department name wise, grade wise, job wise mgrs where mgrs name has atleast one 'A' in it.

select e.ename,e.deptno,d.dname,s.grade,e.job from emp e,dept d,SALGRADE s
where e.deptno=d.deptno
and e.sal between s.losal and s.hisal and e.empno in 
(select e1.mgr from emp e1 where e.ename like '%A%' and e.mgr is not null)
group by e.deptno,d.dname,s.grade,e.job,e.ename;

-- 9.Display department, sum of salaries for those employees who are not managers.

select d.dname, sum(e.sal) from emp e, emp e1,dept d where e.DEPTNO = d.DEPTNO and e.mgr !=e.empno group by d.dname;


-- ~~~~~~~~~~SET OPERATORS~~~~~~~~~~
-- 1.Display details of all employees whose salaries are same as any of the following:
--   -The salary of all employee who are working as managers.
--   -Salaries of all clerks who are first level managers.
--   -The commission of all salesman of sales department belongs to grade 1,2,3.
--   -One third of salary of 1st level of mgr of grade 4,5.

SELECT * FROM EMP 
WHERE SAL IN (SELECT SAL FROM EMP WHERE JOB = 'MANAGER')
UNION
SELECT * FROM EMP
WHERE SAL IN (SELECT M.SAL FROM EMP E, EMP M
 WHERE M.JOB = 'CLERK' AND E.MGR = M.EMPNO)
UNION
SELECT * FROM EMP
WHERE SAL IN (SELECT SUM(NVL(COMM, 0)) FROM EMP E, DEPT D, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.DEPTNO = D.DEPTNO
AND E.JOB='SALESMAN' 
AND D.DNAME='SALES'
AND S.GRADE IN (1,2,3))
UNION
SELECT * FROM EMP 
WHERE SAL IN (SELECT (1/3)*M.SAL FROM EMP E, EMP M, SALGRADE S
 WHERE M.JOB = 'CLERK' AND E.MGR = M.EMPNO AND M.SAL BETWEEN S.LOSAL AND S.HISAL
AND S.GRADE IN (4,5));



-- 2.Display all the jobs available with department 10 and 20 but not with the sales department.
select job from emp where deptno =10
union
select job from emp where deptno = 20
minus 
select   job from emp where deptno not in (select deptno from dept where dname = 'SALES');


-- 3.Find the job that filled in the first half of 1983 and the same job that has hired during the same period in 1984.

select * from emp where (to_char(hiredate,'MM ') <= 06 and to_char(hiredate,'YYYY') = 1984) and job in (select job from emp where to_char(hiredate,'MM' ) <= 06 and to_char(hiredate,'YYYY') <= 1983) ;

or 

SELECT JOB 
FROM EMP
WHERE JOB IN (SELECT JOB FROM EMP
WHERE TO_CHAR(HIREDATE,'YY') = 82 
AND TO_CHAR(HIREDATE,'Q') IN (1,2)) AND TO_CHAR(HIREDATE,'YY') = 83
AND TO_CHAR(HIREDATE,'Q') IN (1,2);


-------------------------------

CREATE TABLE Employees (
  EmpID INT NOT NULL PRIMARY KEY,
  FirstName VARCHAR(35) NOT NULL,
  LastName VARCHAR(35) NOT NULL,
  ManagerID INT NOT NULL);


  INSERT INTO Employees
  (EmpID, FirstName, LastName, ManagerID)
 VALUES
  (1, 'John', 'Smith', 2),
  (2, 'Anna', 'White', 1),
  (3, 'Jack', 'Black', 4),
  (4, 'Tim', 'Smith', 2),
  (5, 'Jason', 'Black', 3),
  (6, 'Tom', 'Black', 3);


WITH cte AS 
(
    SELECT EmpID,FirstName,LastName,ManagerID,1 level
    FROM Employees 
    UNION ALL
    SELECT t2.EmpID,t2.FirstName,t2.LastName,t2.ManagerID,level+ 1
    FROM cte t1 JOIN Employees t2
    on t1.EmpId = t2.ManagerID
    WHERE t1.ManagerID <> t2.EmpId
)

    SELECT EmpID,FirstName,LastName 
    FROM cte t1
    where not exists (
        select 1 
        from cte tt
        WHERE tt.level = 2 and t1.EmpID = tt.EmpID
    ) and level = 1;




select d.*,'Active' as status from dept d;

with cte as (
  select deptno,dname,loc,'Active' as status from dept d
)
select * from cte;