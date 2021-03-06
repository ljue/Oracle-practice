SELECT E.LAST_NAME "Employee", E.EMPLOYEE_ID "Emp#",
NVL(TO_CHAR(EE.LAST_NAME),' ') "Manager", NVL(TO_CHAR(EE.EMPLOYEE_ID),' ') "Mgr#"
FROM EMPLOYEES E LEFT OUTER JOIN EMPLOYEES EE
ON (E.MANAGER_ID=EE.EMPLOYEE_ID)
ORDER BY 2;
