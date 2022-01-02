unit CustomerLanForma;

interface

{$I defines.inc}

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants,
  System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Menus,
  VCL.Dialogs, VCL.StdCtrls, VCL.Mask, Data.DB, VCL.DBCtrls,
  VCL.Buttons, VCL.ActnList, System.Actions, VCL.ExtCtrls, System.UITypes,

  OkCancel_frame, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBGridEh,
  DBLookupEh, GridsEH, DM, PrjConst, CnErrorProvider, FIBDatabase,
  pFIBDatabase, A4onTypeUnit, EhlibFIB;

type
  TCustomerLanForm = class(TForm)
    OkCancelFrame: TOkCancelFrame;
    srcLan: TDataSource;
    dsLAN: TpFIBDataSet;
    GroupBox2: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    eMAC: TDBEditEh;
    Label1: TLabel;
    eIP: TDBEditEh;
    srcVLANS: TDataSource;
    dsVlans: TpFIBDataSet;
    lbl3: TLabel;
    dbleVLAN: TDBLookupComboboxEh;
    Label6: TLabel;
    dbleEquipment: TDBLookupComboboxEh;
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
    procedure dbleEquipmentChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure eIPEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dbleEquipmentEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure eIPEnter(Sender: TObject);
    procedure eIPv6Exit(Sender: TObject);
    procedure eIPv6Enter(Sender: TObject);
    procedure ActLanPingExecute(Sender: TObject);
    procedure actLanTelnetExecute(Sender: TObject);
    procedure actLanHttpExecute(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbleEquipmentExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcbHOUSE_IDChange(Sender: TObject);
    procedure dbleEquipmentEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure actAddPortExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbPortDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure lcbPortExit(Sender: TObject);
    procedure ePortExit(Sender: TObject);
    procedure actEditPortExecute(Sender: TObject);
    procedure lcbPortChange(Sender: TObject);
  private
    { Private declarations }
    fCI: TCustomerInfo;
    FCanEditPort: Boolean;
    FWarnings: string;
    function CheckData(): Integer;
    function CheckWarnings(): Boolean;
    function CheckIP(const ip: String; const VLAN_ID: Integer = -1): string;
    function CheckIPForVlan(const ip: String; const VLAN_ID: Integer = -1): Boolean;
    function CheckVlanForHouse(const VLAN_ID: Integer; const HOUSE_ID: Integer): Boolean;
    function CheckUniqMAC(const MAC: String): String;
    procedure CheckPort();
    procedure miLanClickClick(Sender: TObject);
    procedure GenerateLANPopUp;
  public
    { Public declarations }
    property CI: TCustomerInfo write fCI;
  end;

function EditCustomerLAN(const aCI: TCustomerInfo; aLan_ID: Int64): Boolean;

var
  CustomerLanForm: TCustomerLanForm;

implementation

uses
  MAIN, AtrCommon, AtrStrUtils, StrUtils, EquipEditForma,
  pFIBQuery, TelnetForma, atrCmdUtils, EQPort, HtmlForma;

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
      dsEQ.Open;
      dsPort.Open;

      if (dmMain.GetSettingsValue('LAN_VALAN4HOME') = '1') then
        dsVlans.SQLs.SelectSQL.Add('  and oc.house_id = :House_Id');
      dsVlans.SQLs.SelectSQL.Add('order by finded, NAME_IP');
      dsVlans.ParamByName('HOUSE_ID').AsInt64 := aCI.HOUSE_ID;
      dsVlans.Open;

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
        ActiveControl := eIP;
        dsLAN.Edit;
        CheckPort();
      end;

      if ShowModal = mrOk then
      begin
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
  if dbleEquipment.Text.IsEmpty then
  begin
    dbleEquipment.EditButtons.Items[0].Hint := rsAdd;
    dbleEquipment.EditButtons.Items[0].Visible := True and FCanEditPort;
    dbleEquipment.EditButtons.Items[1].Visible := False;
  end
  else
  begin
    dbleEquipment.EditButtons.Items[1].Hint := rsChange;
    dbleEquipment.EditButtons.Items[0].Visible := False;
    dbleEquipment.EditButtons.Items[1].Visible := True and FCanEditPort;
{$IFDEF NETLAND}
    // TODO:Нужно ли прописывать мак адрес от адреса модема?
    if (dsLAN.FieldByName('MAC').IsNull) and (not dsEQ.FieldByName('MAC').IsNull) and (dsLAN.State = dsInsert) then
    begin
      if CheckMAC(dsEQ['MAC']) then
        dsLAN.FieldByName('MAC').asString := IncMac(dsEQ['MAC']);
    end;
{$ENDIF}
  end;
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

procedure TCustomerLanForm.FormCreate(Sender: TObject);
begin
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
  if (Key = #13) then
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible;
    if (ActiveControl is TDBMemoEh) then
      go := False;
    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TCustomerLanForm.FormShow(Sender: TObject);
begin
  FCanEditPort := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment);

  dbleEquipment.EditButtons.Items[0].Visible := FCanEditPort;
  lcbPort.EditButtons.Items[0].Visible := FCanEditPort;

  if (dsLAN.State = dsInsert) and (not VarIsNull(dbleVLAN.Value)) then
  begin
    actFindIP.Execute;
    eMAC.SetFocus;
  end;
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
      if not FieldByName('Account_No').IsNull then
        Result := Result + rsACCOUNT + ' ' + FieldByName('Account_No').Value + ' ';
      if not FieldByName('Ip').IsNull then
        Result := Result + ' IP ' + FieldByName('Ip').Value + ' ';
      if not FieldByName('Mac').IsNull then
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
      if not FieldByName('Account_No').IsNull then
        Result := Result + rsACCOUNT + ' ' + FieldByName('Account_No').Value + ' ';
      if not FieldByName('Ip').IsNull then
        Result := Result + ' IP ' + FieldByName('Ip').Value + ' ';
      if not FieldByName('Mac').IsNull then
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
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select 0 OT, c.Account_No as Account_No, t.Ip';
      sql.Add('from Tv_Lan t inner join customer c on (t.Customer_Id = c.Customer_Id)');
      sql.Add('where t.Eq_Id = :EQ and t.Port = :PT');

      if not dsLAN.FieldByName('Lan_ID').IsNull then
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
        if not FieldByName('Account_No').IsNull then
        begin
          case FieldByName('OT').AsInteger of
            0:
              Result := Result + rsACCOUNT + ': ' + FieldByName('Account_No').Value + ' ';
          else
            Result := Result + rsEQUIPMENT + ': ' + FieldByName('Account_No').Value + ' ';
          end;
        end;
        if not FieldByName('Ip').IsNull then
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
    if (not dsPort.FieldByName('P_STATE').IsNull) and (dsPort['P_STATE'] = 0) then
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

  if (dsEQ.RecordCount = 0) then
    Exit;

  EQ.id := dsEQ.FieldByName('Eid').AsInteger;
  // if not dsEQ.FieldByName('Eq_Type').IsNull then
  // EQ.TypeID := dsEQ.FieldByName('Eq_Type').AsInteger;
  // if not dsEQ.FieldByName('eqgroup').IsNull then
  // EQ.TypeName := dsEQ.FieldByName('eqgroup').asString;
  if not dsEQ.FieldByName('Name').IsNull then
    EQ.Name := dsEQ.FieldByName('Name').asString;
  if not dsEQ.FieldByName('Ip').IsNull then
    EQ.ip := dsEQ.FieldByName('Ip').asString;
  if not dsEQ.FieldByName('Mac').IsNull then
    EQ.MAC := dsEQ.FieldByName('Mac').asString;
  // if not dsEQ.FieldByName('Notice').IsNull then
  // EQ.notice := dsEQ.FieldByName('Notice').asString;

  if CreatePort(EQ) then
    dsPort.CloseOpen(True);
end;

procedure TCustomerLanForm.actEditPortExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  PORT: string;
begin
  inherited;

  if (dsEQ.RecordCount = 0) then
    Exit;
  if (lcbPort.Text.IsEmpty) then
    Exit;

  PORT := lcbPort.Value;
  EQ.id := dsEQ.FieldByName('Eid').AsInteger;
  // if not dsEQ.FieldByName('Eq_Type').IsNull then
  // EQ.TypeID := dsEQ.FieldByName('Eq_Type').AsInteger;
  // if not dsEQ.FieldByName('eqgroup').IsNull then
  // EQ.TypeName := dsEQ.FieldByName('eqgroup').asString;
  if not dsEQ.FieldByName('Name').IsNull then
    EQ.Name := dsEQ.FieldByName('Name').asString;
  if not dsEQ.FieldByName('Ip').IsNull then
    EQ.ip := dsEQ.FieldByName('Ip').asString;
  if not dsEQ.FieldByName('Mac').IsNull then
    EQ.MAC := dsEQ.FieldByName('Mac').asString;
  // if not dsEQ.FieldByName('Notice').IsNull then
  // EQ.notice := dsEQ.FieldByName('Notice').asString;

  if EditPort(EQ, PORT) then
    dsPort.CloseOpen(True);
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

  // запрет пустого MAC если это DOCSYS
  if ((dmMain.GetSettingsValue('LAN_DELEQPMNT') = '1') and (eMAC.Text.IsEmpty)) then
  begin
    cnError.SetError(eMAC, rsMACIncorrect, iaMiddleLeft, bsNeverBlink);
    eMAC.SetFocus;
    vErrors := True;
  end;

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
    if not CheckVlanForHouse(dbleVLAN.Value, fCI.HOUSE_ID) then
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
end;

procedure TCustomerLanForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  case CheckData() of
    1: // нет ошибок
      ModalResult := mrOk;
    2: // нет ошибок, но есть предупреждения
      begin
        FWarnings := FWarnings + rsEOL + rsWarningQuestStop;
        if (MessageDlg(FWarnings, mtWarning, [mbYes, mbNo], 0) = mrNo) then
          // if (MessageBox(0, PChar(FWarnings), PChar('Внимание'), MB_ICONWARNING or MB_OKCANCEL or MB_DEFBUTTON3) = idOk)
          ModalResult := mrOk;
      end;
  end;
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
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    Exit;

  eid := -1;
  if VarIsNull(dbleEquipment.Value) then
  begin
    eid := EditEquipment(eid, fCI, 1);
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
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    Exit;

  if not VarIsNull(dbleEquipment.Value) then
  begin
    eid := dbleEquipment.Value;
    EditEquipment(eid, fCI, 1);
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
  if dsHomes.FieldByName('HOUSE_ID').IsNull then
    dsEQ.ParamByName('HOUSE_ID').Clear
  else
    dsEQ.ParamByName('HOUSE_ID').AsInteger := dsHomes['HOUSE_ID'];
  dsEQ.Open;
  dsPort.CloseOpen(True);
end;

procedure TCustomerLanForm.lcbPortChange(Sender: TObject);
begin
  if (lcbPort.Text.IsEmpty) or (VarIsNull(lcbPort.Value)) then
  begin
    lcbPort.EditButtons.Items[0].Hint := rsAdd;
    lcbPort.EditButtons.Items[0].Visible := True and FCanEditPort;
    lcbPort.EditButtons.Items[1].Visible := False;
  end
  else
  begin
    lcbPort.EditButtons.Items[1].Hint := rsChange;
    lcbPort.EditButtons.Items[0].Visible := False;
    lcbPort.EditButtons.Items[1].Visible := True and FCanEditPort;
  end;
  if (dsLAN.State = dsInsert) then
  begin
    if (not dsPort.FieldByName('VLAN_ID').IsNull) then
      dbleVLAN.Value := dsPort['VLAN_ID'];
  end;
end;

procedure TCustomerLanForm.lcbPortDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  s : string;
begin
  Background := clWindow;
  if not dsPort.FieldByName('CON').IsNull then begin
    if (not dsPort.FieldByName('CON_ID').IsNull) and (dsPort['CON_ID'] = fCI.CUSTOMER_ID) then begin
      AFont.Style := [fsBold];
    end
    else begin
      AFont.Style := [fsItalic];
      AFont.Color := clGray;
      Background := clBtnShadow;
    end;
  end;
  if (not dsPort.FieldByName('P_STATE').IsNull) then
  begin
    if (dsPort['P_STATE'] = 0) then begin
      AFont.Style := [fsStrikeOut];
      Background := clBtnShadow;
    end
    else if (dsPort['P_STATE'] > 1) then begin
      AFont.Style := [fsItalic];
      Background := clBtnShadow;
    end;
  end;
  if not( dsPort.FieldByName('COLOR').IsNull) then
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
    if FieldByName('ip').IsNull then
      Host := ''
    else
      Host := FieldByName('ip').asString;

    if FieldByName('e_admin').IsNull then
      user := ''
    else
      user := FieldByName('e_admin').asString;

    if FieldByName('e_pass').IsNull then
      pswd := ''
    else
      pswd := FieldByName('e_pass').asString;

    H_MAC := '';
    if (not FieldByName('mac').IsNull) then
    begin
      H_MAC := FieldByName('mac').asString;
    end;

    if FieldByName('command').IsNull then
      cmd := ''
    else
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
        if not FieldByName('H_FINDED').IsNull then
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

end.
