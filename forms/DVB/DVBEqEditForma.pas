unit DVBEqEditForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  OkCancel_frame, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBLookupEh, DBGridEh;

type
  TDVBEqEditForm = class(TForm)
    lbl1: TLabel;
    lbl4: TLabel;
    okcnclfrm: TOkCancelFrame;
    edtNumber: TDBEditEh;
    cbState: TDBComboBoxEh;
    mmoNotice: TDBMemoEh;
    lbl2: TLabel;
    srcMAN: TDataSource;
    dsMan: TpFIBDataSet;
    cbMAN: TDBLookupComboboxEh;
    Label1: TLabel;
    lbl3: TLabel;
    lcbType: TDBLookupComboboxEh;
    dsType: TpFIBDataSet;
    srcType: TDataSource;
    lbl5: TLabel;
    cbEncode: TDBComboBoxEh;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okcnclfrmbbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditDigitEQ(const EQ_N: String; const EQ_TYPE: Integer = 0): boolean;

implementation

uses
  System.DateUtils,
  DM, pFIBQuery, FIBQuery, PrjConst;

{$R *.dfm}

function EditDigitEQ(const EQ_N: String; const EQ_TYPE: Integer = 0): boolean;
var
  i : Integer;
  s : string;
  id: Integer;
begin
  result := False;
  id := -1;
  with TDVBEqEditForm.Create(Application) do
  try
    dsMan.Open;
    dsType.Open;
    if dmMain.AllowedAction( rght_Dictionary_DigitEQP )
    then begin
      edtNumber.Text := EQ_N;
      with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text:='select * from EQUIPMENT_DVB where EQ_TYPE = :EQ_TYPE and EQ_N = :EQ_N ';
        ParamByName('EQ_N').AsString := EQ_N;
        ParamByName('EQ_TYPE').AsInteger := EQ_TYPE;
        Transaction.StartTransaction;
        ExecQuery;
        if not FieldByName('EQ_ID').IsNull
        then id := FieldByName('EQ_ID').AsInteger;
        if not FieldByName('EQ_STATE').IsNull
        then i := FieldByName('EQ_STATE').AsInteger
        else i := 1;
        cbState.Value := i;
        if not FieldByName('notice').IsNull
        then s := FieldByName('notice').AsString
        else s := '';
        mmoNotice.Lines.Text := s;
        if not FieldByName('EQ_MAN').IsNull
        then cbMAN.Value := FieldByName('EQ_MAN').AsInteger;
        if not FieldByName('EQ_TYPE').IsNull
        then lcbType.Value := FieldByName('EQ_TYPE').AsInteger;
        if not FieldByName('TEXT_ENCODE').IsNull
        then cbEncode.Value := FieldByName('TEXT_ENCODE').AsString;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
    if ID>-1 then begin
      if ShowModal = mrOk
      then begin
        try
          with TpFIBQuery.Create(dmMain) do
          try
            Database    := dmMain.dbTV;
            Transaction := dmMain.trWriteQ;
            SQL.Text    := 'execute procedure EQUIPMENT_UPD(:EQ_ID, :EQ_N, :EQ_TYPE, :EQ_STATE, :EQ_MAN, :NOTICE, :TEXT_ENCODE)';
            ParamByName('EQ_ID').AsInteger    := id;
            if VarIsNumeric(cbMAN.Value)
            then ParamByName('EQ_MAN').AsInteger   := cbMAN.Value;
            if VarIsNumeric(lcbType.Value)
            then ParamByName('EQ_TYPE').AsInteger   := lcbType.Value;
            ParamByName('EQ_N').AsString      := EQ_N;
            ParamByName('EQ_STATE').AsInteger := cbState.Value;
            ParamByName('NOTICE').AsString    := mmoNotice.Lines.Text;
            if cbEncode.Text <> ''
            then ParamByName('TEXT_ENCODE').AsString := cbEncode.Text
            else ParamByName('TEXT_ENCODE').Clear;

            Transaction.StartTransaction;
            ExecQuery;
            Transaction.Commit;
          finally
            free;
          end;
          result := true;
        except
          result := false;
        end;
      end;
    end;
    dsMan.Close;
  finally
    free;
  end;
end;

procedure TDVBEqEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then okcnclfrmbbOkClick(sender);
end;

procedure TDVBEqEditForm.FormShow(Sender: TObject);
begin
  okcnclfrm.bbOk.Visible  := (dmMain.AllowedAction(rght_Dictionary_DigitEQP)); // Изменение карт декодеров
end;

procedure TDVBEqEditForm.okcnclfrmbbOkClick(Sender: TObject);
begin
  if (dmMain.AllowedAction(rght_Dictionary_DigitEQP)) // Изменение карт декодеров
  then ModalResult := mrOk;
end;

end.
