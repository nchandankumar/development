--Dynamic Cursor
-- i. Explicit Dynamic Cursor
DECLARE
  TYPE EMP_REFCUR IS --EMP_REFCUR IS A CURSOR DATATYPE
    REF CURSOR;
  V_CUR    EMP_REFCUR;
  V_EMPNO  EMP.EMPNO%TYPE;
  V_JOB    EMP.JOB%TYPE;
  V_DEPTNO DEPT.DEPTNO%TYPE;
  V_DNAME  DEPT.DNAME%TYPE;
  X        NUMBER;
BEGIN
  OPEN V_CUR FOR
    SELECT
      EMPNO,
      JOB
    FROM
      EMP;
  LOOP
    FETCH V_CUR INTO V_EMPNO, V_JOB;
    EXIT WHEN V_CUR%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( V_EMPNO
                          || ' '
                          || V_JOB);
  END LOOP;

  CLOSE V_CUR;
  DBMS_OUTPUT.PUT_LINE('***************************');
  OPEN V_CUR FOR
    SELECT
      DEPTNO,
      DNAME
    FROM
      DEPT;
  LOOP
    FETCH V_CUR INTO V_DEPTNO, V_DNAME;
    EXIT WHEN V_CUR%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( V_DEPTNO
                          || ' '
                          || V_DNAME);
  END LOOP;

  CLOSE V_CUR;
END;
/

-- ii. Implicit Dynamic Cursor

--Write a Implicit Dynamic Cursor to calculate fixed deposite interest upto date
-- CREATE FD MASTER TABLE and insert the data:
CREATE TABLE FD_MAS (
  FD_ID VARCHAR(10),
  FD_DATE DATE,
  FD_ROI NUMBER(7, 2),
  FD_AMT NUMBER(8, 2),
  FD_INT NUMBER(8, 2)
);

INSERT INTO FD_MAS VALUES (
  'FD1',
  '12-FEB-2022',
  10,
  100000,
  0
);

INSERT INTO FD_MAS VALUES (
  'FD2',
  '15-NOV-2022',
  15,
  50000,
  0
);

DECLARE
  FD_CUR     SYS_REFCURSOR;
  FD         FD_MAS%ROWTYPE;
  V_INTEREST NUMBER(8, 2);
  NDAYS      NUMBER;
BEGIN
  OPEN FD_CUR FOR
    SELECT
      *
    FROM
      FD_MAS;
  LOOP
    FETCH FD_CUR INTO FD;
    EXIT WHEN FD_CUR%NOTFOUND;
    NDAYS := SYSDATE-FD.FD_DATE;
    V_INTEREST := NDAYS*(FD.FD_AMT*FD.FD_ROI/100)/365;
    UPDATE FD_MAS
    SET
      FD_INT = V_INTEREST
    WHERE
      FD_ID = FD.FD_ID;
  END LOOP;

  CLOSE FD_CUR;
END;
/

SELECT
  *
FROM
  FD_MAS;

-- FOR CURSORS ....
DECLARE
  CURSOR C1 IS
  SELECT
    EMPNO,
    ENAME,
    JOB,
    SAL,
    DEPTNO
  FROM
    EMP;
BEGIN
  FOR I IN C1 LOOP
    DBMS_OUTPUT.PUT_LINE(I.EMPNO
                         || ' '
                         || I.ENAME
                         || ' '
                         || I.JOB
                         || ' '
                         || I.SAL
                         || ' '
                         || I.DEPTNO );
  END LOOP;
END;
/

--EXCEPTION HANDLING
-- I. PRE-DEFINED ERRORS:
DECLARE
  V_ENAME EMP.ENAME%TYPE;
BEGIN
  SELECT
    ENAME INTO V_ENAME
  FROM
    EMP
  WHERE
    EMPNO = &EMPNO;
  DBMS_OUTPUT.PUT_LINE(V_ENAME);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found');
END;
/

-- TOO_MANY_ROWS:

DECLARE
  V_ENAME EMP.ENAME%TYPE;
BEGIN
  SELECT
    ENAME INTO V_ENAME
  FROM
    EMP;
  DBMS_OUTPUT.PUT_LINE(V_ENAME);
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('MORE THAN ONE RECORD FOUND');
END;
/

--ZERO_DIVIDE:
DECLARE
  X NUMBER(4) := &X;
  Y NUMBER(4) := &Y;
BEGIN
  DBMS_OUTPUT.PUT_LINE('DIVISION OF TWO NUMBERS = '
                       || (X/Y));
EXCEPTION
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Error - Division by zero is not allowed');
END;
/

--VALUE_ERROR:
DECLARE
  STR VARCHAR(5);
BEGIN
  STR :='&STR';
  DBMS_OUTPUT.PUT_LINE(STR);
EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('INSERTING DATA EXCEEDS');
END;
/

--INVALID_NUMBER:
BEGIN
  INSERT INTO DEPT VALUES (
    'MATHS',
    50,
    'HYD'
  );
EXCEPTION
  WHEN INVALID_NUMBER THEN
    DBMS_OUTPUT.PUT_LINE('Invalid APPROPRIATE DATA INTO TABLE...');
END;
/

-- CURSOR_ALREADY_OPEN

DECLARE
  CURSOR C1 IS
  SELECT
    ENAME
  FROM
    EMP;
BEGIN
  OPEN C1;
  OPEN C1;
  CLOSE C1;
EXCEPTION
  WHEN CURSOR_ALREADY_OPEN THEN
    DBMS_OUTPUT.PUT_LINE('Cursor already open..');
END;
/

--USER DEFINED EXCEPTION

--Write a user defined exception program to restrict UPDATE command on Every Tuesday

DECLARE
  HOLIDAY EXCEPTION;
BEGIN
  IF TO_CHAR(SYSDATE, 'DY') = 'TUE' THEN
    RAISE HOLIDAY;
  ELSE
    UPDATE EMP
    SET
      SAL = SAL+100;
  END IF;
EXCEPTION
  WHEN HOLIDAY THEN
    DBMS_OUTPUT.PUT_LINE('TODAY HOLIDAY, NO TRANS. ARE ALLOWED');
END;
/

--Write a PL/SQL block to raise error if any value divide with 0
DECLARE
  X   NUMBER(4) := &X;
  Y   NUMBER(4) := &Y;
  ABC EXCEPTION;
BEGIN
  IF Y=0 THEN
    RAISE ABC;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Division of two numbers = '
                         || (X/Y));
  END IF;
EXCEPTION
  WHEN ABC THEN
    DBMS_OUTPUT.PUT_LINE('Error! Cannot divide by zero');
END;
/

--NON PRE-DEFINED EXCEPTION

ALTER TABLE DEPT_PRACTICE ADD PRIMARY KEY(DEPTNO);

-- INSERT INTO DEPT_PRACTICE VALUES(
--   40,
--   'maths',
--   'hyd'
-- );

-- INSERT INTO DEPT_PRACTICE VALUES(
--   * ERROR AT LINE 265: ORA-00001: UNIQUE CONSTRAINT (SYS.SYS_C007509) VIOLATED

--Write a PL/SQL block to handle UNIQUE CONSTRAINT error message

DECLARE
  DUPLICATE_FOUND EXCEPTION;
  PRAGMA EXCEPTION_INIT (DUPLICATE_FOUND, -00001);
BEGIN
  INSERT INTO DEPT_PRACTICE VALUES(
    40,
    'MATHS',
    'HYD'
  );
  DBMS_OUTPUT.PUT_LINE('inserted scuccessfully');
EXCEPTION
  WHEN DUPLICATE_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Department already exists');
END;
/

--PL/SQL to handle not null CONSTRAINT error code
DECLARE
  NULLS_FOUND EXCEPTION;
  PRAGMA EXCEPTION_INIT (NULLS_FOUND, -01400);
BEGIN
  INSERT INTO DEPT_PRACTICE VALUES(
    NULL,
    'MATHS',
    'HYD'
  );
  DBMS_OUTPUT.PUT_LINE('inserted scuccessfully');
EXCEPTION
  WHEN NULLS_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Department column is null');
END;
/

--example

DECLARE
  V_ENAME               EMP.ENAME%TYPE;
  MORETHAN_RECORD_FOUND EXCEPTION;
  PRAGMA EXCEPTION_INIT (MORETHAN_RECORD_FOUND, -01422);
BEGIN
  SELECT
    ENAME INTO V_ENAME
  FROM
    EMP
  WHERE
    DEPTNO = 50;
  DBMS_OUTPUT.PUT_LINE(V_ENAME);
EXCEPTION
  WHEN MORETHAN_RECORD_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('More than one record found in the table');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: '
                         || SQLCODE
                         || ' Error Message: '
                         ||SQLERRM);
END;
/

-- Composite datatype (collection)
-- PL/SQL Table
--Declaring pl/sql table type
DECLARE
  TYPE ARRTYPE IS
    TABLE OF NUMBER(4) INDEX BY BINARY_INTEGER;
  X ARRTYPE;
BEGIN
 -- filling X array with elements
  FOR I IN 1..10 LOOP
    X(I) := I*10;
  END LOOP;
 -- displaying X array elements
 --  FOR I IN X.FIRST .. X.LAST
  FOR K IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(X(K));
  END LOOP;
END;
/

--pl/sql block for to insert ename and salary into array and display array elements.

DECLARE
  TYPE NAMES IS
    TABLE OF EMP.ENAME%TYPE INDEX BY BINARY_INTEGER;
  TYPE PAYS IS
    TABLE OF EMP.SAL%TYPE INDEX BY BINARY_INTEGER;
  N       NAMES;
  P       PAYS;
  CNT     NUMBER :=0;
  TOT_SAL NUMBER :=0;
BEGIN
 --FILLING NAMES, SALARIES INTO N,P ARRAYS
  FOR I IN (
    SELECT
      ENAME,
      SAL
    FROM
      EMP
  ) LOOP
    N(CNT) := I.ENAME;
    P(CNT) := I.SAL;
    CNT := CNT+1;
  END LOOP;
 --displayING N,P ELEMENTS
  FOR I IN N.FIRST .. N.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Name : '
                         ||N(I)
                         ||' Salary: '
                         ||P(I));
    TOT_SAL := TOT_SAL+P(I);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total Salaries = '
                       ||TOT_SAL);
END;
/

--Bulk collect

DECLARE
  TYPE NAMES IS
    TABLE OF EMP.ENAME%TYPE INDEX BY BINARY_INTEGER;
  TYPE PAYS IS
    TABLE OF EMP.SAL%TYPE INDEX BY BINARY_INTEGER;
  N       NAMES;
  P       PAYS;
  CNT     NUMBER :=0;
  TOT_SAL NUMBER :=0;
BEGIN
 --FILLING NAMES, SALARIES INTO N,P ARRAYS
  SELECT
    ENAME,
    SAL BULK COLLECT INTO N,
    P
  FROM
    EMP;
 --displayING N,P ELEMENTS
  FOR I IN N.FIRST .. N.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Name : '
                         ||N(I)
                         ||' Salary: '
                         ||P(I));
    TOT_SAL := TOT_SAL+P(I);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total Salaries = '
                       ||TOT_SAL);
END;
/

--Bulk collection records
DECLARE
  TYPE ETYPE IS
    TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;
  E ETYPE;
  X NUMBER;
BEGIN
  SELECT
    * BULK COLLECT INTO E
  FROM
    EMP;
  X := E.FIRST; --1
  WHILE(X<=E.LAST) -- 1<=14
  LOOP
    DBMS_OUTPUT.PUT_LINE(E(X).EMPNO
                            || ' '
                            || E(X).ENAME
                            || ' '
                            || E(X).SAL);
    X:=E.NEXT(X);
  END LOOP;
END;
/