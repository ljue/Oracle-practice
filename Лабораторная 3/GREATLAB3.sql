SELECT DISTINCT c.constraint_name fk_name, c.table_name fk_table,
                cc.column_name fk_column, uc.table_name pk_table,
                ucc.column_name pk_column
FROM user_constraints c 
JOIN user_cons_columns cc
ON (c.constraint_name=cc.constraint_name)
JOIN user_constraints uc
ON (c.r_constraint_name=uc.constraint_name)
JOIN user_cons_columns ucc
ON (uc.constraint_name=ucc.constraint_name)
WHERE c.constraint_type='R'
AND cc.position=ucc.position
ORDER BY 2,1,3;