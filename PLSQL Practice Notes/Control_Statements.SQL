-- 1. Write a PL/SQL program to arrange the number of two variable in such a way that the small number will store in num_small variable and large number will store in num_large variable.
DECLARE
NUM_SMALL NUMBER(10) := &NUM_SMALL;
NUM_LARGE NUMBER(10) := &NUM_LARGE;
NUM_TEMP NUMBER(4);
BEGIN
IF NUM_SMALL > NUM_LARGE THEN
NUM_TEMP := NUM_SMALL;
NUM_LARGE := NUM_LARGE;
NUM_SMALL := NUM_TEMP;
END IF;
DBMS_OUTPUT.PUT_LINE('LARGER NUMBER = ' || NUM_LARGE);
DBMS_OUTPUT.PUT_LINE('SMALLER NUMBER = ' || NUM_SMALL);
END;
/

-- 2. Write a PL/SQL procedure to calculate the incentive on a target achieved and display the message either the record updated or not.

-- 3. Write a PL/SQL program to check whether a number is even or odd.
DECLARE
NUM NUMBER(4):=&NUM;
BEGIN
IF MOD(NUM,2) = 0 THEN
DBMS_OUTPUT.PUT_LINE(NUM||' IS AN EVEN NUMBER');
ELSE
DBMS_OUTPUT.PUT_LINE(NUM||' IS AN ODD NUMBER');
END IF;
END;
/

-- 4. Write a PL/SQL procedure to calculate the incentive on a specific target otherwise a general incentive to be paid using IF-THEN-ELSE.

-- 5. Write a PL/SQL program to check whether a date falls on weekend i.e. SATURDAY or SUNDAY.

DECLARE
V_DATE DATE := '&V_DATE';
BEGIN
IF TO_CHAR(V_DATE,'DY') IN ('SAT','SUN') THEN
DBMS_OUTPUT.PUT_LINE(V_DATE||' FALLS ON WEEKEND (SAT / SUN)');
ELSE
DBMS_OUTPUT.PUT_LINE(V_DATE||' DOES NOT FALL ON WEEKEND');
END IF;
END;
/
-- 6. Write a PL/SQL procedure to calculate incentive achieved according to the specific sale limit.

-- 7. Write a PL/SQL program to count number of employees in department 50 and check whether this department have any vacancies or not. There are 45 vacancies in this department.
DECLARE
DEPT_CNT NUMBER(10);
BEGIN
SELECT COUNT(*) INTO DEPT_CNT FROM CHANDAN_EMPLOYEE WHERE DEPARTMENT_ID=50;
IF DEPT_CNT >= 45 THEN
DBMS_OUTPUT.PUT_LINE('THERE IS NO VACANCIES');
ELSE
DBMS_OUTPUT.PUT_LINE('THERE ARE SOME VACANCY AVAILABLE');
END IF;
END;
/

-- 8. Write a PL/SQL program to display the description against a grade.
DECLARE
GRD CHAR(1) := '&GRD';
BEGIN
IF grd = 'A' THEN
      dbms_output.Put_line('Your Grade is: Outstanding');
    ELSIF grd = 'B' THEN
      dbms_output.Put_line('Your Grade is: Excellent');
    ELSIF grd = 'C' THEN
      dbms_output.Put_line('Your Grade is: Very Good');
    ELSIF grd = 'D' THEN
      dbms_output. Put_line('Your Grade is: Average');
    ELSIF grd = 'F' THEN
      dbms_output.Put_line('Your Grade is: Poor');
    ELSE
      dbms_output.Put_line('No such grade in the list.');
    END IF;
END;
/

-- 9. Write a PL/SQL program to count number of employees in a specific department and check whether this department have any vacancies or not. If any vacancies, how many vacancies are in that department.
DESC CHANDAN_EMPLOYEE;
DECLARE
DEPT_CNT NUMBER(10);
DEPT_NUM NUMBER(10) := &DEPT_NUM;
BEGIN
SELECT COUNT(*) INTO DEPT_CNT FROM CHANDAN_EMPLOYEE WHERE DEPARTMENT_ID = DEPT_NUM;
IF DEPT_CNT >= 45 THEN
DBMS_OUTPUT.PUT_LINE('THERE IS NO VACANCIES');
ELSE
DBMS_OUTPUT.PUT_LINE('THERE ARE '|| TO_CHAR(45-DEPT_CNT) ||' VACANCY AVAILABLE');
END IF;
END;
/

-- 10. Write a PL/SQL program to display the description against a grade using CASE statement.
DECLARE
GRD CHAR(1) := '&GRD';
BEGIN
CASE GRD
WHEN 'A' THEN DBMS_OUTPUT.Put_line('Outstanding');
WHEN 'B' THEN DBMS_OUTPUT.Put_line('Excellent');
WHEN 'C' THEN DBMS_OUTPUT.Put_line('Very Good');
WHEN 'D' THEN DBMS_OUTPUT.Put_line('Average');
WHEN 'F' THEN DBMS_OUTPUT.Put_line('Poor');
ELSE DBMS_OUTPUT.Put_line('Invalid Grade');
END CASE;
END;
/

-- 11. Write a PL/SQL program to display the description against a grade using CASE statement with EXCEPTION.
DECLARE
GRD CHAR(1) := '&GRD';
BEGIN
CASE GRD
WHEN 'A' THEN DBMS_OUTPUT.Put_line('Outstanding');
WHEN 'B' THEN DBMS_OUTPUT.Put_line('Excellent');
WHEN 'C' THEN DBMS_OUTPUT.Put_line('Very Good');
WHEN 'D' THEN DBMS_OUTPUT.Put_line('Average');
WHEN 'F' THEN DBMS_OUTPUT.Put_line('Poor');
END CASE;
EXCEPTION
WHEN CASE_NOT_FOUND THEN
DBMS_OUTPUT.Put_Line('Invalid Grade Entered!');
END;
/

-- 12. Write a PL/SQL program to check whether a given number is positive, negative or zero.
DECLARE
NUM NUMBER := &NUM;
BEGIN
IF NUM > 0 THEN
DBMS_OUTPUT.Put_Line('The Number Is Positive');
ELSIF NUM < 0 THEN
DBMS_OUTPUT.Put_Line('The Number Is Negative');
ELSE
DBMS_OUTPUT.Put_Line('The Number Is Zero');
END IF;
END;
/

-- 13. Write a PL/SQL program to check whether a given character is letter or digit.
DECLARE
CHR VARCHAR2(5) := '&CHR';
BEGIN
IF (CHR >='A' AND CHR <='Z') OR (CHR >='a' AND CHR<='z') THEN
DBMS_OUTPUT.Put_Line('It''s A Letter');
ELSIF CHR BETWEEN '0' AND '9' THEN
DBMS_OUTPUT.Put_Line('It''s ADigit');
ELSE
DBMS_OUTPUT.Put_Line('Neither A Digit Nor A Letter');
END IF;
END;
/

-- 14. Write a PL/SQL program to convert a temperature in scale Fahrenheit to Celsius and vice versa.
DECLARE
TEMP NUMBER:=&TEMP;
SCALE CHAR(1):=UPPER('&SCALE'); -- S for Fahrenheit, C for Celsius
RESULT NUMBER;
BEGIN
IF SCALE = 'S' THEN
RESULT := (TEMP - 32) * 5 / 9;
DBMS_OUTPUT.Put_Line('Temperature In Fahrenheit : '|| TEMP || ', Temperature In Celsius : ' || ROUND(RESULT));
ELSE
RESULT := (TEMP * 9 / 5) + 32;
DBMS_OUTPUT.Put_Line('Temperature In Celsius : ' || TEMP || ', Temperature In Fahrenheit : ' || ROUND(RESULT));
END IF;
END;
/

-- 15. Write a PL/SQL program to display which day is a specific date.
DECLARE
D DATE := TO_DATE('&YEAR-&MONTH-&DAY','YYYY-MM-DD');
BEGIN
CASE TO_CHAR(D,'D')
WHEN 1 THEN DBMS_OUTPUT.Put_Line('Sunday');
WHEN 2 THEN DBMS_OUTPUT.Put_Line('Monday');
WHEN 3 THEN DBMS_OUTPUT.Put_Line('Tuesday');
WHEN 4 THEN DBMS_OUTPUT.Put_Line('Wednesday');
WHEN 5 THEN DBMS_OUTPUT.Put_Line('Thursday');
WHEN 6 THEN DBMS_OUTPUT.Put_Line('Friday');
WHEN 7 THEN DBMS_OUTPUT.Put_Line('Saturday');
END CASE;
END;
/

-- 16. Write a program in PL/SQL to print the value of a variable inside and outside a loop using LOOP EXIT statement.
DECLARE
N NUMBER := &N;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE ('The value of n inside the loop is:  ' || TO_CHAR(n));
    n := n + 1;
    IF n > 5 THEN
      EXIT;
    END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('The value of n outside the loop is: ' || TO_CHAR(n));
END;
/

-- 17. Write a program in PL/SQL to print the value of a variable inside and outside a loop using LOOP WHEN EXIT statement.
DECLARE
N NUMBER := &N;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE ('The value of n inside the loop is:  ' || TO_CHAR(n));
n := n + 1;
EXIT WHEN N>5;
END LOOP;
DBMS_OUTPUT.PUT_LINE('The value of n outside the loop is: ' || TO_CHAR(n));
END;
/

-- 18. Write a program in PL/SQL to show the uses of nested loop.
DECLARE
N NUMBER := &N;
M NUMBER := &M;
BEGIN
FOR I IN 1..N
LOOP
FOR J IN 1..M
LOOP
DBMS_OUTPUT.PUT_LINE('I='||I||' J='||J);
END LOOP;
END LOOP;
END;
/
-- 19. Write a program in PL/SQL to update the salary of a specifc employee by 8% if the salary exceeds the mid range of the salary against this job and update up to mid range if the salary is less than the mid range of the salary, and display a suitable message.
DECLARE
MIN_SAL NUMBER(7,2);
MAX_SAL NUMBER(7,2);
MID_SAL NUMBER(7,2);
V_SAL CHANDAN_EMPLOYEE.SALARY%TYPE;
V_EMP_ID CHANDAN_EMPLOYEE.EMPLOYEE_ID%TYPE := &EMPID;
V_ENAME CHANDAN_EMPLOYEE.FIRST_NAME%TYPE;
BEGIN
--FETCHING MIN AND MAX SAL FROM EMPLOYEE BASED ON JOB
SELECT MIN(SALARY),MAX(SALARY) INTO MIN_SAL,MAX_SAL FROM CHANDAN_EMPLOYEE WHERE JOB_ID = (SELECT JOB_ID FROM CHANDAN_EMPLOYEE WHERE EMPLOYEE_ID = V_EMP_ID);

--FETCHING SALARY, ENAME BY USING EMP_ID
SELECT SALARY, FIRST_NAME INTO V_SAL,V_ENAME FROM CHANDAN_EMPLOYEE WHERE EMPLOYEE_ID = V_EMP_ID;

--FINDING MID_SAL BY USING MIN_SAL AND MAX_SAL
MID_SAL := (MIN_SAL+MAX_SAL)/2;

--UPDATE SALARY
IF V_SAL < MID_SAL THEN
UPDATE CHANDAN_EMP_PRACTICE SET SALARY = MID_SAL WHERE EMPLOYEE_ID = V_EMP_ID;
ELSE
UPDATE CHANDAN_EMP_PRACTICE SET SALARY = SALARY+SALARY*8/100 WHERE EMPLOYEE_ID=V_EMP_ID;
END IF;

IF V_SAL > MID_SAL THEN
DBMS_OUTPUT.PUT_LINE()

END;
/

DESC CHANDAN_EMPLOYEE;

CREATE TABLE CHANDAN_EMP_PRACTICE AS SELECT * FROM CHANDAN_EMPLOYEE;

-- 20. Write a program in PL/SQL using nested loop with EXIT WHEN statement.



-- 21. Write a program in PL/SQL using loop with CONTINUE statement.



-- 22. Write a program in PL/SQL using loop with CONTINUE WHEN statement.



-- 23. Write a program in PL/SQL to print 1st n numbers.



-- 24. Write a program in PL/SQL to print 1st n numbers with a difference of 3 and starting from 1.



-- 25. Write a program in PL/SQL to show the value of a same variable declared as local and global.



-- 26. Write a program in PL/SQL to explain the uses of nested for loop with label.



-- 27. Write a program in PL/SQL to print the prime numbers between 1 to 50.



-- 28. Write a program in PL/SQL to check whether a number is prime or not using goto statement with for loop.



-- 29. Write a program in PL/SQL to insert records from one table to another.

-- 30. Write a program in PL/SQL to insert a row if the featched value for a component is specified.


