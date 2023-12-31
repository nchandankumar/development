-- SET VERIFY OFF;
-- write a PL/SQL block to input employee and display corresponding employee boss name.
DECLARE V_MGRNAME VARCHAR(30);
V_EMPNO NUMBER(4);
BEGIN -- SELECT
M.ENAME,
E.EMPNO INTO V_MGRNAME,
V_EMPNO
FROM EMP E,
  EMP M
WHERE E.MGR = M.EMPNO
  AND E.EMPNO = & EMPNO;
DBMS_OUTPUT.PUT_LINE(
  'BOSS FOR EMPLOYEE ID: ' || V_EMPNO || ' IS ' || V_MGRNAME
);
END;
/ -- OR
DECLARE V_EMPNO NUMBER(4) := & EMPNO;
V_BOSS VARCHAR(30);
BEGIN
SELECT ENAME INTO V_BOSS
FROM EMP
WHERE EMPNO = (
    SELECT MGR
    FROM EMP
    WHERE EMPNO = V_EMPNO
  );
DBMS_OUTPUT.PUT_LINE(
  'BOSS FOR EMPLOYEE ID: ' || V_EMPNO || ' IS ' || V_BOSS
);
END;
/ -- write a PL/SQL block to input employee no. and display corresponding employee name, salary & deptno
DECLARE V_EMPNO NUMBER(4) := & EMPNO;
V_ENAME VARCHAR(30);
V_SAL NUMBER(7, 2);
V_DEPTNO NUMBER(2);
BEGIN
SELECT ENAME,
  SAL,
  DEPTNO INTO V_ENAME,
  V_SAL,
  V_DEPTNO
FROM EMP
WHERE EMPNO = V_EMPNO;
DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME: ' || V_ENAME);
DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY: ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('EMPLOYEE DEPTNO: ' || V_DEPTNO);
END;
/ --WITH REFERENCED DATATYPE
-- #column type
DECLARE V_EMPNO EMP.EMPNO %TYPE := & EMPNO;
V_ENAME EMP.ENAME %TYPE;
V_SAL EMP.SAL %TYPE;
V_DEPTNO EMP.DEPTNO %TYPE;
BEGIN
SELECT ENAME,
  SAL,
  DEPTNO INTO V_ENAME,
  V_SAL,
  V_DEPTNO
FROM EMP
WHERE EMPNO = V_EMPNO;
DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME: ' || V_ENAME);
DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY: ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('EMPLOYEE DEPTNO: ' || V_DEPTNO);
END;
/ -- #row type
DECLARE E EMP %ROWTYPE;
BEGIN
SELECT * INTO E
FROM EMP
WHERE EMPNO = & EMPNO;
DBMS_OUTPUT.PUT_LINE(
  E.EMPNO || ' ' || E.ENAME || ' ' || E.JOB || ' ' || E.MGR || ' ' || E.SAL
);
END;
/ -- #Rowtype attribute using INSERT and UPDATE Commands:
-- INSERT Command:
DECLARE D DEPT %ROWTYPE;
BEGIN D.DEPTNO := 50;
D.DNAME := 'Maths';
D.LOC := 'HYD';
INSERT INTO DEPT
VALUES D;
DBMS_OUTPUT.PUT_LINE('ROW INSERTED SUCCESSFULLY😊');
END;
/ -- UPDATE Command:
DECLARE D DEPT %ROWTYPE;
BEGIN D.DEPTNO := 50;
D.DNAME := 'English';
D.LOC := 'HYD';
UPDATE DEPT
SET ROW = D
WHERE DEPTNO = D.DEPTNO;
DBMS_OUTPUT.PUT_LINE('RECORD UPDATED SUCCESSFULLY😊');
END;
/ -- AT A TIME WE CAN UPDATE ALL THE RECORD
SELECT *
FROM DEPT;
-- write a PL/SQL block to input employee no. and display corresponding grade.
DECLARE V_ENAME VARCHAR(30);
V_GRADE NUMBER(2);
V_EMPNO NUMBER(4);
BEGIN
SELECT E.EMPNO,
  E.ENAME,
  S.GRADE INTO V_EMPNO,
  V_ENAME,
  V_GRADE
FROM EMP E,
  SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
  AND E.EMPNO = & EMPNO;
DBMS_OUTPUT.PUT_LINE(
  'GRADE FOR EMPLOYEE' || V_EMPNO || ' - ' || V_ENAME || ' IS ' || V_GRADE
);
END;
/ -- or
DECLARE V_EMPNO EMP.EMPNO %TYPE := & EMPNO;
V_GRADE SALGRADE.GRADE %TYPE;
BEGIN
SELECT GRADE INTO V_GRADE
FROM EMP,
  SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL
  AND EMPNO = V_EMPNO;
DBMS_OUTPUT.PUT_LINE(
  'GRADE FOR EMPLOYEE ' || V_EMPNO || ' - ' || V_GRADE
);
END;
/ -- CONTROL STRUCTURES
-- Control structures are used to control flow of the program
-- basically PL/SQL supports 4 types of control structures
-- I. CONDITIONAL CONTROL STRUCTURES
-- II. BRANCHING CONTROL STRUCTURES
-- III. INTERATION CONTROL STRUCTURES
-- IV. UN-CONDITIONAL CONTROL STRUCTURES
-- I. CONDITIONAL CONTROL STRUCTURES
-- i. SIMPLE IF
DECLARE FLAG BOOLEAN := & FLAG;
BEGIN IF FLAG = TRUE THEN DBMS_OUTPUT.PUT_LINE('WE ARE AT TRUE BLOCK');
END IF;
DBMS_OUTPUT.PUT_LINE('END OF THE PROGRAM');
END;
/ -- ii. IF .. ELSE
-- write a PL/SQL block to find given number is even or ODD
DECLARE N NUMBER(4) := & N;
BEGIN IF MOD(N, 2) = 0 THEN DBMS_OUTPUT.PUT_LINE('GIVEN NUMBER IS EVEN');
ELSE DBMS_OUTPUT.PUT_LINE('GIVEN NUMBER IS ODD');
END IF;
END;
/ -- iii. NESTED IF
-- write a PL/SQL block to declare employee bonus based on following conditions...
-- if EMPLOYEE type is 'permanent' and experience >=10 years then 20% bonus
--if EMPLOYEE type is 'permanent' and experience < 10 years then 10% bonus
-- if EMPLOYEE type is 'temporary' then 5% bonus
DECLARE EMP_TYPE CHAR(1) := '&EMP_TYPE';
EXPE NUMBER(5, 2) := & EXPE;
BEGIN IF EMP_TYPE = 'P' THEN IF EXPE >= 10 THEN DBMS_OUTPUT.PUT_LINE('EMPLOYEE WILL GET 20% BONOUS');
ELSE DBMS_OUTPUT.PUT_LINE('EMPLOYEE WILL GET 10% BONOUS');
END IF;
ELSE IF EMP_TYPE = 'T' THEN DBMS_OUTPUT.PUT_LINE('EMPLOYEE WILL GET 5% BONOUS');
END IF;
END IF;
END;
/ -- iv. ELSIF LADER
-- write a PL/SQL block to input student avg. and display grade
DECLARE VAVG NUMBER(5, 2) := & AVG;
BEGIN IF VAVG >= 70 THEN DBMS_OUTPUT.PUT_LINE('DISTINCTION');
ELSIF VAVG >= 60 THEN DBMS_OUTPUT.PUT_LINE('FIRST CLASS');
ELSIF VAVG >= 50 THEN DBMS_OUTPUT.PUT_LINE('SECOND CLASS');
ELSE DBMS_OUTPUT.PUT_LINE('THIRD CLASS');
END IF;
END;
/ -- II. BRANCHING CONTROL STATEMENT
-- i. CASE
-- write a PL/SQL block to display message
DECLARE COLOR CHAR(1) := '&COLOR';
BEGIN CASE
  COLOR
  WHEN 'R' THEN DBMS_OUTPUT.PUT_LINE('YOU HAVE SELECTED RED COLOR');
WHEN 'Y' THEN DBMS_OUTPUT.PUT_LINE('YOU HAVE SELECTED YELLOW COLOR');
WHEN 'G' THEN DBMS_OUTPUT.PUT_LINE('YOU HAVE SELECTED GREEN COLOR');
WHEN 'O' THEN DBMS_OUTPUT.PUT_LINE('YOU HAVE SELECTED ORANGE COLOR');
ELSE DBMS_OUTPUT.PUT_LINE('YOUR SELECTED COLOR NOT FOUND, TRY AGAIN!!');
END CASE
;
END;
/ -- III. ITERATION CONTROL STRUCTURES
-- i. Simple loop
BEGIN LOOP DBMS_OUTPUT.PUT_LINE('WELCOME TO PL/SQL COURSE!!');
END LOOP;
END;
/ --Write a PL/SQL block to display welcome message 10 times.
--USING METHOD 1
DECLARE I NUMBER(4) := 1;
BEGIN LOOP IF I > 10 THEN EXIT;
END IF;
DBMS_OUTPUT.PUT_LINE('WELCOME');
I := I + 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('END OF THE PROGRAM.');
END;
/ --USING METHOD 2
DECLARE I NUMBER(4) := 1;
BEGIN LOOP EXIT
WHEN I > 10;
DBMS_OUTPUT.PUT_LINE('WELCOME' || I);
I := I + 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('END OF THE PROGRAM.');
END;
/ -- ii. while loop
-- write a PL/SQL block to display 1 to 10 natural numbers
DECLARE I NUMBER(4) := 1;
BEGIN WHILE (I <= 10) LOOP DBMS_OUTPUT.PUT_LINE(I);
I := I + 1;
END LOOP;
END;
/ --write a PL/SQL block to display 1 to 10 natural numbers in reverse order
DECLARE I NUMBER(4) := 10;
BEGIN WHILE (I >= 1) LOOP DBMS_OUTPUT.PUT_LINE(I);
I := I -1;
END LOOP;
END;
/ -- write a PL/SQL block to display multiplication table
DECLARE N NUMBER(4) := & N;
I NUMBER(4) := 1;
BEGIN WHILE (I <= 10) LOOP DBMS_OUTPUT.PUT_LINE(N || ' X ' || I || ' = ' || (N * I));
I := I + 1;
END LOOP;
END;
/ -- write a PL/SQL block to display FACTORIAL OF A GIVEN NUMBER
DECLARE N NUMBER(4) := & N;
CN NUMBER(4);
FACT NUMBER(4) := 1;
BEGIN CN := N;
IF N = 0 THEN DBMS_OUTPUT.PUT_LINE('THE FACTORIAL OF ' || N || ' IS 1.');
ELSIF N < 0 THEN DBMS_OUTPUT.PUT_LINE(
  'THE FACTORIAL OF ' || N || ' DOESNOT EXISTS.'
);
ELSE WHILE (N > 0) LOOP FACT := FACT * N;
N := N -1;
END LOOP;
DBMS_OUTPUT.PUT_LINE(
  'THE FACTORIAL OF ' || CN || ' IS ' || FACT
);
END IF;
END;
/ --write a PL/SQL block to display a string in vertical order
DECLARE S VARCHAR2(100) := '&S';
I NUMBER(4) := 1;
BEGIN WHILE(I <= LENGTH(S)) LOOP DBMS_OUTPUT.PUT_LINE(SUBSTR(S, I, 1));
I := I + 1;
END LOOP;
END;
/ -- write a PL/SQL block to display FOLLOWING FORMAT OUTPUT
-- C
-- CH
-- CHA
-- CHAN
-- CHAND
-- CHANDA
-- CHANDAN
DECLARE S VARCHAR2(100) := '&S';
I NUMBER(4) := 1;
BEGIN WHILE (I <= LENGTH(S)) LOOP DBMS_OUTPUT.PUT_LINE(SUBSTR(S, 1, I));
I := I + 1;
END LOOP;
END;
/ -- iii. for loop
-- write a PL/SQL block to display 1 to 10 natural numbers
BEGIN FOR I IN 1..10 LOOP DBMS_OUTPUT.PUT_LINE(I);
END LOOP;
END;
/ --write a PL/SQL block to display 1 to 10 natural numbers in reverse order
BEGIN FOR I IN REVERSE 1..10 LOOP DBMS_OUTPUT.PUT_LINE(I);
END LOOP;
END;
/ -- iv. for cursor
/*DISCUSS LATER*/
--IV. UNCONDITIONAL CONTROL STRUCTURES
-- i. GOTO          ii. EXIT
-- write a PL/SQL block to find given number is even or ODD
DECLARE N NUMBER(4) := & N;
BEGIN IF MOD(N, 2) = 0 THEN GOTO EVEN;
ELSE GOTO ODD;
END IF;
<< EVEN >> DBMS_OUTPUT.PUT_LINE('GIVEN NO. IS EVEN.');
GOTO ENDL;
<< ODD >> DBMS_OUTPUT.PUT_LINE('GIVEN NO. IS ODD.');
GOTO ENDL;
<< ENDL >> DBMS_OUTPUT.PUT_LINE('END OF THE PROGRAM.');
END;
/ --#CURSORS :
-- I. STATIC CURSOR
-- A. EXPLICIT CURSOR
--PL/SQL block for to demonstrate cursor operations and attributes.
DECLARE CURSOR MY_CUR IS
SELECT ENAME
FROM EMP
WHERE DEPTNO = 60;
V_ENAME EMP.ENAME %TYPE;
BEGIN OPEN MY_CUR;
IF MY_CUR %ISOPEN THEN DBMS_OUTPUT.PUT_LINE('CURSOR IS OPEN.');
END IF;
FETCH MY_CUR INTO V_ENAME;
IF MY_CUR %FOUND THEN DBMS_OUTPUT.PUT_LINE('CURSOR CONTAINS DATA');
ELSIF MY_CUR %NOTFOUND THEN DBMS_OUTPUT.PUT_LINE('NO DATA FOUND.');
END IF;
CLOSE MY_CUR;
END;
/ --write a PL/SQL block to display all employee name.
DECLARE CURSOR MY_CUR IS
SELECT ENAME
FROM EMP;
V_ENAME EMP.ENAME %TYPE;
BEGIN OPEN MY_CUR;
IF MY_CUR %ISOPEN THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED SUCCESSFULLY😊');
END IF;
FETCH MY_CUR INTO V_ENAME;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
FETCH MY_CUR INTO V_ENAME;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
FETCH MY_CUR INTO V_ENAME;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
FETCH MY_CUR INTO V_ENAME;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
CLOSE MY_CUR;
END;
/ -- NOTE: Above program displays first 4 employee names only,to display all employee names we need to use cursor using loops.
-- i. cursor using simple loops
--write a PL/SQL block to display all employee name.
DECLARE CURSOR MY_CUR IS
SELECT ENAME
FROM EMP;
V_ENAME EMP.ENAME %TYPE;
BEGIN OPEN MY_CUR;
IF MY_CUR %ISOPEN THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED SUCCESSFULLY😊');
END IF;
LOOP FETCH MY_CUR INTO V_ENAME;
EXIT
WHEN MY_CUR %NOTFOUND;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
END LOOP;
CLOSE MY_CUR;
END;
/ --write a PL/SQL block to display TOP - 5 employee MAXIMUM salaries
DECLARE CURSOR E_CUR IS
SELECT SAL
FROM EMP
ORDER BY SAL DESC;
V_SAL EMP.SAL %TYPE;
BEGIN OPEN E_CUR;
IF E_CUR %ISOPEN THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED SUCCESSFULLY😊');
END IF;
LOOP FETCH E_CUR INTO V_SAL;
EXIT
WHEN E_CUR %ROWCOUNT > 5;
DBMS_OUTPUT.PUT_LINE(V_SAL);
END LOOP;
CLOSE E_CUR;
END;
/ --Write a cursor program to display empno, ename,JOB, sal and deptno
DECLARE CURSOR E_CUR IS
SELECT EMPNO,
  ENAME,
  JOB,
  SAL,
  DEPTNO
FROM EMP;
V_EMPNO EMP.EMPNO %TYPE;
V_ENAME EMP.ENAME %TYPE;
V_JOB EMP.JOB %TYPE;
V_SAL EMP.SAL %TYPE;
V_DEPTNO EMP.DEPTNO %TYPE;
BEGIN OPEN E_CUR;
IF E_CUR %ISOPEN THEN DBMS_OUTPUT.PUT_LINE('CURSOR OPENED SUCCESSFULLY😊');
END IF;
LOOP FETCH E_CUR INTO V_EMPNO,
V_ENAME,
V_JOB,
V_SAL,
V_DEPTNO;
EXIT
WHEN E_CUR %NOTFOUND;
DBMS_OUTPUT.PUT_LINE(
  V_EMPNO || ' ' || V_ENAME || ' ' || V_JOB || ' ' || V_SAL || ' ' || V_DEPTNO
);
END LOOP;
CLOSE E_CUR;
END;
/ --wrIte a cursor program to display alternate records(even records)
-- CURSOR USING WHILE LOOP
----------------------------------
DECLARE CURSOR E_CUR IS
SELECT *
FROM EMP;
E EMP %ROWTYPE;
BEGIN OPEN E_CUR;
FETCH E_CUR INTO E;
WHILE (E_CUR %FOUND) LOOP IF MOD(E_CUR %ROWCOUNT, 2) = 0 THEN DBMS_OUTPUT.PUT_LINE(
  E.EMPNO || ' ' || E.ENAME || ' ' || E.JOB || ' ' || E.SAL || ' ' || E.DEPTNO
);
END IF;
FETCH E_CUR INTO E;
END LOOP;
CLOSE E_CUR;
END;
/ --CURSOR WITH PARAMETERS
----------------------------
-- Write a cursor program to input deptno and display corresponding employee details
DECLARE CURSOR EMP_CUR(PDEPTNO NUMBER) IS
SELECT ENAME
FROM EMP
WHERE DEPTNO = PDEPTNO;
V_ENAME EMP.ENAME %TYPE;
BEGIN OPEN EMP_CUR(10);
LOOP FETCH EMP_CUR INTO V_ENAME;
EXIT
WHEN EMP_CUR %NOTFOUND;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
END LOOP;
CLOSE EMP_CUR;
END;
/ -- IN RUNTIME
DECLARE CURSOR EMP_CUR(PDEPTNO NUMBER) IS
SELECT ENAME
FROM EMP
WHERE DEPTNO = PDEPTNO;
V_ENAME EMP.ENAME %TYPE;
BEGIN OPEN EMP_CUR(& DEPTNO);
LOOP FETCH EMP_CUR INTO V_ENAME;
EXIT
WHEN EMP_CUR %NOTFOUND;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
END LOOP;
CLOSE EMP_CUR;
END;
/ -- Write a cursor program to increment employee salaries based on the following conditions  and incremental details should be stored in employee audit table
-- if job is MANAGER/ANALYST then 40%
--if job is SALESMAN/CLERK THEN 20%
--For other jobs no increment
-- Table CREATION
CREATE TABLE EMP_AUDIT (
  EMPNO NUMBER(4),
  INCR_DATE DATE,
  INCR_AMT NUMBER(8, 2)
);
-- PROGRAM:
DECLARE CURSOR C1 IS
SELECT EMPNO,
  JOB,
  SAL
FROM EMP;
E C1 %ROWTYPE;
INCR_SAL NUMBER(7, 2);
BEGIN OPEN C1;
LOOP FETCH C1 INTO E;
EXIT
WHEN C1 %NOTFOUND;
IF E.JOB IN ('MANAGER', 'ANALYST') THEN INCR_SAL := E.SAL * 0.4;
ELSIF E.JOB IN ('SALESMAN', 'CLERK') THEN INCR_SAL := E.SAL * 0.2;
ELSE INCR_SAL := 0;
END IF;
UPDATE EMP_PRACTICE
SET SAL = SAL + INCR_SAL
WHERE EMPNO = E.EMPNO;
INSERT INTO EMP_AUDIT
VALUES(E.EMPNO, SYSDATE, INCR_SAL);
END LOOP;
CLOSE C1;
END;
/
SELECT *
FROM EMP_AUDIT;
-- B. IMPLICIT CURSOR
BEGIN
UPDATE EMP_PRACTICE
SET SAL = SAL + 100
WHERE EMPNO = & EMPNO;
IF SQL %FOUND THEN DBMS_OUTPUT.PUT_LINE('RECORD UPDATED SUCCESSFULLY😊');
ELSIF SQL %NOTFOUND THEN DBMS_OUTPUT.PUT_LINE('EMPLOYEE RECORD NOT FOUND');
END IF;
END;
/