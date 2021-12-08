unit fmuEqpmntPorts;

interface

uses

  System.Classes, System.Actions, System.SysUtils, System.Variants,
  WinAPI.Windows, WinAPI.Messages, Data.DB, System.UITypes,
  Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Controls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Menus, Vcl.ToolWin, Vcl.Dialogs,
  FIBDataSet, pFIBDataSet, DBGridEh, DynVarsEh, FIBDatabase,
  pFIBDatabase, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, GridsEh, EhLibVCL,
  DM, PrjConst, AtrPages, A4onTypeUnit;

type
  TapgEqpmntPort = class(TA4onPage)
    ActListFrame: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcData: TDataSource;
    dsData: TpFIBDataSet;
    dbgCustomer: TDBGridEh;
    actFindCustomer: TAction;
    actCmd: TAction;
    actEditCustLan: TAction;
    btnEdit: TSpeedButton;
    actPEdit: TAction;
    pmCustomerLanPopUp: TPopupMenu;
    actCustPing: TAction;
    actCustTelnet: TAction;
    actCustHttp: TAction;
    Action1: TAction;
    btnCmd: TSpeedButton;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgApplianceDblClick(Sender: TObject);
    procedure srcApplianceDataChange(Sender: TObject; Field: TField);
    procedure srcApplianceStateChange(Sender: TObject);
    procedure dbgCustomerDblClick(Sender: TObject);
    procedure actCmdExecute(Sender: TObject);
    procedure actFindCustomerExecute(Sender: TObject);
    procedure actEditCustLanExecute(Sender: TObject);
    procedure actPEditExecute(Sender: TObject);
    procedure actCustPingExecute(Sender: TObject);
    procedure actCustTelnetExecute(Sender: TObject);
    procedure actCustHttpExecute(Sender: TObject);
    procedure dbgCustomerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgCustomerSortMarkingChanged(Sender: TObject);
  private
    FRightEdit: Boolean;
    FRightFull: Boolean;
    procedure EnableControls;
    function GetCustomerInfo: TCustomerInfo;
    procedure GenerateCustomerLANPopUp;
    function GetEquipmentRecord: TEquipmentRecord;
    procedure miCustomerLanClick(Sender: TObject);
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  System.StrUtils, MAIN, AtrCommon, AtrStrUtils, CF, EQPort,
  atrCmdUtils, HtmlForma, TelnetForma,
  EditApplianceForma, CustomerLanForma;

class function TapgEqpmntPort.GetPageName: string;
begin
  Result := rsEqpmntPorts;
end;

procedure TapgEqpmntPort.InitForm;
var
  i: Integer;
  vFINE: Boolean;
begin
  Caption := GetPageName;

  vFINE := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1'); // пеня
  if vFINE then
    for i := 0 to dbgCustomer.Columns.Count - 1 do
    begin
      if (AnsiUpperCase(dbgCustomer.Columns[i].FieldName) = 'DEBT_SUM') then
      begin
        dbgCustomer.Columns[i].Title.Caption := rsBALANCE;
        dbgCustomer.Columns[i].FieldName := 'BALANCE';
      end;
    end;

  dsData.DataSource := FDataSource;
end;

procedure TapgEqpmntPort.EnableControls;
begin
  actEdit.Enabled := dsData.RecordCount > 0;
  actDel.Enabled := dsData.RecordCount > 0;
end;

procedure TapgEqpmntPort.OpenData;
begin
  if dsData.Active then
    dsData.Close;
  dsData.OrderClause := GetOrderClause(dbgCustomer);
  dsData.Open;

  EnableControls;
end;

procedure TapgEqpmntPort.srcApplianceDataChange(Sender: TObject; Field: TField);
begin
  EnableControls
end;

procedure TapgEqpmntPort.srcApplianceStateChange(Sender: TObject);
begin
  EnableControls;
end;

procedure TapgEqpmntPort.actAddExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    exit;

  if CreatePort(EQ) then
    dsData.CloseOpen(true);
end;

procedure TapgEqpmntPort.actCmdExecute(Sender: TObject);
begin
  GenerateCustomerLANPopUp;
end;

procedure TapgEqpmntPort.actCustHttpExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.RecordCount = 0) then
    exit;
  if (dsData.FieldByName('IP').IsNull) then
    exit;

  s := 'http://' + dsData.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', s, '', '', SW_SHOW);
end;

procedure TapgEqpmntPort.actCustPingExecute(Sender: TObject);
var
  s: String;
begin
  if (dsData.RecordCount = 0) then
    exit;
  if (dsData.FieldByName('IP').IsNull) then
    exit;

  s := dsData.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
end;

procedure TapgEqpmntPort.actCustTelnetExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.RecordCount = 0) then
    exit;
  if (dsData.FieldByName('IP').IsNull) then
    exit;

  s := dsData.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'telnet', s, '', SW_SHOW);
end;

procedure TapgEqpmntPort.actDelExecute(Sender: TObject);
begin
  if dsData.RecordCount = 0 then
    exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsData['Name']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsData.Delete;
  end;
end;

procedure TapgEqpmntPort.actEditCustLanExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  lan_id: Integer;
begin
  if not actEditCustLan.Visible then
    exit;

  if (dsData.RecordCount = 0) or (dsData.FieldByName('LAN_ID').IsNull) then
    exit;

  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID > -1 then
  begin
    lan_id := dsData['LAN_ID'];
    if EditCustomerLAN(ci, lan_id) then
    begin
      dsData.DisableControls;
      dsData.CloseOpen(true);
      dsData.Locate('LAN_ID', lan_id, []);
      dsData.EnableControls;
    end;
  end;
end;

procedure TapgEqpmntPort.actEditExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  if not dsData.FieldByName('PORT').IsNull then
    Port := dsData.FieldByName('PORT').asString
  else
    exit;

  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    exit;

  if EditPort(EQ, Port) then
    dsData.Refresh;
end;

procedure TapgEqpmntPort.actFindCustomerExecute(Sender: TObject);
var
  Grid: TDBGridEh;
  i: Integer;
  b: TBookmark;
  customers: string;
begin
  if dbgCustomer.DataSource.DataSet.RecordCount = 0 then
    exit;

  Grid := dbgCustomer;
  customers := '';

  if (Grid.SelectedRows.Count = 0) then
  begin
    if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
  end
  else
  begin
    b := Grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.DisableControls;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
      if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
    end;
    Grid.DataSource.DataSet.GotoBookmark(b);
    Grid.DataSource.DataSet.EnableControls;
  end;

  customers := Copy(customers, 2, Length(customers) - 1);

  if (customers <> '') then
    ShowCustomers(7, customers);
end;

procedure TapgEqpmntPort.actPEditExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  inherited;
  if not dsData.FieldByName('PORT').IsNull then
    Port := dsData.FieldByName('PORT').asString
  else
    exit;

  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    exit;

  if EditPort(EQ, Port) then
    dsData.Refresh;
end;

procedure TapgEqpmntPort.CloseData;
begin
  dsData.Close;
end;

procedure TapgEqpmntPort.dbgApplianceDblClick(Sender: TObject);
begin
  if (Sender as TDBGridEh).DataSource.DataSet.RecordCount > 0 then
  begin
    if actEdit.Enabled then
      actEdit.Execute;
  end
  else
  begin
    if actAdd.Enabled then
      actAdd.Execute;
  end;
end;

procedure TapgEqpmntPort.dbgCustomerDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  s: String;
begin
  inherited;
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgCustomer.ScreenToClient(ScrPt);
  Cell := dbgCustomer.MouseCoord(GrdPt.X, GrdPt.Y);
  s := UpperCase(dbgCustomer.Fields[Cell.X - 1].FieldName);
  if (s = 'PORT') then
    actPEdit.Execute
  else
    actEditCustLan.Execute;
end;

procedure TapgEqpmntPort.dbgCustomerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    GenerateCustomerLANPopUp;
end;

procedure TapgEqpmntPort.dbgCustomerSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  Grid: TCustomDBGridEh;
  id: String;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Grid := TCustomDBGridEh(Sender);
  FIBDS := Grid.DataSource.DataSet as TpFIBDataSet;
  id := '';
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FIBDS.Active;
    if beOpened then
    begin
      if not FIBDS.FieldByName('PORT').IsNull then
        id := FIBDS.FieldByName('PORT').asString;
      FIBDS.Close;
    end;

    s := GetOrderClause(Sender as TDBGridEh);

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> '' then
        FIBDS.Locate('PORT', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

function TapgEqpmntPort.GetCustomerInfo: TCustomerInfo;
begin
  with Result do
  begin
    if not dsData.Eof then
    begin
      FLAT_NO := '';
      phone_no := '';
      notice := '';
      color := '';
      porch_n := '';
      floor_n := '';
      STREET_ID := -1;
      STREET := '';
      HOUSE_ID := -1;
      HOUSE_NO := '';

      if dsData.FieldByName('CUSTOMER_ID').IsNull then
        CUSTOMER_ID := -1
      else
        CUSTOMER_ID := dsData['CUSTOMER_ID'];
      if dsData.FieldByName('cust_code').IsNull then
        Cust_Code := ''
      else
        Cust_Code := dsData['cust_code'];
      if dsData.FieldByName('Account_No').IsNull then
        Account_No := ''
      else
        Account_No := dsData['Account_No'];
      if dsData.FieldByName('CUST_STATE_DESCR').IsNull then
        CUST_STATE_DESCR := ''
      else
        CUST_STATE_DESCR := dsData['CUST_STATE_DESCR'];

      if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
        Debt_sum := dsData['BALANCE']
      else
        Debt_sum := dsData['Debt_sum'];

      if not dsData.FieldByName('SURNAME').IsNull then
        FIO := dsData['SURNAME']
      else
        FIO := '';
      if not dsData.FieldByName('street_ID').IsNull then
      begin
        STREET_ID := dsData['street_ID'];
        STREET := dsData['STREET_NAME'];
      end;
      if not dsData.FieldByName('HOUSE_ID').IsNull then
      begin
        HOUSE_ID := dsData['HOUSE_ID'];
        HOUSE_NO := dsData['House_No'];
      end;
      if not dsData.FieldByName('FLAT_No').IsNull then
        FLAT_NO := dsData['FLAT_No'];
      if not dsData.FieldByName('phone_no').IsNull then
        phone_no := dsData['phone_no'];
      if not dsData.FieldByName('notice').IsNull then
        notice := dsData['notice'];
      if not dsData.FieldByName('HIS_COLOR').IsNull then
        color := dsData['HIS_COLOR'];
      if not dsData.FieldByName('PORCH_N').IsNull then
        porch_n := dsData['PORCH_N'];
      if not dsData.FieldByName('FLOOR_N').IsNull then
        floor_n := dsData['FLOOR_N'];
    end
    else
      CUSTOMER_ID := -1;
  end;
end;

procedure TapgEqpmntPort.GenerateCustomerLANPopUp;
var
  NewItem: TMenuItem;
  rCursor: TPoint;
begin
  if dsData.RecordCount = 0 then
    exit;
  if dsData.DataSource.DataSet.RecordCount = 0 then
    exit;

  pmCustomerLanPopUp.Items.Clear;
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Action := actCustPing;
  pmCustomerLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Action := actCustTelnet;
  pmCustomerLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Action := actCustHttp;
  pmCustomerLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Caption := '-';
  NewItem.Tag := 0;
  pmCustomerLanPopUp.Items.Add(NewItem);
  if not dsData.DataSource.DataSet.FieldByName('EID').IsNull then
  begin
    with dmMain.qRead do
    begin
      sql.Clear;
      sql.Add('select distinct *');
      sql.Add('  from (select ec.ec_id, ec.name, ec.command');
      sql.Add('          from equipment_cmd_grp ec');
      sql.Add('            inner join equipment e on (ec.eg_id = e.eq_group)');
      sql.Add('          where ec.in_gui = 1 and e.eid = :eq_id');
      sql.Add('        union');
      sql.Add('        select ec.ec_id, ec.name, ec.command');
      sql.Add('          from equipment_cmd_grp ec');
      sql.Add('          where ec.in_gui = 1 and ec.Eg_Id = -1)');
      sql.Add('  order by name');
      ParamByName('eq_id').AsInteger := dsData.DataSource.DataSet.FieldByName('EID').AsInteger;
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do
      begin
        NewItem := TMenuItem.Create(pmCustomerLanPopUp);
        NewItem.Caption := FieldByName('name').asString;
        NewItem.Tag := FieldByName('ec_id').AsInteger;
        NewItem.OnClick := miCustomerLanClick;
        pmCustomerLanPopUp.Items.Add(NewItem);
        next;
      end;
      Close;
      Transaction.Rollback;
    end;
  end;

  if pmCustomerLanPopUp.Items.Count > 0 then
  begin
    GetCursorPos(rCursor);
    pmCustomerLanPopUp.Popup(rCursor.X, rCursor.Y);
  end;
end;

procedure TapgEqpmntPort.miCustomerLanClick(Sender: TObject);
var
  Host: string;
  user: string;
  pswd: string;
  H_MAC, C_IP, C_MAC, C_PORT, C_VLAN: string;
  C_TAG, C_TAGSTR: string;
  cmd: string;
  eol_chars: Integer;
  CMD_TYPE: Integer;
  URL, AUT_USER, AUT_PSWD: String;
  C_FIO, C_ACCNT, C_ADDR: string;

  procedure replaceParams(var InStr: String);
  begin
    InStr := ReplaceStr(InStr, '<e_admin>', user);
    InStr := ReplaceStr(InStr, '<e_pass>', pswd);
    InStr := ReplaceStr(InStr, '<e_mac>', H_MAC);
    InStr := ReplaceStr(InStr, '<e_mac_h>', H_MAC.Replace(':', '-'));
    InStr := ReplaceStr(InStr, '<e_mac_d>', H_MAC.Replace(':', '.'));
    InStr := ReplaceStr(InStr, '<e_ip>', Host);
    InStr := ReplaceStr(InStr, '<c_ip>', C_IP);
    InStr := ReplaceStr(InStr, '<c_mac>', C_MAC);
    InStr := ReplaceStr(InStr, '<c_mac_h>', C_MAC.Replace(':', '-'));
    InStr := ReplaceStr(InStr, '<c_mac_d>', C_MAC.Replace(':', '.'));
    InStr := ReplaceStr(InStr, '<c_port>', C_PORT);
    InStr := ReplaceStr(InStr, '<c_vlan>', C_VLAN);
    InStr := ReplaceStr(InStr, '<c_tag>', C_TAG);
    InStr := ReplaceStr(InStr, '<c_tagstr>', C_TAGSTR);
    InStr := ReplaceStr(InStr, '<c_accnt>', C_ACCNT);
    InStr := ReplaceStr(InStr, '<c_fio>', C_FIO);
    InStr := ReplaceStr(InStr, '<c_addr>', C_ADDR);
    InStr := ReplaceStr(InStr, '<date>', FormatDateTime('Y-m-d h:n', Now()));
  end;

begin
  if not(Sender is TMenuItem) then
    exit;
  if dsData.DataSource.DataSet.RecordCount = 0 then
    exit;
  if dsData.RecordCount = 0 then
    exit;

  if (not dsData.FieldByName('IP').IsNull) then
    C_IP := dsData.FieldByName('IP').asString;

  if (not dsData.FieldByName('MAC').IsNull) then
    C_MAC := dsData.FieldByName('MAC').asString;

  if (not dsData.FieldByName('PORT').IsNull) then
    C_PORT := dsData.FieldByName('PORT').asString;

  if (not dsData.FieldByName('ACCOUNT_NO').IsNull) then
    C_ACCNT := dsData.FieldByName('ACCOUNT_NO').asString;
  if (not dsData.FieldByName('SURNAME').IsNull) then
  begin
    C_FIO := dsData.FieldByName('SURNAME').asString;
    if (not dsData.FieldByName('INITIALS').IsNull) then
      C_FIO := C_FIO + dsData.FieldByName('INITIALS').asString;
  end;
  if (not dsData.FieldByName('CUST_CODE').IsNull) then
  begin
    C_ADDR := dsData.FieldByName('CUST_CODE').asString;
  end;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command, e.ip, e.mac, e.e_admin, e.e_pass, ec.eol_chrs');
    sql.Add(', ec.CMD_TYPE, ec.URL, ec.AUT_USER, ec.AUT_PSWD');
    sql.Add('from equipment e');
    sql.Add('  inner join equipment_cmd_grp ec');
    sql.Add('       on ((ec.eg_id = e.eq_group or ec.eg_id = -1) and ec.ec_id = :ec_id )');
    sql.Add('where e.eid = :eq_id');
    ParamByName('ec_id').AsInteger := (Sender as TMenuItem).Tag;
    ParamByName('eq_id').AsInteger := dsData.DataSource.DataSet.FieldByName('EID').AsInteger;
    Transaction.StartTransaction;
    ExecQuery;

    if not FieldByName('ip').IsNull then
      Host := FieldByName('ip').asString;

    if not FieldByName('e_admin').IsNull then
      user := FieldByName('e_admin').asString;

    if not FieldByName('e_pass').IsNull then
      pswd := FieldByName('e_pass').asString;

    if (not FieldByName('mac').IsNull) then
      H_MAC := FieldByName('mac').asString;

    if not FieldByName('command').IsNull then
      cmd := FieldByName('command').asString;

    if FieldByName('eol_chrs').IsNull then
      eol_chars := 0
    else
    begin
      if FieldByName('eol_chrs').asString = '\r\n' then
        eol_chars := 0
      else if FieldByName('eol_chrs').asString = '\n\r' then
        eol_chars := 1
      else if FieldByName('eol_chrs').asString = '\n' then
        eol_chars := 2
      else if FieldByName('eol_chrs').asString = '\r' then
        eol_chars := 3
      else
        eol_chars := 0
    end;

    if FieldByName('CMD_TYPE').IsNull then
      CMD_TYPE := 0
    else
      CMD_TYPE := FieldByName('CMD_TYPE').AsInteger;
    if not FieldByName('URL').IsNull then
      URL := FieldByName('URL').asString;
    if not FieldByName('AUT_USER').IsNull then
      AUT_USER := FieldByName('AUT_USER').asString;
    if not FieldByName('AUT_PSWD').IsNull then
      AUT_PSWD := FieldByName('AUT_PSWD').asString;

    Close;
    Transaction.Rollback;
  end;
  if cmd <> '' then
    replaceParams(cmd);
  if cmd <> '' then
    replaceParams(URL);

  case CMD_TYPE of
    2:
      cmd := GetHtml(URL, AUT_USER, AUT_PSWD, cmd, true, (Sender as TMenuItem).Caption);
  else
    if cmd <> '' then
      cmd := telnet(Host, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, true);
  end;
end;

function TapgEqpmntPort.GetEquipmentRecord: TEquipmentRecord;
begin
  if (dsData.DataSource.DataSet.RecordCount = 0) then
  begin
    Result.id := -1;
    exit;
  end;

  Result.id := dsData.DataSource.DataSet.FieldByName('Eid').AsInteger;
  if not dsData.DataSource.DataSet.FieldByName('Eq_Type').IsNull then
    Result.TypeID := dsData.DataSource.DataSet.FieldByName('Eq_Type').AsInteger;
  if not dsData.DataSource.DataSet.FieldByName('eqgroup').IsNull then
    Result.TypeName := dsData.DataSource.DataSet.FieldByName('eqgroup').asString;
  if not dsData.DataSource.DataSet.FieldByName('Name').IsNull then
    Result.Name := dsData.DataSource.DataSet.FieldByName('Name').asString;
  if not dsData.DataSource.DataSet.FieldByName('Ip').IsNull then
    Result.IP := dsData.DataSource.DataSet.FieldByName('Ip').asString;
  if not dsData.DataSource.DataSet.FieldByName('Mac').IsNull then
    Result.MAC := dsData.DataSource.DataSet.FieldByName('Mac').asString;
  if not dsData.DataSource.DataSet.FieldByName('Notice').IsNull then
    Result.notice := dsData.DataSource.DataSet.FieldByName('Notice').asString;
end;

end.
