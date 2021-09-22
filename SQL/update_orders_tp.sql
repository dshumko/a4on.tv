SET TERM ^ ;
CREATE OR ALTER TRIGGER ORDERS_TP_BIU0 FOR ORDERS_TP
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
as
begin
-- удалим
end
^
SET TERM ; ^

ALTER TABLE ORDERS_TP ALTER OTP_NUBER TO OTP_NUMBER;

SET TERM ^ ;
CREATE OR ALTER TRIGGER ORDERS_TP_BIU0 FOR ORDERS_TP
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
as
begin
  if (new.Otp_Id is null) then
    new.Otp_Id = gen_id(GEN_OPERATIONS_UID, 1);

  if (new.Otp_Number is null) then
    new.Otp_Number = new.Otp_Id;

  if ((not new.Quant is null) and (not new.Price is null)) then
    new.Amount = new.Quant * new.Price;

  if ((not new.customer_id is null) and (new.Adress is null) and (new.Fio is null)) then begin
    select
        trim(s.Street_Short || ' ' || s.Street_Name || ', ' || h.House_No || ', ' || c.Flat_No)
      , trim(c.Surname || ' ' || c.Firstname || ' ' || c.Midlename)
      from customer c
           inner join house h on (h.House_Id = c.House_Id)
           inner join street s on (s.Street_Id = h.Street_Id)
      where c.Customer_Id = new.Customer_Id
    into new.Adress, new.Fio;
  end

  if (inserting) then begin
    new.ADDED_BY = current_user;
    new.ADDED_ON = localtimestamp;
  end
  else begin
    new.EDIT_BY = current_user;
    new.EDIT_ON = localtimestamp;
  end
end
^
SET TERM ; ^