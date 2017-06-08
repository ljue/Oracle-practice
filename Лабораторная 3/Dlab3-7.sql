SELECT 
uc.table_name||'.'||ucc.column_name "CUST.FK",
c.table_name||'.'||cc.column_name "SUPP.PK",
(SELECT count(ut.grantee)
FROM user_tab_privs ut
WHERE table_name=c.table_name
AND PRIVILEGE='DELETE'
)-
(SELECT count(utm.grantee)
FROM user_tab_privs_made utm join user_tab_privs ut
on (utm.grantee=ut.grantee)
WHERE ut.table_name=c.table_name
AND ut.PRIVILEGE='DELETE'
)
us_del_cnt,
uc.delete_rule del_rule
FROM user_constraints c JOIN user_constraints uc
ON (c.constraint_name=uc.r_constraint_name)
JOIN user_cons_columns cc
ON (c.constraint_name=cc.constraint_name)
JOIN user_cons_columns ucc
ON (uc.constraint_name=ucc.constraint_name);