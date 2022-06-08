unit UserLoginDlg;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ActnList, Vcl.Buttons, Vcl.Mask, Vcl.Grids,
  Vcl.Imaging.pngimage,
  DBCtrlsEh, PrjConst;

{$IFDEF Scale4k}

const
  WM_DPICHANGED = 736; // 0x02E0
{$ENDIF}

type
  TUserLoginDialog = class(TForm)
    ActionList: TActionList;
    actLogin: TAction;
    Timer1: TTimer;
    pnlLogin: TPanel;
    AppIcon: TImage;
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbSERVER: TDBComboBoxEh;
    mbbOk: TBitBtn;
    mbbCancel: TBitBtn;
    xLabel1: TLabel;
    edUser: TDBEditEh;
    edPassword: TDBEditEh;
    actEditDB: TAction;
    lblLANG: TLabel;
    lblCAPS: TLabel;
    procedure actLoginUpdate(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mbbCancelClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbSERVERNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actEditDBExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edUserExit(Sender: TObject);
  private
    FDatabases: TStringList;
    procedure UpdateKbdState;
    procedure LoadListOfDataBases;
    procedure SetDataBase(const Value: string);
    function GetDataBase: string;
{$IFDEF Scale4k}
    procedure WMDpiChanged(var Message: TMessage); message WM_DPICHANGED;
{$ENDIF}
  public
    { Public declarations }
    procedure CreateParams(VAR Params: TCreateParams);
    property DataBase: string read GetDataBase write SetDataBase;
  end;

function LoginDialog(var ADatabaseName, AUserName, APassword: string): Boolean;
// Возвращает базу пароль логин и алиас (название) базы
function LoginDialogA(var ADatabaseName, AUserName, APassword,
  ADatabaseAlias: string): Boolean;

implementation

{$R *.DFM}

uses
  Winapi.ShellAPI, Winapi.CommCtrl, Winapi.ShlObj,
  System.IniFiles,
  DBEditor, DM, MAIN, atrCmdUtils;

function LoginDialog(var ADatabaseName, AUserName, APassword: string): Boolean;
var
  LoginDlg: TUserLoginDialog;
begin
  LoginDlg := TUserLoginDialog.Create(nil);
  with LoginDlg do
    try
      DataBase := ADatabaseName;
      edUser.Text := AUserName;
      Result := ShowModal = mrOk;
      if Result then
      begin
        ADatabaseName := DataBase;
        AUserName := edUser.Text;
        APassword := edPassword.Text;
      end;
    finally
      Free;
    end
end;

function LoginDialogA(var ADatabaseName, AUserName, APassword,
  ADatabaseAlias: string): Boolean;
var
  LoginDlg: TUserLoginDialog;
begin
  LoginDlg := TUserLoginDialog.Create(nil);
  with LoginDlg do
    try
      DataBase := ADatabaseName;
      edUser.Text := AUserName;
      edPassword.Text := APassword;
      Result := ShowModal = mrOk;
      if Result then
      begin
        ADatabaseName := DataBase;
        AUserName := edUser.Text;
        APassword := edPassword.Text;
        ADatabaseAlias := cbSERVER.Text;
      end;
    finally
      Free;
    end
end;

{$IFDEF Scale4k}

procedure TUserLoginDialog.WMDpiChanged(var Message: TMessage);
{$IFDEF DELPHI_STYLE_SCALING}
  function FontHeightAtDpi(aDPI, aFontSize: integer): integer;
  var
    tmpCanvas: TCanvas;
  begin
    tmpCanvas := TCanvas.Create;
    try
      tmpCanvas.Handle := GetDC(0);
      tmpCanvas.Font.Assign(self.Font);
      tmpCanvas.Font.PixelsPerInch := aDPI; // must be set BEFORE size
      tmpCanvas.Font.size := aFontSize;
      Result := tmpCanvas.TextHeight('0');
    finally
      tmpCanvas.Free;
    end;
  end;
{$ENDIF}

begin
  inherited;
{$IFDEF DELPHI_STYLE_SCALING}
  ChangeScale(FontHeightAtDpi(LOWORD(Message.wParam), self.Font.size),
    FontHeightAtDpi(self.PixelsPerInch, self.Font.size));
{$ELSE}
  ChangeScale(LOWORD(Message.wParam), self.PixelsPerInch);
{$ENDIF}
  self.PixelsPerInch := LOWORD(Message.wParam);
end;
{$ENDIF}

procedure TUserLoginDialog.SetDataBase(const Value: string);
var
  i: integer;
begin
  i := FDatabases.IndexOf(Value);
  if i < 0 then
    cbSERVER.Text := Value
  else
    cbSERVER.Text := cbSERVER.Items[i];
end;

function TUserLoginDialog.GetDataBase: string;
var
  i: integer;
begin
  i := cbSERVER.Items.IndexOf(cbSERVER.Text);
  if i >= 0 then
    Result := FDatabases[i]
  else
    Result := '';
end;

procedure TUserLoginDialog.LoadListOfDataBases;
var
  AppIni: TIniFile;
  i: integer;
begin
  cbSERVER.Items.Clear;
  FDatabases.Clear;
  AppIni := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    AppIni.ReadSection('DATABASES', cbSERVER.Items);
    for i := 0 to cbSERVER.Items.Count - 1 do
      FDatabases.Add(AppIni.ReadString('DATABASES', cbSERVER.Items[i], ''));
  finally
    AppIni.Free;
  end;
end;

procedure TUserLoginDialog.UpdateKbdState;
var
  Buf: array [0 .. KL_NAMELENGTH] of char;
  Pk: PChar;
  C, i: integer;
begin
  GetKeyboardLayoutName(@Buf);
  Pk := @Buf;
  Val(StrPas(Pk), i, C);

  case i of
    409:
      lblLANG.Caption := 'EN';
    419:
      lblLANG.Caption := 'RU';
    422:
      lblLANG.Caption := 'UA';
    10437:
      lblLANG.Caption := 'ქარ';
    42:
      lblLANG.Caption := 'HY';
  else
    lblLANG.Caption := IntToStr(i);
  end;

  lblCAPS.Visible := (GetKeyState(VK_CAPITAL) and $01) = 1;
end;

procedure TUserLoginDialog.actLoginUpdate(Sender: TObject);
begin
  actLogin.Enabled := (edUser.Text > '') and (cbSERVER.Text > '');
end;

procedure TUserLoginDialog.actEditDBExecute(Sender: TObject);
var
  lzForm: TfmDBEditor;
  AppIni: TIniFile;
  i, j: integer;
  c1, c2: string;
begin
  Screen.Cursor := crHourGlass;
  lzForm := TfmDBEditor.Create(Application);
  try
    lzForm.Left := Left + Width + 2;
    lzForm.Top := Top;
    lzForm.temp.Open;
    AppIni := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
    try
      AppIni.ReadSection('DATABASES', cbSERVER.Items);
      for i := 0 to cbSERVER.Items.Count - 1 do
      begin
        lzForm.temp.Append;
        lzForm.temp.FieldByName('NAME').Value := cbSERVER.Items[i];
        c1 := AppIni.ReadString('DATABASES', cbSERVER.Items[i], '');

        for j := 1 to Length(c1) do
        begin
          c2 := Copy(c1, j, 1);
          if (c2 = ':') and (Copy(c1, j + 1, 1) <> '\') then
          begin
            lzForm.temp.FieldByName('IP').Value := Copy(c1, 1, j - 1);
            lzForm.temp.FieldByName('WAY').Value := Copy(c1, j + 1);
            Break;
          end;
        end;
        if ((j - 1) = Length(c1)) then
          lzForm.temp.FieldByName('WAY').Value := c1;
        lzForm.temp.Post;
      end;
      lzForm.temp.First;
      Screen.Cursor := crDefault;
      lzForm.ShowModal;
      Screen.Cursor := crHourGlass;
      try
        AppIni.EraseSection('DATABASES');
        lzForm.temp.First;
        while (not lzForm.temp.Eof) do
        begin
          if (lzForm.temp.FieldByName('IP').AsString <> '') then
            c1 := lzForm.temp.FieldByName('IP').AsString + ':' +
              lzForm.temp.FieldByName('WAY').AsString
          else
            c1 := lzForm.temp.FieldByName('WAY').AsString;
          AppIni.WriteString('DATABASES', lzForm.temp.FieldByName('NAME')
            .AsString, c1);
          lzForm.temp.Next;
        end;
      except
        ShowMessage(format(rsIniWriteError, [AppIni.FileName]));
      end;
    finally
      AppIni.Free;
    end;
    lzForm.temp.Close;
  finally
    lzForm.Free;
  end;
  LoadListOfDataBases;
  Screen.Cursor := crDefault;
end;

procedure TUserLoginDialog.actLoginExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TUserLoginDialog.FormDestroy(Sender: TObject);
begin
  FDatabases.Free;
end;

procedure TUserLoginDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    actLoginExecute(Sender);
end;

procedure TUserLoginDialog.FormActivate(Sender: TObject);
begin
  Left := (Screen.Monitors[0].Width - Width) div 2;
  Top := (Screen.Monitors[0].Height - Height) div 2;
  if cbSERVER.Text <> '' then
  begin
    if edUser.Text <> '' then
      edPassword.SetFocus
    else
      edUser.SetFocus;
  end
  else
    cbSERVER.SetFocus;
end;

procedure TUserLoginDialog.FormCreate(Sender: TObject);
begin
  FDatabases := TStringList.Create;
  LoadListOfDataBases;
end;

procedure TUserLoginDialog.mbbCancelClick(Sender: TObject);
begin
  // Halt;
  ModalResult := mrCancel;
end;

procedure TUserLoginDialog.Timer1Timer(Sender: TObject);
begin
  UpdateKbdState;
end;

procedure TUserLoginDialog.cbSERVERNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
var
  InputString: string;
  AppIni: TIniFile;
begin
  if NewText = 'A4ON' then
    Exit;
  if NewText = '' then
  begin
    if cbSERVER.Items.Count > 0 then
      cbSERVER.Text := cbSERVER.Items[0];
    Exit;
  end;

  InputString := InputBox(rsDataBaseAlias, rsLabelName + ' ' + NewText, '');
  if InputString <> '' then
  begin
    AppIni := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
    try
      AppIni.WriteString('DATABASES', InputString, NewText);
    finally
      AppIni.Free;
    end;
  end;
  RecheckInList := False;
  LoadListOfDataBases;
  cbSERVER.Text := InputString;
end;

procedure TUserLoginDialog.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params); { CreateWindowEx }
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow; // дочерняя форма рабочего стола
end;

procedure TUserLoginDialog.edUserExit(Sender: TObject);
var
  pass: String;
begin
  pass := GetEnvVarValue('A4ON_' + edUser.Text);
  if not pass.isEmpty then
    edPassword.Text := pass;
end;

end.
