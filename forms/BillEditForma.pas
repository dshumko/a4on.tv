unit BillEditForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, Buttons, StdCtrls, DBCtrlsEh, Mask, DBCtrls;

type
  TBillEditForm = class(TForm)
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    srcBill: TDataSource;
    dsBill: TpFIBDataSet;
    lbl1: TLabel;
    edtInetIP: TDBEditEh;
    Label3: TLabel;
    edtLOGIN: TDBEditEh;
    edtSecret: TDBEditEh;
    Label5: TLabel;
    chkVPN: TDBCheckBoxEh;
    btnnEXTip: TSpeedButton;
    mmoNOTICE: TDBMemoEh;
    lbl2: TLabel;
    btn1: TSpeedButton;
    OkCancelFrame1: TOkCancelFrame;
    lbl3: TLabel;
    edtLOGIN1: TDBEditEh;
    procedure chkVPNClick(Sender: TObject);
    procedure edtInetIPEnter(Sender: TObject);
    procedure edtInetIPExit(Sender: TObject);
    procedure edtMASKExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnnEXTipClick(Sender: TObject);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure GenIP(const CUSTOMER_ID: Integer);
    procedure FindSecret(const CUSTOMER_ID: Integer);
  public
    { Public declarations }
  end;

function EditBillInfo(const aBILL_ID: Int64; const CUSTOMER_ID: Integer; const ACCOUNT: string; const NOTICE: string = ''; const SetVPN:Boolean = True): Int64;

implementation

uses
  DM, AtrStrUtils, AtrCommon, RxStrUtils, synacode, pFIBQuery;

{$R *.dfm}

function EditBillInfo(const aBILL_ID: Int64; const CUSTOMER_ID: Integer; const ACCOUNT: string; const NOTICE: string = ''; const SetVPN:Boolean = True): Int64;
var
  pwd: AnsiString;
begin
  result := -1;
  with TBillEditForm.Create(Application) do
    try
      trWrite.Active := true;
      trRead.Active := true;
      dsBill.ParamByName('BLNG_ID').Value := aBILL_ID;
      dsBill.Open;
      if aBILL_ID = -1
      then begin
        dsBill.Insert;
        chkVPN.Checked := SetVPN;
        edtLOGIN.Text := ACCOUNT;
        FindSecret(CUSTOMER_ID);
        GenIP(CUSTOMER_ID);
      end
      else begin
        if not dsBill.FieldByName('SECRET').IsNull
        then begin
          pwd := dsBill.FieldByName('SECRET').AsAnsiString;
          edtSecret.Text := string(DecodeBase64(pwd));
        end;

        dsBill.Edit;
      end;

      dsBill['Customer_id'] := CUSTOMER_ID;

      if NOTICE <> '' then begin
        mmoNOTICE.Lines.Text := NOTICE;
      end;

      if ShowModal = mrOk
      then begin
        pwd := AnsiString(edtSecret.Text);
        pwd := EncodeBase64(pwd);
        dsBill.FieldByName('SECRET').AsAnsiString := pwd;
        dsBill.Post;
        result := 1;
      end
      else dsBill.Cancel;
      dsBill.Close;
    finally free
    end;
end;

procedure TBillEditForm.btn1Click(Sender: TObject);
begin
  edtSecret.Text := GenPassword(8);
end;

procedure TBillEditForm.btnnEXTipClick(Sender: TObject);
begin
  GenIP(dsBill['CUSTOMER_ID']);
end;

procedure TBillEditForm.chkVPNClick(Sender: TObject);
begin
  edtLOGIN.Enabled := chkVPN.Checked;
  edtSecret.Enabled := chkVPN.Checked;
end;

procedure TBillEditForm.edtMASKExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0')
  then SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else dmMain.RestoreKL;

  if (Sender as TDBEditEh).Text = ''
  then Exit;
  (Sender as TDBEditEh).Text := ReplaceStr((Sender as TDBEditEh).Text, ',', '.');
  if not CheckIP((Sender as TDBEditEh).Text)
  then begin
    ShowMessage('Неверная маска');
    (Sender as TDBEditEh).SetFocus;
  end;
end;

procedure TBillEditForm.edtInetIPEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0')
  then SetKeyboardLayout('EN')
  else dmMain.SaveKLAndSelectEnglish;
end;

procedure TBillEditForm.edtInetIPExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0')
  then SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else dmMain.RestoreKL;
  if (Sender as TDBEditEh).Text = ''
  then Exit;
  (Sender as TDBEditEh).Text := ReplaceStr((Sender as TDBEditEh).Text, ',', '.');
  if not CheckIP((Sender as TDBEditEh).Text)
  then begin
    ShowMessage('Неверный IP');
    (Sender as TDBEditEh).SetFocus;
  end;
end;

procedure TBillEditForm.GenIP(const CUSTOMER_ID: Integer);
var
  QRY: string;
begin
  edtInetIP.Text := '';

  QRY := 'select Ip from Get_Free_Inet_Ip_Customer(:Customer_Id)';

  with TpFIBQuery.Create(Self) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := QRY;
      ParamByName('CUSTOMER_ID').AsInteger := CUSTOMER_ID;
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do begin
        if not FieldByName('IP').IsNull
        then begin
          if edtInetIP.Text = ''
          then edtInetIP.Text := FieldByName('IP').Value
          else begin
            edtInetIP.MRUList.Active := true;
            edtInetIP.MRUList.Add(FieldByName('IP').Value);
          end;
        end;
        Next;
      end;
      Transaction.Commit;
    finally free;
    end;
end;

procedure TBillEditForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);

end;

procedure TBillEditForm.FindSecret(const CUSTOMER_ID: Integer);
var
  QRY: string;
begin
  QRY := 'select Secret from customer where customer_id = :Customer_Id';

  with TpFIBQuery.Create(Self) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := QRY;
      ParamByName('CUSTOMER_ID').AsInteger := CUSTOMER_ID;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('SECRET').IsNull
      then edtSecret.Text := FieldByName('SECRET').AsString;
      Transaction.Commit;
    finally free;
    end;

  if edtSecret.Text = ''
  then edtSecret.Text := GenPassword(8);

end;

end.
