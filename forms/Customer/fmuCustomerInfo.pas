unit fmuCustomerInfo;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, StdCtrls, ToolCtrlsEh, GridsEh,
  DBGridEh, DBCtrls, DBCtrlsEh, Mask, Buttons, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet, Menus, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, System.Actions, Vcl.ActnList, dnSplitter, CnErrorProvider;

type
  TapgCustomerInfo = class(TA4onPage)
    dsContacts: TpFIBDataSet;
    srcContacts: TDataSource;
    pnlInfo: TPanel;
    Label11: TLabel;
    lblPN: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    lblPREG: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtPASSPORT_NUMBER: TDBEditEh;
    dbeACCOUNT_NO: TDBEditEh;
    edtPASP_REG: TDBEditEh;
    DBDateTimeEditCONTRACT_DATE: TDBDateTimeEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit9: TDBEditEh;
    edFIO: TEdit;
    edtAddress: TEdit;
    memState: TDBMemoEh;
    pmRecalc: TPopupMenu;
    N2: TMenuItem;
    ds: TDataSource;
    pnlAddInfo: TPanel;
    Splitter1: TdnSplitter;
    pnlDP: TPanel;
    sbRecalc: TSpeedButton;
    gbSaldo: TGroupBox;
    DBTextDebt: TDBText;
    pnlPrepay: TPanel;
    dbtxtPrepay: TDBText;
    pnlContacts: TPanel;
    dbgrdhContacts: TDBGridEh;
    GroupBox2: TGroupBox;
    memCustNotice: TDBMemoEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    actlst1: TActionList;
    actMakeCall: TAction;
    pnlBtns: TPanel;
    lbl5: TLabel;
    btnCall: TSpeedButton;
    lbl1: TLabel;
    btnCAdd: TSpeedButton;
    btnCdel: TSpeedButton;
    lbl2: TLabel;
    btnSaveNotice: TButton;
    lblBD: TLabel;
    edBIRTHDAY: TDBDateTimeEditEh;
    edtBP: TDBEditEh;
    dnSplitter1: TdnSplitter;
    btnCEdit: TSpeedButton;
    actCAdd: TAction;
    actCEdit: TAction;
    actCDel: TAction;
    CnErrors: TCnErrorProvider;
    lblPR: TLabel;
    edtPASSPORT_REGISTRATION: TDBEditEh;
    procedure srcCustomerDataChange(Sender: TObject; Field: TField);
    procedure memCustNoticeExit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sbRecalcClick(Sender: TObject);
    procedure dsContactsNewRecord(DataSet: TDataSet);
    procedure dsContactsBeforePost(DataSet: TDataSet);
    procedure dbgrdhContactsExit(Sender: TObject);
    procedure srcContactsUpdateData(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbgrdhContactsDblClick(Sender: TObject);
    procedure actMakeCallExecute(Sender: TObject);
    procedure btnSaveNoticeClick(Sender: TObject);
    procedure memCustNoticeKeyPress(Sender: TObject; var Key: Char);
    procedure actCAddExecute(Sender: TObject);
    procedure actCEditExecute(Sender: TObject);
    procedure actCDelExecute(Sender: TObject);
    procedure dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSaveNotice: String;
    fVisibleColumns: Integer;
    FCheckPassport: Boolean;
    procedure RecalcCustomer(const CUSTOMER_ID: Int64);
    procedure dsCustomers_Refresh;
    procedure SaveContact;
    procedure SaveNotice;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses DM, pFIBQuery, Typinfo, MAIN, ContactForma;

{$R *.dfm}

const
  clc_PE = 64; // Подъезд'/'этаж Город

function PropertyExists(aObject: TObject; const aPropertyName: String): Boolean;
begin
  Result := (GetPropInfo(aObject.ClassInfo, aPropertyName) <> nil);
end;

class function TapgCustomerInfo.GetPageName: string;
begin
  Result := rsInformation;
end;

procedure TapgCustomerInfo.InitForm;
var
  vVisibleSum: Boolean;
  vAsBalance: Boolean;
  vVisiblePassport: Boolean;
  vDec: Integer;
  DispNum: string;
  i: Integer;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    memCustNotice.Font.Size := i;
    memCustNotice.Font.Name := dmMain.GetIniValue('FONT_NAME');
  end;

  dsContacts.DataSource := FDataSource;
  ds.DataSet := FDataSource.DataSet;
{$IFNDEF DEMOVERSION}
  if Assigned(FGrid) then
    sbRecalc.PopupMenu := pmRecalc;
{$ENDIF}
  {
    for i := 0 to pnlInfo.ControlCount - 1 do begin
    if PropertyExists(pnlInfo.Controls[i], 'DataSource')
    then SetObjectProp(pnlInfo.Controls[i],'DataSource',FDataSource);
    end;
  }
  // actCustomerEdit.Enabled   :=  (ds.RecordCount>0) and actCustomerAdd.Enabled;
  // actCustomerDelete.Enabled :=  (ds.RecordCount>0) and (dmMain.AllowedAction(rght_Customer_del) or dmMain.AllowedAction(rght_Customer_full));
  vVisibleSum := (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full));
  vVisiblePassport := (dmMain.AllowedAction(rght_Customer_add)) or (dmMain.AllowedAction(rght_Customer_edit)) or (dmMain.AllowedAction(rght_Customer_full));
  // просмотр сумм
  vAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1'); // пеня
  vDec := dmMain.GetSettingsValue('FEE_ROUND');
  if vDec > 0 then
    DispNum := '#,##0.00'
  else
    DispNum := '#,##0';

  gbSaldo.Visible := vVisibleSum;
  if vVisibleSum then
  begin
    if vAsBalance then
    begin
      gbSaldo.Caption := rsBALANCE;
      DBTextDebt.DataField := 'BALANCE';
      // DBTextDebt.DisplayFormat := DispNum;
    end
    else
    begin
      gbSaldo.Caption := rsSALDO;
      DBTextDebt.DataField := 'DEBT_SUM';
    end;
  end;

  if not(TryStrToInt(dmMain.GetIniValue('COLUMNS'), fVisibleColumns)) then
  begin
    fVisibleColumns := 0;
  end;

  edBIRTHDAY.Visible := vVisiblePassport;
  edtPASSPORT_REGISTRATION.Visible := vVisiblePassport;
  edtPASSPORT_NUMBER.Visible := vVisiblePassport;
  edtPASP_REG.Visible := vVisiblePassport;
  lblBD.Visible := vVisiblePassport;
  lblPR.Visible := vVisiblePassport;
  lblPN.Visible := vVisiblePassport;
  lblPREG.Visible := vVisiblePassport;

  if not vVisiblePassport then begin
    memState.Top := edtAddress.Top + edtAddress.Height + 4;
  end;

  sbRecalc.Visible := (dmMain.AllowedAction(rght_Customer_AddSrv)) or (dmMain.AllowedAction(rght_Customer_full));
  dbgrdhContacts.ReadOnly := not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full));
  memCustNotice.ReadOnly := not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full));
{$IFNDEF DEMOVERSION}
  sbRecalc.PopupMenu := pmRecalc;
{$ENDIF}
end;

procedure TapgCustomerInfo.memCustNoticeExit(Sender: TObject);
begin
  SaveNotice;
end;

procedure TapgCustomerInfo.memCustNoticeKeyPress(Sender: TObject; var Key: Char);
begin
  btnSaveNotice.Visible := (FSaveNotice <> memCustNotice.Lines.Text);
end;

procedure TapgCustomerInfo.SaveNotice;
begin
  if (not FDataSource.DataSet.Active) or (FDataSource.DataSet.RecordCount = 0) then
    exit;

  if FSaveNotice <> memCustNotice.Lines.Text then
  begin
    FSaveNotice := memCustNotice.Lines.Text;
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'UPDATE Customer SET Notice = :Notice WHERE (Customer_Id = :Customer_Id)';
        ParamByName('Notice').AsString := FSaveNotice;
        ParamByName('Customer_Id').AsInt64 := FDataSource.DataSet['Customer_id'];
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        FDataSource.DataSet.Refresh;
      finally
        Free;
      end;
  end;
  btnSaveNotice.Visible := (FSaveNotice <> memCustNotice.Lines.Text);
end;

procedure TapgCustomerInfo.N2Click(Sender: TObject);
{$IFNDEF DEMOVERSION}
var
  Save_Cursor: TCursor;
  i: Integer;
{$ENDIF}
begin
{$IFNDEF DEMOVERSION}
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Show hourglass cursor }
  try
    if FGrid.SelectedRows.Count = 0 then
    begin
      FGrid.DataSource.DataSet.First;
      while not FGrid.DataSource.DataSet.Eof do
      begin
        RecalcCustomer(FGrid.DataSource.DataSet['customer_id']);
        Application.ProcessMessages;
        FGrid.DataSource.DataSet.Next;
      end;
    end
    else
    begin
      for i := 0 to FGrid.SelectedRows.Count - 1 do
      begin
        FGrid.DataSource.DataSet.Bookmark := FGrid.SelectedRows[i];
        RecalcCustomer(FGrid.DataSource.DataSet['customer_id']);
        Application.ProcessMessages;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor; { Always restore to normal }
  end
{$ENDIF}
end;

procedure TapgCustomerInfo.RecalcCustomer(const CUSTOMER_ID: Int64);
begin
  with TpFIBQuery.Create(Self) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      Transaction.StartTransaction;
      SQL.Text := 'EXECUTE PROCEDURE FULL_RECALC_CUSTOMER(:CUST)';
      ParamByName('CUST').AsInt64 := CUSTOMER_ID;
      ExecQuery;
      Transaction.Commit;
      dsCustomers_Refresh;
    finally
      Free;
    end
end;

procedure TapgCustomerInfo.dsContactsNewRecord(DataSet: TDataSet);
begin
  dsContacts['CUSTOMER_ID'] := FDataSource.DataSet['CUSTOMER_ID'];
  dsContacts['Cc_type'] := 0;
  dsContacts['Cc_Notify'] := 1;
end;

procedure TapgCustomerInfo.dsCustomers_Refresh;
begin
  FDataSource.DataSet.Refresh;
  FSaveNotice := memCustNotice.Lines.Text;
end;

procedure TapgCustomerInfo.OpenData;
begin
  dsContacts.Open;
  FSaveNotice := memCustNotice.Lines.Text;
end;

procedure TapgCustomerInfo.sbRecalcClick(Sender: TObject);
var
  b: TDateTime;
  Save_Cursor: TCursor;
begin
  Save_Cursor := Screen.Cursor;
  b := Now();
  Screen.Cursor := crSQLWait;
  try
    RecalcCustomer(FDataSource.DataSet['CUSTOMER_ID']);
  finally
    Screen.Cursor := Save_Cursor;
  end;
  b := b - Now();
  ShowMessage(Format(rsCalculateComplite, [TimeToStr(b)]));
end;

procedure TapgCustomerInfo.srcCustomerDataChange(Sender: TObject; Field: TField);
var
  ds: TDataSet;
  s: string;
begin
  ds := FDataSource.DataSet;

  s := ds.FieldByName('SURNAME').AsString;
  if not ds.FieldByName('FIRSTNAME').IsNull then
    s := s + ' ' + ds.FieldByName('FIRSTNAME').AsString;
  if not ds.FieldByName('MIDLENAME').IsNull then
    s := s + ' ' + ds.FieldByName('MIDLENAME').AsString;
  edFIO.Text := s;
  s := ds.FieldByName('STREET_SHORT').AsString + ' ' + ds.FieldByName('STREET_NAME').AsString + rsHouse +
    ds.FieldByName('HOUSE_NO').AsString;

  if not ds.FieldByName('Flat_no').IsNull then
    s := s + rsFlatShort + ds.FieldByName('Flat_no').AsString;
  if (fVisibleColumns and clc_PE) <> 0 then
  begin
    if (ds.FieldDefs.IndexOf('Area_Name') >= 0) and (not ds.FieldByName('Area_Name').IsNull) then
      s := ds.FieldByName('Area_Name').AsString + ' ' + s;
  end;
  edtAddress.Text := s;

  if ds.FieldByName('Notice').IsNull then
    memCustNotice.Lines.Text := ''
  else
    memCustNotice.Lines.Text := ds.FieldByName('Notice').AsString;
  FSaveNotice := memCustNotice.Lines.Text;

  pnlPrepay.Visible := False;
  if not ds.FieldByName('PREPAY').IsNull then
    pnlPrepay.Visible := (ds.FieldByName('PREPAY').AsCurrency > 0);

  if not ds.FieldByName('HIS_COLOR').IsNull then
    try
      Self.Color := StringToColor(ds.FieldByName('HIS_COLOR').Value);
    except
      Self.Color := clBtnFace
    end
  else
    Self.Color := clBtnFace;

  if FCheckPassport then
  begin
    if (not ds.FieldByName('JURIDICAL').IsNull) and (ds['JURIDICAL'] = 0) then
    begin
      if (ds.FieldByName('PASSPORT_VALID').IsNull) then
        CnErrors.Dispose(edtPASSPORT_NUMBER)
      else if ds['PASSPORT_VALID'] = 0 then
        CnErrors.SetError(edtPASSPORT_NUMBER, rsPassportNotValid, iaMiddleLeft, bsNeverBlink)
      else if ds['PASSPORT_VALID'] = -1 then
        CnErrors.SetError(edtPASSPORT_NUMBER, rsError + '. ' + rsNeedPassportCheck, iaMiddleLeft, bsNeverBlink)
      else
        CnErrors.Dispose(edtPASSPORT_NUMBER);
    end
    else
      CnErrors.Dispose(edtPASSPORT_NUMBER);
  end;
end;

procedure TapgCustomerInfo.actCAddExecute(Sender: TObject);
var
  Contact: TContact;
begin
  if not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full)) then
    exit;

  if not dsContacts.Active then
    dsContacts.Open;

  Contact.cID := -1;
  if EditContact(Contact) then
  begin
    dsContacts.Insert;
    dsContacts['CUSTOMER_ID'] := FDataSource.DataSet['CUSTOMER_ID'];
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.Notice;
    dsContacts['Cc_Notify'] := Contact.Notify;
    dsContacts['O_Name'] := Contact.cType;
    dsContacts.Post;
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerInfo.actCDelExecute(Sender: TObject);
var
  s: String;
begin
  if not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full)) then
    exit;
  if (not dsContacts.Active) or (dsContacts.RecordCount = 0) then
    exit;

  if not dsContacts.FieldByName('CC_VALUE').IsNull then
    s := Format(rsDeleteWithName, [dsContacts.FieldByName('CC_VALUE').AsString])
  else
    s := rsContactDelete;

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    dsContacts.Delete;
end;

procedure TapgCustomerInfo.actCEditExecute(Sender: TObject);
var
  Contact: TContact;
begin
  if not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full)) then
    exit;
  if (not dsContacts.Active) then
    dsContacts.Open;
  if dsContacts.RecordCount > 0 then
  begin
    Contact.cID := dsContacts['CC_TYPE'];
    if not dsContacts.FieldByName('CC_VALUE').IsNull then
      Contact.Contact := dsContacts['CC_VALUE']
    else
      Contact.Contact := '';
    if not dsContacts.FieldByName('CC_NOTICE').IsNull then
      Contact.Notice := dsContacts['CC_NOTICE']
    else
      Contact.Notice := '';
    if not dsContacts.FieldByName('Cc_Notify').IsNull then
      Contact.Notify := dsContacts['Cc_Notify']
    else
      Contact.Notify := 0;
    if not dsContacts.FieldByName('O_Name').IsNull then
      Contact.cType := dsContacts['O_Name']
    else
      Contact.cType := '';
  end
  else
    Contact.cID := -1;

  if EditContact(Contact) then
  begin
    if dsContacts.RecordCount > 0 then
      dsContacts.Edit
    else
      dsContacts.Insert;
    dsContacts['CUSTOMER_ID'] := FDataSource.DataSet['CUSTOMER_ID'];
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.Notice;
    dsContacts['Cc_Notify'] := Contact.Notify;
    dsContacts['O_Name'] := Contact.cType;

    dsContacts.Post;
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerInfo.actMakeCallExecute(Sender: TObject);
begin
  if (dsContacts.RecordCount = 0) or (dsContacts.FieldByName('CC_TYPE').IsNull) or
    (dsContacts.FieldByName('CC_VALUE').IsNull) then
    exit;

  A4MainForm.MakeCall(dsContacts['CC_TYPE'], dsContacts['CC_VALUE']);
end;

procedure TapgCustomerInfo.btnSaveNoticeClick(Sender: TObject);
begin
  SaveNotice;
end;

procedure TapgCustomerInfo.CloseData;
begin
  dsContacts.Close;
end;

procedure TapgCustomerInfo.dsContactsBeforePost(DataSet: TDataSet);
begin
  if dsContacts.State in [dsInsert, dsEdit] then
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (Trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      Abort;
end;

procedure TapgCustomerInfo.dbgrdhContactsDblClick(Sender: TObject);
begin
  actMakeCallExecute(Sender);
end;

procedure TapgCustomerInfo.dbgrdhContactsExit(Sender: TObject);
begin
  SaveContact;
end;

procedure TapgCustomerInfo.dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ActiveControl = dbgrdhContacts then
  begin
    case Key of
      VK_INSERT:
        actCAdd.Execute;
      VK_DELETE:
        actCDel.Execute;
      VK_F2:
        actCEdit.Execute;
      VK_RETURN:
        actMakeCall.Execute;
    end;
  end;
end;

procedure TapgCustomerInfo.SaveContact;
begin
  if dsContacts.State in [dsInsert, dsEdit] then
    dsContacts.Post;
end;

procedure TapgCustomerInfo.srcContactsUpdateData(Sender: TObject);
begin
  if dsContacts.State in [dsInsert, dsEdit] then
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (Trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      dsContacts.Cancel;
end;

procedure TapgCustomerInfo.FormResize(Sender: TObject);
begin
  memState.Height := Self.Height - memState.Top - 5;
end;

procedure TapgCustomerInfo.FormShow(Sender: TObject);
begin
  FCheckPassport := True; // (dmMain.GetSettingsValue('KEY_MVD') <> '');
end;

end.
