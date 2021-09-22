-------------------------------------------------------------- BLOB GZIP

DROP DOMAIN D_BLOB_GZIP1K;
DROP DOMAIN D_BLOB1K;

CREATE DOMAIN D_BLOB_GZIP1K AS BLOB SUB_TYPE -15 SEGMENT SIZE 1024;
CREATE DOMAIN D_BLOB1K AS BLOB SUB_TYPE 0 SEGMENT SIZE 1024;

ALTER TABLE BLOB_TBL ADD BLB_TMP D_BLOB1K;
update BLOB_TBL set BLB_TMP = BL_BODY;
commit;
ALTER TABLE BLOB_TBL DROP BL_BODY;
ALTER TABLE BLOB_TBL ADD BL_BODY D_BLOB1K;
update BLOB_TBL set BL_BODY = BLB_TMP;
commit;
ALTER TABLE BLOB_TBL DROP BLB_TMP;

ALTER TABLE Blb_Gzip ADD BLB_TMP D_BLOB_GZIP1K;
update Blb_Gzip set BLB_TMP = Blb_Body;
commit;
ALTER TABLE Blb_Gzip DROP Blb_Body;
ALTER TABLE Blb_Gzip ADD Blb_Body D_BLOB_GZIP1K;
update Blb_Gzip set Blb_Body = BLB_TMP;
commit;
ALTER TABLE Blb_Gzip DROP BLB_TMP;

-------------------------------------------------------------- BLOB

ALTER TABLE CHANNELS ADD BLB_TMP D_BLOB1K;
update CHANNELS set BLB_TMP = CH_ICON;
commit;
ALTER TABLE CHANNELS DROP CH_ICON;
ALTER TABLE CHANNELS ADD CH_ICON D_BLOB1K;
update CHANNELS set CH_ICON = BLB_TMP;
commit;
ALTER TABLE CHANNELS DROP BLB_TMP;

ALTER TABLE CLIENT_FILES ADD BLB_TMP D_BLOB1K;
update CLIENT_FILES set BLB_TMP = FILE_BODY;
commit;
ALTER TABLE CLIENT_FILES DROP FILE_BODY;
ALTER TABLE CLIENT_FILES ADD FILE_BODY D_BLOB1K;
update CLIENT_FILES set FILE_BODY = BLB_TMP;
commit;
ALTER TABLE CLIENT_FILES DROP BLB_TMP;

ALTER TABLE CUSTOMER_FILES ADD BLB_TMP D_BLOB1K;
update CUSTOMER_FILES set BLB_TMP = CONTENT;
commit;
ALTER TABLE CUSTOMER_FILES DROP CONTENT;
ALTER TABLE CUSTOMER_FILES ADD CONTENT D_BLOB1K;
update CUSTOMER_FILES set CONTENT = BLB_TMP;
commit;
ALTER TABLE CUSTOMER_FILES DROP BLB_TMP;

ALTER TABLE HOUSE_CIRCUIT ADD BLB_TMP D_BLOB1K;
update HOUSE_CIRCUIT set BLB_TMP = PNG;
commit;
ALTER TABLE HOUSE_CIRCUIT DROP PNG;
ALTER TABLE HOUSE_CIRCUIT ADD PNG D_BLOB1K;
update HOUSE_CIRCUIT set PNG = BLB_TMP;
commit;
ALTER TABLE HOUSE_CIRCUIT DROP BLB_TMP;

ALTER TABLE HOUSE_CIRCUIT ADD BLB_TMP D_BLOB1K;
update HOUSE_CIRCUIT set BLB_TMP = CIRCUIT;
commit;
ALTER TABLE HOUSE_CIRCUIT DROP CIRCUIT;
ALTER TABLE HOUSE_CIRCUIT ADD CIRCUIT D_BLOB1K;
update HOUSE_CIRCUIT set CIRCUIT = BLB_TMP;
commit;
ALTER TABLE HOUSE_CIRCUIT DROP BLB_TMP;

ALTER TABLE MODULES ADD BLB_TMP D_BLOB1K;
update MODULES set BLB_TMP = MODULE;
commit;
ALTER TABLE MODULES DROP MODULE;
ALTER TABLE MODULES ADD MODULE D_BLOB1K;
update MODULES set MODULE = BLB_TMP;
commit;
ALTER TABLE MODULES DROP BLB_TMP;

ALTER TABLE NODE_FILES ADD BLB_TMP D_BLOB1K;
update NODE_FILES set BLB_TMP = CONTENT;
commit;
ALTER TABLE NODE_FILES DROP CONTENT;
ALTER TABLE NODE_FILES ADD CONTENT D_BLOB1K;
update NODE_FILES set CONTENT = BLB_TMP;
commit;
ALTER TABLE NODE_FILES DROP BLB_TMP;

ALTER TABLE REQUEST_PHOTOS ADD BLB_TMP D_BLOB1K;
update REQUEST_PHOTOS set BLB_TMP = JPG;
commit;
ALTER TABLE REQUEST_PHOTOS DROP JPG;
ALTER TABLE REQUEST_PHOTOS ADD JPG D_BLOB1K;
update REQUEST_PHOTOS set JPG = BLB_TMP;
commit;
ALTER TABLE REQUEST_PHOTOS DROP BLB_TMP;


-------------------------------------------------------------- BLOB REPORTS
SET TERM ^ ;

create or alter procedure GET_ALL_REPORTS
returns (
    ID_REPORT   D_INTEGER,
    ID_PARENT   D_INTEGER,
    REPORT_NAME D_VARCHAR500,
    NO_VISIBLE  D_IBOOLEAN,
    LVL         D_INTEGER,
    IS_FILE     D_IBOOLEAN,
    PATH        D_PATH,
    FULL_PATH   D_PATH)
as
declare variable canView d_integer;
begin
-- body
end
^

create or alter procedure GET_FULLNAME_ALLREPORTS (
    SEPARATOR varchar(10))
returns (
    ID_REPORT integer,
    FULL_NAME varchar(5000))
as
declare variable id_parent integer;
declare variable name_level varchar(100);
begin
-- body
end
^
SET TERM ; ^

ALTER TABLE REPORTS ADD BLB_TMP D_BLOB_GZIP1K;
update REPORTS set BLB_TMP = REPORT_BODY;
commit;
ALTER TABLE REPORTS DROP REPORT_BODY;
ALTER TABLE REPORTS ADD REPORT_BODY D_BLOB_GZIP1K;
update REPORTS set REPORT_BODY = BLB_TMP;
commit;
ALTER TABLE REPORTS DROP BLB_TMP;

SET TERM ^ ;

create or alter procedure GET_ALL_REPORTS
returns (
    ID_REPORT   D_INTEGER,
    ID_PARENT   D_INTEGER,
    REPORT_NAME D_VARCHAR500,
    NO_VISIBLE  D_IBOOLEAN,
    LVL         D_INTEGER,
    IS_FILE     D_IBOOLEAN,
    PATH        D_PATH,
    FULL_PATH   D_PATH)
as
declare variable canView d_integer;
begin
  for with recursive tree
      as (select
              r.id_report, r.id_parent, r.report_name, r.no_visible, 1 lvl, iif(r.report_body is null, 0, 1) is_file, iif(r.report_body is null, r.report_name, '') path
            from reports r
            where r.id_parent = 0
          union all
          select
              r.id_report, r.id_parent, r.report_name, r.no_visible, p.lvl + 1 lvl, iif(r.report_body is null, 0, 1) is_file, p.path || iif(r.report_body is null, '/' || r.report_name, '')
            from reports r
                 inner join tree p on p.id_report = r.id_parent)
      select
          ID_REPORT, ID_PARENT, REPORT_NAME, NO_VISIBLE, LVL, IS_FILE, PATH
        from tree
        order by path, is_file
      into :ID_REPORT, :ID_PARENT, :REPORT_NAME, :NO_VISIBLE, :LVL, :IS_FILE, :PATH
  do begin
    NO_VISIBLE = coalesce(NO_VISIBLE,0);
    execute procedure get_fullname_report(:ID_REPORT, null) returning_values :FULL_PATH;
    if (current_user <> 'SYSDBA') then begin
      canView = 0;
      if (IS_FILE = 1) then
        select first 1
            1
          from REPORTS r
               inner join Sys$Group_Rights gr on (gr.Rights_Type = 1 and
                     gr.Right_Id = r.Id_Report)
               inner join Sys$Group g on (g.Id = gr.Group_Id and
                     coalesce(g.Lockedout, 0) = 0)
               inner join Sys$User_Groups ug on (ug.Group_Id = gr.Group_Id)
               inner join Sys$User u on (u.Id = ug.User_Id)
          where upper(u.Ibname) = upper(current_user)
                and r.Id_Report = :ID_REPORT
        into :canView;
      else
        canView = 1;

      if (canView = 1) then
        suspend;

    end
    else
      suspend;
  end
end
^

create or alter procedure GET_FULLNAME_ALLREPORTS (
    SEPARATOR varchar(10))
returns (
    ID_REPORT integer,
    FULL_NAME varchar(5000))
as
declare variable id_parent integer;
declare variable name_level varchar(100);
begin
  if (separator is null) then
    separator = '/'; -- значение сепаратора по умолчанию
-- текущей узел
  for
    select r.id_report, r.id_parent, r.report_name
    from REPORTS r
    where r.no_visible = 0 and not r.report_body is null
    into :id_report, :id_parent, :full_name
  do
  begin
-- очередной узел, только если  найден текущий
    execute procedure get_fullname_report(:id_parent, :separator) returning_values :name_level;
-- добавление имени очередного узла
    full_name = coalesce(:name_level||:separator, '')||:full_name;
-- вывод
    suspend;
  end

end
^

SET TERM ; ^

