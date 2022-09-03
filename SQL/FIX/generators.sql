execute block as
declare variable i integer;
begin
select max(r.Id_Report) from reports r   into :i;
i = coalesce(i, 1);
execute statement 'SET GENERATOR gen_report_id TO ' || i;
end;
commit;

execute block as
declare variable i integer;
begin
select max(p.Payment_Id) from payment p into :i;
i = coalesce(i, 1);
execute statement 'SET GENERATOR GEN_PAYMENT TO ' || i;
end;
commit;

execute block as
declare variable i integer;
begin
select max(p.CUSTOMER_Id) from CUSTOMER p into :i;
i = coalesce(i, 1);
execute statement 'SET GENERATOR GEN_CUSTOMER_UID TO ' || i;
end;
commit;

execute block as
declare variable i integer;
begin
select max(p.Id) from TQUEUE p into :i;
i = coalesce(i, 1);
execute statement 'SET GENERATOR GEN_QUEUE TO ' || i;
end;
commit;

execute block as
declare variable i integer;
begin
select max(p.RQ_ID) from REQUEST p into :i;
i = coalesce(i, 1);
execute statement 'SET GENERATOR gen_request TO ' || i;
end;
commit;