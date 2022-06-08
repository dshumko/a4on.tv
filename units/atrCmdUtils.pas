unit atrCmdUtils;

interface

uses
  Winapi.Windows, Winapi.ActiveX, Winapi.ShellAPI,
  System.Classes, System.SysUtils;

procedure WinExec(const ACmdLine: String; const ACmdShow: UINT = SW_SHOWNORMAL);
function ShellExecute(const AWnd: HWND; const AOperation, AFileName: String; const AParameters: String = '';
  const ADirectory: String = ''; const AShowCmd: Integer = SW_SHOWNORMAL): Boolean;
function Ping(const host: string): string;
procedure RunCmdWithOutInStrings(const CmdLine: AnsiString; ResLines: TStringList);
function GetEnvVarValue(const VarName: string): string;
{
  function ExecuteFile(FileName,StdInput: string;
  TimeOut: integer;
  var StdOutput:string) : boolean;
}

implementation

function GetEnvVarValue(const VarName: string): string;
var
  BufSize: Integer;  // buffer size required for value
begin
  // Get required buffer size (inc. terminal #0)
  BufSize := GetEnvironmentVariable(
    PChar(VarName), nil, 0);
  if BufSize > 0 then
  begin
    // Read env var value into result string
    SetLength(Result, BufSize - 1);
    GetEnvironmentVariable(PChar(VarName),
      PChar(Result), BufSize);
  end
  else
    // No such environment variable
    Result := '';
end;

// RunDosInMemo('ping -t 192.168.28.200',Memo1);
procedure RunCmdWithOutInStrings(const CmdLine: AnsiString; ResLines: TStringList);
const
  BUFSIZE = 24000;
var
  SecAttr: TSecurityAttributes;
  hReadPipe, hWritePipe: THandle;
  StartupInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Buffer: PAnsiChar;
  WaitReason, BytesRead: DWord;
begin
  with SecAttr do
  begin
    nlength := SizeOf(TSecurityAttributes);
    binherithandle := true;
    lpsecuritydescriptor := nil;
  end;
  // Creazione della pipe
  if Createpipe(hReadPipe, hWritePipe, @SecAttr, 0) then
  begin
    Buffer := AllocMem(BUFSIZE + 1);
    // Allochiamo un buffer di dimensioni BUFSIZE+1
    FillChar(StartupInfo, SizeOf(StartupInfo), #0);
    StartupInfo.cb := SizeOf(StartupInfo);
    StartupInfo.hStdOutput := hWritePipe;
    StartupInfo.hStdInput := hReadPipe;
    StartupInfo.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
    StartupInfo.wShowWindow := SW_HIDE;
    if CreateProcess(nil, Pchar(CmdLine), @SecAttr, @SecAttr, true, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo,
      ProcessInfo) then
    begin
      // Attendiamo la fine dell'esecuzione del processo
      repeat
        WaitReason := WaitForSingleObject(ProcessInfo.hProcess, 100);
      until (WaitReason <> WAIT_TIMEOUT);
      // Leggiamo la pipe
      Repeat
        BytesRead := 0;
        // Leggiamo "BUFSIZE" bytes dalla pipe
        ReadFile(hReadPipe, Buffer[0], BUFSIZE, BytesRead, nil);
        // Convertiamo in una stringa "\0 terminated"
        Buffer[BytesRead] := #0;
        // Convertiamo i caratteri da DOS ad ANSI
        OemToAnsi(Buffer, Buffer);
        // Scriviamo nell' "OutMemo" l'output ricevuto tramite pipe
        ResLines.Text := ResLines.Text + String(Buffer);
      until (BytesRead < BUFSIZE);
    end;
    FreeMem(Buffer);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(hReadPipe);
    CloseHandle(hWritePipe);
  end;

end;

function Ping(const host: string): string;
var
  CommandLine: string;
  t: TStringList;
begin
  CommandLine := 'ping -n 3 -a ' + host;
  t := TStringList.Create;
  try
    RunCmdWithOutInStrings(CommandLine, t);
    Result := t.Text;
  finally
    t.Free;
  end;
end;

function ShellExecute(const AWnd: HWND; const AOperation, AFileName: String; const AParameters: String = '';
  const ADirectory: String = ''; const AShowCmd: Integer = SW_SHOWNORMAL): Boolean;
var
  ExecInfo: TShellExecuteInfo;
  NeedUninitialize: Boolean;
begin
  Assert(AFileName <> '');

  NeedUninitialize := SUCCEEDED(CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE));
  try
    FillChar(ExecInfo, SizeOf(ExecInfo), 0);
    ExecInfo.cbSize := SizeOf(ExecInfo);

    ExecInfo.Wnd := AWnd;
    ExecInfo.lpVerb := Pointer(AOperation);
    ExecInfo.lpFile := Pchar(AFileName);
    ExecInfo.lpParameters := Pointer(AParameters);
    ExecInfo.lpDirectory := Pointer(ADirectory);
    ExecInfo.nShow := AShowCmd;
    ExecInfo.fMask := SEE_MASK_NOASYNC { = SEE_MASK_FLAG_DDEWAIT для старых версий Delphi }
      or SEE_MASK_FLAG_NO_UI;
{$IFDEF UNICODE}
    // Необязательно, см. http://www.transl-gunsmoker.ru/2015/01/what-does-SEEMASKUNICODE-flag-in-ShellExecuteEx-actually-do.html
    ExecInfo.fMask := ExecInfo.fMask or SEE_MASK_UNICODE;
{$ENDIF}
{$WARN SYMBOL_PLATFORM OFF}
    Result := ShellExecuteEx(@ExecInfo);
{$WARN SYMBOL_PLATFORM ON}
  finally
    if NeedUninitialize then
      CoUninitialize;
  end;
end;

procedure WinExec(const ACmdLine: String; const ACmdShow: UINT = SW_SHOWNORMAL);
var
  SI: TStartUpInfo;
  PI: TProcessInformation;
  CmdLine: String;
begin
  Assert(ACmdLine <> '');

  CmdLine := ACmdLine;
  UniqueString(CmdLine);

  FillChar(SI, SizeOf(SI), 0);
  FillChar(PI, SizeOf(PI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := ACmdShow;

  SetLastError(ERROR_INVALID_PARAMETER);
{$WARN SYMBOL_PLATFORM OFF}
  Win32Check(CreateProcess(nil, Pchar(CmdLine), nil, nil, False, CREATE_DEFAULT_ERROR_MODE
    {$IFDEF UNICODE} or CREATE_UNICODE_ENVIRONMENT{$ENDIF}, nil, nil, SI, PI));
{$WARN SYMBOL_PLATFORM ON}
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);
end;

{
  Это пример запуска консольных программ с передачей ей консольного ввода
  (как если бы он был введен с клавиатуры после запуска программы) и чтением консольного вывода.
  Таким способом можно запускать например стандартный виндовый ftp.exe (в невидимом окне) и тем
  самым отказаться от использования специализированных, зачастую глючных компонент.


  function ExecuteFile(FileName,StdInput: string;
  TimeOut: integer;
  var StdOutput:string) : boolean;

  label Error;

  type
  TPipeHandles = (IN_WRITE,  IN_READ,
  OUT_WRITE, OUT_READ,
  ERR_WRITE, ERR_READ);

  type
  TPipeArray = array [TPipeHandles] of THandle;

  var
  i         : integer;
  ph        : TPipeHandles;
  sa        : TSecurityAttributes;
  Pipes     : TPipeArray;
  StartInf  : TStartupInfo;
  ProcInf   : TProcessInformation;
  Buf       : array[0..1024] of byte;
  TimeStart : TDateTime;


  function ReadOutput : string;
  var
  i : integer;
  s : string;
  BytesRead : longint;

  begin
  Result := '';
  repeat

  Buf[0]:=26;
  WriteFile(Pipes[OUT_WRITE],Buf,1,BytesRead,nil);
  if ReadFile(Pipes[OUT_READ],Buf,1024,BytesRead,nil) then
  begin
  if BytesRead>0 then
  begin
  buf[BytesRead]:=0;
  s := StrPas(@Buf[0]);
  i := Pos(#26,s);
  if i>0 then s := copy(s,1,i-1);
  Result := Result + s;
  end;
  end;

  if BytesRead1024 then break;
  until false;
  end;


  begin
  Result := false;
  for ph := Low(TPipeHandles) to High(TPipeHandles) do
  Pipes[ph] := INVALID_HANDLE_VALUE;


  // Создаем пайпы
  sa.nLength := sizeof(sa);
  sa.bInheritHandle := TRUE;
  sa.lpSecurityDescriptor := nil;


  if not CreatePipe(Pipes[IN_READ],Pipes[IN_WRITE], @sa, 0 ) then
  goto Error;
  if not CreatePipe(Pipes[OUT_READ],Pipes[OUT_WRITE], @sa, 0 ) then
  goto Error;
  if not CreatePipe(Pipes[ERR_READ],Pipes[ERR_WRITE], @sa, 0 ) then
  goto Error;



  // Пишем StdIn
  StrPCopy(@Buf[0],stdInput+^Z);
  WriteFile(Pipes[IN_WRITE],Buf,Length(stdInput),i,nil);


  // Хендл записи в StdIn надо закрыть - иначе выполняемая программа
  // может не прочитать или прочитать не весь StdIn.

  CloseHandle(Pipes[IN_WRITE]);

  Pipes[IN_WRITE] := INVALID_HANDLE_VALUE;


  FillChar(StartInf,sizeof(TStartupInfo),0);
  StartInf.cb := sizeof(TStartupInfo);
  StartInf.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;


  StartInf.wShowWindow := SW_SHOW; // SW_HIDE если надо запустить невидимо


  StartInf.hStdInput := Pipes[IN_READ];
  StartInf.hStdOutput := Pipes[OUT_WRITE];
  StartInf.hStdError := Pipes[ERR_WRITE];


  if not CreateProcess(nil, PChar(FileName), nil,
  nil, True, NORMAL_PRIORITY_CLASS,
  nil, nil, StartInf, ProcInf) then goto Error;

  TimeStart := Now;

  repeat
  Application.ProcessMessages;
  i := WaitForSingleObject(ProcInf.hProcess,100);
  if i = WAIT_OBJECT_0 then break;
  if (Now-TimeStart)*SecsPerDay>TimeOut then break;
  until false;


  if iWAIT_OBJECT_0 then goto Error;
  StdOutput := ReadOutput;

  for ph := Low(TPipeHandles) to High(TPipeHandles) do
  if Pipes[ph]INVALID_HANDLE_VALUE then
  CloseHandle(Pipes[ph]);


  CloseHandle(ProcInf.hProcess);
  CloseHandle(ProcInf.hThread);
  Result := true;
  Exit;


  Error:

  if ProcInf.hProcessINVALID_HANDLE_VALUE then

  begin
  CloseHandle(ProcInf.hThread);
  i := WaitForSingleObject(ProcInf.hProcess, 1000);
  CloseHandle(ProcInf.hProcess);
  if iWAIT_OBJECT_0 then

  begin
  ProcInf.hProcess := OpenProcess(PROCESS_TERMINATE,
  FALSE,
  ProcInf.dwProcessId);

  if ProcInf.hProcess  0 then
  begin
  TerminateProcess(ProcInf.hProcess, 0);
  CloseHandle(ProcInf.hProcess);
  end;
  end;
  end;

  for ph := Low(TPipeHandles) to High(TPipeHandles) do
  if Pipes[ph]INVALID_HANDLE_VALUE then
  CloseHandle(Pipes[ph]);

  end;
}

end.
