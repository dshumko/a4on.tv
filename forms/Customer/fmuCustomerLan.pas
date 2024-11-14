unit fmuCustomerLan;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ActnList, Vcl.Menus,
  Vcl.ComCtrls, Vcl.ToolWin,
  FIBDataSet, pFIBDataSet, DM, AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, A4onTypeUnit, amSplitter;

type
  TapgCustomerLan = class(TA4onPage)
    dsLAN: TpFIBDataSet;
    srcLan: TDataSource;
    dbgCustLAN: TDBGridEh;
    ActListCustomers: TActionList;
    ActLanPing: TAction;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    pmLanPopUp: TPopupMenu;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    btnActLanPing: TSpeedButton;
    dsIPPacket: TpFIBDataSet;
    srcIPPacket: TDataSource;
    PanelIPTV: TPanel;
    Label7: TLabel;
    DBGridEh1: TDBGridEh;
    pnlPack: TPanel;
    btnAddPack: TSpeedButton;
    btnDelPacket: TSpeedButton;
    actDelPack: TAction;
    actAddPack: TAction;
    actLanTelnet: TAction;
    actLanHttp: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    splitter: TSplitter;
    actOpenObject: TAction;
    actOpenEqpmnt: TAction;
    btnOpen: TSpeedButton;
    pmOpen: TPopupMenu;
    miEqpmnt: TMenuItem;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure btnActLanPingClick(Sender: TObject);
    procedure dbgCustLANCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer; var Processed: Boolean);
    procedure srcLanStateChange(Sender: TObject);
    procedure ActLanPingExecute(Sender: TObject);
    procedure actAddPackExecute(Sender: TObject);
    procedure actDelPackExecute(Sender: TObject);
    procedure actLanTelnetExecute(Sender: TObject);
    procedure actLanHttpExecute(Sender: TObject);
    procedure dbgCustLANDblClick(Sender: TObject);
    procedure srcLanDataChange(Sender: TObject; Field: TField);
    procedure actOpenObjectExecute(Sender: TObject);
    procedure actOpenEqpmntExecute(Sender: TObject);
  private
    FRightEdit: Boolean;
    FRightFull: Boolean;
    function GetCustomerInfo: TCustomerInfo;
    procedure miLanClickClick(Sender: TObject);
    procedure GenerateLANPopUp;
    procedure EnableControls;
    function LanServicesExists(): Boolean;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, AtrStrUtils, CustomerLanForma, RxStrUtils, TelnetForma, IPPacketForma, atrCmdUtils, HtmlForma;

class function TapgCustomerLan.GetPageName: string;
begin
  Result := rsLAN;
end;

procedure TapgCustomerLan.InitForm;
var
  i: Integer;
  ShowAddr: Boolean;
begin
  ShowAddr := (dmMain.GetSettingsValue('LAN_ADDRES') = '1');
  for i := 0 to dbgCustLAN.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgCustLAN.Columns[i].FieldName) = 'PLACE') then
      dbgCustLAN.Columns[i].Visible := ShowAddr;
    if (AnsiUpperCase(dbgCustLAN.Columns[i].FieldName) = 'HOUSE_NO') then
      dbgCustLAN.Columns[i].Visible := ShowAddr;
    if (AnsiUpperCase(dbgCustLAN.Columns[i].FieldName) = 'STREET_NAME') then
      dbgCustLAN.Columns[i].Visible := ShowAddr;
  end;

  FRightFull := dmMain.AllowedAction(rght_Customer_full); // Полный доступ
  FRightEdit := dmMain.AllowedAction(rght_Customer_EditLan); // Сеть
  actAdd.Visible := FRightEdit or FRightFull;
  actEdit.Visible := FRightEdit or FRightFull;
  actDel.Visible := FRightEdit or FRightFull;
  pnlButtons.Visible := FRightEdit or FRightFull;
  actAddPack.Visible := FRightEdit or FRightFull;
  actDelPack.Visible := FRightEdit or FRightFull;
  pnlPack.Visible := FRightEdit or FRightFull;

  dsLAN.DataSource := FDataSource;
  PanelIPTV.Visible := (VarToStr(dmMain.GetSettingsValue('IPTV_PACKET')) = '1');
  splitter.Enabled := PanelIPTV.Visible;
end;

procedure TapgCustomerLan.EnableControls;
begin
  actEdit.Enabled := dsLAN.RecordCount > 0;
  actDel.Enabled := dsLAN.RecordCount > 0;
  actAddPack.Enabled := actAddPack.Visible and (dsLAN.RecordCount > 0);
  actDelPack.Enabled := actDelPack.Visible and (dsLAN.RecordCount > 0);
  btnActLanPing.Enabled := dsLAN.RecordCount > 0;
end;

procedure TapgCustomerLan.OpenData;
begin
  if dsLAN.Active then
    dsLAN.Close;
  dsLAN.OrderClause := GetOrderClause(dbgCustLAN);
  dsLAN.Open;
  dsIPPacket.Active := (VarToStr(dmMain.GetSettingsValue('IPTV_PACKET')) = '1');
  EnableControls;
end;

procedure TapgCustomerLan.srcLanDataChange(Sender: TObject; Field: TField);
begin
  EnableControls
end;

procedure TapgCustomerLan.srcLanStateChange(Sender: TObject);
begin
  EnableControls;
end;

procedure TapgCustomerLan.actAddExecute(Sender: TObject);
var
  ci: TCustomerInfo;

begin
  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID = -1 then
    Exit;

  if (dmMain.GetSettingsValue('LAN_SRV_EXISTS') = '1') then
  begin
    if (not LanServicesExists()) then begin
      ShowMessage(rsErrorLANsrvNotExists);
      Exit;
    end;
  end;

  if EditCustomerLAN(ci, -1) then
    dsLAN.CloseOpen(true);
end;

procedure TapgCustomerLan.actDelExecute(Sender: TObject);
var
  eq_id: Integer;
begin
  if dsLAN.RecordCount = 0 then
    Exit;

  if (MessageDlg(Format(rsDelIP, [dsLAN['IP']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    eq_id := -1;
    if (dmMain.GetSettingsValue('LAN_DELEQPMNT') = '1') then
    begin
      if not dsLAN.FieldByName('EQ_ID').IsNull then
        eq_id := dsLAN['EQ_ID'];
    end;
    dsLAN.Delete;
    if eq_id <> -1 then
    begin
      with dmMain.Query do
      begin
        SQL.Clear;
        SQL.Add('delete from Equipment where Eid = :Eid');
        ParamByName('Eid').AsInteger := eq_id;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      end;
    end;
  end;
end;

procedure TapgCustomerLan.actEditExecute(Sender: TObject);
var
  ci: TCustomerInfo;
begin
  if (dsLAN.RecordCount = 0) or (dsLAN.FieldByName('LAN_ID').IsNull) then
    Exit;

  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID = -1 then
    dsLAN.CloseOpen(true)
  else
  begin
    if EditCustomerLAN(ci, dsLAN['LAN_ID']) then
      dsLAN.CloseOpen(true);
  end;
end;

procedure TapgCustomerLan.ActLanPingExecute(Sender: TObject);
var
  s: string;
begin
  if dsLAN.RecordCount = 0 then
    Exit;

  s := '';

  if (dbgCustLAN.Columns[dbgCustLAN.Col - 1].FieldName = 'EQ_IP') then
  begin
    if not dsLAN.FieldByName('EQ_IP').IsNull then
      s := dsLAN['EQ_IP'];
  end;

  if (not dsLAN.FieldByName('IP').IsNull) and (s = '') then
    s := dsLAN['IP'];

  if (s <> '') then
  begin
    atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
    {
      if not FileExists( ExtractFilePath(Application.ExeName) +  'ping.bat')
      then atrCmdUtils.ShellExecute(Application.A4MainForm.Handle, 'open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
      else atrCmdUtils.ShellExecute(Application.A4MainForm.Handle, 'open', ExtractFilePath(Application.ExeName) +  'ping.bat', '', '', SW_SHOW);
    }
  end;
end;

procedure TapgCustomerLan.btnActLanPingClick(Sender: TObject);
begin
  pmLanPopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TapgCustomerLan.CloseData;
begin
  if dsIPPacket.Active then
    dsIPPacket.Close;
  dsLAN.Close;
end;

procedure TapgCustomerLan.dbgCustLANCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; var Processed: Boolean);
begin
  if dsLAN.RecordCount = 0 then
    Exit;

  if Button = mbRight then
    GenerateLANPopUp;
end;

function TapgCustomerLan.GetCustomerInfo: TCustomerInfo;
begin
  with Result do
  begin
    if not FDataSource.DataSet.Eof then
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

      if FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        CUSTOMER_ID := -1
      else
        CUSTOMER_ID := FDataSource.DataSet['CUSTOMER_ID'];
      if FDataSource.DataSet.FieldByName('cust_code').IsNull then
        Cust_Code := ''
      else
        Cust_Code := FDataSource.DataSet['cust_code'];
      if FDataSource.DataSet.FieldByName('Account_No').IsNull then
        Account_No := ''
      else
        Account_No := FDataSource.DataSet['Account_No'];
      if FDataSource.DataSet.FieldByName('CUST_STATE_DESCR').IsNull then
        CUST_STATE_DESCR := ''
      else
        CUST_STATE_DESCR := FDataSource.DataSet['CUST_STATE_DESCR'];

      if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
        Debt_sum := FDataSource.DataSet['BALANCE']
      else
        Debt_sum := FDataSource.DataSet['Debt_sum'];

      if not FDataSource.DataSet.FieldByName('SURNAME').IsNull then
        FIO := FDataSource.DataSet['SURNAME']
      else
        FIO := '';
      if not FDataSource.DataSet.FieldByName('street_ID').IsNull then
      begin
        STREET_ID := FDataSource.DataSet['street_ID'];
        STREET := FDataSource.DataSet['STREET_NAME'];
      end;
      if not FDataSource.DataSet.FieldByName('HOUSE_ID').IsNull then
      begin
        HOUSE_ID := FDataSource.DataSet['HOUSE_ID'];
        HOUSE_NO := FDataSource.DataSet['House_No'];
      end;
      if not FDataSource.DataSet.FieldByName('FLAT_No').IsNull then
        FLAT_NO := FDataSource.DataSet['FLAT_No'];
      if not FDataSource.DataSet.FieldByName('phone_no').IsNull then
        phone_no := FDataSource.DataSet['phone_no'];
      if not FDataSource.DataSet.FieldByName('notice').IsNull then
        notice := FDataSource.DataSet['notice'];
      if not FDataSource.DataSet.FieldByName('HIS_COLOR').IsNull then
        color := FDataSource.DataSet['HIS_COLOR'];
      if not FDataSource.DataSet.FieldByName('PORCH_N').IsNull then
        porch_n := FDataSource.DataSet['PORCH_N'];
      if not FDataSource.DataSet.FieldByName('FLOOR_N').IsNull then
        floor_n := FDataSource.DataSet['FLOOR_N'];
    end
    else
      CUSTOMER_ID := -1;
  end;
end;

procedure TapgCustomerLan.GenerateLANPopUp;
var
  NewItem: TMenuItem;
  rCursor: TPoint;
begin
  if dsLAN.RecordCount = 0 then
    Exit;
  pmLanPopUp.Items.Clear;
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Caption := 'Ping';
  NewItem.Tag := 0;
  NewItem.OnClick := ActLanPingExecute;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := actLanTelnet;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := actLanHttp;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Caption := '-';
  NewItem.Tag := 0;
  pmLanPopUp.Items.Add(NewItem);
  with dmMain.qRead do
  begin
    SQL.Clear;
    SQL.Add('select distinct *');
    SQL.Add('  from (select ec.ec_id, ec.name, ec.command');
    SQL.Add('from equipment_cmd_grp ec');
    SQL.Add('   inner join equipment e on (ec.eg_id = e.eq_group)');
    SQL.Add('   inner join tv_lan t on (e.eid = t.eq_id)');
    SQL.Add('where ec.in_gui = 1 and t.customer_id = :customer_id');
    SQL.Add('        union');
    SQL.Add('        select ec.ec_id, ec.name, ec.command');
    SQL.Add('          from equipment_cmd_grp ec');
    SQL.Add('          where ec.in_gui = 1 and ec.Eg_Id = -1)');
    SQL.Add('order by name');
    ParamByName('customer_id').AsInteger := FDataSource.DataSet['CUSTOMER_ID'];
    Transaction.StartTransaction;
    ExecQuery;
    while not Eof do
    begin
      NewItem := TMenuItem.Create(pmLanPopUp);
      NewItem.Caption := FieldByName('name').AsString;
      NewItem.Tag := FieldByName('ec_id').AsInteger;
      NewItem.OnClick := miLanClickClick;
      pmLanPopUp.Items.Add(NewItem);
      Next;
    end;
    Close;
    Transaction.Rollback;
  end;

  if pmLanPopUp.Items.Count > 0 then
  begin
    GetCursorPos(rCursor);
    pmLanPopUp.Popup(rCursor.X, rCursor.Y);
  end;
end;

procedure TapgCustomerLan.miLanClickClick(Sender: TObject);
var
  Host: string;
  user: string;
  pswd: string;
  H_MAC, C_IP, C_MAC, C_PORT, C_VLAN: string;
  C_TAG, C_TAGSTR: string;
  cmd: string;
  eol_chars: Integer;
  CMD_TYPE: Integer;
  URL, AUT_USER, AUT_PSWD, eid, pid: String;

  procedure replaceParams(var InStr: String);
  begin
    InStr := ReplaceStr(InStr, '<e_admin>', user);
    InStr := ReplaceStr(InStr, '<e_pass>', pswd);
    InStr := ReplaceStr(InStr, '<e_mac>', H_MAC);
    InStr := ReplaceStr(InStr, '<e_mac_h>', H_MAC.Replace(':', '-'));
    InStr := ReplaceStr(InStr, '<e_mac_d>', H_MAC.Replace(':', '.'));
    InStr := ReplaceStr(InStr, '<e_mac_j>', FormatMACas4CD(H_MAC));
    InStr := ReplaceStr(InStr, '<e_ip>', Host);
    InStr := ReplaceStr(InStr, '<c_ip>', C_IP);
    InStr := ReplaceStr(InStr, '<c_mac>', C_MAC);
    InStr := ReplaceStr(InStr, '<c_mac_h>', C_MAC.Replace(':', '-'));
    InStr := ReplaceStr(InStr, '<c_mac_d>', C_MAC.Replace(':', '.'));
    InStr := ReplaceStr(InStr, '<c_mac_j>', FormatMACas4CD(C_MAC));
    InStr := ReplaceStr(InStr, '<c_port>', C_PORT);
    InStr := ReplaceStr(InStr, '<c_vlan>', C_VLAN);
    InStr := ReplaceStr(InStr, '<c_tag>', C_TAG);
    InStr := ReplaceStr(InStr, '<c_tagstr>', C_TAGSTR);
    InStr := ReplaceStr(InStr, '<e_id>', eid);
    InStr := ReplaceStr(InStr, '<prnt_id>', pid);
  end;

begin
  if not(Sender is TMenuItem) then
    Exit;
  if not dsLAN.FieldByName('IP').IsNull then
    C_IP := dsLAN.FieldByName('IP').AsString;

  if (not dsLAN.FieldByName('MAC').IsNull) then
    C_MAC := dsLAN.FieldByName('MAC').AsString;

  if not dsLAN.FieldByName('PORT').IsNull then
    C_PORT := dsLAN.FieldByName('PORT').AsString;

  if not dsLAN.FieldByName('VLAN_NUM').IsNull then
    C_VLAN := dsLAN.FieldByName('VLAN_NUM').AsString;

  if not dsLAN.FieldByName('TAG').IsNull then
    C_TAG := dsLAN.FieldByName('TAG').AsString;

  if not dsLAN.FieldByName('TAG_STR').IsNull then
    C_TAGSTR := dsLAN.FieldByName('TAG_STR').AsString;

  with dmMain.qRead do
  begin
    SQL.Clear;
    SQL.Add('select ec.ec_id, ec.name, ec.command, e.ip, e.mac, e.e_admin, e.e_pass, ec.eol_chrs');
    SQL.Add(', ec.CMD_TYPE, ec.URL, ec.AUT_USER, ec.AUT_PSWD, e.eid, e.PARENT_ID');
    SQL.Add('from equipment e');
    SQL.Add('  inner join equipment_cmd_grp ec');
    SQL.Add('       on ((ec.eg_id = e.eq_group or ec.eg_id = -1) and ec.ec_id = :ec_id )');
    SQL.Add('where e.eid = :eq_id');
    ParamByName('ec_id').AsInteger := (Sender as TMenuItem).Tag;
    ParamByName('eq_id').AsInteger := dsLAN['eq_id'];
    Transaction.StartTransaction;
    ExecQuery;
    if not FieldByName('ip').IsNull then
      Host := FieldByName('ip').AsString;

    if not FieldByName('e_admin').IsNull then
      user := FieldByName('e_admin').AsString;

    if not FieldByName('e_pass').IsNull then
      pswd := FieldByName('e_pass').AsString;

    if (not FieldByName('mac').IsNull) then
      H_MAC := FieldByName('mac').AsString;

    if not FieldByName('command').IsNull then
      cmd := FieldByName('command').AsString;

    if FieldByName('eol_chrs').IsNull then
      eol_chars := 0
    else
    begin
      if FieldByName('eol_chrs').AsString = '\r\n' then
        eol_chars := 0
      else if FieldByName('eol_chrs').AsString = '\n\r' then
        eol_chars := 1
      else if FieldByName('eol_chrs').AsString = '\n' then
        eol_chars := 2
      else if FieldByName('eol_chrs').AsString = '\r' then
        eol_chars := 3
      else
        eol_chars := 0
    end;

    if FieldByName('CMD_TYPE').IsNull then
      CMD_TYPE := 0
    else
      CMD_TYPE := FieldByName('CMD_TYPE').AsInteger;
    if not FieldByName('URL').IsNull then
      URL := FieldByName('URL').AsString;
    if not FieldByName('AUT_USER').IsNull then
      AUT_USER := FieldByName('AUT_USER').AsString;
    if not FieldByName('AUT_PSWD').IsNull then
      AUT_PSWD := FieldByName('AUT_PSWD').AsString;

    if not FieldByName('eid').IsNUll then
      eid := FieldByName('eid').asString
    else
      eid := '';
    if not FieldByName('PARENT_ID').IsNUll then
      pid := FieldByName('PARENT_ID').asString
    else
      pid := '';

    Close;
    Transaction.Rollback;
  end;

  if cmd <> '' then
    replaceParams(cmd);

  if URL <> '' then
    replaceParams(URL);

  case CMD_TYPE of
    2:
      cmd := GetHtml(URL, AUT_USER, AUT_PSWD, cmd, true, (Sender as TMenuItem).Caption);
  else
    if cmd <> '' then
      cmd := telnet(Host, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, true);
  end;
end;

procedure TapgCustomerLan.actAddPackExecute(Sender: TObject);
begin
  if dsLAN.FieldByName('LAN_ID').IsNull then
    Exit;

  if AddIPPaket(dsLAN['LAN_ID']) then
    dsIPPacket.CloseOpen(true);
end;

procedure TapgCustomerLan.actDelPackExecute(Sender: TObject);
begin
  if dsIPPacket.FieldByName('NAME').IsNull then
    Exit;

  if (MessageDlg(Format(rsDelIpPacket, [dsIPPacket['NAME'], dsLAN['IP']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
  begin
    dsIPPacket.Delete;
  end;
end;

procedure TapgCustomerLan.actLanTelnetExecute(Sender: TObject);
var
  s: string;
begin
  if dsLAN.RecordCount = 0 then
    Exit;

  s := '';

  if (dbgCustLAN.Columns[dbgCustLAN.Col - 1].FieldName = 'EQ_IP') then
  begin
    if not dsLAN.FieldByName('EQ_IP').IsNull then
      s := dsLAN['EQ_IP'];
  end;

  if (not dsLAN.FieldByName('IP').IsNull) and (s = '') then
    s := dsLAN['IP'];

  if (s <> '') then
    atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'telnet', s, '', SW_SHOW);
end;

procedure TapgCustomerLan.actOpenEqpmntExecute(Sender: TObject);
begin
  if ((dsLAN.RecordCount = 0) or (dsLAN.FieldByName('EQ_ID').IsNull)) then
    Exit;

  // A4MainForm.OpenEquipmentByName(dsLAN['E_NAME']);
  if not A4MainForm.OpenEquipmentByID(dsLAN['EQ_ID']) then
    ShowMessage(rsWarningQuestFilter);
end;

procedure TapgCustomerLan.actOpenObjectExecute(Sender: TObject);
begin
  pmOpen.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TapgCustomerLan.actLanHttpExecute(Sender: TObject);
var
  s: string;
begin
  if dsLAN.RecordCount = 0 then
    Exit;

  s := '';

  if (dbgCustLAN.Columns[dbgCustLAN.Col - 1].FieldName = 'EQ_IP') then
  begin
    if not dsLAN.FieldByName('EQ_IP').IsNull then
      s := 'http://' + dsLAN['EQ_IP'];
  end;

  if (not dsLAN.FieldByName('IP').IsNull) and (s = '') then
    s := 'http://' + dsLAN['IP'];

  if (s <> '') then
    atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', s, '', '', SW_SHOW);
end;

procedure TapgCustomerLan.dbgCustLANDblClick(Sender: TObject);
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

function TapgCustomerLan.LanServicesExists(): Boolean;
begin
  try
    with dmMain.qRead do
    begin
      SQL.Clear;
      SQL.Add('select  count(*) CNT');
      SQL.Add('  from Subscr_serv h');
      SQL.Add('       inner join services s on (s.Service_Id = h.Serv_Id)');
      SQL.Add('  where s.Business_Type = 1');
      SQL.Add('        and h.State_Sgn = 1');
      SQL.Add('        and h.Customer_Id = :customer_id  ');
      ParamByName('customer_id').AsInteger := FDataSource.DataSet['CUSTOMER_ID'];
      Transaction.StartTransaction;
      ExecQuery;
      Result := (FieldByName('CNT').AsInteger > 0);
      Close;
      Transaction.Rollback;
    end;
  except
    Result := False;
  end;
end;

end.
