unit SettinsUserForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Win.ComObj,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons,
  DBCtrlsEh;

type
  TSettingsUserForm = class(TForm)
    cbShowFilter: TCheckBox;
    cbFetchAll: TCheckBox;
    cbPrintReq: TCheckBox;
    chkNotUpdate: TCheckBox;
    Label9: TLabel;
    cbAutoOpen: TDBComboBoxEh;
    cbAuto: TCheckBox;
    lbl7: TLabel;
    edMinutes: TDBNumberEditEh;
    lbl1: TLabel;
    cbbSearchType: TDBComboBoxEh;
    chkReqUnion: TCheckBox;
    chkReqAll: TCheckBox;
    chkReqToAddress: TCheckBox;
    chkReqOpen: TCheckBox;
    btnUpdate: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnDelSettings: TSpeedButton;
    Label1: TLabel;
    cbKBDSWITCH: TDBComboBoxEh;
    chkPrintBothCheck: TCheckBox;
    grp1: TGroupBox;
    chkBtnA: TCheckBox;
    chkBtnP: TCheckBox;
    chkBtnR: TCheckBox;
    chkBtnE: TCheckBox;
    dlgFont: TFontDialog;
    btnFont: TButton;
    chkBtnN: TCheckBox;
    chkBtnT: TCheckBox;
    btnExplore: TSpeedButton;
    chkHint: TCheckBox;
    lblCBPSWD: TLabel;
    edtCBPSWD: TDBEditEh;
    chkToday: TCheckBox;
    chkRecToCustomer: TCheckBox;
    chkDBsettings: TCheckBox;
    ednRH: TDBNumberEditEh;
    lbl2: TLabel;
    chkAlwaysShow: TCheckBox;
    chkShowWorks: TCheckBox;
    chkQuckFilter: TCheckBox;
    procedure frmOkCancelbbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbAutoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDelSettingsClick(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure btnExploreClick(Sender: TObject);
  private
    { Private declarations }
    CallExist: Boolean;
  public
    { Public declarations }
  end;

implementation

uses
  Winapi.ShellAPI,
  DM, MAIN;

{$R *.dfm}

procedure TSettingsUserForm.btnExploreClick(Sender: TObject);
var
  s: string;
begin
  s := A4MainForm.GetIniFileName;
  s := ExtractFileDir(s);
  ShellExecute(Application.MainForm.Handle, 'explore', PChar(s), nil, nil, SW_SHOWNORMAL);
end;

procedure TSettingsUserForm.btnFontClick(Sender: TObject);
begin
  dlgFont.Font := btnFont.Font;
  if dlgFont.Execute then
  begin
    btnFont.Font := dlgFont.Font;
  end;
end;

procedure TSettingsUserForm.btnUpdateClick(Sender: TObject);
begin
  A4MainForm.DoUpdate;
end;

procedure TSettingsUserForm.cbAutoClick(Sender: TObject);
begin
  edMinutes.Enabled := cbAuto.Checked;
end;

procedure TSettingsUserForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    frmOkCancelbbOkClick(Sender);
end;

procedure TSettingsUserForm.FormShow(Sender: TObject);
  procedure ReadCheckSettings(const SETTING: string; CheckBox: TCheckBox);
  var
    j: Integer;
  begin
    if not TryStrToInt(dmMain.GetIniValue(SETTING), j) then
      j := 0;
    CheckBox.Checked := (j = 1);
  end;

var
  i: Integer;
begin
  CallExist := False;

  ReadCheckSettings('SHOWFILTER', cbShowFilter);
  ReadCheckSettings('FETCHALL', cbFetchAll);
  ReadCheckSettings('PRINTREQ', cbPrintReq);
  ReadCheckSettings('NOTAUTOUPDATE', chkNotUpdate);
  ReadCheckSettings('REQTOADRES', chkReqToAddress);
  ReadCheckSettings('REQOPENNEW', chkReqOpen);
  ReadCheckSettings('SET_AS_CURRENT_DATE', chkToday);
  ReadCheckSettings('HIDEHINT', chkHint);
  ReadCheckSettings('REQUNION', chkReqUnion);
  ReadCheckSettings('REQALL', chkReqAll);
  ReadCheckSettings('PRINT_CHECK_AND_REPORT', chkPrintBothCheck);
  ReadCheckSettings('RECTOCUSTOMER', chkRecToCustomer);
  ReadCheckSettings('ALWAYSSHOW', chkAlwaysShow);
  ReadCheckSettings('DBSETTINGS', chkDBsettings);
  ReadCheckSettings('SHOW_WORKS_IN_SINGLE', chkShowWorks);
  ReadCheckSettings('QUICK_FILTER', chkQuckFilter);

  if not TryStrToInt(dmMain.GetIniValue('KBDSWITCH'), i) then
    i := 0;
  cbKBDSWITCH.Value := i;

  if not TryStrToInt(dmMain.GetIniValue('DEFSEARCH'), i) then
    i := 0;
  cbbSearchType.Value := i;

  if not TryStrToInt(dmMain.GetIniValue('AUTOOPEN'), i) then
    i := 0;
  cbAutoOpen.Value := i;

  cbAuto.Checked := False;
  edMinutes.Value := 0;

  if TryStrToInt(dmMain.GetIniValue('AUTOOPEN'), i) then
  begin
    if (TryStrToInt(dmMain.GetIniValue('AUTOUPDATE'), i)) then
    begin
      cbAuto.Checked := (i > 0);
      edMinutes.Value := i;
    end;
  end;

  edtCBPSWD.Text := dmMain.GetIniValue('CASHBOXPSWD');

  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    btnFont.Font.Size := i;
    btnFont.Font.Name := dmMain.GetIniValue('FONT_NAME');
  end;

  if TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    ednRH.Value := i
  else
    ednRH.Value := 0;

  if not TryStrToInt(dmMain.GetIniValue('BUTTONS'), i) then
    i := 0;
  chkBtnA.Checked := ((i and chkBtnA.Tag) <> 0);
  chkBtnP.Checked := ((i and chkBtnP.Tag) <> 0);
  chkBtnR.Checked := ((i and chkBtnR.Tag) <> 0);
  chkBtnE.Checked := ((i and chkBtnE.Tag) <> 0);
  chkBtnN.Checked := ((i and chkBtnN.Tag) <> 0);
  chkBtnT.Checked := ((i and chkBtnT.Tag) <> 0);

  chkPrintBothCheck.Enabled := FileExists(ExtractFilePath(Application.ExeName) + 'cashrgst.dll');
  edtCBPSWD.Enabled := chkPrintBothCheck.Enabled;
end;

procedure TSettingsUserForm.frmOkCancelbbOkClick(Sender: TObject);
  procedure SetCheckSettings(const Checked: Boolean; const SETTING: string);
  begin
    if Checked then
      dmMain.SetIniValue(SETTING, '1')
    else
      dmMain.SetIniValue(SETTING, '0');
  end;

var
  i: Integer;
begin
  SetCheckSettings(cbShowFilter.Checked, 'SHOWFILTER');
  SetCheckSettings(cbFetchAll.Checked, 'FETCHALL');
  SetCheckSettings(chkReqUnion.Checked, 'REQUNION');
  SetCheckSettings(chkReqAll.Checked, 'REQALL');
  SetCheckSettings(cbPrintReq.Checked, 'PRINTREQ');
  SetCheckSettings(chkNotUpdate.Checked, 'NOTAUTOUPDATE');
  SetCheckSettings(chkReqToAddress.Checked, 'REQTOADRES');
  SetCheckSettings(chkRecToCustomer.Checked, 'RECTOCUSTOMER');
  SetCheckSettings(chkAlwaysShow.Checked, 'ALWAYSSHOW');
  SetCheckSettings(chkReqOpen.Checked, 'REQOPENNEW');
  SetCheckSettings(chkToday.Checked, 'SET_AS_CURRENT_DATE');
  SetCheckSettings(chkDBsettings.Checked, 'DBSETTINGS');
  SetCheckSettings(chkHint.Checked, 'HIDEHINT');
  SetCheckSettings(chkShowWorks.Checked, 'SHOW_WORKS_IN_SINGLE');
  SetCheckSettings(chkQuckFilter.Checked, 'QUICK_FILTER');

  dmMain.SetIniValue('AUTOOPEN', cbAutoOpen.Value);
  if cbAuto.Checked then
    dmMain.SetIniValue('AUTOUPDATE', edMinutes.Value)
  else
    dmMain.SetIniValue('AUTOUPDATE', '0');

  if chkPrintBothCheck.Checked and (FileExists(ExtractFilePath(Application.ExeName) + 'cashrgst.dll')) then
    dmMain.SetIniValue('PRINT_CHECK_AND_REPORT', '1')
  else
    dmMain.SetIniValue('PRINT_CHECK_AND_REPORT', '0');

  if edtCBPSWD.Enabled then
    dmMain.SetIniValue('CASHBOXPSWD', edtCBPSWD.Text);

  dmMain.SetIniValue('DEFSEARCH', cbbSearchType.Value);
  dmMain.SetIniValue('KBDSWITCH', cbKBDSWITCH.Value);

  i := 0;
  if (chkBtnA.Checked) then
    i := (i or chkBtnA.Tag);
  if (chkBtnP.Checked) then
    i := (i or chkBtnP.Tag);
  if (chkBtnR.Checked) then
    i := (i or chkBtnR.Tag);
  if (chkBtnE.Checked) then
    i := (i or chkBtnE.Tag);
  if (chkBtnN.Checked) then
    i := (i or chkBtnN.Tag);
  if (chkBtnT.Checked) then
    i := (i or chkBtnT.Tag);
  dmMain.SetIniValue('BUTTONS', IntToStr(i));

  dmMain.SetIniValue('FONT_SIZE', IntToStr(btnFont.Font.Size));
  dmMain.SetIniValue('FONT_NAME', btnFont.Font.Name);
  dmMain.SetIniValue('ROW_HEIGHT', ednRH.Text);

  ModalResult := mrOk;
end;

procedure TSettingsUserForm.btnDelSettingsClick(Sender: TObject);
var
  s: string;
begin
  s := A4MainForm.GetIniFileName;
  DeleteFile(s);
end;

end.
