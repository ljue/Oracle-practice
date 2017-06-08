SELECT department_id, MIN (salary) 
FROM employees 
WHERE department_id = 
                      (SELECT department_id 
                      FROM employees 
                      GROUP BY department_id 
                      HAVING AVG(salary) IN 
                                            (SELECT MAX(AVG(salary)) 
                                            FROM employees 
                                            GROUP BY department_id)) 
GROUP BY department_id;