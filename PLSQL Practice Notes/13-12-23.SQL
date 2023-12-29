-- STORED PROCEDURE
--Write a stored PROCEDURE to display 'welcome' message
CREATE OR REPLACE PROCEDURE MY_PROC IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('WELCOME');
END MY_PROC;
/

--How to call the PROCEDURE:
--on sql prompt
EXEC MY_PROC;

--in plsql block
BEGIN
  MY_PROC;
END;
/

--Write a stored PROCEDURE to find sum of two given numbers
CREATE OR REPLACE PROCEDURE ADD_PROC IS
  X NUMBER := 10;
  Y NUMBER := 20;
BEGIN
  DBMS_OUTPUT.PUT_LINE('SUM OF TWO NUMBERS = '
                       || (X+Y));
END ADD_PROC;
/

BEGIN
  ADD_PROC;
END;
/

--NOTE: to execute above programs it returns same output to take values at runtime then procedure with parameter are required

--PROCEDURE with parameter
--Write a stored procedure to find sum of two given numbers
CREATE OR REPLACE PROCEDURE ADD_PROC (
  X NUMBER,
  Y NUMBER
) IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('SUM OF TWO NUMBERS = '
                       || (X+Y));
END ADD_PROC;
/

--calling procedure
EXEC ADD_PROC(100, 200);

--Write a stored procedure to input employee no. and display corresponding employee name,sal & deptno

CREATE OR REPLACE PROCEDURE EMP_PROC(
  P_EMPNO EMP.EMPNO%TYPE
) IS
  V_ENAME  EMP.ENAME%TYPE;
  V_SAL    EMP.SAL%TYPE;
  V_DEPTNO EMP.DEPTNO%TYPE;
BEGIN
  SELECT
    ENAME,
    SAL,
    DEPTNO INTO V_ENAME,
    V_SAL,
    V_DEPTNO
  FROM
    EMP
  WHERE
    EMPNO=P_EMPNO;
  DBMS_OUTPUT.PUT_LINE('Employee Number : '
                       ||P_EMPNO);
  DBMS_OUTPUT.PUT_LINE('Name           : '
                       ||V_ENAME);
  DBMS_OUTPUT.PUT_LINE('Salary         : '
                       ||V_SAL);
  DBMS_OUTPUT.PUT_LINE('Department No   : '
                       ||V_DEPTNO);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found for Employee number: '
                         ||P_EMPNO);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in executing the query');
END EMP_PROC;
/

EXEC EMP_PROC(&empno);

--STORED PROCEDURE USING INSERT COMMAND
--Write a stored procedure to INSERT data into dept table

CREATE OR REPLACE PROCEDURE DEPT_PROC(
  P_DEPTNO DEPT.DEPTNO%TYPE,
  P_DNAME DEPT.DNAME%TYPE,
  P_LOCATION DEPT.LOC%TYPE
) IS
BEGIN
  INSERT INTO DEPT_PRACTICE VALUES (
    P_DEPTNO,
    P_DNAME,
    P_LOCATION
  );
  DBMS_OUTPUT.PUT_LINE('Data inserted successfully');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Department already exists');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in inserting data');
END DEPT_PROC;
/

SELECT
  *
FROM
  DEPT_PRACTICE;

SHOW ERRORS;

--STORED PROCEDURE USING UPDATE COMMAND
--Write a stored procedure to increment employee salary based in given percentage
CREATE OR REPLACE PROCEDURE EMP_UPD_PROC (
  P_EMPNO EMP.EMPNO%TYPE,
  P_PCT NUMBER
) IS
BEGIN
UPDATE EMP_PRACTICE SET SAL = SAL + P_PCT/100 WHERE EMPNO = P_EMPNO;
IF SQL%FOUND THEN
DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Employee ID :'|| P_EMPNO);
ELSE
DBMS_OUTPUT.PUT_LINE('No record found for Employee ID :' || P_EMPNO);
END IF;
END EMP_UPD_PROC;
/

--PROCEDURE USING DELETE COMMAND
--Write a stored procedure to delete a employee record
CREATE OR REPLACE PROCEDURE DEL_PROC (
  P_EMPNO EMP.EMPNO%TYPE
  ) IS
  BEGIN
  DELETE FROM EMP_PRACTICE WHERE EMPNO=P_EMPNO;
  IF SQL%ROWCOUNT > 0 OR SQL%FOUND THEN
  DBMS_OUTPUT.PUT_LINE('Employee deleted Successfully with Employe Id: '|| P_EMPNO);
  ELSE
  RAISE_APPLICATION_ERROR(-20001,'No Record Found For The Given Employee id');
  END IF;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('No Data Found!');
  ROLLBACK; --Rollback the transaction if no data is found
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('An error occurred while deleting the record');
  ROLLBACK; --Rollback the transaction on any other errors
  END DEL_PROC;
  /

EXEC DEL_PROC(7788);

