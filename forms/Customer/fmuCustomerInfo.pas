unit fmuCustomerInfo;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ActnList, Vcl.StdActns,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh,
  PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, dnSplitter, PropFilerEh, PropStorageEh, HtmlView,
  HTMLUn2,
  FramView, FramBrwz;

type
  TapgCustomerInfo = class(TA4onPage)
    dsContacts: TpFIBDataSet;
    srcContacts: TDataSource;
    pmRecalc: TPopupMenu;
    N2: TMenuItem;
    pnlAddInfo: TPanel;
    spltMemo: TdnSplitter;
    pnlDP: TPanel;
    sbRecalc: TSpeedButton;
    gbSaldo: TGroupBox;
    dbtxtDEBT: TDBText;
    pnlPrepay: TPanel;
    dbtxtPrepay: TDBText;
    pnlContacts: TPanel;
    dbgrdhContacts: TDBGridEh;
    gbMemo: TGroupBox;
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
    dnSplitterHTML: TdnSplitter;
    btnCEdit: TSpeedButton;
    actCAdd: TAction;
    actCEdit: TAction;
    actCDel: TAction;
    pmHV: TPopupMenu;
    miCopy: TMenuItem;
    dsCustomer: TpFIBDataSet;
    PropStorageEh: TPropStorageEh;
    dnSplitterPhone: TdnSplitter;
    pnlHTML: TPanel;
    HtmlViewer: THtmlViewer;
    srcCustomer: TDataSource;
    pnlACC: TPanel;
    lblACCNT: TLabel;
    dbeACCOUNT_NO: TDBEditEh;
    btnAlign: TSpeedButton;
    pmMemo: TPopupMenu;
    miN1: TMenuItem;
    actRecalc: TAction;
    procedure memCustNoticeExit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dsContactsNewRecord(DataSet: TDataSet);
    procedure dsContactsBeforePost(DataSet: TDataSet);
    procedure dbgrdhContactsExit(Sender: TObject);
    procedure srcContactsUpdateData(Sender: TObject);
    procedure dbgrdhContactsDblClick(Sender: TObject);
    procedure actMakeCallExecute(Sender: TObject);
    procedure btnSaveNoticeClick(Sender: TObject);
    procedure memCustNoticeKeyPress(Sender: TObject; var Key: Char);
    procedure actCAddExecute(Sender: TObject);
    procedure actCEditExecute(Sender: TObject);
    procedure actCDelExecute(Sender: TObject);
    procedure dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miCopyClick(Sender: TObject);
    procedure srcCustomerDataChange(Sender: TObject; Field: TField);
    procedure HtmlViewerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlignClick(Sender: TObject);
    procedure miN1Click(Sender: TObject);
    procedure PropStorageEhWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
    procedure PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
      var Processed: Boolean);
    procedure actRecalcExecute(Sender: TObject);
    procedure sbRecalcClick(Sender: TObject);
    procedure sbRecalcMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    fVisibleColumns: Integer;
    FCheckPassport: Boolean;
    FHtmlParams: TStringList;
    FVisibleSum: Boolean;
    FAsBalance: Boolean;
    FVisiblePassport: Boolean;
    FPersonalData: Boolean;
    FDec: Integer;
    FHtml: string;
    FWkeHtml: Boolean;
    FMemoNeedRealign: Boolean;
    FRunUnderWine: Boolean;
    FSkipRecalc: Boolean;
    FHL_ROW: Boolean;
    FHL_COLOR: TColor;
    // FWkeWebbrowser: TWkeWebbrowser;
    procedure RecalcCustomer(const CUSTOMER_ID: Int64);
    procedure SaveContact;
    procedure SaveNotice;
    procedure GetHtmlParams;
    procedure MakeHtmlWithParams;
    procedure infoPanelConfig;
    procedure HtmlViewConfig;
    procedure SetSaveBtnVisible;
    procedure UpdateInfoPanel;
    function GetParamValue(const param: String): String;
    procedure MemoAlign;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    procedure UpdateObject; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  System.RegularExpressions, System.TypInfo,
  A4onTypeUnit, AtrCommon, AtrStrUtils, DM, pFIBQuery, MAIN, ContactForma;

{$R *.dfm}

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
  DispNum: string;
  i: Integer;
begin
  FMemoNeedRealign := True;
  HtmlViewConfig;
  infoPanelConfig;
  GetHtmlParams;

  FHL_ROW := (dmMain.GetSettingsValue('ROW_HL_COLOR') <> '') and (dmMain.GetSettingsValue('ROW_HL_ID') <> '') and
    (dmMain.GetSettingsValue('ROW_HL_TYPE') <> '');
  if FHL_ROW then
  begin
    try
      FHL_COLOR := StringToColor(dmMain.GetSettingsValue('ROW_HL_COLOR'));
    except
      FHL_COLOR := clPurple;
    end;
  end;

  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    memCustNotice.Font.Size := i;
    memCustNotice.Font.Name := dmMain.GetIniValue('FONT_NAME');
    HtmlViewer.DefFontSize := i;
    HtmlViewer.DefFontName := dmMain.GetIniValue('FONT_NAME');
    lblACCNT.Font.Size := i;
    lblACCNT.Font.Name := dmMain.GetIniValue('FONT_NAME');
    dbeACCOUNT_NO.Font.Name := dmMain.GetIniValue('FONT_NAME');
  end;

  dsCustomer.DataSource := FDataSource;
  dsContacts.DataSource := FDataSource;
  dbeACCOUNT_NO.DataSource := FDataSource;
  if Assigned(FGrid) then
    sbRecalc.PopupMenu := pmRecalc;

  FVisibleSum := (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full));
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));
  // просмотр сумм
  FAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1'); // пеня
  FDec := dmMain.GetSettingsValue('FEE_ROUND');
  if FDec > 0 then
    DispNum := '#,##0.00'
  else
    DispNum := '#,##0';

  gbSaldo.Visible := FVisibleSum;
  if FVisibleSum then
  begin
    dbtxtDEBT.DataSource := FDataSource;
    dbtxtPrepay.DataSource := FDataSource;

    if FAsBalance then
    begin
      gbSaldo.Caption := '       ' + rsBALANCE;
      dbtxtDEBT.DataField := 'BALANCE';
    end
    else
    begin
      gbSaldo.Caption := '       ' + rsSALDO;
      dbtxtDEBT.DataField := 'DEBT_SUM';
    end;
  end;

  if not(TryStrToInt(dmMain.GetIniValue('COLUMNS'), fVisibleColumns)) then
  begin
    fVisibleColumns := 0;
  end;

  actRecalc.Visible := (dmMain.AllowedAction(rght_Customer_AddSrv)) or (dmMain.AllowedAction(rght_Customer_full));
  sbRecalc.Visible := actRecalc.Visible;
  dbgrdhContacts.ReadOnly := not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full));
  memCustNotice.ReadOnly := not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full));
  if actRecalc.Visible then
    sbRecalc.PopupMenu := pmRecalc;
end;

procedure TapgCustomerInfo.memCustNoticeExit(Sender: TObject);
begin
  SaveNotice;
end;

procedure TapgCustomerInfo.SetSaveBtnVisible;
var
  s: String;
begin
  if FDataSource.DataSet.FieldByName('Notice').IsNull then
    s := ''
  else
    s := FDataSource.DataSet.FieldByName('Notice').AsString;
  btnSaveNotice.Visible := (s <> memCustNotice.Lines.Text);
end;

procedure TapgCustomerInfo.memCustNoticeKeyPress(Sender: TObject; var Key: Char);
begin
  SetSaveBtnVisible;
end;

procedure TapgCustomerInfo.miCopyClick(Sender: TObject);
begin
  HtmlViewer.CopyToClipboard;
end;

procedure TapgCustomerInfo.miN1Click(Sender: TObject);
begin
  MemoAlign;
end;

procedure TapgCustomerInfo.SaveNotice;
var
  s: String;
begin
  if (not FDataSource.DataSet.Active) or (FDataSource.DataSet.RecordCount = 0) then
    exit;

  if FDataSource.DataSet.FieldByName('Notice').IsNull then
    s := ''
  else
    s := FDataSource.DataSet.FieldByName('Notice').AsString;

  if s <> memCustNotice.Lines.Text then
  begin
    s := memCustNotice.Lines.Text;
    with TpFIBQuery.Create(Nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'UPDATE Customer SET Notice = :Notice WHERE (Customer_Id = :Customer_Id)';
        ParamByName('Notice').AsString := s;
        ParamByName('Customer_Id').AsInt64 := FDataSource.DataSet['Customer_id'];
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        UpdatePage;
      finally
        Free;
      end;
    end;
  end;
  SetSaveBtnVisible;
end;

procedure TapgCustomerInfo.sbRecalcClick(Sender: TObject);
begin
  if actRecalc.Visible then
    actRecalc.Execute;
end;

procedure TapgCustomerInfo.sbRecalcMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // попытка обойти ошибку Wine + ESC
  FSkipRecalc := not FRunUnderWine;
end;

procedure TapgCustomerInfo.N2Click(Sender: TObject);
var
  Save_Cursor: TCursor;
  i: Integer;
begin
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
end;

procedure TapgCustomerInfo.RecalcCustomer(const CUSTOMER_ID: Int64);
begin
  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      Transaction.StartTransaction;
      SQL.Text := 'EXECUTE PROCEDURE FULL_RECALC_CUSTOMER(:CUST)';
      ParamByName('CUST').AsInt64 := CUSTOMER_ID;
      ExecQuery;
      Transaction.Commit;
      UpdatePage;
    finally
      Free;
    end;
  end;
end;

procedure TapgCustomerInfo.dsContactsNewRecord(DataSet: TDataSet);
begin
  dsContacts['CUSTOMER_ID'] := FDataSource.DataSet['CUSTOMER_ID'];
  dsContacts['Cc_type'] := 0;
  dsContacts['Cc_Notify'] := 1;
end;

procedure TapgCustomerInfo.OpenData;
begin
  if (not dsCustomer.Active) then
    dsCustomer.Open;

  if (not dsContacts.Active) then
    dsContacts.Open;
end;

procedure TapgCustomerInfo.PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
  var Processed: Boolean);
var
  h: Integer;
begin
  if PropName = 'MemoHeight' then
  begin
    h := Reader.ReadInteger();
    if h > 0 then
    begin
      FMemoNeedRealign := True;
      MemoAlign;
      pnlDP.Height := h;
    end;
    Processed := True;
  end;
end;

procedure TapgCustomerInfo.PropStorageEhWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
begin
  Writer.WritePropName('MemoHeight');
  if spltMemo.Align = alTop then
    Writer.WriteInteger(pnlDP.Height)
  else
    Writer.WriteInteger(0);
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
  Contact.CustID := FDataSource.DataSet['CUSTOMER_ID'];
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
  Contact.CustID := FDataSource.DataSet['CUSTOMER_ID'];
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

procedure TapgCustomerInfo.actRecalcExecute(Sender: TObject);
var
  b: TDateTime;
  Save_Cursor: TCursor;
begin
  // попытка обойти ошибку Wine + ESC
  if FRunUnderWine and FSkipRecalc then
    exit;

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

  FSkipRecalc := FRunUnderWine;
end;

procedure TapgCustomerInfo.btnAlignClick(Sender: TObject);
begin
  MemoAlign;
end;

procedure TapgCustomerInfo.btnSaveNoticeClick(Sender: TObject);
begin
  SaveNotice;
end;

procedure TapgCustomerInfo.CloseData;
begin
  if dsCustomer.Active then
    dsCustomer.Close;

  if dsContacts.Active then
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
  begin
    dsContacts.Post;
    UpdatePage;
  end;
end;

procedure TapgCustomerInfo.srcContactsUpdateData(Sender: TObject);
begin
  if dsContacts.State in [dsInsert, dsEdit] then
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (Trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      dsContacts.Cancel;
end;

procedure TapgCustomerInfo.srcCustomerDataChange(Sender: TObject; Field: TField);
begin
  UpdateInfoPanel;
end;

procedure TapgCustomerInfo.FormCreate(Sender: TObject);
begin
  FHtmlParams := TStringList.Create;
  FHtmlParams.Sorted := True;
  FHtmlParams.Duplicates := dupIgnore;
  FRunUnderWine := GetWineAvail;
  FSkipRecalc := FRunUnderWine;
end;

procedure TapgCustomerInfo.FormDestroy(Sender: TObject);
begin
  // if Assigned(FWkeWebbrowser) then
  // FWkeWebbrowser.Free;

  if Assigned(FHtmlParams) then
    FHtmlParams.Free;
end;

procedure TapgCustomerInfo.FormShow(Sender: TObject);
begin
  FCheckPassport := True; // (dmMain.GetSettingsValue('KEY_MVD') <> '');
end;

procedure TapgCustomerInfo.GetHtmlParams;
var
  M: TMatchCollection;
  i: Integer;
  s: string;
begin
  M := TRegEx.Matches(FHtml, '<!--(.*?)-->', [roMultiLine]); // получаем коллекцию совпадений
  for i := 0 to M.Count - 1 do
  begin
    s := M.Item[i].Groups[1].Value;
    FHtmlParams.Add(s); // выводим совпадение
  end;
end;

procedure TapgCustomerInfo.MakeHtmlWithParams;
var
  i: Integer;
  P, V, s: string;
  resMemo: string;
  PASS_STATE: Integer;
begin
  resMemo := FHtml;
  i := FHtmlParams.IndexOf('PASS_STATE');
  if i >= 0 then
  begin
    PASS_STATE := 0;
    V := '';
    if FCheckPassport and (not FDataSource.DataSet.FieldByName('JURIDICAL').IsNull) and
      (FDataSource.DataSet['JURIDICAL'] = 0) then
    begin
      if FDataSource.DataSet['PASSPORT_VALID'] = 0 then
      begin
        PASS_STATE := 1;
        V := '<hr>' + rsPassportNotValid + '<hr>';
      end
      else if FDataSource.DataSet['PASSPORT_VALID'] = -1 then
      begin
        PASS_STATE := 2;
        V := '<hr>' + rsError + '. ' + rsNeedPassportCheck + '<hr>';
      end

    end;
    resMemo := StringReplace(resMemo, '<!--PASS_STATE-->', PASS_STATE.ToString, [rfReplaceAll, rfIgnoreCase]);
    resMemo := StringReplace(resMemo, '<!--PASS_ERROR-->', V, [rfReplaceAll, rfIgnoreCase]);

  end;

  for i := 0 to FHtmlParams.Count - 1 do
  begin
    P := FHtmlParams[i];
    V := GetParamValue(P);

    if (not FPersonalData) and (not V.IsEmpty) then
    begin
      s := P.ToUpper;
      if ((s = 'PASSPORT_NUMBER') or (s = 'PASSPORT_REGISTRATION') or (s = 'BIRTHDAY')) then
        V := ''
      else if (s = 'SURNAME') then
      begin
        V := HideSurname(V);
      end;
    end;

    resMemo := StringReplace(resMemo, '<!--' + P + '-->', V, [rfReplaceAll, rfIgnoreCase]);
  end;

  // if FWkeHtml then
  // FWkeWebbrowser.LoadHtml(resMemo)
  // else
  HtmlViewer.LoadFromString(resMemo);
end;

procedure TapgCustomerInfo.infoPanelConfig;
var
  s, gi: string;
  a: TArray<string>;
  allSQL, groupSQL: string;
begin
  s := dmMain.GetSettingsValue('INFO_PANEL');
  s := s + dmMain.GetSettingsValue('INFO_PANEL_1');
  s := s + dmMain.GetSettingsValue('INFO_PANEL_2');
  FHtml := s;

  s := dmMain.UserGroups.Trim;
  if not s.IsEmpty then
  begin
    a := s.Split([',']);
    gi := a[0].Trim;
    s := dmMain.GetSettingsValue('INFO_PANEL_GR' + gi);
    s := s + dmMain.GetSettingsValue('INFO_PANEL_GR' + gi + '_1');
    s := s + dmMain.GetSettingsValue('INFO_PANEL_GR' + gi + '_2');
    if not s.IsEmpty then
      FHtml := s;
  end;

  if FHtml.IsEmpty then
    FHtml := '<html><head><style>body{font-family:Tahoma;line-height:170%}.pass1{color:blue;}.pass2{color:red;}</style>'
      + '</head><body>' + // для соохранения форматирования
      'Договор <strong><!--DOGOVOR_NO--></strong> от <strong><!--CONTRACT_DATE--></strong> Перв. подкл. <strong>' +
      '<!--ACTIVIZ_DATE--></strong><br>' + // для соохранения форматирования
      'ФИО <strong><!--SURNAME--> <!--FIRSTNAME--> <!--MIDLENAME--></strong><br>' + // для соохранения форматирования
      'Адрес <strong><!--STREET_SHORT--> <!--STREET_NAME--> д. <!--HOUSE_NO--> кв. <!--FLAT_NO--></strong><br>' +
    // для соохранения форматирования
      '<font class="pass<!--PASS_STATE-->">Паспорт <strong><!--PASSPORT_NUMBER--></strong> выдан <strong>' +
      '<!--PASSPORT_REGISTRATION--></strong><!--PASS_ERROR--><br></font>' + // для соохранения форматирования
      'Прописка <strong><!--ADRES_REGISTR--></strong><br>' + // для соохранения форматирования
      'ДР <strong><!--BIRTHDAY--></strong><br>' + // для соохранения форматирования
      'Статус <strong><!--CUST_STATE_DESCR--></strong>' + // для соохранения форматирования
      '</body></html>';

  groupSQL := '';
  groupSQL := dmMain.UserGroups.Trim;
  if not groupSQL.IsEmpty then
  begin
    a := groupSQL.Split([',']);
    gi := a[0].Trim;
    groupSQL := dmMain.GetSettingsValue('INFO_PANEL_SQL_GR' + gi);
    groupSQL := groupSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_GR' + gi + '_1');
    groupSQL := groupSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_GR' + gi + '_2');
    groupSQL := groupSQL.Trim;
  end;

  if groupSQL.IsEmpty then
  begin
    allSQL := dmMain.GetSettingsValue('INFO_PANEL_SQL');
    allSQL := allSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_1');
    allSQL := allSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_2');
    allSQL := allSQL.Trim;
  end
  else
    allSQL := groupSQL;

  if not allSQL.IsEmpty then
    dsCustomer.SQLs.SelectSQL.Text := allSQL
  else
    dsCustomer.SQLs.SelectSQL.Text := 'SELECT CUSTOMER_ID from customer where CUSTOMER_ID = :CUSTOMER_ID';
end;

procedure TapgCustomerInfo.HtmlViewConfig;
begin
  FWkeHtml := False;
  {
    FWkeHtml := FileExists(ExtractFilePath(Application.ExeName) + 'miniblink.dll');
    if FWkeHtml then
    begin
    FWkeWebbrowser := TWkeWebbrowser.Create(Self);

    FWkeWebbrowser.Name := 'WkeWebBrowser';
    FWkeWebbrowser.Parent := pnlHTML;
    FWkeWebbrowser.Align := alClient;
    FWkeWebbrowser.Color := Self.Color;
    FWkeWebbrowser.Taborder := 0;
    // fWkeWebbrowser.UserAgent := 'miniblink A4on.TV';
    // FWkeWebbrowser.CspEnabled := true;
    FWkeWebbrowser.Headless := False;
    FWkeWebbrowser.TouchEnabled := False;
    FWkeWebbrowser.DragEnabled := False;
    FWkeWebbrowser.LocalStoragePath := GetUserCacheFolder();
    FWkeWebbrowser.CookiePath := GetUserCacheFolder();
    FWkeWebbrowser.PopupEnabled := False;
    FWkeWebbrowser.Visible := true;
    end;
    HtmlViewer.Visible := not FWkeHtml;
  }
end;

procedure TapgCustomerInfo.HtmlViewerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Str: WideString;
begin
  if (Shift = [ssCtrl]) then
  begin
    case Key of
      67:
        begin
          HtmlViewer.CopyToClipboard; // Ctrl+C
          // далее чистим буфер от лишних данных
          // так как HtmlViewer помещает в буфер и текст и html
          Str := GetStringFromClipboard;
          PutStringIntoClipBoard(Str);
        end;
      65:
        HtmlViewer.SelectAll; // Ctrl+A
    end;
  end;
end;

function TapgCustomerInfo.GetParamValue(const param: String): String;
var
  V: string;
  fld: TField;
  NeedCHK: Boolean;
begin
  V := '';
  NeedCHK := True;
  if dsCustomer.Active then
  begin
    fld := dsCustomer.FindField(param);
    if (not(fld = nil)) then
    begin
      NeedCHK := False;
      if not fld.IsNull then
        V := fld.AsString;
    end;
  end;

  if NeedCHK and V.IsEmpty then
  begin
    fld := FDataSource.DataSet.FindField(param);
    if (not(fld = nil)) then
    begin
      if not fld.IsNull then
        V := fld.AsString;
    end;
  end;

  Result := V;
end;

procedure TapgCustomerInfo.UpdateInfoPanel;
begin
  if FDataSource.DataSet.FieldByName('Notice').IsNull then
    memCustNotice.Lines.Text := ''
  else
    memCustNotice.Lines.Text := FDataSource.DataSet.FieldByName('Notice').AsString;

  pnlPrepay.Visible := False;
  if not FDataSource.DataSet.FieldByName('PREPAY').IsNull then
    pnlPrepay.Visible := (FDataSource.DataSet.FieldByName('PREPAY').AsCurrency <> 0);

  if not FDataSource.DataSet.FieldByName('HIS_COLOR').IsNull then
    try
      Self.Color := StringToColor(FDataSource.DataSet.FieldByName('HIS_COLOR').Value);
    except
      Self.Color := clBtnFace
    end
  else
    Self.Color := clBtnFace;

  if FHL_ROW then
  begin
    try
      if (not dsCustomer.FieldByName('ROW_HL_COLOR').IsNull) then
        Self.Color := FHL_COLOR; // TColor($00FF7B9E);// Purple
    except
      FHL_ROW := False;
    end;
  end;

  pnlHTML.Color := Self.Color;
  pnlBtns.Color := Self.Color;
  // if FWkeHtml then
  // FWkeWebbrowser.Color := Self.Color
  // else

  MakeHtmlWithParams;
  HtmlViewer.defBackground := Self.Color;
end;

procedure TapgCustomerInfo.UpdateObject;
begin
  // обновим инфо панель.
  if dsCustomer.Active then
    dsCustomer.CloseOpen(True)
  else
    UpdateInfoPanel;
end;

procedure TapgCustomerInfo.MemoAlign;
begin
  if FMemoNeedRealign then
  begin
    pnlDP.Align := alTop;
    spltMemo.Align := alTop;
    pnlDP.Height := Trunc(Self.Height / 2);
    pnlDP.Realign;
    gbMemo.Height := Trunc(Self.Height / 2);

    FMemoNeedRealign := False;
  end
  else
  begin
    pnlDP.Align := alLeft;
    spltMemo.Align := alRight;
    spltMemo.Align := alLeft;
    pnlDP.Height := Self.Height;
    gbMemo.Height := Self.Height;
    pnlDP.Realign;

    FMemoNeedRealign := True;
  end;
end;

end.
