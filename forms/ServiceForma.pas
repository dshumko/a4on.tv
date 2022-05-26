unit ServiceForma;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, Mask, StdCtrls, DBCtrls, OkCancel_frame, ExtCtrls,
  DB, FIBDataSet, pFIBDataSet, DBLookupEh, Buttons, PrjConst,
  FIBDatabase, pFIBDatabase, DBGridEh, CnErrorProvider, Vcl.ComCtrls;

type
  TServiceForm = class(TForm)
    pnlSrv: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlNotice: TPanel;
    Label6: TLabel;
    cbShowService: TDBCheckBoxEh;
    edName: TDBEditEh;
    edShortName: TDBEditEh;
    edDim: TDBEditEh;
    dsPaymentType: TpFIBDataSet;
    srcPaymentType: TDataSource;
    dsService: TpFIBDataSet;
    srcService: TDataSource;
    gbInet: TGroupBox;
    cbItsInet: TDBCheckBoxEh;
    pnlPayType: TGroupBox;
    Label3: TLabel;
    eIPBegin: TDBEditEh;
    Label5: TLabel;
    eIPEnd: TDBEditEh;
    Label8: TLabel;
    pnlPeriodSrv: TPanel;
    lbl1: TLabel;
    gbDIGIT: TGroupBox;
    pnlFull: TPanel;
    lbl4: TLabel;
    cbCalcType: TDBComboBoxEh;
    lblFullMonthDays1: TLabel;
    edtFullMonthDays: TDBNumberEditEh;
    lblFullMonthDays2: TLabel;
    cbBusinessType: TDBLookupComboboxEh;
    btn1: TSpeedButton;
    pnlAllDays: TPanel;
    chkAUTOOFF: TDBCheckBoxEh;
    pnlAddToMin: TPanel;
    edtEXTID: TDBEditEh;
    lbl2: TLabel;
    edtDigExtID: TDBEditEh;
    pnlShift: TPanel;
    lblshift: TLabel;
    edtShift: TDBNumberEditEh;
    lbl3: TLabel;
    pnlAUTO: TPanel;
    lbl5: TLabel;
    edtPRIORITY: TDBNumberEditEh;
    chkPOSITIVE: TDBCheckBoxEh;
    trSWrite: TpFIBTransaction;
    trSRead: TpFIBTransaction;
    cnError: TCnErrorProvider;
    chkOnlyOne: TDBCheckBoxEh;
    pnlBottom: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    pgc1: TPageControl;
    tsNotice: TTabSheet;
    tsWeb: TTabSheet;
    mmoDESCRIPTION: TDBMemoEh;
    pnlNote: TPanel;
    Label4: TLabel;
    Notice: TDBMemoEh;
    pnlTop: TPanel;
    lbl6: TLabel;
    edtTAGSTR: TDBEditEh;
    edtTAGINT: TDBNumberEditEh;
    chkONLY_ONE: TDBCheckBoxEh;
    cbUnblMeth: TDBComboBoxEh;
    procedure cbItsInetClick(Sender: TObject);
    procedure eIPEndEnter(Sender: TObject);
    procedure eIPEndExit(Sender: TObject);
    procedure cbBusinessTypeChange(Sender: TObject);
    procedure cbCalcTypeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
    procedure dsServiceNewRecord(DataSet: TDataSet);
    procedure chkAUTOOFFClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtDigExtIDKeyPress(Sender: TObject; var Key: Char);
    procedure dsServiceAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FCanEdit: Boolean;
    fSrvType: Integer;
    procedure Save;
    procedure SetCalcTypeReadOnly;
  public
    //
  end;

function ViewService(const aServ_ID, aType_ID: int64): int64;

implementation

uses
  DM, AtrCommon, StrUtils, AtrStrUtils, pFIBQuery;

{$R *.dfm}

function ViewService(const aServ_ID, aType_ID: int64): int64;
var
  b: Integer;
begin
  with TServiceForm.Create(application) do
    try
      FCanEdit := (dmMain.AllowedAction(rght_Dictionary_full));
      FCanEdit := FCanEdit or (dmMain.AllowedAction(rght_Dictionary_Services));
      // может редактировать если разрешено редактировать все

      fSrvType := aType_ID;
      dsPaymentType.Active := false;
      pnlPayType.Visible := false;

      dsService.ParamByName('Service_Id').AsInt64 := aServ_ID;
      dsService.Open;

      if dsService.FieldByName('SHOW_SERVICE').IsNull then
        b := 1
      else
        b := dsService['SHOW_SERVICE'];
      cbShowService.Checked := (b = 1);
      pnlPeriodSrv.Visible := (aType_ID = 0);

      if aType_ID = 0 then
      begin
        cbItsInetClick(cbItsInet);
        if dsService.FieldByName('BUSINESS_TYPE').IsNull then
          b := -1
        else
        begin
          b := dsService['BUSINESS_TYPE'];
        end;
        gbInet.Visible := (aType_ID = 0) and (b = 1);
        gbDIGIT.Visible := (aType_ID = 0) and (b = 2);
      end
      else
      begin
        cbItsInet.Visible := false;
        gbInet.Visible := false;
      end;

      btnOk.Enabled := FCanEdit;

      if (ShowModal = mrOk) and (dsService.State in [dsEdit, dsInsert]) then
      begin

        if cbShowService.Checked then
          dsService['SHOW_SERVICE'] := 1
        else
          dsService['SHOW_SERVICE'] := 0;
        if aType_ID = 0 then
        begin
          if VarIsNull(dsService.FieldByName('CALC_TYPE').NewValue) then
            dsService['CALC_TYPE'] := 0
          else if dsService.FieldByName('CALC_TYPE').NewValue <> 1 then
            dsService['EXTRA'] := 0;
        end;
        dsService.Post;
        result := dsService['SERVICE_ID'];
      end
      else
      begin
        result := -1;
      end;
    finally
      free;
    end
end;

procedure TServiceForm.btn1Click(Sender: TObject);
var
  s: string;
begin

  if dsService.FieldByName('SERVICE_ID').IsNull then
    Exit;

  s := '';
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select IP from GET_FREE_INET_IP(' + dsService.FieldByName('SERVICE_ID').AsString + ')';
      Transaction.StartTransaction;
      ExecQuery;
      if not EOF then
        s := FieldByName('IP').Value;

      Close;
      Transaction.Commit;
    finally
      free;
    end;
  ShowMessage('IP: ' + s);
end;

procedure TServiceForm.cbBusinessTypeChange(Sender: TObject);
begin
  if VarIsNull(cbBusinessType.Value) then
    Exit;
  if not VarIsNumeric(cbBusinessType.Value) then
    Exit;
  gbInet.Visible := (cbBusinessType.Value = 1);
  gbDIGIT.Visible := (cbBusinessType.Value = 2);
end;

procedure TServiceForm.cbCalcTypeChange(Sender: TObject);
begin

  if VarIsNull(cbCalcType.Value) then
    Exit;

  pnlShift.Visible := (cbCalcType.Value = 0) and (dsService['SRV_TYPE_ID'] = 0);
  pnlFull.Visible := (cbCalcType.Value = 1) and (dsService['SRV_TYPE_ID'] = 0);

  pnlAllDays.Visible := (dsService['SRV_TYPE_ID'] = 0) and
    ((cbCalcType.Value = 0) or (cbCalcType.Value = 1) or (cbCalcType.Value = 2) or (cbCalcType.Value = 3) or
    (cbCalcType.Value = 5));

  pnlAddToMin.Visible := (cbCalcType.Value = 3) and (dsService['SRV_TYPE_ID'] = 0);
end;

procedure TServiceForm.cbItsInetClick(Sender: TObject);
begin
  if cbItsInet.Checked then
    gbInet.Height := 75
  else
    gbInet.Height := cbItsInet.Height + 3;

  edtEXTID.TabStop := cbItsInet.Checked;
  eIPBegin.TabStop := cbItsInet.Checked;
  eIPEnd.TabStop := cbItsInet.Checked;
end;

procedure TServiceForm.chkAUTOOFFClick(Sender: TObject);
begin
  pnlAUTO.Visible := chkAUTOOFF.Checked;
  cbUnblMeth.Visible := chkAUTOOFF.Checked;
end;

procedure TServiceForm.dsServiceAfterOpen(DataSet: TDataSet);
begin
  SetCalcTypeReadOnly();
end;

procedure TServiceForm.dsServiceNewRecord(DataSet: TDataSet);
begin
  dsService['SHIFT_MONTHS'] := 0;
  dsService['EXTRA'] := 0;
  dsService['SHOW_SERVICE'] := 1;
  dsService['SRV_TYPE_ID'] := fSrvType;
  dsService['Unbl_Meth'] := 0;
end;

procedure TServiceForm.edtDigExtIDKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(((Key >= '0') and (Key <= '9')) or (Key = ',') or (Key = #8))) then
    Key := #0;
end;

procedure TServiceForm.eIPEndEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TServiceForm.eIPEndExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;

  if (Sender as TDBEditEh).Text = '' then
    Exit;
  (Sender as TDBEditEh).Text := ReplaceStr((Sender as TDBEditEh).Text, ',', '.');
  if not CheckIP((Sender as TDBEditEh).Text) then
  begin
    ShowMessage(rsIPIncorrect);
    (Sender as TDBEditEh).SetFocus;
  end;
end;

procedure TServiceForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ((Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (btnOk.Enabled)) then
    Save;
end;

procedure TServiceForm.btnOkClick(Sender: TObject);
begin
  Save;
end;

procedure TServiceForm.Save;
var
  errors: Boolean;
begin
  errors := false;

  if ((pnlFull.Visible) // какой-то бред. не работает без сравнения с true
    and (edtFullMonthDays.Value = 0)) then
  begin
    cnError.SetError(edtFullMonthDays, rsDayNotZerro, iaMiddleLeft, bsNeverBlink);
    errors := true;
    ModalResult := mrNone;
  end
  else
    cnError.Dispose(edtFullMonthDays);

  if not errors then
  begin
    ModalResult := mrOk;
  end;
end;

procedure TServiceForm.SetCalcTypeReadOnly;
begin

  if dsService.FieldByName('SERVICE_ID').IsNull then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select count(*) cnt from subscr_serv s where s.Serv_Id = :SID';
      ParamByName('SID').AsInteger := dsService['SERVICE_ID'];
      Transaction.StartTransaction;
      ExecQuery;
      if RecordCount>0 then
        cbCalcType.ReadOnly := (FieldByName('cnt').Value > 0);
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

end.
