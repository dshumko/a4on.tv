alter table Materials_Group add Rent D_Uid_Null;
alter table Materials_Group add Loan D_Uid_Null;

alter table Materials add Rent D_Uid_Null;
alter table Materials add Loan D_Uid_Null;

alter table Request_Materials add PROP D_INTEGER;
ALTER TABLE REQUEST_MATERIALS ALTER COLUMN NOT_CALC TYPE D_INTEGER;
update Request_Materials set PROP = NOT_CALC;
commit;


ALTER TABLE WORKS ADD F_TMP D_Iboolean;
UPDATE WORKS SET F_TMP = W_ONOFF;
ALTER TABLE WORKS DROP W_ONOFF;
ALTER TABLE WORKS ADD W_ONOFF D_Iboolean;
UPDATE WORKS SET W_ONOFF = F_TMP;
ALTER TABLE WORKS DROP F_TMP;
COMMIT;

COMMENT ON COLUMN WORKS.W_ONOFF IS 'Периодическую услугу вкл или отключать';