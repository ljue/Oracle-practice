DESCRIBE EMPLOYEES
SELECT JOB_ID, MAX(SALARY) "Maximum", MIN(SALARY) "Minimum", SUM(SALARY) "Sum", ROUND(AVG(SALARY)) "Average"
FROM EMPLOYEES
GROUP BY JOB_ID;
