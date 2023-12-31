-- TABLE CREATION
CREATE OR REPLACE TYPE CK_ADDR_OBJ AS
    OBJECT (
        ADDR1 VARCHAR2(100),
        ADDR2 VARCHAR2(100),
        CITY VARCHAR2(100),
        DISTRICT VARCHAR2(100),
        STATE VARCHAR2(100),
        PINCODE NUMBER(6)
    );
    CREATE TABLE CK_DEPT_CRUD(
        DEPT_NO NUMBER(4) PRIMARY KEY,
        DEPT_NAME VARCHAR(30)
    );
    CREATE TABLE CK_EMP_CREATE (
        EMP_ID NUMBER(4) PRIMARY KEY,
        FIRST_NAME VARCHAR2(30),
        LAST_NAME VARCHAR2(30),
        EMAIL VARCHAR2(50) CHECK (REGEXP_LIKE (EMAIL, '^\w+(\.\w+)*+@\w+(\.\w+)+$')),
        PHONE NUMBER(10),
        HIRE_DATE DATE DEFAULT SYSDATE,
        DEPT_NUMBER NUMBER(4) REFERENCES CK_DEPT_CRUD(DEPT_NO) ON DELETE SET NULL,
        ADDR CK_ADDR_OBJ
    );
    CREATE TABLE CK_USER_LOGIN(
        USER_ID NUMBER(4) REFERENCES CK_EMP_CREATE(EMP_ID) ON DELETE CASCADE,
        USR_NAME VARCHAR2(30),
        PSWD VARCHAR2(30)
    );

--********************PACKAGE CREATION************************

--PACKAGE SPECIFICATION
CREATE OR REPLACE PACKAGE CK_EMP_CRUD_PKG IS
 -- TYPE CK_DEPT_TYPE IS TABLE OF CK_DEPT_CRUD%ROWTYPE INDEX BY BINARY_INTEGER;
 --TO REGISTER USER
    PROCEDURE CK_RESGISTER_USER(
        FIRST_NAME IN CK_EMP_CREATE.FIRST_NAME%TYPE,
        LAST_NAME IN CK_EMP_CREATE.LAST_NAME%TYPE,
        EMAIL IN CK_EMP_CREATE.EMAIL%TYPE,
        PHONE IN CK_EMP_CREATE.PHONE%TYPE,
        DEPT_NUMBER IN CK_EMP_CREATE.DEPT_NUMBER%TYPE,
        ADDR1 IN CK_EMP_CREATE.ADDR.ADDR1%TYPE,
        ADDR2 IN CK_EMP_CREATE.ADDR.ADDR2%TYPE,
        CITY IN CK_EMP_CREATE.ADDR.CITY%TYPE,
        DISTRICT IN CK_EMP_CREATE.ADDR.DISTRICT%TYPE,
        STATE IN CK_EMP_CREATE.ADDR.STATE%TYPE,
        PINCODE IN CK_EMP_CREATE.ADDR.PINCODE%TYPE,
        P_STATUS OUT VARCHAR2
    );
 --TO ADD Department
    PROCEDURE CK_ADD_DEPT(
        P_DEPT_NAME IN CK_DEPT_CRUD.DEPT_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    );
 -- TO GENERATE USERNAME
    FUNCTION CK_GEN_USERNAME(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE
    ) RETURN VARCHAR2;
 -- TO GENERATE PASSWORD
    FUNCTION CK_GEN_PSWD(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE
    ) RETURN VARCHAR2;
 --TO ADD THE USERNAME AND Password
    PROCEDURE CK_ADD_USER_PSWD(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE,
        P_STATUS OUT VARCHAR2
    );
 -- TO LOGIN THE USER
    PROCEDURE CK_LOGIN_USER(
        P_USR_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        P_PSWD IN CK_USER_LOGIN.PSWD%TYPE,
        P_STATUS OUT VARCHAR2
    );
 -- TO GET THE USER DETAILS
    PROCEDURE CK_GET_USER_DETAILS(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        V_EMP_DATA OUT CK_EMP_CREATE%ROWTYPE,
        P_STATUS OUT VARCHAR2
    );
 -- TO GET THE USERNAME AND PASSWORD
    PROCEDURE CK_GET_CREDENTAILS(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE,
        P_STATUS OUT VARCHAR2
    );
 --TO GET ADDRESS OF USER
    PROCEDURE CK_GET_ADDR(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        V_ADDR_DATA OUT CK_EMP_CREATE%ROWTYPE,
        P_STATUS OUT VARCHAR2
    );
 --TO GET DEPARTMENT DETAILS
    PROCEDURE CK_GET_DEPT(
        DEPT_DETAILS OUT SYS_REFCURSOR,
        P_STATUS OUT VARCHAR2
    );
 --TO GET WHOLE USER DETAILS
    PROCEDURE CK_GET_USER(
        USER_DETAILS OUT SYS_REFCURSOR,
        P_STATUS OUT VARCHAR2
    );
 --TO GET WHOLE LOGIN DETAILS
    PROCEDURE CK_USER_LOGIN_DETAILS(
        LOGIN_DETAILS OUT SYS_REFCURSOR,
        P_STATUS OUT VARCHAR2
    );
 --TO DELETE DEPT DETAILS
    PROCEDURE CK_DELETE_DEPT(
        V_DEPT_NAME IN CK_DEPT_CRUD.DEPT_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    );
 --TO DELETE USER DETAILS
    PROCEDURE CK_DELETE_USER(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    );
 --TO DELETE CREDENTAILS
    PROCEDURE CK_DELETE_CREDENTIALS(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    );
 --TO UPDATE PASSWORD
    PROCEDURE CK_UPDATE_PASSWORD(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        V_OLD_PASSWORD IN CK_USER_LOGIN.PSWD%TYPE,
        V_NEW_PASSWORD IN CK_USER_LOGIN.PSWD%TYPE,
        V_CONFIRM_PASSWORD IN CK_USER_LOGIN.PSWD%TYPE,
        P_STATUS OUT VARCHAR2
    );
END CK_EMP_CRUD_PKG;
/

--PACKAGE BODY CREATION
CREATE OR REPLACE PACKAGE BODY CK_EMP_CRUD_PKG IS
 -- TYPE CK_DEPT_TYPE IS TABLE OF CK_DEPT_CRUD%ROWTYPE INDEX BY BINARY_INTEGER;
 --USER REGISTRATION BODY
    PROCEDURE CK_RESGISTER_USER(
        FIRST_NAME IN CK_EMP_CREATE.FIRST_NAME%TYPE,
        LAST_NAME IN CK_EMP_CREATE.LAST_NAME%TYPE,
        EMAIL IN CK_EMP_CREATE.EMAIL%TYPE,
        PHONE IN CK_EMP_CREATE.PHONE%TYPE,
        DEPT_NUMBER IN CK_EMP_CREATE.DEPT_NUMBER%TYPE,
        ADDR1 IN CK_EMP_CREATE.ADDR.ADDR1%TYPE,
        ADDR2 IN CK_EMP_CREATE.ADDR.ADDR2%TYPE,
        CITY IN CK_EMP_CREATE.ADDR.CITY%TYPE,
        DISTRICT IN CK_EMP_CREATE.ADDR.DISTRICT%TYPE,
        STATE IN CK_EMP_CREATE.ADDR.STATE%TYPE,
        PINCODE IN CK_EMP_CREATE.ADDR.PINCODE%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        V_EMPID CK_EMP_CREATE.EMP_ID%TYPE;
    BEGIN
        SELECT
            MAX(EMP_ID) INTO V_EMPID
        FROM
            CK_EMP_CREATE;
        IF V_EMPID IS NULL THEN
            V_EMPID := 1001;
        ELSE
            V_EMPID := V_EMPID+1;
        END IF;

        INSERT INTO CK_EMP_CREATE VALUES (
            V_EMPID,
            FIRST_NAME,
            LAST_NAME,
            EMAIL,
            PHONE,
            SYSDATE,
            DEPT_NUMBER,
            CK_ADDR_OBJ(ADDR1, ADDR2, CITY, DISTRICT, STATE, PINCODE)
        );
        IF SQL%FOUND THEN
            P_STATUS := 'EMPLOYEE INSERTED SUCCESSFULLY 😊! PLEASE NOTE EMPID FOR GENERATION OF USER NAME AND PASSWORD: '
                        ||V_EMPID;
        ELSE
            P_STATUS := 'YOU GOT AN ISSUE WHILE INSERTING DETAISL ☹️! PLEASE TRY AGAIN';
        END IF;
    END CK_RESGISTER_USER;
 --ADD Department BODY
    PROCEDURE CK_ADD_DEPT(
        P_DEPT_NAME IN CK_DEPT_CRUD.DEPT_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        V_DEPT_NO CK_DEPT_CRUD.DEPT_NO%TYPE;
    BEGIN
        SELECT
            MAX(DEPT_NO) INTO V_DEPT_NO
        FROM
            CK_DEPT_CRUD;
        IF V_DEPT_NO IS NULL THEN
            V_DEPT_NO := 111;
        ELSE
            V_DEPT_NO := V_DEPT_NO+1;
        END IF;

        INSERT INTO CK_DEPT_CRUD VALUES (
            V_DEPT_NO,
            P_DEPT_NAME
        );
        IF SQL%FOUND THEN
            P_STATUS := 'DEPARTMENT'
                        || P_DEPT_NAME
                        || 'INSERTED SUCCESSFULLY 😊';
        ELSE
            P_STATUS := 'NO DEPARTMENT INSERTED ☹️';
        END IF;
    END CK_ADD_DEPT;
 --FUNCTION TO GENERATE USERNAME
    FUNCTION CK_GEN_USERNAME(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE
    ) RETURN VARCHAR2 IS
        V_FIRST_NAME CK_EMP_CREATE.FIRST_NAME%TYPE;
        V_EMPID      CK_EMP_CREATE.EMP_ID%TYPE;
        V_USERNAME   VARCHAR(100);
    BEGIN
        SELECT
            EMP_ID,
            FIRST_NAME INTO V_EMPID,
            V_FIRST_NAME
        FROM
            CK_EMP_CREATE
        WHERE
            EMP_ID = V_EMP_ID;
        IF SQL%FOUND THEN
            V_USERNAME := V_FIRST_NAME
                          || TO_CHAR(V_EMPID);
            RETURN V_USERNAME;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'ERROR OCCURRED IN FETCHING THE RECORD ⚠️');
    END CK_GEN_USERNAME;
 --FUNCTION TO GENERATE PASSWORD
    FUNCTION CK_GEN_PSWD(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE
    ) RETURN VARCHAR2 IS
        V_FIRST_NAME      CK_EMP_CREATE.FIRST_NAME%TYPE;
        V_EMPID           CK_EMP_CREATE.EMP_ID%TYPE;
        V_PASSWORD_ENCODE VARCHAR(100);
    BEGIN
        SELECT
            EMP_ID,
            FIRST_NAME INTO V_EMPID,
            V_FIRST_NAME
        FROM
            CK_EMP_CREATE
        WHERE
            EMP_ID = V_EMP_ID;
        IF SQL%FOUND THEN
            V_PASSWORD_ENCODE := UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_ENCODE(UTL_RAW.CAST_TO_RAW(V_FIRST_NAME
                                                                                                       || '@'
                                                                                                       || TO_CHAR(V_EMPID))));
            RETURN V_PASSWORD_ENCODE;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'THE PROVIDED ID DOES NOT EXIST ❌');
    END CK_GEN_PSWD;
 --PROCEDURE TO ADD USERNAME AND PASSWORD TO USER_LOGIN TABLE
    PROCEDURE CK_ADD_USER_PSWD(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        V_USER_NAME VARCHAR2(100);
        V_PSWD      VARCHAR2(100);
    BEGIN
        V_USER_NAME := CK_GEN_USERNAME(V_EMP_ID);
        V_PSWD := CK_GEN_PSWD(V_EMP_ID);
        IF V_USER_NAME IS NOT NULL AND V_PSWD IS NOT NULL THEN
            INSERT INTO CK_USER_LOGIN (
                USER_ID,
                USR_NAME,
                PSWD
            ) VALUES (
                V_EMP_ID,
                V_USER_NAME,
                V_PSWD
            );
            P_STATUS := 'USERNAME AND PASSWORD GENERATED SUCCESSFULLY😊 FOR EMPID '
                        ||V_EMP_ID
                        ||' . PLEASE GO TO GET CREDENTAILS FOR VIEWING YOUR USERNAME AND YOUR PASSWORD IS FIRST_NAME@EMP_ID.';
        ELSE
            P_STATUS := 'THE PROVIDED ID DOES NOT EXIST ❌.';
        END IF;
    END CK_ADD_USER_PSWD;
 -- PROCEDURE TO LOGIN USER
    PROCEDURE CK_LOGIN_USER(
        P_USR_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        P_PSWD IN CK_USER_LOGIN.PSWD%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        CNT NUMBER;
    BEGIN
        SELECT
            COUNT(*) INTO CNT
        FROM
            CK_USER_LOGIN
        WHERE
            USR_NAME = P_USR_NAME
            AND UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_DECODE(UTL_RAW.CAST_TO_RAW(PSWD))) = P_PSWD;
        IF CNT=0 THEN
            P_STATUS:='Invalid Username or Password';
        ELSE
            P_STATUS:='Logged In Successfully';
        END IF;
    END CK_LOGIN_USER;
 -- PROCEDURE TO GET USER DETAILS
    PROCEDURE CK_GET_USER_DETAILS(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        V_EMP_DATA OUT CK_EMP_CREATE%ROWTYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        EMP_CUR SYS_REFCURSOR;
    BEGIN
        OPEN EMP_CUR FOR
            SELECT
                *
            FROM
                CK_EMP_CREATE
            WHERE
                EMP_ID = (
                    SELECT
                        USER_ID
                    FROM
                        CK_USER_LOGIN
                    WHERE
                        USR_NAME = V_USER_NAME
                );
        LOOP
            FETCH EMP_CUR INTO V_EMP_DATA;
            EXIT WHEN EMP_CUR%NOTFOUND;
        END LOOP;

        CLOSE EMP_CUR;
        IF V_EMP_DATA.EMP_ID IS NULL THEN
            P_STATUS := 'ERROR WHILE FETCHING THE ADDRESS DETAIS! PLEASE TRY AGAIN';
        END IF;
    END CK_GET_USER_DETAILS;
 --TO GET USER CREDENTAILS
    PROCEDURE CK_GET_CREDENTAILS(
        V_EMP_ID IN CK_EMP_CREATE.EMP_ID%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        V_USER_NAME CK_USER_LOGIN.USR_NAME%TYPE;
        V_PASSWORD  CK_USER_LOGIN.PSWD%TYPE;
    BEGIN
        SELECT
            USR_NAME,
            PSWD INTO V_USER_NAME,
            V_PASSWORD
        FROM
            CK_USER_LOGIN
        WHERE
            USER_ID = V_EMP_ID;
        P_STATUS :='YOUR USER NAME : '
                   || V_USER_NAME
                   || ' AND PASSWORD : '
                   || V_PASSWORD;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            P_STATUS :='NO RECORD FOUND FOR THAT ID';
    END CK_GET_CREDENTAILS;
 --TO GET ADDRESS OF USER
    PROCEDURE CK_GET_ADDR(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        V_ADDR_DATA OUT CK_EMP_CREATE%ROWTYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        ADDR_CUR SYS_REFCURSOR;
    BEGIN
        OPEN ADDR_CUR FOR
            SELECT
                *
            FROM
                CK_EMP_CREATE
            WHERE
                EMP_ID = (
                    SELECT
                        USER_ID
                    FROM
                        CK_USER_LOGIN
                    WHERE
                        USR_NAME = V_USER_NAME
                );
        LOOP
            FETCH ADDR_CUR INTO V_ADDR_DATA;
            EXIT WHEN ADDR_CUR%NOTFOUND;
        END LOOP;

        CLOSE ADDR_CUR;
        IF V_ADDR_DATA.EMP_ID IS NULL THEN
            P_STATUS := 'ERROR WHILE FETCHING THE ADDRESS DETAIS! PLEASE TRY AGAIN';
        END IF;
    END CK_GET_ADDR;
 --TO GET DEPARTMENT DETAILS
    PROCEDURE CK_GET_DEPT(
        DEPT_DETAILS OUT SYS_REFCURSOR,
        P_STATUS OUT VARCHAR2
    ) IS
    BEGIN
        OPEN DEPT_DETAILS FOR
            SELECT
                *
            FROM
                CK_DEPT_CRUD;
 -- SELECT DEPT_NO,DEPT_NAME BULK COLLECT INTO DEPT_DETAILS FROM CK_DEPT_CRUD;
        IF DEPT_DETAILS%NOTFOUND THEN
            P_STATUS := 'ERROR WHILE FETCHING THE ADDRESS DETAIS! PLEASE TRY AGAIN';
        END IF;
    END CK_GET_DEPT;
 --TO GET WHOLE USER DETAILS
    PROCEDURE CK_GET_USER(
        USER_DETAILS OUT SYS_REFCURSOR,
        P_STATUS OUT VARCHAR2
    ) IS
    BEGIN
        OPEN USER_DETAILS FOR
            SELECT
                *
            FROM
                CK_EMP_CREATE;
        IF USER_DETAILS%NOTFOUND THEN
            P_STATUS := 'ERROR WHILE FETCHING THE ADDRESS DETAIS! PLEASE TRY AGAIN';
        END IF;
    END CK_GET_USER;
 --TO GET WHOLE USER LOGIN DETAILS
    PROCEDURE CK_USER_LOGIN_DETAILS(
        LOGIN_DETAILS OUT SYS_REFCURSOR,
        P_STATUS OUT VARCHAR2
    )IS
    BEGIN
        OPEN LOGIN_DETAILS FOR
            SELECT
                *
            FROM
                CK_USER_LOGIN;
        IF LOGIN_DETAILS%NOTFOUND THEN
            P_STATUS := 'ERROR WHILE FETCHING THE ADDRESS DETAIS! PLEASE TRY AGAIN';
        END IF;
    END CK_USER_LOGIN_DETAILS;
 --TO DELETE DEPARTMENT DETAILS
    PROCEDURE CK_DELETE_DEPT(
        V_DEPT_NAME IN CK_DEPT_CRUD.DEPT_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        QUERY VARCHAR2(1000);
    BEGIN
        QUERY := 'DELETE FROM CK_DEPT_CRUD WHERE DEPT_NAME = '''
                 || TO_CHAR(V_DEPT_NAME)
                 || '''';
        EXECUTE IMMEDIATE QUERY;
        DBMS_OUTPUT.PUT_LINE('QUERY : '
                             || QUERY);
        P_STATUS:='THE DEPARTMENT HAS BEEN SUCCESSFULLY DELETED';
    EXCEPTION
        WHEN OTHERS THEN
            P_STATUS:='FAILED TO DELETE THE DEPARTMENT!'
                      ||' ERROR CODE : '
                      ||SQLCODE
                      ||' ERROR MESSAGE : '
                      ||SQLERRM;
    END CK_DELETE_DEPT;
 --TO DELETE USER DETAILS
    PROCEDURE CK_DELETE_USER(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
    BEGIN
        DELETE FROM CK_EMP_CREATE
        WHERE
            EMP_ID = (
                SELECT
                    USER_ID
                FROM
                    CK_USER_LOGIN
                WHERE
                    USR_NAME = V_USER_NAME
            );
        P_STATUS:='THE USER HAS SUCCESSFULLY DELETED';
    EXCEPTION
        WHEN OTHERS THEN
            P_STATUS:='FAILED TO DELETE THE USER DETAILS!'
                      ||' ERROR CODE : '
                      ||SQLCODE
                      ||' ERROR MESSAGE : '
                      ||SQLERRM;
    END CK_DELETE_USER;
 --TO DELETE CREDENTIALS
    PROCEDURE CK_DELETE_CREDENTIALS(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
    BEGIN
        DELETE FROM CK_USER_LOGIN
        WHERE
            USR_NAME =V_USER_NAME;
        P_STATUS:='THE USER CREDENTAILS HAS SUCCESSFULLY DELETED';
    EXCEPTION
        WHEN OTHERS THEN
            P_STATUS:='FAILED TO DELETE THE USER CREDENTAILS!'
                      ||' ERROR CODE : '
                      ||SQLCODE
                      ||' ERROR MESSAGE : '
                      ||SQLERRM;
    END CK_DELETE_CREDENTIALS;
 --TO UPDATE PASSWORD
    PROCEDURE CK_UPDATE_PASSWORD(
        V_USER_NAME IN CK_USER_LOGIN.USR_NAME%TYPE,
        V_OLD_PASSWORD IN CK_USER_LOGIN.PSWD%TYPE,
        V_NEW_PASSWORD IN CK_USER_LOGIN.PSWD%TYPE,
        V_CONFIRM_PASSWORD IN CK_USER_LOGIN.PSWD%TYPE,
        P_STATUS OUT VARCHAR2
    ) IS
        V_PSWD CK_USER_LOGIN.PSWD%TYPE;
    BEGIN
        SELECT
            PSWD INTO V_PSWD
        FROM
            CK_USER_LOGIN
        WHERE
            USR_NAME = V_USER_NAME;
        IF UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_DECODE(UTL_RAW.CAST_TO_RAW(V_PSWD))) = V_OLD_PASSWORD THEN
            IF V_NEW_PASSWORD=V_CONFIRM_PASSWORD THEN
                UPDATE CK_USER_LOGIN
                SET
                    PSWD = UTL_RAW.CAST_TO_VARCHAR2(
                        UTL_ENCODE.BASE64_ENCODE(UTL_RAW.CAST_TO_RAW(V_CONFIRM_PASSWORD))
                    )
                WHERE
                    USR_NAME = V_USER_NAME;
                P_STATUS := 'PASSWORD UPDATED SUCCESSFULLY😊';
            ELSE
                RAISE_APPLICATION_ERROR(-20135, 'The new password and confirmation password does not match!');
            END IF;
        ELSE
            RAISE_APPLICATION_ERROR(-20134, 'Old Password is incorrect! Please enter the correct old password.');
        END IF;
    END CK_UPDATE_PASSWORD;
END CK_EMP_CRUD_PKG;
/

--CALLING PACKAGES AND PROCEDURES
DECLARE
    U_DETAILS SYS_REFCURSOR;
    USERS CK_EMP_CREATE%ROWTYPE;
    L_DETAILS SYS_REFCURSOR;
    LOGINS CK_USER_LOGIN%ROWTYPE;
    D_DETAILS SYS_REFCURSOR;
    DEPT CK_DEPT_CRUD%ROWTYPE;
    ADDR_DATA CK_EMP_CREATE%ROWTYPE;
    EMP_DATA CK_EMP_CREATE%ROWTYPE;
    DEPT_DATA CK_DEPT_CRUD%ROWTYPE;
    RES VARCHAR2(200);
BEGIN
--CALLING PROCEDURE TO ADD EMPLOYEE DETAILS
-- CK_EMP_CRUD_PKG.CK_RESGISTER_USER('&FIRST_NAME','&LAST_NAME','&EMAIL',&PHONE,&DEPT_NO,'&ADDR1','&ADDR2','&CITY','&DISTRICT','&STATE',&PINCODE ,RES);

--CALLING PROCEDURE TO ADD DEPT DETAILS
-- CK_EMP_CRUD_PKG.CK_ADD_DEPT('&DEPT_NAME', RES);


-- CALLING PROCEDURE TO GENERATE USERNAME AND PASSWORD FUNCTION
-- CK_EMP_CRUD_PKG.CK_ADD_USER_PSWD(&EMP_ID,RES);

--CALLING PROCEDURE TO LOGIN USER
-- CK_EMP_CRUD_PKG.CK_LOGIN_USER('&USERNAME','&PASSWORD',RES);

--CALLING PROCEDURE TO GET CREDENTAILS
-- CK_EMP_CRUD_PKG.CK_GET_CREDENTAILS(&EMP_ID,RES);

--CALLING PROCEDURE TO GET USER DETAILS
-- CK_EMP_CRUD_PKG.CK_GET_USER_DETAILS('&USERNAME',EMP_DATA,RES);
-- DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID: '||EMP_DATA.EMP_ID);
-- DBMS_OUTPUT.PUT_LINE('FIRST NAME: '||EMP_DATA.FIRST_NAME);
-- DBMS_OUTPUT.PUT_LINE('LAST NAME :'||EMP_DATA.LAST_NAME);
-- DBMS_OUTPUT.PUT_LINE('EMAIL :'||EMP_DATA.EMAIL);
-- DBMS_OUTPUT.PUT_LINE('PHONE :'||EMP_DATA.PHONE);
-- DBMS_OUTPUT.PUT_LINE('HIREDATE :'||EMP_DATA.HIRE_DATE);
-- DBMS_OUTPUT.PUT_LINE('DEPARTMENT NO. :'||EMP_DATA.DEPT_NUMBER);


--CALLING TO GET ADDRESS DETAILS
-- CK_EMP_CRUD_PKG.CK_GET_ADDR('&USERNAME',ADDR_DATA,RES);
-- DBMS_OUTPUT.PUT_LINE('ADDR1 :'||ADDR_DATA.ADDR.ADDR1);
-- DBMS_OUTPUT.PUT_LINE('ADDR2 :'||ADDR_DATA.ADDR.ADDR2);
-- DBMS_OUTPUT.PUT_LINE('CITY :'||ADDR_DATA.ADDR.CITY);
-- DBMS_OUTPUT.PUT_LINE('DISTRICT :'||ADDR_DATA.ADDR.DISTRICT);
-- DBMS_OUTPUT.PUT_LINE('STATE :'||ADDR_DATA.ADDR.STATE);
-- DBMS_OUTPUT.PUT_LINE('PINCODE :'||ADDR_DATA.ADDR.PINCODE);

--CALLING TO GET DEPARTMENT DETAILS
-- CK_EMP_CRUD_PKG.CK_GET_DEPT(D_DETAILS,RES);
-- LOOP
-- FETCH D_DETAILS INTO DEPT;
-- EXIT WHEN D_DETAILS%NOTFOUND;
-- DBMS_OUTPUT.PUT_LINE('DEPARTMENT NUMBER | ' || 'DEPARTMENT NAME');
-- DBMS_OUTPUT.PUT_LINE(DEPT.DEPT_NO || '  |   '|| DEPT.DEPT_NAME);
-- END LOOP;

--CALLING TO GET WHOLE USER DETAILS
-- CK_EMP_CRUD_PKG.CK_GET_USER(U_DETAILS,RES);
-- LOOP
-- FETCH U_DETAILS INTO USERS;
-- EXIT WHEN U_DETAILS%NOTFOUND;
-- DBMS_OUTPUT.PUT_LINE(USERS.EMP_ID || ' , '|| USERS.FIRST_NAME|| ' , '|| USERS.LAST_NAME|| ' , '||USERS.EMAIL|| ' , '||USERS.PHONE|| ' , '||USERS.HIRE_DATE|| ' , '||USERS.DEPT_NUMBER|| ' , '||USERS.ADDR.ADDR1|| ' , '||USERS.ADDR.ADDR2|| ' , '||USERS.ADDR.CITY|| ' , '||USERS.ADDR.DISTRICT|| ' , '||USERS.ADDR.STATE|| ' , '||USERS.ADDR.PINCODE);
-- END LOOP;

--CALLING TO GET WHOLE USER LOGIN DETAILS
-- CK_EMP_CRUD_PKG.CK_USER_LOGIN_DETAILS(L_DETAILS,RES);
-- LOOP
-- FETCH L_DETAILS INTO LOGINS;
-- EXIT WHEN L_DETAILS%NOTFOUND;
-- DBMS_OUTPUT.PUT_LINE(LOGINS.USER_ID|| ' , '||LOGINS.USR_NAME|| ' , '|| LOGINS.PSWD);
-- END LOOP;


-- FOR I IN D_DETAILS.FIRST .. D_DETAILS.LAST LOOP
-- DBMS_OUTPUT.PUT_LINE('DEPTNAME :'||D_DETAILS(I).DEPT_NAME);
-- END LOOP;

--CALLING TO DELETE DEPARTMENT DETAILS
-- CK_EMP_CRUD_PKG.CK_DELETE_DEPT('&DEPT_NAME',RES);

--CALLING TO DELETE USER DETAILS
-- CK_EMP_CRUD_PKG.CK_DELETE_USER('&USER_NAME',RES);

--CALLING TO DELETE USER CREDENTAILS
-- CK_EMP_CRUD_PKG.CK_DELETE_CREDENTIALS('&USER_NAME',RES);


--CALLING TO UPDATE PASSWORD 
-- CK_EMP_CRUD_PKG.CK_UPDATE_PASSWORD('&USERNAME','&OLD_PASSWORD','&NEW_PASSWORD','&CONFIRM_PASSWORD',RES);

DBMS_OUTPUT.PUT_LINE(RES);
END;
/
