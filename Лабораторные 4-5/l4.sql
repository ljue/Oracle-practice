SELECT
  (SELECT E.FIRST_NAME||' '||E.LAST_NAME
  FROM EMPLOYEES E
  WHERE E.EMPLOYEE_ID = EM.MANAGER_ID)
  
  || CASE 
  GROUPING(EM.MANAGER_ID)+GROUPING(EM.JOB_ID)
   WHEN 0 THEN NULL
   WHEN 1 THEN ' итоги:'
   ELSE 'О Б Щ И Й   И Т О Г'
   END
   "Руководитель",
   
nvl(to_char((SELECT J.JOB_TITLE
FROM JOBS J
WHERE J.JOB_ID = EM.JOB_ID)
       
  || CASE GROUPING(EM.JOB_ID)
  WHEN 1 THEN 
        (SELECT J.JOB_TITLE
         FROM JOBS J
        WHERE J.JOB_ID =
              (SELECT E.JOB_ID 
               FROM EMPLOYEES E 
              WHERE E.EMPLOYEE_ID = EM.MANAGER_ID))
  ELSE null
  END),' ') "Должность",
  
COUNT(1)"Кол-во подчиненных",
SUM(EM.SALARY) "Сумма"
FROM EMPLOYEES EM
WHERE EM.MANAGER_ID IS NOT NULL
GROUP BY ROLLUP (EM.MANAGER_ID, EM.JOB_ID);