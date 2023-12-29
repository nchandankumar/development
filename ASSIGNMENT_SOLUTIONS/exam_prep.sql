select substr('chandan-kumar',instr('chandan-kumar','-')+1) from dual;
select instr('chandan-kumar','-') from dual;

--every month first wed
select next_day(last_day(ADD_MONTHS('01-jan-2024',-1)),'wed') from dual;

--every month last wednesday
select next_day(last_day(ADD_MONTHS('01-nov-2023',-1))+24,'fri') from dual;

select to_char(100000,'9,999,99') from dual;


select SYSTIMESTAMP from dual;





select lpad('chandan',10,'*') from dual;
select rpad('chandan',10,'*') from dual;

select lpad(rpad('chandan','10','*'),13,'*') from dual;
select ltrim('chandan kumar','chandan') from dual;
select rtrim('chandan kumar','chandan') from dual;

select replace('chandan kumar','chandan','chandani') from dual;


select substr('Rama Krishna',6,4) from dual;
select substr('Rama Krishna',-7,4) from dual;



update emp set ename = 'HEMANTH' where empno=7902;
select * from emp where substr(ename,1,1)=substr(ename,-1,1);

select ename from emp where instr(ename,'A',1,2)>0;

drop table emp_db;
create table emp_db(
eno number(4),
address varchar2(30)
);



insert into emp_db values(1001,'ameertpet hyderabad');
insert into emp_db values(1002,'srnagar hyderabad');
insert into emp_db values(1003,'panjagutta hyderabad');


select substr(address,1,instr(address,' ',1,1)-1) from emp_db;

select substr(address,-1,instr(address,' ',1,1)-1 )from emp_db;

select instr(address,' ',1,1) from emp_db;

select substr(address,instr(address,' ',1,1)) from emp_db;

select * from emp_db;



select sysdate from dual;


select NEXT_DAY(SYSDATE, 'SAT') from dual;


--waq to display next month first date
select LAST_DAY(SYSDATE)+1 from dual;

-- waq to display current month first date
select add_months(LAST_DAY(SYSDATE),-1)+1 from dual;

--waq to display current month 2nd sat and 4th sat dates
select next_day(add_months(LAST_DAY(SYSDATE),-1)+7,'sat') from dual;

select next_day(add_months(LAST_DAY(SYSDATE),-1)+21,'sat') from dual;

--waq to display each emp experience in years
select empno,round(months_between(sysdate,hiredate)/12) from emp;

--waq to display each emp how much they earned upto last month
select * from emp;
select round(months_between(add_months(LAST_DAY(SYSDATE),-1),hiredate)*sal)  from emp;


select to_char(sysdate,'ddd') from dual;


select to_char(sysdate,'cc') from dual; 
    
select to_char(sysdate,'ddsp') from dual;

--waq to display who are joined in 81 year

select * from emp where to_char(hiredate,'yy') = 81;

--waq to display who are joined on january
select * from emp where to_char(hiredate,'mm') = 01;

--waq to display who are joined on 1st quater of the year
select * from emp where to_char(hiredate,'q') = 1;

--waq to display who are joined from jan to jun
select * from emp where to_char(hiredate,'mm') between 01 and 06;


--waq to display each sysdate date of joining in the following format
--'18/11/21'
--'18th nov 2021'

select to_char(sysdate, 'dd/mm/yy') from dual;
select to_char(sysdate, 'ddth mon, yyyy') from dual;

--waq to display each employee date of joining in the following format
--'18/11/21'
--'18th nov 2021'

--waq to display who are joined on last month

select * from emp where to_char(hiredate,'mm-yyyy') = to_char(add_months(sysdate,-1),'mm-yyyy');

--waq to display who are joined on current month till date

select * from emp where to_char(hiredate,'mm-yyyy') = to_char(sysdate,'mm-yyyy');

-- To convert number to char format
--waq to display emoployee salaries in the following format.
-- 5,000.00
-- 4,000.00

select empno,ename,to_char(sal,'S9G999D99C')  from emp;

Alter session set nls_territory='india';

select empno,ename,to_char(sal,'S9G999D99l')  from emp;


--waq to convert 19/11/23 to oraclepre-defined format

Alter session set nls_territory='america';

select to_date('19/11/23','dd/mm/yy') from dual;
select to_date('11/19/23','mm/dd/yy') from dual;

--waq to display day of independence day
--15/08/1947

select to_date('15/08/1947','dd/mm/yyyy') from dual;
select to_char(to_date('15/08/1947','dd/mm/yyyy'),'day') from dual;
select to_char(to_date('20/11/2023','dd/mm/yyyy'),'day') from dual;

--General functions

--Greatest()

select Greatest(10,20,30,40) from dual;
select Greatest('a','bc','cde') from dual;

--least()
select Least('d','cd','bcd','abcd') from dual;
select least (0,1,2,3,4) from dual;

--NVL(exp1,exp2)

select 100+NULL,100-NULL,100*NULL,100/NULL from dual;

select nvl(null,200),nvl(100,200) from dual;

--waq to display each employee net salary
select empno, ename,sal, nvl(comm,0),sal+nvl(comm,0),deptno from emp;

--SOUNDEX()

--waq to display 'smith' emp record
select * from emp where soundex(ename)=soundex('smit');


--Group by clause

--waq to display dept wise sum of slaries (sub-totals)

select deptno,sum(sal) from emp group by deptno;

--waq to display in each job min and max salary

select job,min(sal),max(sal) from emp group by job;

--waq to display in dept how many  employees are working

select deptno, count(deptno) from emp group by deptno;

--waq to display in each year how many employees are joined

select to_char(hiredate,'yyyy'),count(*) from emp group by to_char(hiredate,'yyyy');

--waq to display under each boss how many sub-ordinates

select mgr,count(*) from emp where mgr is not null group by mgr;


--Having clause
--WAQ to display in which dept more than 3 emps are working

select deptno,count(*)as deptcnt from emp group by deptno having count(*) > 3;

--WAQ to display in which jobs min salary > 2000

select job, min(sal) from emp group by job having min(sal)> 2000;

--Order by clause

select * from emp order by deptno desc;

select * from emp order by deptno asc;

select * from emp order by deptno asc,ename desc;

select empno, sal+nvl(comm,0) as net_sal from emp order by net_sal asc;

select * from emp order by 3; --it will take 3rd column i.e position of columns