DESCRIBE EMPLOYEES
SELECT LAST_NAME "Employee", SALARY "Monthly Salary"
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000
AND DEPARTMENT_ID IN (20, 50);