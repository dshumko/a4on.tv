unit ScriptModule;
{$I defines.inc}

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes,
  fs_idialogsrtti, fs_iextctrlsrtti, fs_iclassesrtti, fs_igraphicsrtti, fs_iformsrtti, fs_icpp, fs_ipascal,
  fs_iinterpreter,
  fs_iinirtti, fs_ibasic, fs_ijs, fs_ichartrtti, fs_iadortti, fs_idbctrlsrtti, fs_idbrtti, fs_iibxrtti;

type
  TSM = class(TDataModule)
    fs: TfsScript;
    fsPascal1: TfsPascal;
    fsFormsRTTI1: TfsFormsRTTI;
    fsGraphicsRTTI1: TfsGraphicsRTTI;
    fsClassesRTTI1: TfsClassesRTTI;
    fsExtCtrlsRTTI1: TfsExtCtrlsRTTI;
    fsDialogsRTTI1: TfsDialogsRTTI;
    fsIBXRTTI1: TfsIBXRTTI;
    fsDBRTTI1: TfsDBRTTI;
    fsDBCtrlsRTTI1: TfsDBCtrlsRTTI;
    fsADORTTI1: TfsADORTTI;
    fsChartRTTI1: TfsChartRTTI;
    fsIniRTTI1: TfsIniRTTI;
    fsCPP1: TfsCPP;
    fsJScript1: TfsJScript;
    fsBasic1: TfsBasic;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function CallMethodforCMD(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function GridCallMethod(Instance: TObject; ClassType: TClass; const MethodName: String;
      var Params: Variant): Variant;
    function FromWinToUtf8(const FileName: String): Boolean;
    function FromWinToDos(const FileName: String): Boolean;
    function FromUtf8toDos(const FileName: String): Boolean;
    function FromUtf8toWin(const FileName: String): Boolean;
  public
    script: TStringList;
  end;

var
  SM: TSM;

implementation

uses
  Data.DB,
  Vcl.Grids,
  DM, FIBQuery, pFIBQuery, atrCmdUtils, RxStrUtils, synacode;

{$R *.dfm}

procedure TSM.DataModuleCreate(Sender: TObject);
begin
  script := TStringList.Create();
  fsGlobalUnit.AddMethod('function FileExists(const FileName: string): Boolean', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function DeleteFile(const FileName: string): Boolean', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function ExtractFileName(const FileName: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function ExtractFilePath(const FileName: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function ExtractFileDir(const FileName: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function ExtractFileExt(const FileName: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function RenameFile(const OldName: string; const NewName: string): Boolean', CallMethod,
    'A4on.TV');
  fsGlobalUnit.AddMethod('function OemToAnsiStr(const OemStr: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function AnsiToOemStr(const OemStr: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function BASE64_Decode(const S: String): String', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function BASE64_Encode(const S: String): String', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromWinToUtf8(const FileName: String)', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromWinToDos(const FileName: String)', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromUtf8toDos(const FileName: String)', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromUtf8toWin(const FileName: String)', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function RunCmd(const CmdLine: String; const params: String): String', CallMethodforCMD, 'A4on.TV');

  with fsGlobalUnit do
  begin
    AddClass(TCustomGrid, 'TCustomControl');
    AddClass(TDrawGrid, 'TCustomGrid');
    with AddClass(TStringGrid, 'TDrawGrid') do
    begin
      AddIndexProperty('Cells', 'Integer,Integer', 'String', GridCallMethod);
    end;
  end;
end;

function TSM.CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
begin
  if MethodName = 'FILEEXISTS' then
    Result := FileExists(Params[0])
  else if MethodName = 'DELETEFILE' then
    Result := System.SysUtils.DeleteFile(Params[0])
  else if MethodName = 'EXTRACTFILENAME' then
    Result := System.SysUtils.ExtractFileName(Params[0])
  else if MethodName = 'EXTRACTFILEPATH' then
    Result := System.SysUtils.ExtractFilePath(Params[0])
  else if MethodName = 'EXTRACTFILEDIR' then
    Result := System.SysUtils.ExtractFileDir(Params[0])
  else if MethodName = 'EXTRACTFILEEXT' then
    Result := System.SysUtils.ExtractFileExt(Params[0])
  else if MethodName = 'RENAMEFILE' then
    Result := System.SysUtils.RenameFile(Params[0], Params[1])
  else if MethodName = 'OEMTOANSISTR' then
    Result := OemToAnsiStr(Params[0])
  else if MethodName = 'BASE64_DECODE' then
    Result := DecodeBase64(Params[0])
  else if MethodName = 'BASE64_ENCODE' then
    Result := EncodeBase64(Params[0])
  else if MethodName = 'FROMWINTOUTF8' then
    Result := FromWinToUtf8(Params[0])
  else if MethodName = 'FROMUTF8TODOS' then
    Result := FromUtf8toDos(Params[0])
  else if MethodName = 'FROMUTF8TOWIN' then
    Result := FromUtf8toWin(Params[0])
  else if MethodName = 'ANSITOOEMSTR' then
    Result := StrToOem(Params[0])
  else if MethodName = 'FROMWINTODOS' then
    Result := FromWinToDos(Params[0]);
end;

function TSM.CallMethodforCMD(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
var
  ResLines: TStringList;
begin
  if MethodName = 'RUNCMD' then begin
    ShellExecute(0, 'open', Params[0], Params[1]);
  end;
end;

function TSM.GridCallMethod(Instance: TObject; ClassType: TClass; const MethodName: String;
  var Params: Variant): Variant;
begin
  if MethodName = 'CELLS.GET' then
    Result := TStringGrid(Instance).Cells[Params[0], Params[1]]
  else if MethodName = 'CELLS.SET' then
    TStringGrid(Instance).Cells[Params[0], Params[1]] := Params[2]
end;

procedure TSM.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(script);
end;

function TSM.FromWinToUtf8(const FileName: String): Boolean;
var
  str: TStrings;
begin
  Result := False;
  if not FileExists(FileName) then
    Exit;

  str := TStringList.Create;
  try
    str.LoadFromFile(FileName, TEncoding.ANSI);
    str.SaveToFile(FileName, TEncoding.UTF8);
    Result := True;
  finally
    str.Free;
  end;
end;

function TSM.FromWinToDos(const FileName: String): Boolean;
var
  str: TStrings;
begin
  Result := False;
  if not FileExists(FileName) then
    Exit;
  str := TStringList.Create;
  try
    str.LoadFromFile(FileName, TEncoding.ANSI);
    str.SaveToFile(FileName, TEncoding.ASCII);
    Result := True;
  finally
    str.Free;
  end;
end;

function TSM.FromUtf8toWin(const FileName: String): Boolean;
var
  str: TStrings;
begin
  Result := False;
  if not FileExists(FileName) then
    Exit;

  str := TStringList.Create;
  try
    str.LoadFromFile(FileName, TEncoding.UTF8);
    str.SaveToFile(FileName, TEncoding.ANSI);
    Result := True;
  finally
    str.Free;
  end;
end;

function TSM.FromUtf8toDos(const FileName: String): Boolean;
var
  str: TStrings;
begin
  Result := False;
  if not FileExists(FileName) then
    Exit;

  str := TStringList.Create;
  try
    str.LoadFromFile(FileName, TEncoding.UTF8);
    str.SaveToFile(FileName, TEncoding.ASCII);
    Result := True;
  finally
    str.Free;
  end;
end;

end.
