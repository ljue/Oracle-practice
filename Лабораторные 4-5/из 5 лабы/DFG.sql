WITH
STRING1 AS 
(SELECT 'Пусть имеем 212 45 567.456 789 или 212,13,245.4568 * Имеется 123456.345 567 123.375' AS STR FROM DUAL),
STRK AS (SELECT
			TRIM(REGEXP_SUBSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+',
      			            REGEXP_INSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1, LEVEL)))
			AS RES,
       			STR
		 FROM STRING1
		 CONNECT BY LEVEL <= REGEXP_COUNT(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1))

SELECT		NVL(CASE	WHEN ROWNUM = 
                  (SELECT COUNT(RES)
                  FROM STRK)
              THEN TRIM(REGEXP_REPLACE(STR,'\*.+',''))
                	WHEN ROWNUM = 
                  (SELECT COUNT(RES)+1
                  FROM STRK)
              THEN TRIM(REGEXP_REPLACE(STR,'.+\*',''))
            				ELSE null END, ' ') AS "Текст",
        		RES "Результат"
FROM 		STRK;


WITH
STRING1 AS 
(SELECT 'Пусть имеем 212 45 567.456 789 или 212,13,245.4568' AS STR FROM DUAL
UNION ALL
SELECT 'Имеется 123456.345 567 123.375' AS STR FROM DUAL)

SELECT NVL(CASE WHEN ROWNUM = 1 THEN STR
            				ELSE null END, ' ') AS "Текст",
        		RES "Результат"
FROM  (SELECT
			TRIM(REGEXP_SUBSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+',
      			            REGEXP_INSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1, LEVEL)))
			AS RES,
       			STR
		 FROM STRING1
		 CONNECT BY LEVEL <= REGEXP_COUNT(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1));
     
     
WITH
STRING1 AS 
(SELECT 'Пусть имеем 212 45 567.456 789 или 212,13,245.4568' AS STR FROM DUAL),
STRING2 AS 
(SELECT 'Имеется 123456.345 567 123.375' AS STR FROM DUAL)

SELECT  NVL(CASE WHEN ROWNUM = 1 THEN STR
            				ELSE null END, ' ') AS "Текст",
        		 RES "Результат"
FROM  (SELECT
			TRIM(REGEXP_SUBSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+',
      			            REGEXP_INSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1, LEVEL)))
			AS RES,
       			STR
		 FROM STRING1
		 CONNECT BY LEVEL <= REGEXP_COUNT(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1));

     
WITH
STRING1 AS 
(SELECT 'Пусть имеем 212 45 567.456 789 или 212,13,245.4568' AS STR FROM DUAL
UNION ALL
SELECT 'Имеется 123456.345 567 123.375' AS STR FROM DUAL),
STRK AS (SELECT
			TRIM(REGEXP_SUBSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+',
      			            REGEXP_INSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1, LEVEL)))
			AS RES,
       			STR
		 FROM STRING1
		 CONNECT BY LEVEL <= REGEXP_COUNT(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1))

SELECT		NVL(CASE	WHEN ROWNUM =1 OR ROWNUM=3 THEN 
                  (
            				ELSE null END, ' ') AS "Текст",
        		RES "Результат"
FROM 		
(SELECT DISTINCT STRING1.STR AS S, STRK.RES R
FROM STRING1 RIGHT JOIN STRK
ON (STRING1.STR=STRK.RES));






WITH
STRING1 AS 
(SELECT 'Пусть имеем 212 45 567.456 789 или 212,13,245.4568' AS STR FROM DUAL
UNION ALL
SELECT 'Имеется 123456.345 567 123.375' AS STR FROM DUAL),
STRK AS (SELECT LEVEL TLEVEL, STR,
			TRIM(REGEXP_SUBSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+',
      			            REGEXP_INSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1, LEVEL)))
			AS RES
		 FROM STRING1
		 CONNECT BY LEVEL <= REGEXP_COUNT(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1)
     GROUP BY LEVEL,STR
     ORDER BY STR,LEVEL)
     
SELECT		NVL(CASE	WHEN TLEVEL = 1 
              THEN STR
            				ELSE null END, ' ') AS "Текст",
        		RES "Результат"
FROM 		STRK;
     
     
     
     
     
     
 WITH
STRK AS (SELECT LEVEL TLEVEL,ZNAK,
			TRIM(REGEXP_SUBSTR(ZNAK, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+',
      			            REGEXP_INSTR(ZNAK, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1, LEVEL)))
			AS RES
		 FROM TABS
		 CONNECT BY LEVEL <= REGEXP_COUNT(ZNAK, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1)
     GROUP BY LEVEL,ZNAK
     ORDER BY ZNAK,LEVEL)
     

SELECT		NVL(CASE	WHEN TLEVEL = 1 
              THEN ZNAK
            				ELSE null END, ' ') AS "Текст",
        		RES "Результат"
FROM 		STRK;






WITH
STRING1 AS 
(SELECT 'Пусть имеем 212 45 567.456 789 или 212,13,245.4568 * Имеется 123456.345 567 123.375' AS STR FROM DUAL)


SELECT		NVL(CASE	WHEN ROWNUM = 1 THEN TRIM(REGEXP_REPLACE(STR,'\*.+',''))
          	WHEN ROWNUM = 3 THEN TRIM(REGEXP_REPLACE(STR,'.+\*',''))
            				ELSE null END, ' ') AS "Текст",
        		RES "Результат"
FROM 		(SELECT
			TRIM(REGEXP_SUBSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+',
      			            REGEXP_INSTR(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1, LEVEL)))
			AS RES,
       			STR
		 FROM STRING1
		 CONNECT BY LEVEL <= REGEXP_COUNT(STR, '(((\d{1,3})?((\s)\d{3})+|(\d{1,3}))|((\d{1,3})?((\,)\d{3})+|(\d{1,3}))|((\d{1,3})?(\d{3})+|(\d{1,3})))\.\d+', 1));



