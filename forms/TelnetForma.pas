unit TelnetForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditHighlighter, StdCtrls, OverbyteIcsWndControl,
  OverbyteIcsTnCnx, ExtCtrls, Mask, DBCtrlsEh, ActnList, System.Actions, PropFilerEh, PropStorageEh;

type
  TTelnetForm = class(TForm)
    pnlControl: TPanel;
    HostLabel: TLabel;
    InfoLabel: TLabel;
    PortLabel: TLabel;
    Label1: TLabel;
    HostEdit: TEdit;
    ConnectButton: TButton;
    DisconnectButton: TButton;
    PortEdit: TEdit;
    DataEdit: TEdit;
    SendButton: TButton;
    btnClose: TButton;
    lbl6: TLabel;
    cbbEOL: TDBComboBoxEh;
    actlst1: TActionList;
    actShowControl: TAction;
    DisplayMemo: TDBMemoEh;
    PropStorageEh: TPropStorageEh;
    procedure FormCreate(Sender: TObject);
    procedure DisplayMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DisplayMemoKeyPress(Sender: TObject; var Key: Char);
    procedure SendButtonClick(Sender: TObject);
    procedure ConnectButtonClick(Sender: TObject);
    procedure DisconnectButtonClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbEOLChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actShowControlExecute(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    tlntExecuted : Boolean;
    fEOL : Integer;
    fExitOnExucute : Boolean;
    TnCnx: TTnCnx;
    function Connect(const host, port: string):boolean;
    procedure SendText(const text : string);
    procedure SetEOL(value : integer);
    procedure SetOnExit(value : Boolean);
    procedure TnCnxDataAvailable(Sender: TTnCnx; Buffer: Pointer;
      Len: Integer);
    procedure TnCnxSessionClosed(Sender: TTnCnx; Error: Word);
    procedure TnCnxSessionConnected(Sender: TTnCnx; Error: Word);
  public
    property telnet_EOL : Integer write SetEOL;
    property ExitOnExucute : Boolean write SetOnExit;
    { Public declarations }
  end;

function telnet(const host:string='localhost'; const port:string='telnet';const commands : string=''; const EOL_CHR:Integer = 0;const ExExit : Boolean = False):string;

implementation

uses StrUtils, OverbyteIcsWSocket;

{$R *.dfm}
const
  Telnet_wait = 500;
  CR = #13;
  LF = #10;

function CharToCode(const str : String) : string;
begin
  Result := str;
  Result := ReplaceStr(Result,'\n',CR+LF);
  Result := ReplaceStr(Result,'\r',CR+LF);
  Result := ReplaceStr(Result,'\p',#32);
end;

function telnet(const host:string='localhost'; const port:string='telnet';const commands : string=''; const EOL_CHR:Integer = 0;const ExExit : Boolean = False):string;
begin
  Result := '';

  with TTelnetForm.Create(Application) do
  try
    telnet_EOL := EOL_CHR;
    ExitOnExucute := ExExit;
    HostEdit.Text := host;
    PortEdit.Text := Port;
    DataEdit.Text := commands;
    pnlControl.Visible := not ExExit;
    if showmodal = mrOk
    then begin
      Result := DisplayMemo.Text;
    end;
  finally
    Free;
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{* Display a message in the memo field, breaking with CR                   *}
procedure MemoAddLines(Memo : TDBMemoEh; const Msg : String);
var
    Start, Stop : Integer;
begin
    if Memo.Lines.Count = 0 then Memo.Lines.Add('');
    //Memo.Lines.Text := Memo.Lines.Text+msg;
    //Exit;
    Start := 1;
    Stop  := Pos(CR, Msg);
    if Stop = 0 then
        Stop := Length(Msg) + 1;
    while Start <= Length(Msg) do begin
        Memo.Lines.Strings[Memo.Lines.Count - 1] :=
            Memo.Lines.Strings[Memo.Lines.Count - 1] +
            Copy(Msg, Start, Stop - Start);
        if Msg[Stop] = CR then begin
            Memo.Lines.Add('');
            SendMessage(Memo.Handle, WM_KEYDOWN, VK_UP, 1);
        end;
        Start := Stop + 1;
        if Start > Length(Msg) then
            Break;
        if Msg[Start] = LF then
           Start := Start + 1;
        Stop := Start;
        while (Msg[Stop] <> CR) and (Stop <= Length(Msg)) do
            Stop := Stop + 1;
    end;
end;

procedure TTelnetForm.actShowControlExecute(Sender: TObject);
begin
  pnlControl.Visible := True;
end;

procedure TTelnetForm.btnCloseClick(Sender: TObject);
begin
  if TnCnx.State = wsConnected then TnCnx.Close;
end;

procedure TTelnetForm.btn2Click(Sender: TObject);
begin
  DisplayMemo.SetFocus;
  if connect(HostEdit.Text, PortEdit.Text)
  then SendText(DataEdit.Text);
end;

procedure TTelnetForm.DisconnectButtonClick(Sender: TObject);
begin
    TnCnx.Close;
end;

procedure TTelnetForm.DisplayMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Key := 0;
end;

procedure TTelnetForm.DisplayMemoKeyPress(Sender: TObject; var Key: Char);
begin
  if TnCnx.State = wsConnected
  then begin
    TnCnx.Send(@Key, 1);
    if Key = CR then begin
        { Send a LF after CR key }
        if fEOL = 0 then begin
          Key := LF;
          TnCnx.Send(@Key, 1);
        end;
    end;
    Key := #0;
  end;
end;

procedure TTelnetForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(TnCnx)
  then begin
    if TnCnx.State = wsConnected then TnCnx.Close;
    FreeAndNil(TnCnx);
  end;
end;

procedure TTelnetForm.FormCreate(Sender: TObject);
begin
  //TnCnx
  TnCnx := TTnCnx.Create(Self);
  TnCnx.Name := 'TnCnx';
  TnCnx.Port := '23';
  TnCnx.Location := 'TNCNX';
  TnCnx.TermType := 'VT100';
  TnCnx.LocalEcho := False;
  TnCnx.SocketFamily := sfIPv4;
  TnCnx.OnSessionConnected := TnCnxSessionConnected;
  TnCnx.OnSessionClosed := TnCnxSessionClosed;
  TnCnx.OnDataAvailable := TnCnxDataAvailable;

  telnet_EOL := 0;
  fExitOnExucute := False;
end;

procedure TTelnetForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then btnCloseClick(Sender);
end;

procedure TTelnetForm.FormShow(Sender: TObject);
begin
  if fExitOnExucute
  then begin
    DisplayMemo.SetFocus;
    if connect(HostEdit.Text, PortEdit.Text)
    then begin
      Sleep(1000);
      Application.ProcessMessages;
      SendText(DataEdit.Text);
    end;
  end;
end;

procedure TTelnetForm.SendButtonClick(Sender: TObject);
begin
    SendText(DataEdit.Text);
end;

procedure TTelnetForm.TnCnxDataAvailable(Sender: TTnCnx; Buffer: Pointer;
  Len: Integer);
var
    Data : AnsiString;
begin
    if Len <= 0 then Exit;

    SetLength(Data, Len);
    Move(Buffer^, Data[1], Len);
    MemoAddLines(DisplayMemo, String(Data));
    tlntExecuted:=(Length(Data)>0);
end;

procedure TTelnetForm.TnCnxSessionClosed(Sender: TTnCnx; Error: Word);
begin
    InfoLabel.Caption        := 'Disconnected';
    ConnectButton.Enabled    := TRUE;
    DisconnectButton.Enabled := FALSE;
    SendButton.Enabled       := FALSE;
    if pnlControl.Visible then ActiveControl := ConnectButton;
end;

procedure TTelnetForm.TnCnxSessionConnected(Sender: TTnCnx; Error: Word);
begin
    if Error <> 0 then begin
        DisplayMemo.Lines.Add('Unable to connect. Error #' + IntToStr(Error));
        Exit;
    end;

    DisplayMemo.Clear;
    InfoLabel.Caption        := 'Connected';
    ConnectButton.Enabled    := FALSE;
    DisconnectButton.Enabled := TRUE;
    SendButton.Enabled       := True;
    ActiveControl            := DisplayMemo;
end;

procedure TTelnetForm.cbbEOLChange(Sender: TObject);
begin
  fEOL := cbbEOL.Value;
end;

function TTelnetForm.Connect(const host, port: string):boolean;
var
  i : Integer;
begin
  TnCnx.Host      := Host;
  TnCnx.Port      := Port;
  TnCnx.TermType  := 'VT100';
  TnCnx.LocalEcho := FALSE;

  TnCnx.Connect;
  i:=0;
  tlntExecuted := False;
  while (TnCnx.State <> wsConnected) and (i<Telnet_wait) do begin
    Sleep(10);
    Application.ProcessMessages;
    Inc(i);
  end;
  Result := (TnCnx.State = wsConnected);
end;

procedure TTelnetForm.ConnectButtonClick(Sender: TObject);
begin
  if (HostEdit.Text = '') or (PortEdit.Text = '') then
    exit;

  connect(HostEdit.Text, PortEdit.Text);
  fExitOnExucute := False;
end;

procedure TTelnetForm.SetEOL(value : integer);
begin
  fEOL := value;
  cbbEOL.Value := fEOL;
end;

procedure TTelnetForm.SetOnExit(value : boolean);
begin
  fExitOnExucute := value;
end;

procedure TTelnetForm.SendText(const text:string);
var
  cmd : string;
  commands : TStrings;
  i : Integer;
  w : Integer;
begin
  if TnCnx.State <> wsConnected
  then begin
    DisplayMemo.Lines.Add('*** NOT CONNECTED ***');
    Exit;
  end;

  cmd := Text;
  cmd := CharToCode(cmd);
  commands := TStringList.Create;
  try
    commands.Text := cmd;
    for i := 0 to commands.Count - 1 do begin
      cmd := commands[i];
      if cmd = 'wait' then begin
        Sleep(1000);
        Continue;
      end;
      case fEOL of
        1 :  cmd := cmd + LF+CR;
        2 :  cmd := cmd + LF;
        3 :  cmd := cmd + CR;
        else cmd := cmd + CR+LF;
      end;
      if TnCnx.State = wsConnected
      then begin
        tlntExecuted := False;
        w := 0;
        TnCnx.SendStr(cmd);
        while (not tlntExecuted) and (w<Telnet_wait) do begin
          Sleep(10);
          Application.ProcessMessages;
          Inc(w);
        end;
        //if (i<(commands.Count - 1)) then  sleep(500);
      end;
    end;
  finally
    commands.Free;
  end;
end;

end.
