unit DigitCardForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  DBCtrlsEh, CnErrorProvider, PrjConst;

type
  TDigitCardForm = class(TForm)
    lbl1: TLabel;
    edtNumber: TDBEditEh;
    lbl4: TLabel;
    lbl2: TLabel;
    mmoNotice: TDBMemoEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtSTB: TDBEditEh;
    CnErrors: TCnErrorProvider;
    lbl3: TLabel;
    edtTV: TDBEditEh;
    edtTVSoft: TDBEditEh;
    lbl5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNumberExit(Sender: TObject);
    procedure edtNumberEnter(Sender: TObject);
    procedure edtSTBEnter(Sender: TObject);
    procedure edtSTBExit(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    fDecoder: string;
    fSTB: string;
    fDECID: Integer;
    fCustomer_id: Integer;
    procedure SetDecoder(const Value: string);
    procedure SetStb(const Value: string);
    procedure SetID(const Value: Integer);
    function CheckDecoder: Boolean;
    function CheckSTB: Boolean;
  public
    { Public declarations }
    property DECODER: string write SetDecoder;
    property STB: string write SetStb;
    property DEC_ID: Integer write SetID;
    property CUSTOMER_ID: Integer read fCustomer_id write fCustomer_id;
  end;

function EditDecoder(const CUST_DEC_ID: Integer): Boolean;
function AddDecoder(const pCUSTOMER_ID: Integer): String;

implementation

uses
  DM, pFIBQuery, FIBQuery;

{$R *.dfm}

function AddDecoder(const pCUSTOMER_ID: Integer): String;
begin
  Result := '';
  with TDigitCardForm.Create(application) do
    try
      DEC_ID := -1;
      CUSTOMER_ID := pCUSTOMER_ID;
      if ShowModal = mrOk then
      begin
        with TpFIBQuery.Create(dmMain) do
          try
            Database := dmMain.dbTV;
            Transaction := dmMain.trWriteQ;
            SQL.Text := 'insert into CUSTOMER_DECODERS (CUSTOMER_ID, DECODER_N, STB_N, NOTICE, TV_MODEL, TV_SOFT) ' +
              ' values (:CUSTOMER_ID, :DECODER_N, :STB_N, :NOTICE, :TV_MODEL, :TV_SOFT)';
            ParamByName('CUSTOMER_ID').AsInteger := pCUSTOMER_ID;
            ParamByName('DECODER_N').AsString := edtNumber.Text;
            ParamByName('NOTICE').AsString := mmoNotice.Lines.Text;

            if edtSTB.Text <> '' then
              ParamByName('STB_N').AsString := edtSTB.Text;
            if edtTV.Text <> '' then
              ParamByName('TV_MODEL').AsString := edtTV.Text;
            if edtTVSoft.Text <> '' then
              ParamByName('TV_SOFT').AsString := edtTVSoft.Text;

            Transaction.StartTransaction;
            ExecQuery;
            Transaction.Commit;
            Result := edtNumber.Text;
          finally
            free;
          end;

      end;
    finally
      free;
    end;
end;

function EditDecoder(const CUST_DEC_ID: Integer): Boolean;
begin
  Result := False;
  with TDigitCardForm.Create(application) do
    try
      edtNumber.ReadOnly := True;
      if not(dmMain.AllowedAction(rght_Customer_DigitAdd) or dmMain.AllowedAction(rght_Customer_full)) then
        edtNumber.ReadOnly := True;

      ActiveControl := edtSTB;
      with TpFIBQuery.Create(dmMain) do
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trReadQ;
          SQL.Text := 'select CUSTOMER_ID, DECODER_N, STB_N, NOTICE, TV_MODEL, TV_SOFT from ' +
            ' CUSTOMER_DECODERS where dec_id = :DEC_ID';
          ParamByName('DEC_ID').AsInteger := CUST_DEC_ID;
          Transaction.StartTransaction;
          ExecQuery;
          DEC_ID := CUST_DEC_ID;
          if not FieldByName('CUSTOMER_ID').IsNull then
            CUSTOMER_ID := FieldByName('CUSTOMER_ID').AsInteger;
          if not FieldByName('DECODER_N').IsNull then
            DECODER := FieldByName('DECODER_N').AsString;
          if not FieldByName('STB_N').IsNull then
            STB := FieldByName('STB_N').AsString;
          if not FieldByName('TV_MODEL').IsNull then
            edtTV.Text := FieldByName('TV_MODEL').AsString;
          if not FieldByName('TV_SOFT').IsNull then
            edtTVSoft.Text := FieldByName('TV_SOFT').AsString;
          if not FieldByName('NOTICE').IsNull then
            mmoNotice.Lines.Text := FieldByName('NOTICE').AsString;
          Transaction.Commit;
        finally
          free;
        end;
      if ShowModal = mrOk then
      begin
        with TpFIBQuery.Create(dmMain) do
          try
            Database := dmMain.dbTV;
            Transaction := dmMain.trWriteQ;
            SQL.Text := 'update CUSTOMER_DECODERS set DECODER_N = :DECODER_N, STB_N = :STB_N, NOTICE = :NOTICE ' +
              ' , TV_MODEL = :TV_MODEL, TV_SOFT = :TV_SOFT where (DEC_ID = :DEC_ID)';
            ParamByName('DEC_ID').AsInteger := CUST_DEC_ID;
            ParamByName('DECODER_N').AsString := edtNumber.Text;
            if edtSTB.Text <> '' then
              ParamByName('STB_N').AsString := edtSTB.Text;
            if edtTV.Text <> '' then
              ParamByName('TV_MODEL').AsString := edtTV.Text
            else
              ParamByName('TV_MODEL').Clear;
            if edtTVSoft.Text <> '' then
              ParamByName('TV_SOFT').AsString := edtTVSoft.Text
            else
              ParamByName('TV_SOFT').Clear;

            ParamByName('NOTICE').AsString := mmoNotice.Lines.Text;
            Transaction.StartTransaction;
            ExecQuery;
            Transaction.Commit;
            Result := True;
          finally
            free;
          end;
      end;
    finally
      free;
    end;
end;

procedure TDigitCardForm.FormCreate(Sender: TObject);
begin
  fDecoder := '';
  fDECID := -1;
  fSTB := '';
end;

procedure TDigitCardForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TDigitCardForm.SetDecoder(const Value: string);
begin
  fDecoder := Value;
  edtNumber.Text := Value;
end;

procedure TDigitCardForm.SetID(const Value: Integer);
begin
  fDECID := Value;
end;

procedure TDigitCardForm.SetStb(const Value: string);
begin
  fSTB := Value;
  edtSTB.Text := Value;
end;

procedure TDigitCardForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TDigitCardForm.btnOkClick(Sender: TObject);
begin
  if CheckDecoder and CheckSTB then
    ModalResult := mrOk;
end;

procedure TDigitCardForm.edtNumberEnter(Sender: TObject);
begin
  CnErrors.Dispose(Sender as TControl);
end;

procedure TDigitCardForm.edtNumberExit(Sender: TObject);
begin
  CheckDecoder;
end;

function TDigitCardForm.CheckDecoder: Boolean;
var
  i: Integer;
begin
  Result := True;
  btnOk.Enabled := True;

  if edtNumber.Text = '' then
  begin
    edtNumber.SelectAll;
    btnOk.Enabled := False;
    Result := False;
    CnErrors.SetError(edtNumber, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    Exit;
  end
  else
    CnErrors.Dispose(edtNumber);

  with TpFIBQuery.Create(dmMain) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Clear;
      SQL.Add('select ( select count(*) from EQUIPMENT_DVB e where e.EQ_N = :CARD_N                      ');
      SQL.Add('and ((e.Eq_State = 1)                                                                     ');
      SQL.Add('  or (e.Eq_State = 2 and exists(select cd.Dec_Id from Customer_Decoders cd                ');
      SQL.Add('                         where cd.Decoder_N = e.Eq_N and cd.Customer_Id = :customer_id))) ');
      SQL.Add(') as CN_EXISTS,');
      SQL.Add('  (select list(c.Account_No) from Customer_Decoders cd inner join customer c on (c.Customer_Id = cd.Customer_Id)');
      SQL.Add('       where cd.Dec_Id <> :dec_id and cd.Decoder_N = :CARD_N) as ACCNTS');
      SQL.Add('from RDB$DATABASE');
      ParamByName('CARD_N').AsString := edtNumber.Text;
      ParamByName('DEC_ID').AsInteger := fDECID;
      ParamByName('customer_id').AsInteger := CUSTOMER_ID;

      Transaction.StartTransaction;
      ExecQuery;
      i := FieldByName('CN_EXISTS').AsInteger;
      if i = 0 then
      begin
        edtNumber.SelectAll;
        btnOk.Enabled := False;
        Result := False;
        CnErrors.SetError(edtNumber, rsNOT_FOUND_DECODER, iaMiddleLeft, bsNeverBlink);
      end
      else if not FieldByName('ACCNTS').IsNull then
      begin
        edtNumber.SelectAll;
        btnOk.Enabled := False;
        Result := False;
        CnErrors.SetError(edtNumber, rsDECODER_USED + FieldByName('ACCNTS').AsString, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtNumber);

      Transaction.Commit;
    finally
      free;
    end;
end;

function TDigitCardForm.CheckSTB: Boolean;
var
  i: Integer;
begin
  Result := True;
  if edtSTB.Text = '' then
    Exit;

  with TpFIBQuery.Create(dmMain) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Clear;
      SQL.Add('select ( select count(*) from EQUIPMENT_DVB where EQ_TYPE <> 0 and EQ_N = :STB_N) as CN_EXISTS,');
      SQL.Add('  (select list(c.Account_No) from Customer_Decoders cd inner join customer c on (c.Customer_Id = cd.Customer_Id)');
      SQL.Add('       where cd.Dec_Id <> :dec_id and cd.STB_N = :STB_N) as ACCNTS');
      SQL.Add('from RDB$DATABASE');
      ParamByName('STB_N').AsString := edtSTB.Text;
      ParamByName('DEC_ID').AsInteger := fDECID;

      Transaction.StartTransaction;
      ExecQuery;
      i := FieldByName('CN_EXISTS').AsInteger;
      if i = 0 then
      begin
        edtSTB.SelectAll;
        Result := False;
        CnErrors.SetError(edtSTB, rsSTB_NOT_FOUND, iaMiddleLeft, bsNeverBlink);
      end
      else if not FieldByName('ACCNTS').IsNull then
      begin
        edtSTB.SelectAll;
        Result := False;
        CnErrors.SetError(edtSTB, rsSTB_USED + FieldByName('ACCNTS').AsString, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtSTB);
      Transaction.Commit;
    finally
      free;
    end;
  btnOk.Enabled := btnOk.Enabled and Result;
end;

procedure TDigitCardForm.edtSTBEnter(Sender: TObject);
begin
  CnErrors.Dispose(Sender as TControl);
end;

procedure TDigitCardForm.edtSTBExit(Sender: TObject);
begin
  CheckSTB;
end;

end.
