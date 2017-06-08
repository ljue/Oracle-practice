CREATE TABLE EMP
            (ID NUMBER(7)
                CONSTRAINT EMP_ID_PK PRIMARY KEY,
            LAST_NAME VARCHAR2(25),
            FIRST_NAME VARCHAR2(25),
            DEPT_ID NUMBER(7)
                CONSTRAINT EMP_DEPT_ID_FK
                REFERENCES DEPT(ID));