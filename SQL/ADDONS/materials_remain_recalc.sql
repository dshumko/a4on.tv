set names Utf8;
set Sql Dialect 3;

CREATE TABLE REMAIN_SAVE (
    M_ID       UID,
    WH_ID      UID,
    MR_QUANT   D_N15_5
);
CREATE INDEX REMAIN_SAVE_IDX1 ON REMAIN_SAVE (M_ID, WH_ID);
insert into Remain_Save (M_Id, Wh_Id, Mr_Quant)
select M_Id, Wh_Id, Mr_Quant from Materials_Remain where coalesce(Mr_Quant, 0) <> 0;
COMMIT;

execute procedure Material_Remain_Recalc(null);
commit;

execute block
as
declare variable DOC_ID integer;
declare variable WH_ID  integer;
declare variable PR_WH  integer;
declare variable M_ID   integer;
declare variable OLD_Q  numeric(18,5);
declare variable NEW_Q  numeric(18,5);
begin
  PR_WH = -9999;
  for select
          Wh_Id
        , M_Id
        , coalesce(OLD_Q, 0) OLD_Q
        , coalesce(NEW_Q, 0) NEW_Q
        from (select
                  M_Id
                , Wh_Id
                , Mr_Quant OLD_Q
                , (select
                       n.Mr_Quant
                     from Materials_Remain n
                     where n.M_Id = o.M_Id
                           and n.Wh_Id = o.Wh_Id) NEW_Q
                from Remain_Save o
              union
              select
                  M_Id
                , Wh_Id
                , null OLD_Q
                , n.Mr_Quant NEW_Q
                from Materials_Remain n
                where not exists(select
                                     o.Mr_Quant
                                   from Remain_Save o
                                   where n.M_Id = o.M_Id
                                         and n.Wh_Id = o.Wh_Id)

        )
        order by WH_ID, M_ID
      into :WH_ID, :M_ID, :OLD_Q, :NEW_Q
  do begin
    if (WH_ID <> PR_WH) then begin

      if (not Doc_Id is null) then
        execute procedure Close_Material_Doc(:Doc_Id)
            returning_values :Doc_Id;

      Doc_Id = gen_id(Gen_Uid, 1);
      insert into MATERIAL_DOCS (DOC_ID, DOC_N, DOC_DATE, DT_ID, NOTICE, WH_ID, DOC_CLOSED)
      values (:Doc_Id, current_date, current_date, 5, 'Выравнивание остатков после пересчета', :WH_ID, 0);
      PR_WH = WH_ID;
    end

    if (NEW_Q <> OLD_Q) then
      insert into MATERIALS_IN_DOC (DOC_ID, M_ID, B_QUANT, M_QUANT)
      values (:Doc_Id, :M_ID, :NEW_Q, :OLD_Q);
  end
  if (not Doc_Id is null) then
     execute procedure Close_Material_Doc(:Doc_Id)
         returning_values :Doc_Id;

end;
commit;
execute procedure Material_Remain_Recalc(null);
commit;