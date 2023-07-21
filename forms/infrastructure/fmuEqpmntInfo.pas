unit fmuEqpmntInfo;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes, System.StrUtils,
  Data.DB,
  Vcl.ActnList, Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
  Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus,
  AtrPages, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, pFIBDatabase, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, ToolCtrlsEh, DBCtrlsEh, DBLookupEh;

type

  TapgEqpmntInfo = class(TA4onPage)
    pnlInfo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl1: TLabel;
    Label4: TLabel;
    lbl4: TLabel;
    Label5: TLabel;
    dbtxtNAME: TDBText;
    dbtxtdbedt1: TDBText;
    dbtxtDBEdit1: TDBText;
    dbtxtDBEdit2: TDBText;
    dbtxtHOUSE: TDBText;
    dbtxtSTREET: TDBText;
    cbTypeEQ: TDBComboBoxEh;
    pnlMemo: TPanel;
    lbl2: TLabel;
    mmoNotice: TDBMemoEh;
    pmLanPopUp: TPopupMenu;
    actlstLAN: TActionList;
    ActLanPing: TAction;
    actLanTelnet: TAction;
    actLanHttp: TAction;
    actParentPing: TAction;
    actParentTelnet: TAction;
    actParentWeb: TAction;
    dsData: TpFIBDataSet;
    srcData: TDataSource;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    lbl5: TLabel;
    dbtxtSTREET1: TDBText;
    dbtxtparent_name: TDBText;
    splMemo: TSplitter;
    splR: TSplitter;
    pnlPages: TPanel;
    pgcTypeInfo: TPageControl;
    tsLan: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbl3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    eMAC: TDBEditEh;
    eIP: TDBEditEh;
    DBEditEh1: TDBEditEh;
    edtGroup: TDBEditEh;
    edtIP: TDBEditEh;
    btnCMD: TButton;
    edtIPV6: TDBEditEh;
    tsTV: TTabSheet;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl8: TLabel;
    dbckActive: TDBCheckBoxEh;
    cbbLine: TDBComboBoxEh;
    edSIN: TDBNumberEditEh;
    edSOUT: TDBNumberEditEh;
    tsOther: TTabSheet;
    actLanHttpName: TAction;
    procedure btnCMDClick(Sender: TObject);
    procedure ActLanPingExecute(Sender: TObject);
    procedure actLanTelnetExecute(Sender: TObject);
    procedure actLanHttpExecute(Sender: TObject);
    procedure actParentPingExecute(Sender: TObject);
    procedure actParentTelnetExecute(Sender: TObject);
    procedure actParentWebExecute(Sender: TObject);
    procedure mmoNoticeChange(Sender: TObject);
    procedure mmoNoticeExit(Sender: TObject);
    procedure FDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLanHttpNameExecute(Sender: TObject);
  private
    FUpdatetNotice: Boolean;
    FIsVertical: Boolean;
    procedure GenerateLANPopUp;
    procedure miLanGroupCMDClick(Sender: TObject);
    procedure SwitchLayout(const InVertical: Boolean);
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    procedure SaveState; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, DM, AtrStrUtils, atrCmdUtils,
  HtmlForma, TelnetForma, System.NetEncoding;

class function TapgEqpmntInfo.GetPageName: string;
begin
  Result := rsInformation;
end;

procedure TapgEqpmntInfo.InitForm;
var
  i: Integer;
begin
  Caption := GetPageName;

  for i := 0 to pgcTypeInfo.PageCount - 1 do
    pgcTypeInfo.Pages[i].TabVisible := False;

  dsData.DataSource := FDataSource;
  mmoNotice.ReadOnly := not(dmMain.AllowedAction(rght_Dictionary_full) or
    dmMain.AllowedAction(rght_Comm_Equipment));
end;

procedure TapgEqpmntInfo.OpenData;
begin
  dsData.Open;
end;

procedure TapgEqpmntInfo.CloseData;
begin
  if dsData.Active then
    dsData.Close;
end;

procedure TapgEqpmntInfo.GenerateLANPopUp;
var
  NewItem: TMenuItem;
  rCursor: TPoint;
begin
  if FDataSource.DataSet.RecordCount = 0 then
    exit;
  pmLanPopUp.Items.Clear;
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := ActLanPing;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := actLanTelnet;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := actLanHttp;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := actLanHttpName;
  pmLanPopUp.Items.Add(NewItem);

  if (not dsData.FieldByName('Parent_Id').IsNull) then
  begin
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Caption := '-';
    pmLanPopUp.Items.Add(NewItem);
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Action := actParentPing;
    pmLanPopUp.Items.Add(NewItem);
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Action := actParentTelnet;
    pmLanPopUp.Items.Add(NewItem);
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Action := actParentWeb;
    pmLanPopUp.Items.Add(NewItem);
  end;

  if (not dsData.FieldByName('Eq_Group').IsNull) then
  begin
    with dmMain.qRead do
    begin
      sql.Clear;
      sql.Add('select ec.ec_id, ec.name, ec.command');
      sql.Add('from equipment_cmd_grp ec');
      sql.Add('where ec.in_gui = 1 and (ec.eg_id = :eg_id or ec.eg_id = -1)');
      sql.Add('order by ec.name');
      ParamByName('eg_id').AsInteger := dsData.FieldByName('Eq_Group').AsInteger;
      Transaction.StartTransaction;
      ExecQuery;

      NewItem := TMenuItem.Create(pmLanPopUp);
      NewItem.Caption := '-';
      pmLanPopUp.Items.Add(NewItem);

      while not Eof do
      begin
        if ((not FieldByName('ec_id').IsNull) and (not FieldByName('name').IsNull)) Then
        begin
          NewItem := TMenuItem.Create(pmLanPopUp);
          NewItem.Caption := FieldByName('name').asString;
          NewItem.Tag := FieldByName('ec_id').AsInteger;
          NewItem.OnClick := miLanGroupCMDClick;
          pmLanPopUp.Items.Add(NewItem);
        end;
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

procedure TapgEqpmntInfo.miLanGroupCMDClick(Sender: TObject);
var
  Host: string;
  user: string;
  pswd: string;
  H_MAC, C_IP, C_MAC, C_PORT, C_VLAN: string;
  cmd: string;
  eol_chars: Integer;
  CMD_TYPE: Integer;
  URL, AUT_USER, AUT_PSWD: String;
begin
  if not(Sender is TMenuItem) then
    exit;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command, e.ip, e.mac, e.e_admin, e.e_pass, ec.eol_chrs');
    sql.Add(', ec.CMD_TYPE, ec.URL, ec.AUT_USER, ec.AUT_PSWD');
    sql.Add('from equipment e');
    sql.Add('   inner join equipment_cmd_grp ec on ((ec.eg_id = e.eq_group or ec.eg_id = -1) and ec.ec_id = :ec_id)');
    sql.Add('where e.eid = :eq_id');
    ParamByName('ec_id').AsInteger := (Sender as TMenuItem).Tag;
    ParamByName('eq_id').AsInteger := FDataSource.DataSet.FieldByName('Eid').AsInteger;
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

    if FieldByName('CMD_TYPE').IsNull then
      CMD_TYPE := 0
    else
      CMD_TYPE := FieldByName('CMD_TYPE').AsInteger;
    if FieldByName('URL').IsNull then
      URL := ''
    else
      URL := FieldByName('URL').asString;
    if FieldByName('AUT_USER').IsNull then
      AUT_USER := ''
    else
      AUT_USER := FieldByName('AUT_USER').asString;
    if FieldByName('AUT_PSWD').IsNull then
      AUT_PSWD := ''
    else
      AUT_PSWD := FieldByName('AUT_PSWD').asString;

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
  end;

  URL := ReplaceStr(URL, '<e_ip>', Host);
  URL := ReplaceStr(URL, '<c_ip>', C_IP);

  case CMD_TYPE of
    2:
      cmd := GetHtml(URL, AUT_USER, AUT_PSWD, cmd, true, (Sender as TMenuItem).Caption);
  else
    cmd := telnet(Host, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, true);
  end;

end;

procedure TapgEqpmntInfo.mmoNoticeChange(Sender: TObject);
begin
  FUpdatetNotice := true;
end;

procedure TapgEqpmntInfo.mmoNoticeExit(Sender: TObject);
var
  s: string;
begin
  if (FUpdatetNotice) and (not srcData.DataSet.FieldByName('EID').IsNull) then
  begin
    s := mmoNotice.Lines.Text;
    srcData.DataSet.Edit;
    srcData.DataSet['NOTICE'] := s;
    srcData.DataSet.Post;
  end;
end;

procedure TapgEqpmntInfo.FDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if not srcData.DataSet.FieldByName('eq_type').IsNull then
  begin
    case srcData.DataSet['eq_type'] of
      1:
        begin
          pgcTypeInfo.ActivePage := tsLan;
          pgcTypeInfo.Visible := true;
        end;
      2:
        begin
          pgcTypeInfo.ActivePage := tsTV;
          pgcTypeInfo.Visible := true;
        end;
      3:
        begin
          pgcTypeInfo.ActivePage := tsOther;
          pgcTypeInfo.Visible := true;
        end;
    else
      begin
        pgcTypeInfo.Visible := False;
      end;
    end;
  end
  else
  begin
    pgcTypeInfo.Visible := False;
  end;

  if srcData.DataSet.FieldByName('Notice').IsNull then
    mmoNotice.Lines.Text := ''
  else
    mmoNotice.Lines.Text := srcData.DataSet.FieldByName('Notice').asString;
  FUpdatetNotice := False;
end;

procedure TapgEqpmntInfo.FormCreate(Sender: TObject);
begin
  inherited;
  FIsVertical := False;
end;

procedure TapgEqpmntInfo.FormResize(Sender: TObject);
var
  b: Boolean;
begin
  b := (dmMain.GetIniValue('EQUIPMENT_INFOLAYOUT') = '1');
  SwitchLayout(b);
end;

procedure TapgEqpmntInfo.actLanHttpExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.FieldByName('IP').IsNull) then
    exit;

  s := 'http://' + dsData.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'Open', s, '', '', SW_SHOW);
end;

procedure TapgEqpmntInfo.actLanHttpNameExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.FieldByName('NAME').IsNull) then
    exit;

  s := 'http://' + TNetEncoding.URL.Encode(dsData.FieldByName('NAME').asString);
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'Open', s, '', '', SW_SHOW);
end;

procedure TapgEqpmntInfo.ActLanPingExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.FieldByName('IP').IsNull) then
    exit;

  s := dsData.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'Open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
end;

procedure TapgEqpmntInfo.actLanTelnetExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.FieldByName('IP').IsNull) then
    exit;

  s := dsData.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'Open', 'telnet', s, '', SW_SHOW);
end;

procedure TapgEqpmntInfo.actParentPingExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.FieldByName('P_IP').IsNull) then
    exit;

  s := dsData.FieldByName('P_IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'Open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
end;

procedure TapgEqpmntInfo.actParentTelnetExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.FieldByName('P_IP').IsNull) then
    exit;

  s := dsData.FieldByName('P_IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'Open', 'telnet', s, '', SW_SHOW);
end;

procedure TapgEqpmntInfo.actParentWebExecute(Sender: TObject);
var
  s: string;
begin
  if (dsData.FieldByName('P_IP').IsNull) then
    exit;

  s := 'http://' + dsData.FieldByName('P_IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'Open', s, '', '', SW_SHOW);
end;

procedure TapgEqpmntInfo.btnCMDClick(Sender: TObject);
begin
  GenerateLANPopUp;
end;

procedure TapgEqpmntInfo.SaveState;
begin
  if FIsVertical then
  begin
    dmMain.SetIniValue('EQUIPMENT_ISIZE', pnlInfo.Height.ToString);
    dmMain.SetIniValue('EQUIPMENT_PSIZE', pnlPages.Height.ToString);
  end
  else
  begin
    dmMain.SetIniValue('EQUIPMENT_ISIZE', pnlInfo.Width.ToString);
    dmMain.SetIniValue('EQUIPMENT_PSIZE', pnlPages.Width.ToString);
  end;
end;

procedure TapgEqpmntInfo.SwitchLayout(const InVertical: Boolean);
var
  i, m: Integer;
begin
  if (FIsVertical = InVertical) then
    exit;

  FIsVertical := InVertical;

  if (Self.Width > Self.Height) then
    m := Trunc(Self.Width / 3)
  else
    m := Trunc(Self.Height / 3);

  if FIsVertical then
  begin
    pnlInfo.Align := alTop;
    splR.Align := alTop;
    pnlPages.Align := alTop;
    splMemo.Align := alTop;

    if (not TryStrToInt(dmMain.GetIniValue('EQUIPMENT_ISIZE'), i)) or (i > m) then
      i := m;
    pnlInfo.Height := i;

    if (not TryStrToInt(dmMain.GetIniValue('EQUIPMENT_PSIZE'), i)) or (i > m) then
      i := m;
    pnlPages.Height := i
  end
  else
  begin
    splMemo.Align := alLeft;
    pnlPages.Align := alLeft;
    splR.Align := alLeft;
    pnlInfo.Align := alLeft;

    if (not TryStrToInt(dmMain.GetIniValue('EQUIPMENT_ISIZE'), i)) or (i > m) then
      i := m;
    pnlInfo.Width := i;

    if (not TryStrToInt(dmMain.GetIniValue('EQUIPMENT_PSIZE'), i)) or (i > m) then
      i := m;
    pnlPages.Width := i;
  end;
end;

end.
