unit EquipEditForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.ActnList, Vcl.Forms, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls,
  Vcl.Dialogs, Vcl.DBCtrls,
  DBGridEh, OkCancel_frame, DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, DM, GridsEH,
  PrjConst,
  A4onTypeUnit, CnErrorProvider;

type
  TEquipEditForm = class(TForm)
    pgcTypeInfo: TPageControl;
    tsLan: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lbl3: TLabel;
    btnPing: TSpeedButton;
    lbl2: TLabel;
    lbl5: TLabel;
    Label9: TLabel;
    edtMAC: TDBEditEh;
    edtIP: TDBEditEh;
    edtMASK: TDBEditEh;
    dbleVLAN: TDBLookupComboboxEh;
    edtADMIN: TDBEditEh;
    edtPWD: TDBEditEh;
    cbbEQG: TDBLookupComboboxEh;
    tsTV: TTabSheet;
    tsOther: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl1: TLabel;
    Label6: TLabel;
    lbl4: TLabel;
    Label8: TLabel;
    luStreet: TDBLookupComboboxEh;
    luHouse: TDBLookupComboboxEh;
    edtNAME: TDBEditEh;
    DBMemo1: TDBMemoEh;
    dbedt1: TDBEditEh;
    DBEdit1: TDBEditEh;
    cbTypeEQ: TDBComboBoxEh;
    edtPlace: TDBEditEh;
    srcVLANS: TDataSource;
    dsVlans: TpFIBDataSet;
    dsEQGroups: TpFIBDataSet;
    srcEQGroups: TDataSource;
    dsEquipment: TpFIBDataSet;
    srcDataSource: TDataSource;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    trSWrite: TpFIBTransaction;
    trSRead: TpFIBTransaction;
    actlst1: TActionList;
    actFindIP: TAction;
    btnFindIP: TBitBtn;
    edtSerial: TDBEditEh;
    lbl6: TLabel;
    actExit: TAction;
    cbbLine: TDBComboBoxEh;
    edSIN: TDBNumberEditEh;
    edSOUT: TDBNumberEditEh;
    dbckActive: TDBCheckBoxEh;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    dsParent: TpFIBDataSet;
    srcParent: TDataSource;
    luParent: TDBLookupComboboxEh;
    edtPort: TDBEditEh;
    btnTelnet: TSpeedButton;
    lbl12: TLabel;
    edtIP1: TDBEditEh;
    pnlBottom: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    cnError: TCnErrorProvider;
    lblNODE: TLabel;
    lcbNODE: TDBLookupComboboxEh;
    srcNODE: TDataSource;
    dsNODE: TpFIBDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTypeEQChange(Sender: TObject);
    procedure btnPingClick(Sender: TObject);
    procedure edtMACEnter(Sender: TObject);
    procedure edtMACExit(Sender: TObject);
    procedure edtIPExit(Sender: TObject);
    procedure edtPlaceExit(Sender: TObject);
    procedure actFindIPExecute(Sender: TObject);
    procedure dbleVLANDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure luHouseChange(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbl5DblClick(Sender: TObject);
    procedure edtADMINEnter(Sender: TObject);
    procedure edtPWDEnter(Sender: TObject);
    procedure edtADMINExit(Sender: TObject);
    procedure edtPWDExit(Sender: TObject);
    procedure btnTelnetClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure okcnclfrmbbOkClick(Sender: TObject);
    procedure edtIP1Exit(Sender: TObject);
    procedure edtIP1Enter(Sender: TObject);
    procedure lcbNODEDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure luHouseDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    fCI: TCustomerInfo;
    FEnterSecondPress: Boolean;
    function CheckData: Boolean;
    procedure ShowTabs;
    procedure GetVlan;
    function CheckIpInUse(const ip: String; const VLAN_ID: Integer = -1): string;
    procedure IpInfo(const ip: String);
    procedure GetCloneDataFromDB(const aEQ_ID: Int64);
    function CheckUniqMAC(const MAC: String): string;
  public
    { Public declarations }
    property CI: TCustomerInfo write fCI;
    procedure CheckPortTemplate(const eid: Integer);
  end;

function EditEquipment(const aEQ_ID: Int64; const aCI: TCustomerInfo; const aEqType: Integer = 1;
  const aParent: Integer = -1): Int64;
function EditHouseEquipment(const aEQ_ID: Int64; const aStreet: Integer; const aHouse: Integer;
  const aEqType: Integer = 0): Int64;

function CloneEquipment(const aEQ_ID: Int64): Int64;

implementation

uses
  System.StrUtils,
  AtrStrUtils, atrCmdUtils, AtrCommon, TelnetForma, pFibQuery, MAIN;

{$R *.dfm}

procedure CorrectIP(EditCtrl: TDBEditEh);
begin
  EditCtrl.Text := ReplaceStr(EditCtrl.Text, ',', '.');
  EditCtrl.Text := ReplaceStr(AnsiUpperCase(EditCtrl.Text), 'Ю', '.');
end;

function EditEquipment(const aEQ_ID: Int64; const aCI: TCustomerInfo; const aEqType: Integer = 1;
  const aParent: Integer = -1): Int64;
var
  i: Int64;
begin
  result := -1;
  with TEquipEditForm.Create(Application) do
    try
      CI := aCI;
      trSWrite.Active := true;
      trSRead.Active := true;

      dsEquipment.ParamByName('EID').AsInteger := aEQ_ID;
      dsEquipment.Open;

      if aEQ_ID = -1 then
      begin
        dsEquipment.Insert;
        if aCI.CUSTOMER_ID <> -1 then
        begin
          luStreet.Value := aCI.STREET_ID;
          dsEquipment['HOUSE_ID'] := aCI.HOUSE_ID;
          dsEquipment['PLACE'] := aCI.FLAT_NO;
        end;
        if aEqType > 0 then
        begin
          cbTypeEQ.Value := aEqType;
          ActiveControl := edtNAME;
        end;
      end
      else
        dsEquipment.Edit;
      if aParent <> -1 then
        luParent.KeyValue := aParent;

      if ShowModal = mrOk then
      begin
        try
          if aEQ_ID = -1 then
          begin
            i := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1, dmMain.trWriteQ);
            dsEquipment['EID'] := i;
          end
          else
            i := aEQ_ID;

          dsEquipment.Post;
          dsEquipment.UpdateTransaction.Commit;
          result := i;
          CheckPortTemplate(result);

        except
          result := -1;
        end;
      end
      else
        dsEquipment.Cancel;
    finally
      free
    end;
end;

function CloneEquipment(const aEQ_ID: Int64): Int64;
var
  i: Int64;
begin
  result := -1;
  with TEquipEditForm.Create(Application) do
    try
      trSWrite.Active := true;
      trSRead.Active := true;

      dsEquipment.ParamByName('EID').AsInteger := aEQ_ID;
      dsEquipment.Open;

      dsEquipment.Insert;

      GetCloneDataFromDB(aEQ_ID);

      if ShowModal = mrOk then
      begin
        try
          i := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1, dmMain.trWriteQ);
          dsEquipment['EID'] := i;
          dsEquipment.Post;
          result := i;
        except
          result := -1;
        end;
      end
      else
        dsEquipment.Cancel;
    finally
      free
    end;
end;

function EditHouseEquipment(const aEQ_ID: Int64; const aStreet: Integer; const aHouse: Integer;
  const aEqType: Integer = 0): Int64;
var
  i: Int64;
begin
  result := -1;
  with TEquipEditForm.Create(Application) do
    try
      trSWrite.Active := true;
      trSRead.Active := true;

      dsEquipment.ParamByName('EID').AsInteger := aEQ_ID;
      dsEquipment.Open;

      if aEQ_ID = -1 then
      begin
        dsEquipment.Insert;
        if aHouse <> -1 then
        begin
          luStreet.Value := aStreet;
          dsEquipment['HOUSE_ID'] := aHouse;
        end;
        if aEqType > 0 then
        begin
          cbTypeEQ.Value := aEqType;
          ActiveControl := edtNAME;
        end;
      end
      else
        dsEquipment.Edit;

      if ShowModal = mrOk then
      begin
        try
          if aEQ_ID = -1 then
          begin
            i := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1, dmMain.trWriteQ);
            dsEquipment['EID'] := i;
          end
          else
            i := aEQ_ID;
          dsEquipment.Post;
          result := i;
        except
          result := -1;
        end;
      end
      else
        dsEquipment.Cancel;
    finally
      free
    end;
end;

procedure TEquipEditForm.actExitExecute(Sender: TObject);
begin
  if CheckData then
    ModalResult := mrOk;
end;

procedure TEquipEditForm.actFindIPExecute(Sender: TObject);
var
  s: string;
begin
  // if ()dsEQ
  if dbleVLAN.Text <> '' then
    s := dmMain.GetNextVlanIP(dbleVLAN.KeyValue, true)
  else
    s := dmMain.GetNextIP(False, edtIP.Text);

  edtIP.Text := s;

  edtIP.SetFocus;
  IpInfo(s);
end;

procedure TEquipEditForm.btnPingClick(Sender: TObject);
var
  s: string;
begin
  if edtIP.Text <> '' then
  begin
    s := '/K ping ' + edtIP.Text + ' -t';
    atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'cmd', s);
  end;
end;

procedure TEquipEditForm.btnTelnetClick(Sender: TObject);
begin
  telnet(edtIP.Text, 'telnet', '');
end;

procedure TEquipEditForm.cbTypeEQChange(Sender: TObject);
begin
  ShowTabs;
end;

function TEquipEditForm.CheckData: Boolean;
var
  s: string;
begin
  result := true;
  if (cbTypeEQ.Text.IsEmpty) then
  begin
    cnError.SetError(cbTypeEQ, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    cbTypeEQ.SetFocus;
    result := False;
  end
  else
    cnError.Dispose(cbTypeEQ);

  if (edtNAME.Text.IsEmpty) then
  begin
    cnError.SetError(edtNAME, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    edtNAME.SetFocus;
    result := False;
  end
  else
    cnError.Dispose(edtNAME);

  if pgcTypeInfo.ActivePage = tsLan then
  begin
    if ((dmMain.GetSettingsValue('VLAN_REQUIRED') = '1') and (not VarIsNumeric(dbleVLAN.Value))) then
    begin
      cnError.SetError(dbleVLAN, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
      dbleVLAN.SetFocus;
      result := False;
    end
    else
      cnError.Dispose(dbleVLAN);

    if ((not edtMAC.Text.IsEmpty) and (ValidateMAC(edtMAC.Text) = '')) then
    begin
      cnError.SetError(edtMAC, rsMACIncorrect, iaMiddleLeft, bsNeverBlink);
      edtMAC.SetFocus;
      result := False;
    end
    else
    begin
      s := CheckUniqMAC(edtMAC.Text);
      if not s.IsEmpty then
      begin
        cnError.SetError(edtMAC, s, iaMiddleLeft, bsNeverBlink);
        edtMAC.SetFocus;
        result := False;
      end
      else
        cnError.Dispose(edtMAC);
    end;

    if ((not edtIP.Text.IsEmpty) and (not CheckIP(edtIP.Text))) then
    begin
      cnError.SetError(edtIP, rsIPIncorrect, iaMiddleLeft, bsNeverBlink);
      edtIP.SetFocus;
      result := False;
    end
    else
    begin
      if (not dbleVLAN.Text.IsEmpty) then
        s := CheckIpInUse(edtIP.Text, dbleVLAN.Value)
      else
        s := CheckIpInUse(edtIP.Text, -1);
      if not s.IsEmpty then
      begin
        cnError.SetError(edtIP, s, iaMiddleLeft, bsNeverBlink);
        edtIP.SetFocus;
        result := False;
      end
      else
        cnError.Dispose(edtIP);
    end;

  end
end;

procedure TEquipEditForm.edtMACEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
  (Sender as TCustomEdit).SelectAll;
end;

procedure TEquipEditForm.edtMACExit(Sender: TObject);
var
  En: Boolean;
  s: string;
begin
  En := true;
  s := CheckUniqMAC(edtMAC.Text);
  if not s.IsEmpty then
  begin
    cnError.SetError(edtMAC, s, iaMiddleLeft, bsNeverBlink);
    edtMAC.SetFocus;
    En := False;
  end
  else
    cnError.Dispose(edtMAC);

  if En then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
    else
      dmMain.RestoreKL;
  end;
end;

procedure TEquipEditForm.dbleVLANDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if dsVlans['FINDED'] = 1 then
    AFont.Color := dbleVLAN.Font.Color
  else
    AFont.Color := clGray;
end;

procedure TEquipEditForm.edtPlaceExit(Sender: TObject);
begin
  if (edtNAME.Text = '') and (dsEquipment.State in [dsEdit, dsInsert]) then
    edtNAME.Text := Translit(luStreet.Text + luHouse.Text + '-' + edtPlace.Text);
end;

procedure TEquipEditForm.edtPWDEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TEquipEditForm.edtPWDExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;

end;

procedure TEquipEditForm.edtADMINEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TEquipEditForm.edtADMINExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;

end;

procedure TEquipEditForm.edtIPExit(Sender: TObject);
var
  ip, Mask: String;
  m_bin: Integer;
  sa: TStringArray;
begin
  inherited;
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
  if not(srcDataSource.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  ip := (Sender as TDBEditEh).Text;
  if ip.IsEmpty then
    Exit;

  sa := Explode('/', ip);
  if length(sa) = 1 then
  begin
    CorrectIP((Sender as TDBEditEh));
  end
  else
  begin
    ip := sa[0];
    (Sender as TDBEditEh).Text := ip;
    CorrectIP((Sender as TDBEditEh));
    Mask := sa[1];
    if TryStrToInt(Mask, m_bin) then
    begin
      Mask := IntToMask(m_bin);
      if Mask <> '' then
        edtMASK.Text := Mask;
    end;
  end;
end;

procedure TEquipEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  f: string;
begin

  dsEQGroups.Close;
  dsVlans.Close;
  dsStreets.Close;
  dsNODE.Close;
  dsHomes.Close;
  dsParent.Close;

  if edtNAME.MRUList.Active then
  begin
    f := GetSpecialFolderPath();
    edtNAME.MRUList.Items.SaveToFile(f + '\' + rsAplicationName + '\eqname.mru');
  end;
end;

procedure TEquipEditForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
      // else if (ActiveControl is TDBGridEh) then
      // go := False
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
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

procedure TEquipEditForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
  begin
    if CheckData then
      ModalResult := mrOk;
  end;
end;

procedure TEquipEditForm.FormShow(Sender: TObject);
var
  i: Integer;
  f: string;
begin
  dsEQGroups.Open;
  dsStreets.Open;
  dsHomes.Open;
  dsParent.Open;
  dsNODE.Open;

  if dsEquipment.State = dsInsert then
  begin
    cbTypeEQ.SetFocus;
  end;

  for i := 0 to pgcTypeInfo.PageCount - 1 do
    pgcTypeInfo.Pages[i].TabVisible := False;

  ShowTabs;
  f := GetSpecialFolderPath();
  if f <> '' then
  begin
    edtNAME.MRUList.Active := true;
    f := f + '\' + rsAplicationName + '\eqname.mru';
    if FileExists(f) then
      edtNAME.MRUList.Items.LoadFromFile(f);
  end;
end;

procedure TEquipEditForm.lbl5DblClick(Sender: TObject);
begin
  if edtPWD.PasswordChar = '*' then
    edtPWD.PasswordChar := #0
  else
    edtPWD.PasswordChar := '*';
end;

procedure TEquipEditForm.lcbNODEDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not srcNODE.DataSet.FieldByName('COLOR').IsNull then
  begin
    try
      Background := StringToColor(srcNODE.DataSet.FieldByName('COLOR').Value);
    except
      Background := clWindow;
    end;
  end
  else
    Background := clWindow;
end;

procedure TEquipEditForm.luHouseChange(Sender: TObject);
begin
  if (dsHomes['inService'] <> '') then
    luHouse.Color := clYellow
  else
    luHouse.Color := clWindow;

  if (VarIsNumeric(cbTypeEQ.Value)) and (cbTypeEQ.Value = 1) then
    GetVlan;
end;

procedure TEquipEditForm.luHouseDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsHomes.Active) and (dsHomes['inService'] <> '') then
    Background := clYellow
  else
    Background := clWindow;
end;

procedure TEquipEditForm.okcnclfrmbbOkClick(Sender: TObject);
begin
  if CheckData then
    ModalResult := mrOk;
end;

procedure TEquipEditForm.ShowTabs;
var
  i: Integer;
begin
  if (TryStrToInt(cbTypeEQ.Value, i)) then
  begin
    case i of
      2:
        pgcTypeInfo.ActivePage := tsTV;
      3:
        pgcTypeInfo.ActivePage := tsOther;
    else
      begin
        pgcTypeInfo.ActivePage := tsLan;
        GetVlan;
      end;
    end;
  end
  else
  begin
    pgcTypeInfo.ActivePage := tsLan;
    GetVlan;
  end;
end;

procedure TEquipEditForm.GetVlan;
begin
  dsVlans.Close;
  if VarIsNull(luHouse.Value) then
    dsVlans.ParamByName('HOUSE_ID').Clear
  else
    dsVlans.ParamByName('HOUSE_ID').AsInteger := luHouse.Value;
  dsVlans.Open;
  if dsEquipment.State = dsInsert then
    if dsVlans['FINDED'] = 1 then
      dbleVLAN.Value := dsVlans['V_ID']
    else
      dbleVLAN.Value := Unassigned;
end;

procedure TEquipEditForm.edtIP1Exit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;

end;

procedure TEquipEditForm.edtIP1Enter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

function TEquipEditForm.CheckIpInUse(const ip: String; const VLAN_ID: Integer = -1): string;
begin
  result := '';
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

      ParamByName('ip').asString := ip;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Account_No').IsNull then
        result := result + rsACCOUNT + ' ' + FieldByName('Account_No').Value + ' ';
      if not FieldByName('Ip').IsNull then
        result := result + ' IP ' + FieldByName('Ip').Value + ' ';
      if not FieldByName('Mac').IsNull then
        result := result + ' MAC ' + FieldByName('Mac').Value + ' ';
      Close;
      Transaction.Commit;
    finally
      free;
    end;
end;

procedure TEquipEditForm.IpInfo(const ip: String);
var
  s: string;
begin
  s := dmMain.IpInfo(ip);

  if s.IsEmpty then
    cnError.Dispose(edtIP)
  else
    cnError.SetError(edtIP, s, iaMiddleLeft, bsNeverBlink);

end;

procedure TEquipEditForm.GetCloneDataFromDB(const aEQ_ID: Int64);
var
  cq: TpFIBQuery;
begin
  cq := TpFIBQuery.Create(Nil);

  try
    cq.Database := dmMain.dbTV;
    cq.Transaction := dmMain.trReadQ;
    cq.sql.Text := dsEquipment.SQLs.SelectSQL.Text;
    cq.ParamByName('EID').AsInteger := aEQ_ID;
    cq.Transaction.StartTransaction;
    cq.ExecQuery;
    if not cq.Eof then
    begin
      dsEquipment.DisableControls;
      try
        if not cq.FN('STREET_ID').IsNull then
          luStreet.KeyValue := cq.FN('STREET_ID').AsInteger;
        if not cq.FN('HOUSE_ID').IsNull then
        begin
          dsEquipment['HOUSE_ID'] := cq.FN('HOUSE_ID').AsInteger;
          luHouse.KeyValue := cq.FN('HOUSE_ID').AsInteger;
        end;
        if not cq.FN('NAME').IsNull then
          dsEquipment['NAME'] := cq.FN('NAME').asString + '*';
        // if not cq.FN('IP').IsNull then
        // dsEquipment['IP'] := cq.FN('IP').asString;
        // if not cq.FN('MAC').IsNull then
        // dsEquipment['MAC'] := cq.FN('MAC').asString;
        if not cq.FN('NOTICE').IsNull then
          dsEquipment['NOTICE'] := cq.FN('NOTICE').asString;
        if not cq.FN('EQ_TYPE').IsNull then
          dsEquipment['EQ_TYPE'] := cq.FN('EQ_TYPE').AsInteger;
        if not cq.FN('PORCH_N').IsNull then
          dsEquipment['PORCH_N'] := cq.FN('PORCH_N').asString;
        if not cq.FN('FLOOR_N').IsNull then
          dsEquipment['FLOOR_N'] := cq.FN('FLOOR_N').asString;
        if not cq.FN('PLACE').IsNull then
          dsEquipment['PLACE'] := cq.FN('PLACE').asString;
        if not cq.FN('MASK').IsNull then
          dsEquipment['MASK'] := cq.FN('MASK').asString;
        if not cq.FN('VLAN_ID').IsNull then
          dsEquipment['VLAN_ID'] := cq.FN('VLAN_ID').AsInteger;
        if not cq.FN('EQ_GROUP').IsNull then
          dsEquipment['EQ_GROUP'] := cq.FN('EQ_GROUP').AsInteger;
        if not cq.FN('E_ADMIN').IsNull then
          dsEquipment['E_ADMIN'] := cq.FN('E_ADMIN').asString;
        if not cq.FN('E_PASS').IsNull then
          dsEquipment['E_PASS'] := cq.FN('E_PASS').asString;
        // if not cq.FN('SERIAL_N').IsNull then
        // dsEquipment['SERIAL_N'] := cq.FN('SERIAL_N').asString;
        if not cq.FN('PARENT_ID').IsNull then
          dsEquipment['PARENT_ID'] := cq.FN('PARENT_ID').AsInteger;
        if not cq.FN('PARENT_PORT').IsNull then
          dsEquipment['PARENT_PORT'] := cq.FN('PARENT_PORT').asString;
        if not cq.FN('EQ_LINE').IsNull then
          dsEquipment['EQ_LINE'] := cq.FN('EQ_LINE').AsInteger;
        if not cq.FN('SIGNAL_IN').IsNull then
          dsEquipment['SIGNAL_IN'] := cq.FN('SIGNAL_IN').AsFloat;
        if not cq.FN('SIGNAL_OUT').IsNull then
          dsEquipment['SIGNAL_OUT'] := cq.FN('SIGNAL_OUT').AsFloat;
        if not cq.FN('EQ_ACTIVE').IsNull then
          dsEquipment['EQ_ACTIVE'] := cq.FN('EQ_ACTIVE').AsInteger;
        // if not cq.FN('IPV6').IsNull then
        // dsEquipment['IPV6'] := cq.FN('IPV6').asString;
      finally
        dsEquipment.EnableControls;
      end;
    end;
    cq.Close;
    cq.Transaction.Commit;
  finally
    cq.free;
  end;
end;

function TEquipEditForm.CheckUniqMAC(const MAC: String): string;
begin
  result := '';
  if MAC = '' then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select Name, Ip, Mac from Equipment where Mac = :Mac ';

      if dsEquipment.State in [dsEdit] then
      begin
        sql.Add(' and Eid <> :Eid');
        ParamByName('Eid').AsInteger := dsEquipment.ParamByName('Eid').AsInteger;
      end;
      ParamByName('Mac').asString := MAC;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Name').IsNull then
        result := result + rsEQUIPMENT + ' ' + FieldByName('Name').Value + ' ';
      if not FieldByName('Ip').IsNull then
        result := result + ' IP ' + FieldByName('Ip').Value + ' ';
      if not FieldByName('Mac').IsNull then
        result := result + ' MAC ' + FieldByName('Mac').Value + ' ';
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

procedure TEquipEditForm.CheckPortTemplate(const eid: Integer);
var
  gid, gcnt: Integer;
begin
  gcnt := 0;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select (select count(*) cnt from port where EID = -1*e.Eq_Group) gcnt, ' +
     '(select count(*) cnt from port where EID = e.Eid) ecnt, -1*e.Eq_Group gid from Equipment e where e.Eid = :eid';
      ParamByName('Eid').AsInteger := eid;

      Transaction.StartTransaction;
      ExecQuery;
      if (FieldByName('gcnt').Value > 0) and (FieldByName('ecnt').Value = 0) then
        gcnt := FieldByName('gcnt').Value;
      gid := FieldByName('gid').Value;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;

  if gcnt = 0 then
    Exit;

  if Application.MessageBox(PWideChar(format('Добавить %d порта(ов) из шаблона группы?', [gcnt])), 'Создание портов',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'insert into Port (Eid, Port, Notice, P_Type, P_State, Speed, Vlan_Id, Wlabel) ' +
        ' select :Eid, Port, Notice, P_Type, P_State, Speed, Vlan_Id, Wlabel from Port where eid = :gid';
      ParamByName('Eid').AsInteger := eid;
      ParamByName('gid').AsInteger := gid;

      Transaction.StartTransaction;
      ExecQuery;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;

end;

end.
