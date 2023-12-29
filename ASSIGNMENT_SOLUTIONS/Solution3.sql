-- 41)	Display the department name and string ‘HELLO’ in lower case.
select lower(dname),lower('HELLO') from DEPT;

-- 42)	Display the ename in upper case and the job in lower case.

select upper(ename),lower(job) from emp;

-- 43)	Display the employee name with initial letter in capital.

select INITCAP(ename) from emp;

-- 44)	Display the empno, ename together using concat.

select concat(EMPNO,ename) from emp;

-- 45)	Display the ename left justified using 25 spaces.

select LPAD(ename,25,'*') from emp;

-- 46)	Display the ename right justified using 25 spaces.

select RPAD(ename,25,'*') from emp;

-- 47)	Display the employee name from 2nd letter onwards and the job the five characters from 2nd position onwards.

select SUBSTR(ename,2), SUBSTR(job,2,5) from emp;
SELECT * from emp;

-- 48)	Display the character position of ‘A’ in employee name and the character position of 2nd occurrence of ‘C’ 
-- in name starting at position 1 onwards.

SELECT ename,INSTR(ename,'A'),INSTR(ename,'C',1,2) from emp;

-- 49)	Remove any occurrence of ‘A’ on the left of the employee name.

SELECT ename,ltrim(ename,'A') from emp;

-- 50)	Remove any occurrence of ‘G’ on the right of the department name.
SELECT ename,Rtrim(ename,'G') from emp;

-- 51)	Find the length of the character of ename.

select ename,length(ename) from emp;

-- 52)	Change every occurrence of ‘C’ in the department name to ’P’.

select REPLACE(dname,'C','P') from dept;

-- 53)	Change every occurrence of ‘C’ to ‘P’ and ‘I’ to ‘T’ in dname.
select REPLACE(REPLACE(dname,'C','P'),'I','T') from dept;

-- 54)	Change every occurrence of job from salesman to salesman.

select replace(job,'salesman','salesman') from emp;

-- 55)	Find the number of times the character ’S’ occurs in the deptname.

select dname,length(dname) - LENGTH(replace(dname,'S','')) from dept;


-- ~~~~~~~~~~CHARACTER FUNCTIONS~~~~~~~~~~
-- 1.Display the details of employees whose name ends with H.
select * from emp where ename like '%H';
-- 2.Display the details of employees who are hired in the month of MAY irrespective of the year.
select * from emp where to_char(hiredate,'mon') like 'may';
-- 3.Display the employee details whose name starts with S and has 5 characters.
select * from emp where ename like 'S%' and LENGTH(ename)=5;
-- 4.Display the details of the employees whose name start with C and has salary greater than 2400 and whose job name starts with M.
SELECT * from emp where ename like 'C%' and sal>2400 and job like 'M%';
-- 5.Display the details of employees whose job name has 7 characters and joined in the year 1981 and having commission greater than 500.
select * from emp where length(job) = 7 and to_char(HIREDATE,'yyyy') = 1981 and comm>500;

-- 6.Display employee names having character 'A' after second position more than 2 times.

select ename from emp where regexp_count(substr(ename,3),'a')>2;

-- 7.Display all the salaries of employees with fixed size format of 8 characters.
select rpad(sal,8,'*') as "Salary" from emp;


