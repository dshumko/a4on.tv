set names Utf8;
set Sql Dialect 3;

set term ~;
create or alter procedure DELETE_CUSTOMER_DECODER (
    DEC_ID        UID,
    DECODER_STATE D_INTEGER)
AS
 /*$$IBE$$ declare variable DECODER_N type of  D_DECODER;
declare variable STB_N     type of D_VARCHAR50; $$IBE$$*/ 
begin /*$$IBE$$ 
  if (DECODER_STATE is null) then
    DECODER_STATE = 1;

  decoder_n = null;
  stb_n = null;

  select decoder_n, stb_n from CUSTOMER_DECODERS where DEC_ID = :DEC_ID into :decoder_n, :stb_n;
  delete from CUSTOMER_DECODERS where DEC_ID = :DEC_ID;

  if (not decoder_n is null) then
    update EQUIPMENT_DVB
    set EQ_state = :DECODER_STATE
    where EQ_n = :decoder_n;

  if (not stb_n is null) then
    update EQUIPMENT_DVB
    set EQ_state = :DECODER_STATE
    where EQ_n = :stb_n;
 $$IBE$$*/ EXIT;
end~

create or alter procedure EQUIPMENT_UPD (
    EQ_ID       type of UID,
    EQ_N        type of D_DECODER,
    EQ_TYPE     type of D_INTEGER,
    EQ_STATE    type of D_INTEGER,
    EQ_MAN      type of D_INTEGER,
    NOTICE      type of D_NOTICE,
    TEXT_ENCODE type of D_VARCHAR5)
AS
begin /*$$IBE$$ 
  update EQUIPMENT_DVB
  set EQ_STATE = :EQ_STATE,
      EQ_TYPE = :EQ_TYPE,
      EQ_MAN = :EQ_MAN,
      NOTICE = :NOTICE,
      TEXT_ENCODE = :TEXT_ENCODE
  where (EQ_ID = :EQ_ID);

  if (EQ_STATE <> 2) then begin
    delete from CUSTOMER_DECODERS
    where DECODER_N = :EQ_N;

    update CUSTOMER_DECODERS
    set stb_n = null
    where stb_n = :EQ_N;
  end
 $$IBE$$*/ EXIT;
end~
create or alter procedure EQUIPMENT_UPD (
    EQ_ID       type of UID,
    EQ_N        type of D_DECODER,
    EQ_TYPE     type of D_INTEGER,
    EQ_STATE    type of D_INTEGER,
    EQ_MAN      type of D_INTEGER,
    NOTICE      type of D_NOTICE,
    TEXT_ENCODE type of D_VARCHAR5)
AS
begin /*$$IBE$$ 
  update EQUIPMENT_DVB
  set EQ_STATE = :EQ_STATE,
      EQ_TYPE = :EQ_TYPE,
      EQ_MAN = :EQ_MAN,
      NOTICE = :NOTICE,
      TEXT_ENCODE = :TEXT_ENCODE
  where (EQ_ID = :EQ_ID);

  if (EQ_STATE <> 2) then begin
    delete from CUSTOMER_DECODERS
    where DECODER_N = :EQ_N;

    update CUSTOMER_DECODERS
    set stb_n = null
    where stb_n = :EQ_N;
  end
 $$IBE$$*/ EXIT;
end~
CREATE OR ALTER TRIGGER CUSTOMER_DECODERS_AD0 FOR CUSTOMER_DECODERS
INACTIVE AFTER DELETE POSITION 0
as
begin /*$$IBE$$ 
  if (old.decoder_n is not null) then
    update EQUIPMENT_DVB
    set EQ_state = 1
    where EQ_n = old.decoder_n;

  if (not old.stb_n is null) then
    update EQUIPMENT_DVB
    set EQ_state = 1
    where EQ_n = old.stb_n;

  delete from decoder_packets
  where decoder_n = old.decoder_n;

  execute procedure DIGITAL_EVENT(2, old.customer_id, old.decoder_n, null, null, null);
 $$IBE$$*/ POST_EVENT '$$IBE$$';
end~
CREATE OR ALTER TRIGGER CUSTOMER_DECODERS_AIU0 FOR CUSTOMER_DECODERS
INACTIVE AFTER INSERT OR UPDATE POSITION 0
as
begin /*$$IBE$$ 

  if (coalesce(new.DECODER_N, -1) <> coalesce(old.DECODER_N, -2)) then begin
    if (new.DECODER_N is not null) then
      update EQUIPMENT_DVB D
      set D.EQ_STATE = 2
      where D.EQ_N = new.DECODER_N;

    if (old.DECODER_N is not null) then
      update EQUIPMENT_DVB D
      set D.EQ_STATE = 1
      where D.EQ_N = old.DECODER_N;

  end

  if (coalesce(new.STB_N, -1) <> coalesce(old.STB_N, -2)) then begin
    if (new.Stb_N is not null) then
      update EQUIPMENT_DVB
      set EQ_STATE = 2
      where EQ_N = new.STB_N;

    if (old.Stb_N is not null) then
      update EQUIPMENT_DVB
      set EQ_STATE = 1
      where EQ_N = old.STB_N;
  end
 $$IBE$$*/ POST_EVENT '$$IBE$$';
end~
CREATE OR ALTER TRIGGER CUSTOMER_DECODERS_BIU2 FOR CUSTOMER_DECODERS
INACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin /*$$IBE$$ 

  if (new.Decoder_N <> old.Decoder_N) then begin
    if (not exists(select * from EQUIPMENT_DVB where EQ_N = new.DECODER_N)) then
    exception E_DECODER_ERROR;
    new.Pairing = 0;
  end

  if ((new.Stb_N <> old.Stb_N) and (not new.Stb_N is null)) then begin
    if (not exists(select * from EQUIPMENT_DVB where EQ_N = new.Stb_N)) then
    exception E_DECODER_ERROR;
    new.Pairing = 0;
  end

 $$IBE$$*/ POST_EVENT '$$IBE$$';
end~
CREATE OR ALTER TRIGGER EQUIPMENT_DGTL_AU0 FOR EQUIPMENT_DVB
INACTIVE AFTER UPDATE POSITION 0
as
begin /*$$IBE$$ 
  if (coalesce(new.EQ_STATE, -1) <> coalesce(old.EQ_STATE, -2)) then begin
    if (new.Eq_State = 2) then
      insert into equipment_HISTORY (EQ_N, CUSTOMER_ID, EQ_STATE, OLD_STATE, EDIT_BY, EDIT_ON)
      select
          new.EQ_N, CUSTOMER_ID, new.EQ_STATE, OLD.Eq_State, current_user, LOCALTIMESTAMP
        from CUSTOMER_DECODERS CD
        where (CD.DECODER_N = new.EQ_N)
                or (CD.Stb_N = new.Eq_N);
    else
      insert into equipment_HISTORY (EQ_N, CUSTOMER_ID, EQ_STATE, OLD_STATE, EDIT_BY, EDIT_ON)
      values (new.EQ_N, null, new.EQ_STATE, OLD.Eq_State, current_user, LOCALTIMESTAMP);
  end
 $$IBE$$*/ POST_EVENT '$$IBE$$';
end~
set term ;~

DROP INDEX CUSTOMER_DECODERS_IDX1;

ALTER TABLE CUSTOMER_DECODERS ADD NEW_N D_VARCHAR20;
UPDATE CUSTOMER_DECODERS SET NEW_N = STB_N;
COMMIT;

ALTER TABLE CUSTOMER_DECODERS DROP STB_N;
ALTER TABLE CUSTOMER_DECODERS ADD STB_N D_VARCHAR20;
UPDATE CUSTOMER_DECODERS SET STB_N = NEW_N;
COMMIT;

ALTER TABLE CUSTOMER_DECODERS DROP NEW_N;
CREATE INDEX CUSTOMER_DECODERS_IDX1 ON CUSTOMER_DECODERS (STB_N);

set term ~;
create or alter procedure DELETE_CUSTOMER_DECODER (
    DEC_ID        UID,
    DECODER_STATE D_INTEGER)
AS
declare variable DECODER_N type of  D_DECODER;
declare variable STB_N     type of D_VARCHAR50;
begin
  if (DECODER_STATE is null) then
    DECODER_STATE = 1;

  decoder_n = null;
  stb_n = null;

  select decoder_n, stb_n from CUSTOMER_DECODERS where DEC_ID = :DEC_ID into :decoder_n, :stb_n;
  delete from CUSTOMER_DECODERS where DEC_ID = :DEC_ID;

  if (not decoder_n is null) then
    update EQUIPMENT_DVB
    set EQ_state = :DECODER_STATE
    where EQ_n = :decoder_n;

  if (not stb_n is null) then
    update EQUIPMENT_DVB
    set EQ_state = :DECODER_STATE
    where EQ_n = :stb_n;
end~

create or alter procedure EQUIPMENT_UPD (
    EQ_ID       type of UID,
    EQ_N        type of D_DECODER,
    EQ_TYPE     type of D_INTEGER,
    EQ_STATE    type of D_INTEGER,
    EQ_MAN      type of D_INTEGER,
    NOTICE      type of D_NOTICE,
    TEXT_ENCODE type of D_VARCHAR5)
AS
begin
  update EQUIPMENT_DVB
  set EQ_STATE = :EQ_STATE,
      EQ_TYPE = :EQ_TYPE,
      EQ_MAN = :EQ_MAN,
      NOTICE = :NOTICE,
      TEXT_ENCODE = :TEXT_ENCODE
  where (EQ_ID = :EQ_ID);

  if (EQ_STATE <> 2) then begin
    delete from CUSTOMER_DECODERS
    where DECODER_N = :EQ_N;

    update CUSTOMER_DECODERS
    set stb_n = null
    where stb_n = :EQ_N;
  end
end~
create or alter procedure EQUIPMENT_UPD (
    EQ_ID       type of UID,
    EQ_N        type of D_DECODER,
    EQ_TYPE     type of D_INTEGER,
    EQ_STATE    type of D_INTEGER,
    EQ_MAN      type of D_INTEGER,
    NOTICE      type of D_NOTICE,
    TEXT_ENCODE type of D_VARCHAR5)
AS
begin
  update EQUIPMENT_DVB
  set EQ_STATE = :EQ_STATE,
      EQ_TYPE = :EQ_TYPE,
      EQ_MAN = :EQ_MAN,
      NOTICE = :NOTICE,
      TEXT_ENCODE = :TEXT_ENCODE
  where (EQ_ID = :EQ_ID);

  if (EQ_STATE <> 2) then begin
    delete from CUSTOMER_DECODERS
    where DECODER_N = :EQ_N;

    update CUSTOMER_DECODERS
    set stb_n = null
    where stb_n = :EQ_N;
  end
end~
CREATE OR ALTER TRIGGER CUSTOMER_DECODERS_AD0 FOR CUSTOMER_DECODERS
INACTIVE AFTER DELETE POSITION 0
as
begin
  if (old.decoder_n is not null) then
    update EQUIPMENT_DVB
    set EQ_state = 1
    where EQ_n = old.decoder_n;

  if (not old.stb_n is null) then
    update EQUIPMENT_DVB
    set EQ_state = 1
    where EQ_n = old.stb_n;

  delete from decoder_packets
  where decoder_n = old.decoder_n;

  execute procedure DIGITAL_EVENT(2, old.customer_id, old.decoder_n, null, null, null);
end~

CREATE OR ALTER TRIGGER CUSTOMER_DECODERS_AIU0 FOR CUSTOMER_DECODERS
INACTIVE AFTER INSERT OR UPDATE POSITION 0
as
begin

  if (coalesce(new.DECODER_N, -1) <> coalesce(old.DECODER_N, -2)) then begin
    if (new.DECODER_N is not null) then
      update EQUIPMENT_DVB D
      set D.EQ_STATE = 2
      where D.EQ_N = new.DECODER_N;

    if (old.DECODER_N is not null) then
      update EQUIPMENT_DVB D
      set D.EQ_STATE = 1
      where D.EQ_N = old.DECODER_N;

  end

  if (coalesce(new.STB_N, -1) <> coalesce(old.STB_N, -2)) then begin
    if (new.Stb_N is not null) then
      update EQUIPMENT_DVB
      set EQ_STATE = 2
      where EQ_N = new.STB_N;

    if (old.Stb_N is not null) then
      update EQUIPMENT_DVB
      set EQ_STATE = 1
      where EQ_N = old.STB_N;
  end
end~
CREATE OR ALTER TRIGGER CUSTOMER_DECODERS_BIU2 FOR CUSTOMER_DECODERS
INACTIVE BEFORE INSERT OR UPDATE POSITION 1
as
begin

  if (new.Decoder_N <> old.Decoder_N) then begin
    if (not exists(select * from EQUIPMENT_DVB where EQ_N = new.DECODER_N)) then
    exception E_DECODER_ERROR;
    new.Pairing = 0;
  end

  if ((new.Stb_N <> old.Stb_N) and (not new.Stb_N is null)) then begin
    if (not exists(select * from EQUIPMENT_DVB where EQ_N = new.Stb_N)) then
    exception E_DECODER_ERROR;
    new.Pairing = 0;
  end
end~
CREATE OR ALTER TRIGGER EQUIPMENT_DGTL_AU0 FOR EQUIPMENT_DVB
INACTIVE AFTER UPDATE POSITION 0
as
begin
  if (coalesce(new.EQ_STATE, -1) <> coalesce(old.EQ_STATE, -2)) then begin
    if (new.Eq_State = 2) then
      insert into equipment_HISTORY (EQ_N, CUSTOMER_ID, EQ_STATE, OLD_STATE, EDIT_BY, EDIT_ON)
      select
          new.EQ_N, CUSTOMER_ID, new.EQ_STATE, OLD.Eq_State, current_user, LOCALTIMESTAMP
        from CUSTOMER_DECODERS CD
        where (CD.DECODER_N = new.EQ_N)
                or (CD.Stb_N = new.Eq_N);
    else
      insert into equipment_HISTORY (EQ_N, CUSTOMER_ID, EQ_STATE, OLD_STATE, EDIT_BY, EDIT_ON)
      values (new.EQ_N, null, new.EQ_STATE, OLD.Eq_State, current_user, LOCALTIMESTAMP);
  end
end~
set term ;~


