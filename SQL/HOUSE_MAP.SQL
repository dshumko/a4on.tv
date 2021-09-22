-- перенос квартир из старой бд в новую
-- точнее из таблицы housefloor в houseflats

execute block as
declare variable house_id uid;
declare variable floor_n d_varchar10;
declare variable porch_n d_varchar10;
declare variable flat_from d_integer;
declare variable flat_to d_integer;
declare variable notice d_notice;
declare variable flats d_varchar500;
declare variable i d_integer;
begin
  for select
          p.house_id, f.FLOOR_N, f.flat_from, f.FLAT_TO, f.NOTICE, f.FLATS, p.porch_n
      from housefloor f
   inner join houseporch p on (f.porch_id = p.porch_id)
      where not (f.FLOOR_N is null or f.FLAT_FROM is null or f.FLAT_TO is null)
      into :house_id, :FLOOR_N, :FLAT_FROM, :FLAT_TO, :NOTICE, :FLATS, :porch_n
  do begin
    i = flat_from;
    while (i<=flat_to) do begin
      insert into HOUSEFLATS (HOUSE_ID, FLAT_NO, PORCH_N, FLOOR_N)
      values (:HOUSE_ID, :i, :PORCH_N, :FLOOR_N);
      i = i+1;
    end

  end
end;
commit;