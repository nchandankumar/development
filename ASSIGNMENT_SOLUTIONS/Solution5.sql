-- 1)	Display ename, just salary if more than 1500,if exactly 1500 display on target, if less than 1500 display below 1500.
 
select ename,
CASE
when sal > 1500 THEN 'just salary'
when sal = 1500 THEN 'On target'
when sal < 1500 THEN 'below 1500'
END as sal_status from emp;

-- 2)	Display the ename, hiredate and also the paydate. Paydate is computed as follows 
--Employee hired on or hired before the 15th of any month are paid on the last Friday of that month. Those hired after the 15th are paid on the first Friday of the following month. 

select ename,HIREDATE,
CASE
when to_char(HIREDATE,'dd') >15 Then next_day(add_months(last_day(HIREDATE),0),'fri')
when TO_CHAR(HIREDATE,'dd') <=15 Then next_day(add_months(last_day(HIREDATE),-1)+21,'fri')
END as paydate
 from emp;

-- 3)	Display ename,deptno,monthly salary and adjusted monthly salary as 
--                               Department       -                 Raise by
--                 10                                   5%
--                 11                                       7%


select ename,deptno,sal, (
  case deptno 
  when 10 then sal+sal*0.05
  when 11 then sal+sal*0.07
  END
) as adjusted_mon_sal from EMP;
-- 4) Display complete info of employees and to change job from present designation to new one.
-- 	OLD		NEW
-- 	CLERK		MANAGER
-- 	MANAGER		SR.MANAGER
-- 	SALESMAN	SR.SALESMAN     

select e.*, (
  case job
  when 'CLERK' THEN 'MANAGER'
  when 'MANAGER' THEN 'SR.MANAGER'
  when 'SALESMAN' THEN 'SR.SALESMAN'
  END
) as new_job from emp e;
-- 5) Display complete info of employees and to change their salary as follows
-- 	RANGE		INCREMENT
-- 	1000-1250	500
-- 	1251-2500	600
-- 	2500-4999	1000

select e.*, (
  case 
  when SAL BETWEEN 1000 And 1250 Then sal+500
  when SAL BETWEEN 1251 And 2500 Then sal+600
  when SAL BETWEEN 2500 And 4999 Then sal+1000
END
) as updated_sal from emp e;



