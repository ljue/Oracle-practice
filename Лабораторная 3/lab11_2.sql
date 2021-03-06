SELECT CC.COLUMN_NAME, C.CONSTRAINT_NAME, C.CONSTRAINT_TYPE C,
C.SEARCH_CONDITION, C.STATUS
FROM USER_CONSTRAINTS C JOIN USER_CONS_COLUMNS CC
ON (C.TABLE_NAME=CC.TABLE_NAME)
AND (C.CONSTRAINT_NAME=CC.CONSTRAINT_NAME)
WHERE C.TABLE_NAME=UPPER('&TABLE_NAME');