SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN
                      (SELECT DEPARTMENT_ID
                      FROM EMPLOYEES
                      WHERE UPPER(LAST_NAME) LIKE '%U%')
AND SALARY> 
            (SELECT AVG(SALARY)
            FROM EMPLOYEES);