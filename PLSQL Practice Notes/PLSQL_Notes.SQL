DROP TABLE CHANDAN_EMPLOYEE;
CREATE TABLE CHANDAN_EMPLOYEE(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    FIRST_NAME VARCHAR2(100) NOT NULL,
    LAST_NAME VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100),
    PHONE_NUMBER VARCHAR2(100),
    HIRE_DATE DATE,
    JOB_ID VARCHAR2(100),
    SALARY NUMBER(8,2),
    COMMISION_PCT NUMBER(8,2),
    MANAGER_ID NUMBER(6),
    DEPARTMENT_ID NUMBER(4)
);

INSERT INTO CHANDAN_EMPLOYEE VALUES (100 , 'Steven'      , 'King'        , 'SKING'    , '515.123.4567'       , '17-JUN-1987' , 'AD_PRES'    , 24000.00      ,      0.00 ,          0 ,   		    90 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (101 , 'Neena'       , 'Kochhar'     , 'NKOCHHAR' , '515.123.4568'       , '18-JUN-1987' , 'AD_VP'      , 17000.00      ,      0.00 ,        100 ,            90 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (102 , 'Lex'         , 'De Haan'     , 'LDEHAAN'  , '515.123.4569'       , '19-JUN-1987' , 'AD_VP'      , 17000.00      ,      0.00 ,        100 ,            90 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (103 , 'Alexander'   , 'Hunold'      , 'AHUNOLD'  , '590.423.4567'       , '20-JUN-1987' , 'IT_PROG'    ,  9000.00      ,      0.00 ,        102 ,            60 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (104 , 'Bruce'       , 'Ernst'       , 'BERNST'   , '590.423.4568'       , '21-JUN-1987' , 'IT_PROG'    ,  6000.00      ,      0.00 ,        103 ,            60 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (105 , 'David'       , 'Austin'      , 'DAUSTIN'  , '590.423.4569'       , '22-JUN-1987' , 'IT_PROG'    ,  4800.00      ,      0.00 ,        103 ,            60 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (106 , 'Valli'       , 'Pataballa'   , 'VPATABAL' , '590.423.4560'       , '23-JUN-1987' , 'IT_PROG'    ,  4800.00      ,      0.00 ,        103 ,            60 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (107 , 'Diana'       , 'Lorentz'     , 'DLORENTZ' , '590.423.5567'       , '24-JUN-1987' , 'IT_PROG'    ,  4200.00      ,      0.00 ,        103 ,            60 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (108 , 'Nancy'       , 'Greenberg'   , 'NGREENBE' , '515.124.4569'       , '25-JUN-1987' , 'FI_MGR'     , 12000.00      ,      0.00 ,        101 ,           100 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (109 , 'Daniel'      , 'Faviet'      , 'DFAVIET'  , '515.124.4169'       , '26-JUN-1987' , 'FI_ACCOUNT' ,  9000.00      ,      0.00 ,        108 ,           100 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (110 , 'John'        , 'Chen'        , 'JCHEN'    , '515.124.4269'       , '27-JUN-1987' , 'FI_ACCOUNT' ,  8200.00      ,      0.00 ,        108 ,           100 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (111 , 'Ismael'      , 'Sciarra'     , 'ISCIARRA' , '515.124.4369'       , '28-JUN-1987' , 'FI_ACCOUNT' ,  7700.00      ,      0.00 ,        108 ,           100 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (112 , 'Jose Manuel' , 'Urman'       , 'JMURMAN'  , '515.124.4469'       , '29-JUN-1987' , 'FI_ACCOUNT' ,  7800.00      ,      0.00 ,        108 ,           100 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (113 , 'Luis'        , 'Popp'        , 'LPOPP'    , '515.124.4567'       , '30-JUN-1987' , 'FI_ACCOUNT' ,  6900.00      ,      0.00 ,        108 ,           100 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (114 , 'Den'         , 'Raphaely'    , 'DRAPHEAL' , '515.127.4561'       , '01-JUL-1987' , 'PU_MAN'     , 11000.00      ,      0.00 ,        100 ,            30 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (115 , 'Alexander'   , 'Khoo'        , 'AKHOO'    , '515.127.4562'       , '02-JUL-1987' , 'PU_CLERK'   ,  3100.00      ,      0.00 ,        114 ,            30 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (116 , 'Shelli'      , 'Baida'       , 'SBAIDA'   , '515.127.4563'       , '03-JUL-1987' , 'PU_CLERK'   ,  2900.00      ,      0.00 ,        114 ,            30 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (117 , 'Sigal'       , 'Tobias'      , 'STOBIAS'  , '515.127.4564'       , '04-JUL-1987' , 'PU_CLERK'   ,  2800.00      ,      0.00 ,        114 ,            30 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (118 , 'Guy'         , 'Himuro'      , 'GHIMURO'  , '515.127.4565'       , '05-JUL-1987' , 'PU_CLERK'   ,  2600.00      ,      0.00 ,        114 ,            30 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (119 , 'Karen'       , 'Colmenares'  , 'KCOLMENA' , '515.127.4566'       , '06-JUL-1987' , 'PU_CLERK'   ,  2500.00      ,      0.00 ,        114 ,            30 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (120 , 'Matthew'     , 'Weiss'       , 'MWEISS'   , '650.123.1234'       , '07-JUL-1987' , 'ST_MAN'     ,  8000.00      ,      0.00 ,        100 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (121 , 'Adam'        , 'Fripp'       , 'AFRIPP'   , '650.123.2234'       , '08-JUL-1987' , 'ST_MAN'     ,  8200.00      ,      0.00 ,        100 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (122 , 'Payam'       , 'Kaufling'    , 'PKAUFLIN' , '650.123.3234'       , '09-JUL-1987' , 'ST_MAN'     ,  7900.00      ,      0.00 ,        100 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (123 , 'Shanta'      , 'Vollman'     , 'SVOLLMAN' , '650.123.4234'       , '10-JUL-1987' , 'ST_MAN'     ,  6500.00      ,      0.00 ,        100 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (124 , 'Kevin'       , 'Mourgos'     , 'KMOURGOS' , '650.123.5234'       , '11-JUL-1987' , 'ST_MAN'     ,  5800.00      ,      0.00 ,        100 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (125 , 'Julia'       , 'Nayer'       , 'JNAYER'   , '650.124.1214'       , '12-JUL-1987' , 'ST_CLERK'   ,  3200.00      ,      0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (126 , 'Irene'       , 'Mikkilineni' , 'IMIKKILI' , '650.124.1224'       , '13-JUL-1987' , 'ST_CLERK'   ,  2700.00      ,      0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (127 , 'James'       , 'Landry'      , 'JLANDRY'  , '650.124.1334'       , '14-JUL-1987' , 'ST_CLERK'   ,  2400.00      ,      0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (128 , 'Steven'      , 'Markle'      , 'SMARKLE'  , '650.124.1434'       , '15-JUL-1987' , 'ST_CLERK'   ,  2200.00      ,      0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (129 , 'Laura'       , 'Bissot'      , 'LBISSOT'  , '650.124.5234'       , '16-JUL-1987' , 'ST_CLERK'   ,  3300.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (130 , 'Mozhe'       , 'Atkinson'    , 'MATKINSO' , '650.124.6234'       , '17-JUL-1987' , 'ST_CLERK'   ,  2800.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (131 , 'James'       , 'Marlow'      , 'JAMRLOW'  , '650.124.7234'       , '18-JUL-1987' , 'ST_CLERK'   ,  2500.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (132 , 'TJ'          , 'Olson'       , 'TJOLSON'  , '650.124.8234'       , '19-JUL-1987' , 'ST_CLERK'   ,  2100.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (133 , 'Jason'       , 'Mallin'      , 'JMALLIN'  , '650.127.1934'       , '20-JUL-1987' , 'ST_CLERK'   ,  3300.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (134 , 'Michael'     , 'Rogers'      , 'MROGERS'  , '650.127.1834'       , '21-JUL-1987' , 'ST_CLERK'   ,  2900.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (135 , 'Ki'          , 'Gee'         , 'KGEE'     , '650.127.1734'       , '22-JUL-1987' , 'ST_CLERK'   ,  2400.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (136 , 'Hazel'       , 'Philtanker'  , 'HPHILTAN' , '650.127.1634'       , '23-JUL-1987' , 'ST_CLERK'   ,  2200.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (137 , 'Renske'      , 'Ladwig'      , 'RLADWIG'  , '650.121.1234'       , '24-JUL-1987' , 'ST_CLERK'   ,  3600.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (138 , 'Stephen'     , 'Stiles'      , 'SSTILES'  , '650.121.2034'       , '25-JUL-1987' , 'ST_CLERK'   ,  3200.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (139 , 'John'        , 'Seo'         , 'JSEO'     , '650.121.2019'       , '26-JUL-1987' , 'ST_CLERK'   ,  2700.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (140 , 'Joshua'      , 'Patel'       , 'JPATEL'   , '650.121.1834'       , '27-JUL-1987' , 'ST_CLERK'   ,  2500.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (141 , 'Trenna'      , 'Rajs'        , 'TRAJS'    , '650.121.8009'       , '28-JUL-1987' , 'ST_CLERK'   ,  3500.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (142 , 'Curtis'      , 'Davies'      , 'CDAVIES'  , '650.121.2994'       , '29-JUL-1987' , 'ST_CLERK'   ,  3100.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (143 , 'Randall'     , 'Matos'       , 'RMATOS'   , '650.121.2874'       , '30-JUL-1987' , 'ST_CLERK'   ,  2600.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (144 , 'Peter'       , 'Vargas'      , 'PVARGAS'  , '650.121.2004'       , '31-JUL-1987' , 'ST_CLERK'   ,  2500.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (145 , 'John'        , 'Russell'     , 'JRUSSEL'  , '011.44.1344.429268' , '01-AUG-1987' , 'SA_MAN'     , 14000.00      ,      0.40 ,        100 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (146 , 'Karen'       , 'Partners'    , 'KPARTNER' , '011.44.1344.467268' , '02-AUG-1987' , 'SA_MAN'     , 13500.00      ,      0.30 ,        100 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (147 , 'Alberto'     , 'Errazuriz'   , 'AERRAZUR' , '011.44.1344.429278' , '03-SEP-1987' , 'SA_MAN'     , 12000.00      ,      0.30 ,        100 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (148 , 'Gerald'      , 'Cambrault'   , 'GCAMBRAU' , '011.44.1344.619268' , '04-SEP-1987' , 'SA_MAN'     , 11000.00      ,      0.30 ,        100 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (149 , 'Eleni'       , 'Zlotkey'     , 'EZLOTKEY' , '011.44.1344.429018' , '05-SEP-1987' , 'SA_MAN'     , 10500.00      ,      0.20 ,        100 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (150 , 'Peter'       , 'Tucker'      , 'PTUCKER'  , '011.44.1344.129268' , '06-SEP-1987' , 'SA_REP'     , 10000.00      ,      0.30 ,        145 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (151 , 'David'       , 'Bernstein'   , 'DBERNSTE' , '011.44.1344.345268' , '07-SEP-1987' , 'SA_REP'     ,  9500.00      ,      0.25 ,        145 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (152 , 'Peter'       , 'Hall'        , 'PHALL'    , '011.44.1344.478968' , '08-SEP-1987' , 'SA_REP'     ,  9000.00      ,      0.25 ,        145 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (153 , 'Christopher' , 'Olsen'       , 'COLSEN'   , '011.44.1344.498718' , '09-SEP-1987' , 'SA_REP'     ,  8000.00      ,      0.20 ,        145 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (154 , 'Nanette'     , 'Cambrault'   , 'NCAMBRAU' , '011.44.1344.987668' , '10-SEP-1987' , 'SA_REP'     ,  7500.00      ,      0.20 ,        145 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (155 , 'Oliver'      , 'Tuvault'     , 'OTUVAULT' , '011.44.1344.486508' , '11-SEP-1987' , 'SA_REP'     ,  7000.00      ,      0.15 ,        145 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (156 , 'Janette'     , 'King'        , 'JKING'    , '011.44.1345.429268' , '12-SEP-1987' , 'SA_REP'     , 10000.00      ,      0.35 ,        146 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (157 , 'Patrick'     , 'Sully'       , 'PSULLY'   , '011.44.1345.929268' , '13-SEP-1987' , 'SA_REP'     ,  9500.00      ,      0.35 ,        146 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (158 , 'Allan'       , 'McEwen'      , 'AMCEWEN'  , '011.44.1345.829268' , '14-SEP-1987' , 'SA_REP'     ,  9000.00      ,      0.35 ,        146 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (159 , 'Lindsey'     , 'Smith'       , 'LSMITH'   , '011.44.1345.729268' , '15-SEP-1987' , 'SA_REP'     ,  8000.00      ,      0.30 ,        146 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (160 , 'Louise'      , 'Doran'       , 'LDORAN'   , '011.44.1345.629268' , '16-SEP-1987' , 'SA_REP'     ,  7500.00      ,      0.30 ,        146 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (161 , 'Sarath'      , 'Sewall'      , 'SSEWALL'  , '011.44.1345.529268' , '17-SEP-1987' , 'SA_REP'     ,  7000.00      ,      0.25 ,        146 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (162 , 'Clara'       , 'Vishney'     , 'CVISHNEY' , '011.44.1346.129268' , '18-SEP-1987' , 'SA_REP'     , 10500.00      ,      0.25 ,        147 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (163 , 'Danielle'    , 'Greene'      , 'DGREENE'  , '011.44.1346.229268' , '19-SEP-1987' , 'SA_REP'     ,  9500.00      ,      0.15 ,        147 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (164 , 'Mattea'      , 'Marvins'     , 'MMARVINS' , '011.44.1346.329268' , '20-SEP-1987' , 'SA_REP'     ,  7200.00      ,      0.10 ,        147 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (165 , 'David'       , 'Lee'         , 'DLEE'     , '011.44.1346.529268' , '21-SEP-1987' , 'SA_REP'     ,  6800.00      ,      0.10 ,        147 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (166 , 'Sundar'      , 'Ande'        , 'SANDE'    , '011.44.1346.629268' , '22-SEP-1987' , 'SA_REP'     ,  6400.00      ,      0.10 ,        147 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (167 , 'Amit'        , 'Banda'       , 'ABANDA'   , '011.44.1346.729268' , '23-SEP-1987' , 'SA_REP'     ,  6200.00      ,      0.10 ,        147 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (168 , 'Lisa'        , 'Ozer'        , 'LOZER'    , '011.44.1343.929268' , '24-SEP-1987' , 'SA_REP'     , 11500.00      ,      0.25 ,        148 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (169 , 'Harrison'    , 'Bloom'       , 'HBLOOM'   , '011.44.1343.829268' , '25-SEP-1987' , 'SA_REP'     , 10000.00      ,      0.20 ,        148 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (170 , 'Tayler'      , 'Fox'         , 'TFOX'     , '011.44.1343.729268' , '26-SEP-1987' , 'SA_REP'     ,  9600.00      ,      0.20 ,        148 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (171 , 'William'     , 'Smith'       , 'WSMITH'   , '011.44.1343.629268' , '27-SEP-1987' , 'SA_REP'     ,  7400.00      ,      0.15 ,        148 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (172 , 'Elizabeth'   , 'Bates'       , 'EBATES'   , '011.44.1343.529268' , '28-SEP-1987' , 'SA_REP'     ,  7300.00      ,      0.15 ,        148 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (173 , 'Sundita'     , 'Kumar'       , 'SKUMAR'   , '011.44.1343.329268' , '29-SEP-1987' , 'SA_REP'     ,  6100.00      ,      0.10 ,        148 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (174 , 'Ellen'       , 'Abel'        , 'EABEL'    , '011.44.1644.429267' , '30-SEP-1987' , 'SA_REP'     , 11000.00      ,      0.30 ,        149 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (175 , 'Alyssa'      , 'Hutton'      , 'AHUTTON'  , '011.44.1644.429266' , '30-SEP-1987' , 'SA_REP'     ,  8800.00      ,      0.25 ,        149 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (176 , 'Jonathon'    , 'Taylor'      , 'JTAYLOR'  , '011.44.1644.429265' , '01-OCT-1987' , 'SA_REP'     ,  8600.00      ,      0.20 ,        149 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (177 , 'Jack'        , 'Livingston'  , 'JLIVINGS' , '011.44.1644.429264' , '02-OCT-1987' , 'SA_REP'     ,  8400.00      ,      0.20 ,        149 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (178 , 'Kimberely'   , 'Grant'       , 'KGRANT'   , '011.44.1644.429263' , '03-OCT-1987' , 'SA_REP'     ,  7000.00      ,      0.15 ,        149 ,             0 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (179 , 'Charles'     , 'Johnson'     , 'CJOHNSON' , '011.44.1644.429262' , '04-OCT-1987' , 'SA_REP'     ,  6200.00      ,      0.10 ,        149 ,            80 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (180 , 'Winston'     , 'Taylor'      , 'WTAYLOR'  , '650.507.9876'       , '05-OCT-1987' ,' SH_CLERK'   ,  3200.00     ,       0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (181 , 'Jean'        , 'Fleaur'      , 'JFLEAUR'  , '650.507.9877'       , '06-OCT-1987' , 'SH_CLERK'   ,  3100.00      ,      0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (182 , 'Martha'      , 'Sullivan'    , 'MSULLIVA' , '650.507.9878'       , '07-OCT-1987' , 'SH_CLERK'   ,  2500.00      ,      0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (183 , 'Girard'      , 'Geoni'       , 'GGEONI'   , '650.507.9879'       , '08-OCT-1987' , 'SH_CLERK'   ,  2800.00      ,      0.00 ,        120 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (184 , 'Nandita'     , 'Sarchand'    , 'NSARCHAN' , '650.509.1876'       , '09-NOV-1987' , 'SH_CLERK'   ,  4200.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (185 , 'Alexis'      , 'Bull'        , 'ABULL'    , '650.509.2876'       , '10-NOV-1987' , 'SH_CLERK'   ,  4100.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (186 , 'Julia'       , 'Dellinger'   , 'JDELLING' , '650.509.3876'       , '11-NOV-1987' , 'SH_CLERK'   ,  3400.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (187 , 'Anthony'     , 'Cabrio'      , 'ACABRIO'  , '650.509.4876'       , '12-NOV-1987' , 'SH_CLERK'   ,  3000.00      ,      0.00 ,        121 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (188 , 'Kelly'       , 'Chung'       , 'KCHUNG'   , '650.505.1876'       , '13-NOV-1987' , 'SH_CLERK'   ,  3800.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (189 , 'Jennifer'    , 'Dilly'       , 'JDILLY'   , '650.505.2876'       , '14-NOV-1987' , 'SH_CLERK'   ,  3600.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (190 , 'Timothy'     , 'Gates'       , 'TGATES'   , '650.505.3876'       , '15-NOV-1987' , 'SH_CLERK'   ,  2900.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (191 , 'Randall'     , 'Perkins'     , 'RPERKINS' , '650.505.4876'       , '16-NOV-1987' , 'SH_CLERK'   ,  2500.00      ,      0.00 ,        122 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (192 , 'Sarah'       , 'Bell'        , 'SBELL'    , '650.501.1876'       , '17-NOV-1987' , 'SH_CLERK'   ,  4000.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (193 , 'Britney'     , 'Everett'     , 'BEVERETT' , '650.501.2876'       , '18-NOV-1987' , 'SH_CLERK'   ,  3900.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (194 , 'Samuel'      , 'McCain'      , 'SMCCAIN'  , '650.501.3876'       , '19-NOV-1987' , 'SH_CLERK'   ,  3200.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (195 , 'Vance'       , 'Jones'       , 'VJONES'   , '650.501.4876'       , '20-NOV-1987' , 'SH_CLERK'   ,  2800.00      ,      0.00 ,        123 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (196 , 'Alana'       , 'Walsh'       , 'AWALSH'   , '650.507.9811'       , '21-NOV-1987' , 'SH_CLERK'   ,  3100.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (197 , 'Kevin'       , 'Feeney'      , 'KFEENEY'  , '650.507.9822'       , '22-NOV-1987' , 'SH_CLERK'   ,  3000.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (198 , 'Donald'      , 'OConnell'    , 'DOCONNEL' , '650.507.9833'       , '23-NOV-1987' , 'SH_CLERK'   ,  2600.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (199 , 'Douglas'     , 'Grant'       , 'DGRANT'   , '650.507.9844'       , '24-NOV-1987' , 'SH_CLERK'   ,  2600.00      ,      0.00 ,        124 ,            50 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (200 , 'Jennifer'    , 'Whalen'      , 'JWHALEN'  , '515.123.4444'       , '25-NOV-1987' , 'AD_ASST'    ,  4400.00      ,      0.00 ,        101 ,            10 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (201 , 'Michael'     , 'Hartstein'   , 'MHARTSTE' , '515.123.5555'       , '26-NOV-1987' , 'MK_MAN'     , 13000.00      ,      0.00 ,        100 ,            20 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (202 , 'Pat'         , 'Fay'         , 'PFAY'     , '603.123.6666'       , '27-NOV-1987' , 'MK_REP'     ,  6000.00      ,      0.00 ,        201 ,            20 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (203 , 'Susan'       , 'Mavris'      , 'SMAVRIS'  , '515.123.7777'       , '28-NOV-1987' , 'HR_REP'     ,  6500.00      ,      0.00 ,        101 ,            40 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (204 , 'Hermann'     , 'Baer'        , 'HBAER'    , '515.123.8888'       , '29-NOV-1987' , 'PR_REP'     , 10000.00      ,      0.00 ,        101 ,            70 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (205 , 'Shelley'     , 'Higgins'     , 'SHIGGINS' , '515.123.8080'       , '30-NOV-1987' , 'AC_MGR'     , 12000.00      ,      0.00 ,        101 ,           110 );
INSERT INTO CHANDAN_EMPLOYEE VALUES (206 , 'William'     , 'Gietz'       , 'WGIETZ'   , '515.123.8181'       , '01-DEC-1987' , 'AC_ACCOUNT' , 8300.00       ,     0.00 ,        205 ,            110 );


SELECT * FROM CHANDAN_EMPLOYEE;

-- 1. Write a PL/SQL block to calculate the incentive of an employee whose ID is 110.
DECLARE
INCENTIVE NUMBER(8,2);
BEGIN
SELECT SALARY*0.12 INTO INCENTIVE FROM CHANDAN_EMPLOYEE WHERE EMPLOYEE_ID=110;
DBMS_OUTPUT.put_line('The Incentive amount for Employee with ID 110 is : '||INCENTIVE);
END; 
/

--2. Write a PL/SQL block to show an invalid case-insensitive reference to a quoted and without quoted user-defined identifier.
DECLARE
WELCOME VARCHAR2(10) := 'welcome';
BEGIN
DBMS_OUTPUT.put_line('WELCOME');
END;
/

-- 3. Write a PL/SQL block to show a reserved word can be used as a user-define identifier.
DECLARE
"DECLARE" VARCHAR2(100) := 'THIS IS UPPER CASE';
"declare" varchar2(100) := 'this is lower case';
"Declare" varchar2(100) := 'This is proper case';
BEGIN
DBMS_OUTPUT.put_line("DECLARE");
DBMS_OUTPUT.put_line("declare");
DBMS_OUTPUT.put_line("Declare");
END;
/

-- 4. Write a PL/SQL block to show the result to neglect double quotation marks in reserved word identifier.
DECLARE
"WORLD" VARCHAR2(100) := 'world';
"DECLARE" varchar2(100) := 'declare';
BEGIN
DBMS_OUTPUT.put_line("WORLD");
DBMS_OUTPUT.put_line("DECLARE");
END;
/

-- 5. Write a PL/SQL block to show the result to neglect the case sensitivity of a user defined identifier which is also a reserved word.
DECLARE
  "WORLD" varchar2(20) := 'world';  
  "DECLARE" varchar2(20) := 'declare';  
BEGIN
  DBMS_Output.Put_Line(World);      
  DBMS_Output.Put_Line(DECLARE);   
END;
/

-- 16. Write a PL/SQL block to describe the usage of LIKE operator including wildcard characters and escape character.
DECLARE

BEGIN
END;
/


select * from emp;
rollback;