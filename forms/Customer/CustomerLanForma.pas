unit CustomerLanForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ActnList,
  Vcl.ExtCtrls,
  OkCancel_frame, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBGridEh, DBLookupEh, GridsEH, DM, PrjConst, CnErrorProvider,
  FIBDatabase,
  pFIBDatabase, A4onTypeUnit, EhlibFIB;

type
  TCustomerLanForm = class(TForm)
    OkCancelFrame: TOkCancelFrame;
    srcLan: TDataSource;
    dsLAN: TpFIBDataSet;
    pnlMain: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    eMAC: TDBEditEh;
    Label1: TLabel;
    eIP: TDBEditEh;
    srcVLANS: TDataSource;
    dsVlans: TpFIBDataSet;
    lbl3: TLabel;
    dbleVLAN: TDBLookupComboboxEh;
    srcEQ: TDataSource;
    dsEQ: TpFIBDataSet;
    actlst1: TActionList;
    actFindIP: TAction;
    cnError: TCnErrorProvider;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    lbl1: TLabel;
    eIPv6: TDBEditEh;
    lbl2: TLabel;
    edtTAGSTR: TDBEditEh;
    edtTAG: TDBNumberEditEh;
    pmLanPopUp: TPopupMenu;
    ActListEQ: TActionList;
    ActLanPing: TAction;
    actLanTelnet: TAction;
    actLanHttp: TAction;
    btn1: TButton;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    srcHouse: TDataSource;
    dsHomes: TpFIBDataSet;
    pnlAddres: TPanel;
    Label3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    LupStreets: TDBLookupComboboxEh;
    lcbHOUSE_ID: TDBLookupComboboxEh;
    edtPLACE: TDBEditEh;
    pnlMemo: TPanel;
    mmoNOTICE: TDBMemoEh;
    lcbPort: TDBLookupComboboxEh;
    dsPort: TpFIBDataSet;
    srcPort: TDataSource;
    actAddPort: TAction;
    actEditPort: TAction;
    edtPort: TDBEditEh;
    actGetIpv6: TAction;
    pnlEthernet: TPanel;
    pnlDocSYS: TPanel;
    Label5: TLabel;
    dbleEquipment: TDBLookupComboboxEh;
    Label6: TLabel;
    edtModem: TDBEditEh;
    lbl6: TLabel;
    edtSerialModem: TDBEditEh;
    lbl7: TLabel;
    edtMACmodem: TDBEditEh;
    lbl8: TLabel;
    edtIPmodem: TDBEditEh;
    cbbTagList: TDBComboBoxEh;
    procedure eMACEnter(Sender: TObject);
    procedure eMACExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure eIPExit(Sender: TObject);
    procedure OkCancelFrame1bbCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbleEquipmentDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure dbleVLANDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure eIPEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure eIPEnter(Sender: TObject);
    procedure eIPv6Exit(Sender: TObject);
    procedure eIPv6Enter(Sender: TObject);
    procedure ActLanPingExecute(Sender: TObject);
    procedure actLanTelnetExecute(Sender: TObject);
    procedure actLanHttpExecute(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbleEquipmentExit(Sender: TObject);
    procedure lcbHOUSE_IDChange(Sender: TObject);
    procedure actAddPortExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbPortDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure lcbPortExit(Sender: TObject);
    procedure ePortExit(Sender: TObject);
    procedure actEditPortExecute(Sender: TObject);
    procedure lcbPortChange(Sender: TObject);
    procedure DBLookupComboboxClick(Sender: TObject);
    procedure actGetIpv6Execute(Sender: TObject);
    procedure IPv6Get;
    procedure edtMACmodemExit(Sender: TObject);
    procedure edtMACmodemEnter(Sender: TObject);
    procedure edtIPmodemEnter(Sender: TObject);
    procedure edtIPmodemEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dbleEquipmentChange(Sender: TObject);
    procedure dbleEquipmentEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dbleEquipmentEditButtons1Click(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
    FCI: TCustomerInfo;
    FCanEditPort: Boolean;
    FCanEditEqpmnt: Boolean;
    FVlanDisabled: Boolean;
    FPortDictDisable: Boolean;
    FWarnings: string;
    FEnterSecondPress: Boolean;
    FDocSYS: Boolean;
    FModemID: Integer;
    function CheckData(): Integer;
    function CheckWarnings(): Boolean;
    function CheckIP(const ip: String; const VLAN_ID: Integer = -1): string;
    function CheckIPForVlan(const ip: String; const VLAN_ID: Integer = -1): Boolean;
    function CheckVlanForHouse(const VLAN_ID: Integer; const HOUSE_ID: Integer): Boolean;
    function CheckUniqMAC(const MAC: String): String;
    procedure CheckPort();
    procedure miLanClickClick(Sender: TObject);
    procedure GenerateLANPopUp;
    function GetNodeID: Integer;
    function ReplaceCmdParams(const InputCMD: String): String;
    procedure CheckModemMac();
    procedure CheckTagList;
  public
    { Public declarations }
    property CI: TCustomerInfo write FCI;
    property IsDocSYS: Boolean read FDocSYS;
    function CreateOrMoveEquipment(): Integer;
  end;

function EditCustomerLAN(const aCI: TCustomerInfo; aLan_ID: Int64): Boolean;

var
  CustomerLanForm: TCustomerLanForm;

implementation

uses
  System.StrUtils, httpsend, synacode, JsonDataObjects,
  MAIN, AtrCommon, AtrStrUtils, EquipEditForma, pFIBQuery,
  TelnetForma, atrCmdUtils, EQPort, HtmlForma;

{$R *.dfm}

function EditCustomerLAN(const aCI: TCustomerInfo; aLan_ID: Int64): Boolean;
var
  f1, f2, lvl: Integer;
begin
  Result := False;
  if aCI.CUSTOMER_ID = -1 then
    Exit;

  with TCustomerLanForm.Create(application) do
    try
      CI := aCI;

      dsStreets.Open;
      dsHomes.Open;

      dsEQ.ParamByName('CUSTOMER_ID').AsInt64 := aCI.CUSTOMER_ID;
      dsEQ.ParamByName('HOUSE_ID').AsInt64 := aCI.HOUSE_ID;
      dsEQ.ParamByName('LID').AsInt64 := aLan_ID;
      dsEQ.Open;
      dsPort.Open;
      dsLAN.ParamByName('Lan_ID').AsInt64 := aLan_ID;
      dsLAN.Open;
      if aLan_ID = -1 then
      begin
        dsLAN.Insert;
        if (dmMain.GetSettingsValue('LAN_DELEQPMNT') <> '1') then
        begin
          // если нашли оборудование - пропишем его
          if not dsEQ.EOF then
          begin
            f1 := -1;
            f2 := -1;
            lvl := 999;
            dsEQ.DisableControls;
            dsEQ.First;
            while not dsEQ.EOF do
            begin
              if (f1 = -1) and (dsEQ['finded'] = 1) then
                f1 := dsEQ['EID'];
              if (lvl > dsEQ['LVL']) then
              begin
                f2 := dsEQ['EID'];
                lvl := dsEQ['LVL']
              end;
              dsEQ.Next;
            end;
            dsEQ.First;
            dsEQ.EnableControls;
            if f2 <> -1 then
              dbleEquipment.Value := f2
            else if f1 <> -1 then
              dbleEquipment.Value := f1
          end;
        end;

        if (dmMain.GetSettingsValue('LAN_VALAN4HOME') = '1') then
        begin
          dsVlans.SQLs.SelectSQL.Add('  and ((oc.house_id = :House_Id) or (v.v_id = :VID))');
          dsVlans.ParamByName('VID').AsInt64 := -1;
        end;
        dsVlans.SQLs.SelectSQL.Add('order by finded, NAME_IP');
        dsVlans.ParamByName('HOUSE_ID').AsInt64 := aCI.HOUSE_ID;
        dsVlans.Open;
        // если нашли влан - пропишем его
        if not dsVlans.EOF then
        begin
          if (dsVlans['finded'] = 1) and (dbleVLAN.Text.IsEmpty) then
          begin
            dbleVLAN.Value := dsVlans['V_ID'];
            // actFindIP.Execute;
          end;
        end;
      end
      else
      begin
        if (dmMain.GetSettingsValue('LAN_VALAN4HOME') = '1') then
        begin
          if (not dsLAN.FieldByName('VLAN_ID').IsNUll) then
          begin
            dsVlans.SQLs.SelectSQL.Add(' and ( oc.house_id = :House_Id or v.v_id = :VID)');
            dsVlans.ParamByName('VID').AsInt64 := dsLAN['VLAN_ID'];
          end
          else
            dsVlans.SQLs.SelectSQL.Add(' and oc.house_id = :House_Id ');
        end;
        dsVlans.SQLs.SelectSQL.Add('order by finded, NAME_IP');
        dsVlans.ParamByName('HOUSE_ID').AsInt64 := aCI.HOUSE_ID;
        dsVlans.Open;

        ActiveControl := eIP;
        dsLAN.Edit;
        CheckPort();
      end;

      if ShowModal = mrOk then
      begin
        if IsDocSYS then
        begin
          dsLAN['EQ_ID'] := CreateOrMoveEquipment();
        end;
        dsLAN['CUSTOMER_ID'] := aCI.CUSTOMER_ID;
        dsLAN.Post;
        Result := True;
      end;
    finally
      free;
    end;
end;

procedure TCustomerLanForm.dbleEquipmentChange(Sender: TObject);
begin
  dbleEquipment.EditButtons[0].Visible := (dbleEquipment.Text.IsEmpty) and FCanEditEqpmnt;
  dbleEquipment.EditButtons[1].Visible := (not dbleEquipment.Text.IsEmpty) and FCanEditEqpmnt;
end;

procedure TCustomerLanForm.dbleEquipmentDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if dsEQ['FINDED'] = 1 then
    AFont.Color := dbleVLAN.Font.Color
  else
    AFont.Color := clGray;
end;

procedure TCustomerLanForm.dbleVLANDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if dsVlans['FINDED'] = 1 then
    AFont.Color := dbleVLAN.Font.Color
  else
    AFont.Color := clGray;
end;

procedure TCustomerLanForm.eMACEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TCustomerLanForm.eMACExit(Sender: TObject);
var
  s: string;
begin
  s := ValidateMAC(eMAC.Text);
  if s <> '' then
    eMAC.Text := s;

  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
end;

procedure TCustomerLanForm.ePortExit(Sender: TObject);
begin
  CheckPort();
end;

procedure TCustomerLanForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsVlans.Active then
    dsVlans.Close;
  if dsPort.Active then
    dsPort.Close;
  if dsEQ.Active then
    dsEQ.Close;
  if dsHomes.Active then
    dsHomes.Close;
  if dsStreets.Active then
    dsStreets.Close;
end;

procedure TCustomerLanForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TCustomerLanForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := True;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure TCustomerLanForm.FormShow(Sender: TObject);
begin
  FModemID := -1;
  FCanEditEqpmnt := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment);
  FCanEditPort := FCanEditEqpmnt;
  FCanEditPort := FCanEditPort or dmMain.AllowedAction(rght_Comm_Equipment_Ports);
  FDocSYS := (dmMain.GetSettingsValue('LAN_DOCSYS') = '1') and (dsLAN.State = dsInsert);
  FVlanDisabled := (not FDocSYS) and (dmMain.GetSettingsValue('LAN_VALANDISABLE') = '1');
  FPortDictDisable := (FDocSYS) or (dmMain.GetSettingsValue('LAN_PORTDICTDISABLE') = '1');

  pnlEthernet.Visible := not FDocSYS;
  pnlDocSYS.Visible := FDocSYS;

  dbleEquipmentChange(Sender);

  lcbPort.EditButtons.Items[0].Visible := FCanEditPort;

  dbleVLAN.Enabled := (not FVlanDisabled);

  if (dsLAN.State = dsInsert) and (not VarIsNull(dbleVLAN.Value)) then
  begin
    actFindIP.Execute;
    eMAC.SetFocus;
  end;

  lcbPort.Visible := not FPortDictDisable;
  edtPort.Visible := FPortDictDisable;
  if FPortDictDisable then
  begin
    edtPort.Left := dbleEquipment.Left;
    edtPort.Width := dbleEquipment.Width;
    edtPort.TabOrder := 1;
  end
  else
  begin
    lcbPort.Left := dbleEquipment.Left;
    lcbPort.Width := dbleEquipment.Width;
    lcbPort.TabOrder := 1;
  end;

  actGetIpv6.Visible := (dmMain.GetSettingsValue('IPV6GETURL') <> '');

  if (dmMain.GetSettingsValue('LAN_ADDRES') = '1') then
  begin
    pnlAddres.Visible := True;
    mmoNOTICE.Top := pnlAddres.Top + pnlAddres.Height + 4;
  end
  else
  begin
    pnlAddres.Visible := False;
    mmoNOTICE.Top := edtTAG.Top + edtTAG.Height + 4;
  end;
  mmoNOTICE.Height := OkCancelFrame.Top - 8;

  if pnlAddres.Visible then
    pnlAddres.Top := 1000;
  if pnlEthernet.Visible then
    pnlEthernet.Top := 1000;
  if pnlDocSYS.Visible then
    pnlDocSYS.Top := 1000;
  if pnlMain.Visible then
    pnlMain.Top := 1000;

  CheckTagList;
end;

procedure TCustomerLanForm.eIPExit(Sender: TObject);
begin
  if (Sender as TDBEditEh).Text = '' then
    Exit;
  (Sender as TDBEditEh).Text := ReplaceStr((Sender as TDBEditEh).Text, ',', '.');
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
end;

function TCustomerLanForm.CheckIP(const ip: String; const VLAN_ID: Integer = -1): string;
begin
  Result := '';
  if ip = '' then
    Exit;

  with TpFIBQuery.Create(Nil) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select c.Account_No, Ip, Mac';
      sql.Add(' from Tv_Lan t inner join customer c on (t.Customer_Id = c.Customer_Id)');
      sql.Add(' where t.Ip = :ip');

      if VLAN_ID <> -1 then
      begin
        sql.Add('and t.VLAN_Id = :VLAN_id');
        ParamByName('VLAN_id').AsInteger := VLAN_ID;
      end
      else
      begin
        sql.Add('and t.VLAN_Id is null');
      end;

      if dsLAN.State in [dsEdit] then
      begin
        sql.Add('and t.Lan_Id <> :lan_id');
        ParamByName('Lan_id').AsInteger := dsLAN.ParamByName('Lan_ID').AsInt64;
      end;

      ParamByName('ip').asString := ip;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Account_No').IsNUll then
        Result := Result + rsACCOUNT + ' ' + FieldByName('Account_No').Value + ' ';
      if not FieldByName('Ip').IsNUll then
        Result := Result + ' IP ' + FieldByName('Ip').Value + ' ';
      if not FieldByName('Mac').IsNUll then
        Result := Result + ' MAC ' + FieldByName('Mac').Value + ' ';
      Close;
      Transaction.Commit;
    finally
      free;
    end;
end;

function TCustomerLanForm.CheckUniqMAC(const MAC: String): string;
begin
  Result := '';
  if MAC = '' then
    Exit;

  with TpFIBQuery.Create(Nil) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select c.Account_No, Ip, Mac';
      sql.Add(' from Tv_Lan t inner join customer c on (t.Customer_Id = c.Customer_Id)');
      sql.Add(' where t.Mac = :Mac');

      if dsLAN.State in [dsEdit] then
      begin
        sql.Add('and t.Lan_Id <> :lan_id');
        ParamByName('Lan_id').AsInteger := dsLAN.ParamByName('Lan_ID').AsInt64;
      end;
      ParamByName('Mac').asString := MAC;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Account_No').IsNUll then
        Result := Result + rsACCOUNT + ' ' + FieldByName('Account_No').Value + ' ';
      if not FieldByName('Ip').IsNUll then
        Result := Result + ' IP ' + FieldByName('Ip').Value + ' ';
      if not FieldByName('Mac').IsNUll then
        Result := Result + ' MAC ' + FieldByName('Mac').Value + ' ';
      Close;
      Transaction.Commit;
    finally
      free;
    end;
end;

procedure TCustomerLanForm.CheckPort();
var
  EQ_ID: Integer;
  PORT: String;
  Result: string;
begin
  if ((lcbPort.Text = '') or (dbleEquipment.Text = '')) then
    Exit;

  Result := '';
  EQ_ID := dbleEquipment.Value;
  PORT := lcbPort.Value;

  if (dsPort.Lookup('PORT', PORT, 'P_STATE') = 3) then
    Result := PORT + ' - служебный порт';
  if Result <> '' then
  begin
    Result := rsWarningPort + #13#10 + Result;
    cnError.SetError(lcbPort, Result, iaMiddleLeft, bsNeverBlink);
    Exit;
  end;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select 0 OT, c.Account_No as Account_No, t.Ip';
      sql.Add('from Tv_Lan t inner join customer c on (t.Customer_Id = c.Customer_Id)');
      sql.Add('where t.Eq_Id = :EQ and t.Port = :PT');

      if not dsLAN.FieldByName('Lan_ID').IsNUll then
      begin
        sql.Add('and t.Lan_Id <> :lan_id');
        ParamByName('Lan_id').AsInteger := dsLAN.FieldByName('Lan_ID').AsInteger;
      end;
      sql.Add('union');
      sql.Add('select 1 OT, e.Name as Account_No, e.Ip');
      sql.Add('from Equipment e where e.Parent_Id = :EQ and e.Parent_Port = :PT');
      ParamByName('EQ').AsInteger := EQ_ID;
      ParamByName('PT').asString := PORT;
      Transaction.StartTransaction;
      ExecQuery;
      while not EOF do
      begin
        if not FieldByName('Account_No').IsNUll then
        begin
          case FieldByName('OT').AsInteger of
            0:
              Result := Result + rsACCOUNT + ': ' + FieldByName('Account_No').Value + ' ';
          else
            Result := Result + rsEQUIPMENT + ': ' + FieldByName('Account_No').Value + ' ';
          end;
        end;
        if not FieldByName('Ip').IsNUll then
          Result := Result + ' IP ' + FieldByName('Ip').Value + ' ';
        Result := Result + #13#10;
        Next;
      end;
      Close;
      Result := Result.Trim;
      Transaction.Commit;
    finally
      free;
    end;
  end;

  if Result <> '' then
  begin
    Result := rsWarningPort + #13#10 + Result;
    cnError.SetError(lcbPort, Result, iaMiddleLeft, bsNeverBlink);
  end
  else
  begin
    if (not dsPort.FieldByName('P_STATE').IsNUll) and (dsPort['P_STATE'] = 0) then
    begin
      cnError.SetError(lcbPort, rsPORTdefective, iaMiddleLeft, bsNeverBlink);
    end
    else
      cnError.Dispose(lcbPort);
  end;
end;

procedure TCustomerLanForm.OkCancelFrame1bbCancelClick(Sender: TObject);
begin
  dsLAN.Cancel;
end;

procedure TCustomerLanForm.actAddPortExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
begin
  inherited;

  if (dsEQ.RecordCount = 0) or (not FCanEditPort) then
    Exit;

  if (lcbPort.Text.IsEmpty) or (VarIsNull(lcbPort.Value)) then
  begin
    EQ.id := dsEQ.FieldByName('Eid').AsInteger;
    if not dsEQ.FieldByName('Name').IsNUll then
      EQ.Name := dsEQ.FieldByName('Name').asString;
    if not dsEQ.FieldByName('Ip').IsNUll then
      EQ.ip := dsEQ.FieldByName('Ip').asString;
    if not dsEQ.FieldByName('Mac').IsNUll then
      EQ.MAC := dsEQ.FieldByName('Mac').asString;
    EQ.Node_Id := GetNodeID;

    if CreatePort(EQ) then
      dsPort.CloseOpen(True);
  end
  else
    actEditPort.Execute;
end;

procedure TCustomerLanForm.actEditPortExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  PORT: string;
begin
  inherited;

  if (dsEQ.RecordCount = 0) or (not FCanEditPort) or (lcbPort.Text.IsEmpty) then
    Exit;

  PORT := lcbPort.Value;
  EQ.id := dsEQ.FieldByName('Eid').AsInteger;
  if not dsEQ.FieldByName('Name').IsNUll then
    EQ.Name := dsEQ.FieldByName('Name').asString;
  if not dsEQ.FieldByName('Ip').IsNUll then
    EQ.ip := dsEQ.FieldByName('Ip').asString;
  if not dsEQ.FieldByName('Mac').IsNUll then
    EQ.MAC := dsEQ.FieldByName('Mac').asString;
  EQ.Node_Id := GetNodeID;

  if EditPort(EQ, PORT) then
  begin
    // dsPort.CloseOpen(True);
    dsPort.Refresh;
  end;
end;

procedure TCustomerLanForm.actGetIpv6Execute(Sender: TObject);
begin
  IPv6Get;
end;

procedure TCustomerLanForm.actLanHttpExecute(Sender: TObject);
var
  s: string;
begin
  if eIP.Text.IsEmpty then
    Exit;

  s := 'http://' + eIP.Text;
  atrCmdUtils.ShellExecute(application.MainForm.Handle, 'open', s, '', '', SW_SHOW);
end;

procedure TCustomerLanForm.ActLanPingExecute(Sender: TObject);
var
  s: string;
begin
  if eIP.Text.IsEmpty then
    Exit;

  s := eIP.Text;
  atrCmdUtils.ShellExecute(application.MainForm.Handle, 'open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
end;

procedure TCustomerLanForm.actLanTelnetExecute(Sender: TObject);
var
  s: string;
begin
  if eIP.Text.IsEmpty then
    Exit;

  s := eIP.Text;
  atrCmdUtils.ShellExecute(application.MainForm.Handle, 'open', 'telnet', s, '', SW_SHOW);
end;

procedure TCustomerLanForm.btn1Click(Sender: TObject);
begin
  GenerateLANPopUp;
  // pmLanPopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

function TCustomerLanForm.CheckData: Integer;
var
  vErrors: Boolean;
  s: string;
  EmptyIP_MAC_PORT: Boolean;
  vid: Integer;
begin
  vErrors := False;
  Result := 0;
  // проверим IP в базе
  if VarIsNumeric(dbleVLAN.Value) then
    vid := dbleVLAN.Value
  else
    vid := -1;

  s := CheckIP(eIP.Text, vid);
  if s <> '' then
  begin
    // если такой ип есть сообщим где
    cnError.SetError(eIP, s, iaMiddleLeft, bsNeverBlink);
    eIP.SetFocus;
    vErrors := True;
  end
  else
  begin
    if (not dbleVLAN.Text.IsEmpty) and (eIP.Text.IsEmpty) then
    begin
      cnError.SetError(eIP, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
      eIP.SetFocus;
      vErrors := True;
    end
    else
    begin
      cnError.Dispose(eIP);
    end;
  end;

  if (ValidateMAC(eMAC.Text) = '') and (eMAC.Text <> '') then
  begin
    cnError.SetError(eMAC, rsMACIncorrect, iaMiddleLeft, bsNeverBlink);
    eMAC.SetFocus;
    vErrors := True;
  end
  else
  begin
    s := CheckUniqMAC(eMAC.Text);
    if s <> '' then
    begin
      cnError.SetError(eMAC, s, iaMiddleLeft, bsNeverBlink);
      eMAC.SetFocus;
      vErrors := True;
    end
    else
      cnError.Dispose(eMAC);
  end;

  cnError.Dispose(cbbTagList);
  if (cbbTagList.Visible) then
  begin
    if (VarIsNull(cbbTagList.Value)) or (cbbTagList.KeyItems.IndexOf(cbbTagList.Text) < 0) then
    begin
      cnError.SetError(cbbTagList, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
      vErrors := True;
    end;
  end;

  // запрет пустого MAC если это DocSYS
  // if ((dmMain.GetSettingsValue('LAN_DELEQPMNT') = '1') and (eMAC.Text.IsEmpty)) then
  // begin
  // cnError.SetError(eMAC, rsMACIncorrect, iaMiddleLeft, bsNeverBlink);
  // eMAC.SetFocus;
  // vErrors := True;
  // end;

  // проверим влан
  if ((dmMain.GetSettingsValue('VLAN_REQUIRED') = '1') and (not VarIsNumeric(dbleVLAN.Value))) then
  begin
    cnError.SetError(dbleVLAN, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    dbleVLAN.SetFocus;
    vErrors := True;
  end
  else
    cnError.Dispose(dbleVLAN);

  // хоть что-то должно быть заполнено
  EmptyIP_MAC_PORT := (eIPv6.Text = '') and (eIP.Text = '') and (eMAC.Text = '') and
    ((lcbPort.Text = '') or (dbleEquipment.Text = ''));
  if EmptyIP_MAC_PORT then
  begin
    cnError.SetError(OkCancelFrame.bbOk, rsLANIncorrect, iaMiddleLeft, bsNeverBlink);
    vErrors := True;
  end
  else
    cnError.Dispose(OkCancelFrame.bbOk);

  if pnlDocSYS.Visible then
  begin
    if (edtModem.Text.IsEmpty) then
    begin
      cnError.SetError(edtModem, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
      vErrors := True;
      edtModem.Text := 'Модем DOCSIS 2.0-' + edtMACmodem.Text;
    end
    else
    begin
      cnError.Dispose(edtModem);
    end;

    if (edtMACmodem.Text.IsEmpty) then
    begin
      cnError.SetError(edtMACmodem, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
      vErrors := True;
    end
    else
    begin
      cnError.Dispose(edtMACmodem);
    end;

    if (edtIPmodem.Text.IsEmpty) then
    begin
      cnError.SetError(edtIPmodem, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
      vErrors := True;
    end
    else
    begin
      cnError.Dispose(edtIPmodem);
    end;
  end;

  if (not vErrors) then
  begin
    if (CheckWarnings()) then
      Result := 2
    else
      Result := 1;
  end;
end;

function TCustomerLanForm.CheckWarnings(): Boolean;
begin
  Result := False;
  FWarnings := '';
  if (not dbleVLAN.Text.IsEmpty) then
  begin
    if not CheckVlanForHouse(dbleVLAN.Value, FCI.HOUSE_ID) then
    begin
      // EP_WARNING
      cnError.SetError(dbleVLAN, rsVlanHouse, iaMiddleLeft, bsNeverBlink).IconType := EP_WARNING;
      FWarnings := FWarnings + rsVlanHouse + rsEOL;
      Result := True;
    end
  end
  else
    cnError.Dispose(dbleVLAN);

  if (not dbleVLAN.Text.IsEmpty) and (not eIP.Text.IsEmpty) then
  begin
    if not CheckIPForVlan(eIP.Text, dbleVLAN.Value) then
    begin
      cnError.SetError(eIP, rsIpVlan, iaMiddleLeft, bsNeverBlink).IconType := EP_WARNING;
      FWarnings := FWarnings + rsIpVlan + rsEOL;
      Result := True;
    end
  end
  else
    cnError.Dispose(eIP);

  // ЛТВ проверяем
  if (dmMain.GetSettingsValue('LAN_VALANDISABLE') = '1') then
  begin
    if (dsPort.FieldByName('Wid').IsNUll) or (dsPort['Wlabel'] = '') then
    begin
      cnError.SetError(lcbPort, rsNotWireLabel, iaMiddleLeft, bsNeverBlink).IconType := EP_WARNING;
      FWarnings := FWarnings + rsNotWireLabel + rsEOL;
      Result := True;
    end
    else
      cnError.Dispose(lcbPort);
  end;
end;

procedure TCustomerLanForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  case CheckData() of
    1:
      begin // нет ошибок
        CheckModemMac();
        ModalResult := mrOk;
      end;
    2: // нет ошибок, но есть предупреждения
      begin
        FWarnings := FWarnings + rsEOL + rsWarningQuestStop;
        if (MessageDlg(FWarnings, mtWarning, [mbYes, mbNo], 0) = mrNo) then
          // if (MessageBox(0, PChar(FWarnings), PChar('Внимание'), MB_ICONWARNING or MB_OKCANCEL or MB_DEFBUTTON3) = idOk)
          ModalResult := mrOk;
      end;
  end;
end;

procedure TCustomerLanForm.edtIPmodemEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s: string;
begin
  s := dmMain.GetNextIP(False, edtIPmodem.Text);

  edtIPmodem.Text := s;

  edtIPmodem.SetFocus;
end;

procedure TCustomerLanForm.edtIPmodemEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TCustomerLanForm.edtMACmodemEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TCustomerLanForm.edtMACmodemExit(Sender: TObject);
begin
  CheckModemMac();
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
end;

procedure TCustomerLanForm.eIPEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s: string;
begin
  // if ()dsEQ
  if dbleVLAN.Text <> '' then
    s := dmMain.GetNextVlanIP(dbleVLAN.KeyValue, True)
  else
  begin
    if dbleEquipment.Text <> '' then
      s := dmMain.GetNextVlanIP(dbleEquipment.KeyValue, False)
    else
      s := dmMain.GetNextIP(False, eIP.Text);
  end;

  eIP.Text := s;
  s := dmMain.IpInfo(s);

  if s.IsEmpty then
    cnError.Dispose(eIP)
  else
    cnError.SetError(eIP, s, iaMiddleLeft, bsNeverBlink);

  Handled := True;
  // eIP.SetFocus;
end;

procedure TCustomerLanForm.dbleEquipmentEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  eid: Integer;
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    Exit;

  eid := -1;
  if VarIsNull(dbleEquipment.Value) then
  begin
    eid := EditEquipment(eid, FCI, 1);
    if eid <> -1 then
    begin
      dsEQ.CloseOpen(True);
      dbleEquipment.Value := eid;
    end;
  end;
  Handled := True;
end;

procedure TCustomerLanForm.dbleEquipmentEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  eid: Integer;
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    Exit;

  if not VarIsNull(dbleEquipment.Value) then
  begin
    eid := dbleEquipment.Value;
    EditEquipment(eid, FCI, 1);
  end;
  Handled := True;
end;

procedure TCustomerLanForm.dbleEquipmentExit(Sender: TObject);
begin
  CheckPort();
end;

procedure TCustomerLanForm.eIPEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TCustomerLanForm.eIPv6Exit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
end;

procedure TCustomerLanForm.eIPv6Enter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TCustomerLanForm.GenerateLANPopUp;
var
  NewItem: TMenuItem;
  rCursor: TPoint;
begin
  // if dsLAN.RecordCount = 0 then
  // Exit;
  pmLanPopUp.Items.Clear;
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Caption := 'Ping IP';
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
  if VarIsNumeric(dbleEquipment.Value) then
  begin
    with dmMain.qRead do
    begin
      sql.Clear;
      sql.Add('select distinct * ');
      sql.Add('  from (select ec.ec_id, ec.name, ec.command ');
      sql.Add('          from equipment_cmd_grp ec');
      sql.Add('               left outer join equipment e on (ec.eg_id = e.eq_group)');
      sql.Add('          where ec.in_gui = 1 and e.eid = :eq_id');
      sql.Add('        union');
      sql.Add('        select ec.ec_id, ec.name , ec.command');
      sql.Add('          from equipment_cmd_grp ec');
      sql.Add('          where ec.in_gui = 1 and ec.Eg_Id = -1)');
      sql.Add('  order by name');
      ParamByName('eq_id').AsInteger := dbleEquipment.Value;
      Transaction.StartTransaction;
      ExecQuery;
      while not EOF do
      begin
        NewItem := TMenuItem.Create(pmLanPopUp);
        NewItem.Caption := FieldByName('name').asString;
        NewItem.Tag := FieldByName('ec_id').AsInteger;
        NewItem.OnClick := miLanClickClick;
        pmLanPopUp.Items.Add(NewItem);
        Next;
      end;
      Close;
      Transaction.Rollback;
    end;
  end;

  if pmLanPopUp.Items.Count > 0 then
  begin
    GetCursorPos(rCursor);
    pmLanPopUp.Popup(rCursor.X, rCursor.Y);
  end;
end;

procedure TCustomerLanForm.lcbHOUSE_IDChange(Sender: TObject);
begin
  if not dsEQ.Active then
    Exit;

  dsEQ.Close;
  if dsHomes.FieldByName('HOUSE_ID').IsNUll then
    dsEQ.ParamByName('HOUSE_ID').Clear
  else
    dsEQ.ParamByName('HOUSE_ID').AsInteger := dsHomes['HOUSE_ID'];
  dsEQ.Open;
  dsPort.CloseOpen(True);
end;

procedure TCustomerLanForm.lcbPortChange(Sender: TObject);
begin
  if (dsLAN.State = dsInsert) or (FVlanDisabled) then
  begin
    if (not dsPort.FieldByName('VLAN_ID').IsNUll) then
    begin
      dbleVLAN.Enabled := not FVlanDisabled;
      dbleVLAN.Value := dsPort['VLAN_ID'];
      // если не нашли сеть, то перечитаем из базы
      if ((dbleVLAN.Text = '') and (dmMain.GetSettingsValue('LAN_VALAN4HOME') = '1')) then
      begin
        if dsVlans.Active then
        begin
          dsVlans.Close;
          dsVlans.ParamByName('VID').AsInt64 := dsPort['VLAN_ID'];
          dsVlans.Open;
        end;
      end;
    end
    else
      dbleVLAN.Enabled := True;
  end;
end;

procedure TCustomerLanForm.lcbPortDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  s: string;
begin
  Background := clWindow;
  if not dsPort.FieldByName('CON').IsNUll then
  begin
    if (not dsPort.FieldByName('CON_ID').IsNUll) and (dsPort['CON_ID'] = FCI.CUSTOMER_ID) then
    begin
      AFont.Style := [fsBold];
    end
    else
    begin
      AFont.Style := [fsItalic];
      AFont.Color := clGray;
      Background := clBtnShadow;
    end;
  end;
  if (not dsPort.FieldByName('P_STATE').IsNUll) then
  begin
    if (dsPort['P_STATE'] = 0) then
    begin
      if ((Column.FieldName = 'PORT') or (Column.FieldName = 'SPEED')) then
      begin
        AFont.Style := [fsStrikeOut];
        Background := clBtnShadow;
      end
    end
    else if (dsPort['P_STATE'] = 3) then
    begin
      AFont.Style := [fsBold];
      Background := clBtnShadow;
    end
    else if (dsPort['P_STATE'] > 1) then
    begin
      AFont.Style := [fsItalic];
      Background := clBtnShadow;
    end
    else if ((dsPort.FieldByName('CON').IsNUll) and (dsPort['whose'] <> '')) then
    begin
      Background := clRed;
    end;
  end;
  if not(dsPort.FieldByName('COLOR').IsNUll) then
  begin
    s := dsPort['COLOR'];
    if not s.IsEmpty then
      Background := StringToColor(s);
  end;
end;

procedure TCustomerLanForm.lcbPortExit(Sender: TObject);
begin
  CheckPort();
end;

procedure TCustomerLanForm.miLanClickClick(Sender: TObject);
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
  end;

begin
  if not(Sender is TMenuItem) then
    Exit;

  if not VarIsNumeric(dbleEquipment.Value) then
    Exit;

  C_IP := eIP.Text;

  if (not eMAC.Text.IsEmpty) then
    C_MAC := eMAC.Text;

  C_TAG := edtTAG.Text;
  C_TAGSTR := edtTAGSTR.Text;
  if not lcbPort.Text.IsEmpty then
    C_PORT := lcbPort.Value
  else
    C_PORT := '';
  C_VLAN := '';

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command, e.ip, e.mac, e.e_admin, e.e_pass, ec.eol_chrs');
    sql.Add(' , ec.CMD_TYPE, ec.URL, ec.AUT_USER, ec.AUT_PSWD');
    sql.Add('from equipment e');
    sql.Add('  inner join equipment_cmd_grp ec');
    sql.Add('       on ((ec.eg_id = e.eq_group or ec.eg_id = -1) and ec.ec_id = :ec_id )');
    sql.Add('where e.eid = :eq_id');
    eol_chars := (Sender as TMenuItem).Tag;
    ParamByName('ec_id').AsInteger := eol_chars;
    eol_chars := dbleEquipment.Value;
    ParamByName('eq_id').AsInteger := eol_chars;
    dbleEquipment.Value;
    Transaction.StartTransaction;
    ExecQuery;
    if FieldByName('ip').IsNUll then
      Host := ''
    else
      Host := FieldByName('ip').asString;

    if FieldByName('e_admin').IsNUll then
      user := ''
    else
      user := FieldByName('e_admin').asString;

    if FieldByName('e_pass').IsNUll then
      pswd := ''
    else
      pswd := FieldByName('e_pass').asString;

    H_MAC := '';
    if (not FieldByName('mac').IsNUll) then
    begin
      H_MAC := FieldByName('mac').asString;
    end;

    if FieldByName('command').IsNUll then
      cmd := ''
    else
      cmd := FieldByName('command').asString;
    if FieldByName('eol_chrs').IsNUll then
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

    if FieldByName('CMD_TYPE').IsNUll then
      CMD_TYPE := 0
    else
      CMD_TYPE := FieldByName('CMD_TYPE').AsInteger;
    if not FieldByName('URL').IsNUll then
      URL := FieldByName('URL').asString;
    if not FieldByName('AUT_USER').IsNUll then
      AUT_USER := FieldByName('AUT_USER').asString;
    if not FieldByName('AUT_PSWD').IsNUll then
      AUT_PSWD := FieldByName('AUT_PSWD').asString;

    Close;
    Transaction.Rollback;
  end;

  if cmd <> '' then
    replaceParams(cmd);

  if URL <> '' then
    replaceParams(URL);

  case CMD_TYPE of
    2:
      cmd := GetHtml(URL, AUT_USER, AUT_PSWD, cmd, True, (Sender as TMenuItem).Caption);
  else
    if cmd <> '' then
      cmd := telnet(Host, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, True);
  end;
end;

function TCustomerLanForm.CheckIPForVlan(const ip: String; const VLAN_ID: Integer = -1): Boolean;
begin
  Result := True;
  if (ip = '') or (VLAN_ID = -1) then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select count(V_Id) cnt from Vlans v';
      sql.Add('where V_Id = :VLAN_ID and Inet_Aton(:IP) between v.Ip_Begin_Bin and v.Ip_End_Bin');
      ParamByName('VLAN_id').AsInteger := VLAN_ID;
      ParamByName('ip').asString := ip;
      Transaction.StartTransaction;
      ExecQuery;
      Result := (FieldByName('cnt').AsInteger = 1);
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

function TCustomerLanForm.CheckVlanForHouse(const VLAN_ID: Integer; const HOUSE_ID: Integer): Boolean;
begin
  Result := True;
  if (VLAN_ID = -1) or (HOUSE_ID = -1) then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select count(c.House_Id) H_COUNT, sum(iif((c.House_Id = :HOUSE_ID), 1, 0)) H_FINDED';
      sql.Add(' from objects_coverage c where c.oc_type = 2 and c.o_id = :VLAN_ID');

      ParamByName('VLAN_ID').AsInteger := VLAN_ID;
      ParamByName('HOUSE_ID').AsInteger := HOUSE_ID;

      Transaction.StartTransaction;
      ExecQuery;
      Result := (FieldByName('H_COUNT').AsInteger = 0);
      if (not Result) then
      begin
        if not FieldByName('H_FINDED').IsNUll then
          Result := (FieldByName('H_FINDED').AsInteger > 0)
        else
          Result := False;
      end;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

function TCustomerLanForm.GetNodeID: Integer;
begin
  Result := -1;
  with TpFIBQuery.Create(Nil) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select first 1 n.Node_Id';
      sql.Add(' from customer c ');
      sql.Add(' inner join node_flats f on (f.House_Id = c.House_Id and f.Flat_No = c.flat_no) ');
      sql.Add(' inner join nodes n on (n.Node_Id = f.Node_Id) ');
      sql.Add(' where c.Customer_Id = :CID ');
      ParamByName('CID').AsInt64 := FCI.CUSTOMER_ID;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Node_Id').IsNUll then
        Result := FieldByName('Node_Id').Value;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
end;

procedure TCustomerLanForm.DBLookupComboboxClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;
  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
end;

procedure TCustomerLanForm.IPv6Get;
var
  s, URL, body: string;
  i: Integer;
  JO: TJsonObject;
  Params: TStringList;

  function DownloadFile(const URL: string; const Post: string): String;
  var
    HTTPClient: THTTPSend;
    strStream: TStringStream;
    res: Boolean;
    UTF8: UTF8String;
  begin
    Result := '';
    HTTPClient := THTTPSend.Create;
    HTTPClient.Timeout := 1000000;
    strStream := TStringStream.Create;
    try
      if (Post <> '') then
      begin
        UTF8 := UTF8String(Post);
        if UTF8 <> '' then
          HTTPClient.Document.WriteBuffer(UTF8[1], Length(UTF8));
        HTTPClient.MimeType := 'application/json';
        res := HTTPClient.HTTPMethod('POST', URL);
      end
      else
      begin
        res := HTTPClient.HTTPMethod('GET', URL);
      end;

      if res then
      begin
        if Pos('200 OK', HTTPClient.Headers.Text) <> 0 then
        begin
          HTTPClient.Document.SaveToStream(strStream);
          Result := strStream.DataString;
        end;
      end
      else
        ShowMessage(rsDownloadError);
    finally
      strStream.free;
      HTTPClient.free;
    end;
  end;

begin

  //
  // параметры <customer_id> <lan_id>
  // <e_admin> <e_pass> <e_mac> <e_mac_h> <e_mac_d> <e_mac_j> <e_ip>
  // <c_ip> <c_mac> <c_mac_h> <c_mac_d> <c_mac_j> <c_port> <c_vlan> <c_tag> <c_tagstr>
  // возврат <ipv6> <tag_str>

  s := dmMain.GetSettingsValue('IPV6GETURL');
  if (Pos('^', s) > 0) then
  begin
    URL := Copy(s, 1, Pos('^', s) - 1);
    URL := ReplaceCmdParams(URL);
    body := Copy(s, Pos('^', s) + 1, 1000);
    body := ReplaceCmdParams(body);
  end
  else
  begin
    URL := ReplaceCmdParams(s);
    body := '';
  end;

  s := DownloadFile(URL, body);
  s := s.Trim;
  if (s.StartsWith('{') and s.EndsWith('}')) then
  begin
    // json вида {'ipv6':'eeeee', 'tag_str':'dddddd'}
    JO := TJsonObject.Parse(s) as TJsonObject;
    try
      if JO.Contains('ipv6') then
      begin
        if not JO['ipv6'].IsNUll then
          eIPv6.Text := JO.s['ipv6'];
      end;
      if JO.Contains('tag_str') then
      begin
        if not JO['tag_str'].IsNUll then
          edtTAGSTR.Text := JO.s['tag_str'];
      end;
    finally
      JO.free;
    end;
  end
  else
  begin
    // текст парам=значение&парам1=значение1..
    Params := TStringList.Create;
    try
      Params.Delimiter := '&';
      Params.StrictDelimiter := True;
      Params.DelimitedText := s;

      for i := 0 to Params.Count - 1 do
      begin
        // Params.Strings[i] := StringReplace(Params.Strings[i], '+', ' ', [rfReplaceAll]);
        Params.Strings[i] := string(DecodeURL(Params.Strings[i]));
      end;

      eIPv6.Text := Params.Values['ipv6'];
      edtTAGSTR.Text := Params.Values['tag_str'];
    finally
      Params.free;
    end;
  end;
end;

function TCustomerLanForm.ReplaceCmdParams(const InputCMD: String): String;
var
  InStr: string;
  H_IP, H_IPv6: string;
  user: string;
  pswd: string;
  H_MAC, C_IP, C_MAC, C_PORT, C_VLAN: string;
  C_TAG, C_TAGSTR: string;
  // cmd: string;
  id: Integer;
  // URL, AUT_USER, AUT_PSWD: String;

begin
  InStr := InputCMD;

  C_IP := eIP.Text;

  if (not eMAC.Text.IsEmpty) then
    C_MAC := eMAC.Text;

  C_TAG := edtTAG.Text;
  C_TAGSTR := edtTAGSTR.Text;
  if not lcbPort.Text.IsEmpty then
    C_PORT := lcbPort.Value
  else
    C_PORT := '';
  C_VLAN := '';

  if (InStr.Contains('<e_') and (not dbleEquipment.Text.IsEmpty)) then
  begin
    with dmMain.qRead do
    begin
      sql.Text := 'select e.ip, e.mac, e.e_admin, e.e_pass, IPV6 from equipment e where e.eid = :eq_id';

      id := dbleEquipment.Value;
      ParamByName('eq_id').AsInteger := id;

      Transaction.StartTransaction;
      ExecQuery;
      H_IP := IfThen(FieldByName('ip').IsNUll, '', FieldByName('ip').asString);
      H_IPv6 := IfThen(FieldByName('IPV6').IsNUll, '', FieldByName('IPV6').asString);
      user := IfThen(FieldByName('e_admin').IsNUll, '', FieldByName('e_admin').asString);
      pswd := IfThen(FieldByName('e_pass').IsNUll, '', FieldByName('e_pass').asString);
      H_MAC := IfThen(FieldByName('mac').IsNUll, '', FieldByName('mac').asString);

      Close;
      Transaction.Rollback;
    end;

    InStr := ReplaceStr(InStr, '<e_id>', id.ToString);
    InStr := ReplaceStr(InStr, '<e_admin>', user);
    InStr := ReplaceStr(InStr, '<e_pass>', pswd);
    InStr := ReplaceStr(InStr, '<e_mac>', H_MAC);
    InStr := ReplaceStr(InStr, '<e_mac_h>', H_MAC.Replace(':', '-'));
    InStr := ReplaceStr(InStr, '<e_mac_d>', H_MAC.Replace(':', '.'));
    InStr := ReplaceStr(InStr, '<e_mac_j>', FormatMACas4CD(H_MAC));
    InStr := ReplaceStr(InStr, '<e_ip>', H_IP);
    InStr := ReplaceStr(InStr, '<e_ipv6>', H_IPv6);

  end;

  H_MAC := eMAC.Text;
  H_IP := eIP.Text;
  H_IPv6 := eIPv6.Text;

  InStr := ReplaceStr(InStr, '<customer_id>', FCI.CUSTOMER_ID.ToString);
  InStr := ReplaceStr(InStr, '<c_ip>', H_IP);
  InStr := ReplaceStr(InStr, '<c_ipv6>', H_IPv6);
  InStr := ReplaceStr(InStr, '<c_mac>', H_MAC);
  InStr := ReplaceStr(InStr, '<c_mac_h>', H_MAC.Replace(':', '-'));
  InStr := ReplaceStr(InStr, '<c_mac_d>', H_MAC.Replace(':', '.'));
  InStr := ReplaceStr(InStr, '<c_mac_j>', FormatMACas4CD(H_MAC));
  InStr := ReplaceStr(InStr, '<c_port>', edtPort.Text);
  InStr := ReplaceStr(InStr, '<c_tag>', edtTAG.Text);
  InStr := ReplaceStr(InStr, '<c_tagstr>', edtTAGSTR.Text);
  if (dsLAN.RecordCount > 0) then
  begin
    InStr := ReplaceStr(InStr, '<lan_id>', IfThen(dsLAN.FieldByName('LAN_ID').IsNUll, '', dsLAN['LAN_ID']));
  end
  else
  begin
    InStr := ReplaceStr(InStr, '<lan_id>', '');
  end;
  If (dbleVLAN.Text.IsEmpty) then
    H_IP := ''
  else
    H_IP := dbleVLAN.Value;
  InStr := ReplaceStr(InStr, '<c_vlan>', H_IP);

  Result := InStr;
end;

procedure TCustomerLanForm.CheckModemMac();
var
  MAC: string;
  answer, ACCOUNTS: string;
  eid: Integer;
begin
  MAC := ValidateMAC(edtMACmodem.Text);
  if MAC <> '' then
    edtMACmodem.Text := MAC;

  eid := -1;
  answer := '';
  ACCOUNTS := '';
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select e.Eid, s.Street_Name, h.House_No';
      sql.Add(', (select list(c.Account_No) from tv_lan l inner join customer c on (c.Customer_Id = l.Customer_Id) where l.Eq_Id = e.Eid) ACCOUNTS');
      sql.Add('from Equipment e');
      sql.Add('  inner join house h on (h.House_Id = e.House_Id)');
      sql.Add('  inner join street s on (s.Street_Id = h.Street_Id)');
      sql.Add(' where e.Mac = :mac');
      if dsLAN.State in [dsEdit] then
      begin
        sql.Add('and not exists(select l.Lan_Id from Tv_Lan l where l.Lan_Id = :lan_id and l.Eq_Id = e.Eid)');
        ParamByName('Lan_id').AsInteger := dsLAN.ParamByName('Lan_ID').AsInt64;
      end;

      ParamByName('mac').asString := MAC;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Eid').IsNUll then
        eid := FieldByName('eid').Value;
      if not FieldByName('Street_Name').IsNUll then
        answer := answer + FieldByName('Street_Name').Value + ' ';
      if not FieldByName('House_No').IsNUll then
        answer := answer + ' ' + FieldByName('House_No').Value + ' ';
      if not FieldByName('ACCOUNTS').IsNUll then
        ACCOUNTS := FieldByName('ACCOUNTS').Value;

      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
  if (eid <> -1) and (FModemID <> eid) then
  begin
    if answer <> '' then
    begin
      if application.MessageBox(PChar('Моджем установлен на адресе ' + answer), 'Перенести модем',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        answer := '';
      end;
    end;

    if answer = '' then
      FModemID := eid;
  end;
end;

function TCustomerLanForm.CreateOrMoveEquipment(): Integer;
begin
  if FModemID <> -1 then
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.Text :=
          'execute block(pEQ_ID D_Integer=:pEQ_ID, pHouse_id D_Integer=:pHouse_id, PLACE VARCHAR(50)=:PLACE) as';
        sql.Add('begin');
        sql.Add('update tv_lan l set l.Eq_Id = null where l.Eq_Id = :pEQ_ID;');
        sql.Add('update Equipment e set e.House_Id = :pHouse_id, PLACE = :PLACE where e.Eid = :pEQ_ID;');
        sql.Add('end;');

        ParamByName('pEQ_ID').AsInteger := FModemID;
        ParamByName('pHouse_id').AsInteger := FCI.HOUSE_ID;
        ParamByName('PLACE').asString := FCI.FLAT_NO;
        Transaction.StartTransaction;
        ExecQuery;
        Close;
        Transaction.Commit;
      finally
        free;
      end;
    end;
  end
  else
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.Text := 'execute block (HOUSE_ID INTEGER = :HOUSE_ID, NAME VARCHAR(50) = :NAME, IP VARCHAR(15) = :IP,';
        sql.Add('MAC VARCHAR(18) = :MAC, PLACE VARCHAR(50) = :PLACE, SERIAL_N VARCHAR(100) = :SERIAL_N)');
        sql.Add('returns (EID INTEGER) as');
        sql.Add('declare variable EQ_GROUP INTEGER;');
        sql.Add('begin');
        sql.Add('EID = gen_id(gen_operations_uid, 1);');
        sql.Add('select first 1 O_ID FROM OBJECTS WHERE O_TYPE = 7 AND O_DELETED = 0 into :EQ_GROUP;');
        sql.Add('INSERT INTO EQUIPMENT(EID, HOUSE_ID, NAME, IP, MAC, EQ_TYPE, PLACE, SERIAL_N, EQ_GROUP)');
        sql.Add('VALUES(:EID, :HOUSE_ID, :NAME, :IP, :MAC, 1, :PLACE, :SERIAL_N, :EQ_GROUP);');
        sql.Add('suspend;');
        sql.Add('end;');

        ParamByName('HOUSE_ID').AsInteger := FCI.HOUSE_ID;
        ParamByName('NAME').asString := edtModem.Text;
        ParamByName('IP').asString := edtIPmodem.Text;
        ParamByName('MAC').asString := edtMACmodem.Text;
        ParamByName('PLACE').asString := FCI.FLAT_NO;
        ParamByName('SERIAL_N').asString := edtSerialModem.Text;
        Transaction.StartTransaction;
        ExecQuery;
        if not FieldByName('EID').IsNUll then
          FModemID := FieldByName('EID').Value;
        Close;
        Transaction.Commit;
      finally
        free;
      end;
    end;
  end;
  Result := FModemID;
end;

procedure TCustomerLanForm.CheckTagList;
var
  l: string;
begin
  l := dmMain.GetSettingsValue('LAN_TAG_LIST');
  if not l.IsEmpty then
  begin
    cbbTagList.Items.Clear;
    cbbTagList.KeyItems.Clear;
    cbbTagList.Items.DelimitedText := l;
    cbbTagList.KeyItems.DelimitedText := l;
    cbbTagList.Visible := True;
    cbbTagList.Top := edtTAGSTR.Top;
    cbbTagList.Left := edtTAGSTR.Left;
    cbbTagList.Width := edtTAGSTR.Width;
    edtTAGSTR.Visible := False;
  end

end;

end.
