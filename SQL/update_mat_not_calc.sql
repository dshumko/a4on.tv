alter table Materials_Group add Rent D_Uid_Null;
alter table Materials_Group add Loan D_Uid_Null;

alter table Materials add Rent D_Uid_Null;
alter table Materials add Loan D_Uid_Null;

alter table Request_Materials add PROP D_INTEGER;
ALTER TABLE REQUEST_MATERIALS ALTER COLUMN NOT_CALC TYPE D_INTEGER;
update Request_Materials set PROP = NOT_CALC;
commit;