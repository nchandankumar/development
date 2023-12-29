-- write a PL/SQL block to display welecome message

BEGIN
DBMS_OUTPUT.PUT_LINE('WELCOME TO PL/SQL');
END;
/

-- write a PL/SQL block to display sum of 2 numbers
DECLARE 
X NUMBER(4) := 10;
Y NUMBER(4) := 20;
Z NUMBER(6);
BEGIN
Z := X+Y;
DBMS_OUTPUT.PUT_LINE(Z);
END;
/

-- TAKE INPUT AT RUNTIME
DECLARE 
X NUMBER(4) := &X;
Y NUMBER(4) := &Y;
Z NUMBER(6);
BEGIN
Z := X+Y;
DBMS_OUTPUT.PUT_LINE('SUM OF 2 NUMBERS ' || Z);
END;
/

-- write a PL/SQL block to swap to given number with out using 3rd variable
DECLARE
X NUMBER(4) := 10;
Y NUMBER(4) := 20;
BEGIN
DBMS_OUTPUT.PUT_LINE('BEFORE SWAP X = ' || X || ' Y = ' || Y);
X := X+Y;
Y := X-Y;
X := X-Y;
DBMS_OUTPUT.PUT_LINE('AFTER SWAP X = ' || X || ' Y = ' || Y);
END;
/

-- PL/SQL Programs to interact with DB tables.

-- SELECT INTO : 
-----------------
--Write a PL/SQL to display input employee no. and display corresponding employee name.
DECLARE
-- V_ENAME EMP.ENAME%TYPE;
V_ENAME VARCHAR(10);
BEGIN
SELECT ENAME INTO V_ENAME FROM EMP WHERE EMPNO = 7788;
DBMS_OUTPUT.PUT_LINE('Employee Name is ' || V_ENAME);
END;
/

--IN RUNTIME
DECLARE
-- V_ENAME EMP.ENAME%TYPE;
V_ENAME VARCHAR(10);
BEGIN
SELECT ENAME INTO V_ENAME FROM EMP WHERE EMPNO = &EMPNO;
DBMS_OUTPUT.PUT_LINE('Employee Name is ' || V_ENAME);
END;
/

--Write a PL/SQL block to input employee no. and return corresponding employee net salary.
DECLARE
V_SAL NUMBER(7,2);
V_COMM NUMBER(7,2);
NET_SAL NUMBER;
BEGIN
SELECT SAL,NVL(COMM,0) INTO V_SAL,V_COMM FROM EMP WHERE EMPNO = &EMPNO;
NET_SAL := V_SAL + V_COMM;
DBMS_OUTPUT.PUT_LINE('Salary Rs. ' || V_SAL );
DBMS_OUTPUT.PUT_LINE(' COMM Rs. ' || V_COMM);
DBMS_OUTPUT.PUT_LINE(' NET Salary Rs. ' || NET_SAL);
END;
/


-----------------------------------------------------------
-- SET SERVEROUTPUT ON; 
-- SET VERIFY OFF;