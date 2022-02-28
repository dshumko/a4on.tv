-- Блок для формирования подъездов этажей из таблицы квартир
execute block
as
declare variable hid integer;
declare variable pid integer;
declare variable fid integer;
declare variable PN  D_VARCH10_NS;
declare variable FN  D_VARCH10_NS;
declare variable FF  D_FLAT_NS;
declare variable FT  D_FLAT_NS;
declare variable FS  D_VARCHAR1000;
begin
  -- удалим квартиры для которых нет домов
  delete from Houseflats f
      where not exists(select
                           h.House_Id
                         from house h
                         where h.House_Id = f.House_Id);
  -- удалим подъезды для которых нет квартир
  delete from Houseporch f
      where not exists(select
                           h.House_Id
                         from Houseflats h
                         where h.House_Id = f.House_Id
                               and coalesce(h.Porch_N, '') = coalesce(f.Porch_N, ''));
  for select
          f.House_Id
        , f.Porch_N
        , count(distinct f.Floor_N)
        , min(f.flat_no)
        , max(f.flat_no)
        from houseflats f
        group by 1, 2
      into :hid, :pn, :fid, :FF, :FT
  do begin
    -- создадим или обновим инфу по подъездам
    pid = null;
    select
        p.Porch_Id
      from Houseporch p
      where p.House_Id = :hid
            and p.Porch_N = :pn
    into :pid;
    if (pid is null) then begin
      pid = gen_id(Gen_Operations_Uid, 1);
    end
    update or insert into Houseporch (Porch_Id, House_Id, Porch_N, Floors, Flat_From, Flat_To)
    values (:pid, :hid, :PN, :fid, :FF, :FT)
    matching (Porch_Id);
  end

  -- проверим этажи
  for select
          f.House_Id
        , f.Porch_N
        , f.Floor_N
        , list(distinct f.flat_no, ',')
        , min(f.flat_no)
        , max(f.flat_no)
        from houseflats f
        group by 1, 2, 3
      into :hid, :pn, :fn, :FS, :FF, :FT
  do begin
    select
        p.Porch_Id
      from Houseporch p
      where p.House_Id = :hid
            and p.Porch_N = :pn
    into :pid;

    fid = null;
    select
        f.Floor_Id
      from Housefloor f
      where f.Porch_Id = :pid
            and f.Floor_N = :fn
    into :fid;

    if (fid is null) then begin
      fid = gen_id(Gen_Operations_Uid, 1);
    end

    update or insert into Housefloor (Floor_Id, Porch_Id, Floor_N, Flat_From, Flat_To, Flats)
    values (:fid, :pid, :FN, :FF, :FT, :FS)
    matching (Floor_Id);
  end
end
