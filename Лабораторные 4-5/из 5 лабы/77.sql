WITH 
PLUS AS 
(SELECT SYS_CONNECT_BY_PATH(A,'+') AS STR
  FROM LAB77
  WHERE LEVEL>1
  CONNECT BY PRIOR ID<ID),
SUMM AS
(SELECT LTRIM(STR,'+') AS "Слагаемые",
(SELECT SUM(A)
  FROM LAB77
  WHERE STR LIKE '%+'||A||'%') AS "Сумма"
  FROM PLUS
  ORDER BY 2)

SELECT ROWNUM AS ID, "Слагаемые", "Сумма"
FROM SUMM;

SELECT DISTINCT summ 
  FROM 
      (SELECT yp.rnk,
        sum(CASE WHEN bitand(yp.rnk,lab77.rnk)=lab77.rnk  THEN lab77.A END) summ
      FROM 
            (SELECT A, POWER(2,ROWNUM-1) rnk
            FROM lab77) lab77,
            (SELECT ROWNUM rnk
            FROM 
                (SELECT count(*) c 
                FROM lab77)
            CONNECT BY LEVEL <= POWER(2,c)-1) yp
      GROUP BY yp.rnk)
minus
SELECT A
FROM LAB77;