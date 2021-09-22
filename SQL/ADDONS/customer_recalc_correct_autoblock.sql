execute block RETURNS (sql D_Varchar255)
as
declare variable cid integer;
declare variable dd integer;
declare variable mb date;
declare variable me date;
declare variable hid integer;
declare variable bd date;
begin
  for select
          Month_Id
        , Customer_Id
        , DAY_DIFF
        from (select
                  c.Account_No
                , f.Month_Id
                , c.Customer_Id
                , f.NEW_FEE
                , o.OLD_FEE
                ,
                  (f.NEW_FEE - coalesce(o.OLD_FEE, 0)) as DIFF
                , abs(f.NEW_FEE - coalesce(o.OLD_FEE, 0)) as ABS_DIFF
                , f.NEW_Units
                , o.OLD_UNITS
                , coalesce(o.OLD_UNITS, 0) - f.NEW_Units DAY_DIFF
                from (select
                          f.Customer_Id
                        , f.Month_Id
                        , sum(f.Fee) NEW_FEE
                        , sum(f.Units) NEW_UNITS
                        from Monthly_Fee f
                        group by 1, 2) f
                     inner join customer c on (c.Customer_Id = f.Customer_Id)
                     left outer join(select
                                         f.Customer_Id
                                       , f.Month_Id
                                       , sum(f.Fee) OLD_FEE
                                       , sum(f.Units) OLD_UNITS
                                       from Monthly_OLD f
                                       group by 1, 2) o on (o.Customer_Id = f.Customer_Id and
                           o.Month_Id = f.Month_Id)
                where f.NEW_FEE is distinct from o.OLD_FEE
                      and (f.NEW_FEE - coalesce(o.OLD_FEE, 0)) <> 0)
        order by 1
      into :mb, :cid, :dd
  do begin
    if (dd <> 0) then begin
      me = dateadd(-1 day to(dateadd(1 month to mb)));
      select first 1
          sh.Subscr_Hist_Id
        , sh.Date_To
        from subscr_hist sh
        where sh.Customer_Id = :cid
              and sh.Disact_Serv_Id = -3
              and sh.Date_To between :mb and :me
        order by Date_From
      into :hid, :bd;
      if (not hid is null) then begin
        bd = dateadd(day, dd, bd);
        sql = 'update subscr_hist set Date_To = ''' || :bd || ''' where Subscr_Hist_Id = ' || :hid || '; commit;';
        suspend;
      end
      hid = null;
    end
  end
end