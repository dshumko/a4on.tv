unit CustomerLanForma;

interface

{$I defines.inc}

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants,
  System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Menus,
  VCL.Dialogs, VCL.StdCtrls, VCL.Mask, Data.DB, VCL.DBCtrls,
  VCL.Buttons, VCL.ActnList, System.Actions, VCL.ExtCtrls,

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
    ePort: TDBNumberEditEh;
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
    procedure ePortExit(Sender: TObject);
    procedure dbleEquipmentExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcbHOUSE_IDChange(Sender: TObject);
    procedure dbleEquipmentEditButtons1Click(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
    fCI: TCustomerInfo;
    function CheckData: Boolean;
    function CheckIP(const ip: String; const VLAN_ID: Integer = -1): string;
    function CheckUniqMAC(const MAC: String): string;
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

uses MAIN, AtrCommon, AtrStrUtils, StrUtils, EquipEditForma, pFIBQuery, TelnetForma, atrCmdUtils;

{$R *.dfm}

function EditCustomerLAN(const aCI: TCustomerInfo; aLan_ID: Int64): Boolean;
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

      dsVlans.ParamByName('CUSTOMER_ID').AsInt64 := aCI.CUSTOMER_ID;
      dsVlans.Open;

      dsLAN.ParamByName('Lan_ID').AsInt64 := aLan_ID;
      dsLAN.Open;
      if aLan_ID = -1 then
      begin
        dsLAN.Insert;
        // если нашли влан - пропишем его
        if not dsVlans.EOF then
          if dsVlans['finded'] = 1 then
          begin
            dbleVLAN.Value := dsVlans['V_ID'];
            // actFindIP.Execute;
          end;

        if (dmMain.GetSettingsValue('LAN_DELEQPMNT') <> '1') then
        begin
          // если нашли оборудование - пропишем его
          if not dsEQ.EOF then
            if dsEQ['finded'] = 1 then
              dbleEquipment.Value := dsEQ['EID'];
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
    dbleEquipment.EditButtons.Items[0].Visible := True;
    dbleEquipment.EditButtons.Items[1].Visible := False;
  end
  else
  begin
    dbleEquipment.EditButtons.Items[1].Hint := rsChange;
    dbleEquipment.EditButtons.Items[0].Visible := False;
    dbleEquipment.EditButtons.Items[1].Visible := True;
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
  PORT: Integer;
  Result: string;
begin

  if ((ePort.Text = '') or (dbleEquipment.Text = '')) then
    Exit;

  Result := '';
  EQ_ID := dbleEquipment.Value;
  PORT := ePort.Value;
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
      ParamByName('PT').AsInteger := PORT;
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
        next;
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
    cnError.SetError(ePort, Result, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(ePort);
end;

procedure TCustomerLanForm.OkCancelFrame1bbCancelClick(Sender: TObject);
begin
  dsLAN.Cancel;
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

function TCustomerLanForm.CheckData: Boolean;
var
  En: Boolean;
  s: string;
  EmptyIP_MAC_PORT: Boolean;
  vid: Integer;
begin
  En := True;
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
    En := False;
  end
  else
    cnError.Dispose(eIP);

  if (ValidateMAC(eMAC.Text) = '') and (eMAC.Text <> '') then
  begin
    cnError.SetError(eMAC, rsMACIncorrect, iaMiddleLeft, bsNeverBlink);
    eMAC.SetFocus;
    En := False;
  end
  else
  begin
    s := CheckUniqMAC(eMAC.Text);
    if s <> '' then
    begin
      cnError.SetError(eMAC, s, iaMiddleLeft, bsNeverBlink);
      eMAC.SetFocus;
      En := False;
    end
    else
      cnError.Dispose(eMAC);
  end;

  if ((dmMain.GetSettingsValue('VLAN_REQUIRED') = '1') and (not VarIsNumeric(dbleVLAN.Value))) then
  begin
    cnError.SetError(dbleVLAN, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    dbleVLAN.SetFocus;
    En := False;
  end
  else
    cnError.Dispose(dbleVLAN);
  // хоть что-то должно быть заполнено
  EmptyIP_MAC_PORT := (eIPv6.Text = '') and (eIP.Text = '') and (eMAC.Text = '') and
    ((ePort.Text = '') or (dbleEquipment.Text = ''));
  if EmptyIP_MAC_PORT then
  begin
    cnError.SetError(OkCancelFrame.bbOk, rsLANIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(OkCancelFrame.bbOk);

  Result := En and (not EmptyIP_MAC_PORT);
end;

procedure TCustomerLanForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if CheckData then
    ModalResult := mrOk;
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

  eid := -1;
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
  if dsLAN.RecordCount = 0 then
    Exit;
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
      sql.Add('select ec.ec_id, ec.name, ec.command');
      sql.Add('from equipment_cmd_grp ec');
      sql.Add('   inner join equipment e on (ec.eg_id = e.eq_group)');
      sql.Add('where ec.in_gui = 1 and e.eid = :eq_id');
      sql.Add('order by ec.name');
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
        next;
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
begin
  if not(Sender is TMenuItem) then
    Exit;

  if not VarIsNumeric(dbleEquipment.Value) then
    Exit;

  C_IP := eIP.Text;

  if (not dsLAN.FieldByName('MAC').IsNull) then
    C_MAC := dsLAN.FieldByName('MAC').asString;

  C_TAG := edtTAG.Text;
  C_TAGSTR := edtTAGSTR.Text;
  C_PORT := ePort.Text;
  C_VLAN := '';

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command, e.ip, e.mac, e.e_admin, e.e_pass, ec.eol_chrs');
    sql.Add('from equipment_cmd_grp ec inner join equipment e on (ec.eg_id = e.eq_group)');
    sql.Add('where ec.ec_id = :ec_id and e.eid = :eq_id');
    ParamByName('ec_id').AsInteger := (Sender as TMenuItem).Tag;
    ParamByName('eq_id').AsInteger := dbleEquipment.Value;
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

    Close;
    Transaction.Rollback;
  end;
  if cmd <> '' then
  begin
    cmd := ReplaceStr(cmd, '<e_admin>', user);
    cmd := ReplaceStr(cmd, '<e_pass>', pswd);
    cmd := ReplaceStr(cmd, '<e_mac>', H_MAC);
    cmd := ReplaceStr(cmd, '<e_mac_h>', H_MAC.Replace(':', '-'));
    cmd := ReplaceStr(cmd, '<e_mac_d>', H_MAC.Replace(':', '.'));
    cmd := ReplaceStr(cmd, '<e_mac_j>', FormatMACas4CD(H_MAC));
    cmd := ReplaceStr(cmd, '<e_ip>', Host);
    cmd := ReplaceStr(cmd, '<c_ip>', C_IP);
    cmd := ReplaceStr(cmd, '<c_mac>', C_MAC);
    cmd := ReplaceStr(cmd, '<c_mac_h>', C_MAC.Replace(':', '-'));
    cmd := ReplaceStr(cmd, '<c_mac_d>', C_MAC.Replace(':', '.'));
    cmd := ReplaceStr(cmd, '<c_mac_j>', FormatMACas4CD(C_MAC));
    cmd := ReplaceStr(cmd, '<c_port>', C_PORT);
    cmd := ReplaceStr(cmd, '<c_vlan>', C_VLAN);
    cmd := ReplaceStr(cmd, '<c_tag>', C_TAG);
    cmd := ReplaceStr(cmd, '<c_tagstr>', C_TAGSTR);

    cmd := telnet(Host, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, True);
  end;
end;

end.
