unit ScriptModule;
{$I defines.inc}
interface

uses
  SysUtils, Classes, fs_idialogsrtti, fs_iextctrlsrtti, fs_iclassesrtti,
  fs_igraphicsrtti, fs_iformsrtti, fs_icpp, fs_ipascal, fs_iinterpreter,
  fs_iinirtti, fs_ibasic, fs_ijs, fs_ichartrtti, Winapi.Windows,
  fs_iadortti, fs_idbctrlsrtti, fs_idbrtti, fs_iibxrtti
  {$IFNDEF UTF}
  ,PHPCustomLibrary, php4delphi, PHPCommon, phpFunctions, ZendAPI, PHPAPI,
  ZendTypes, phpTypes, phpLibrary
  {$ENDIF}
  ;

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
    {$IFNDEF UTF}
    procedure PSBeforeExecute(Sender: TObject);
    procedure AddPHPVariable(const Name, Value : string);
    {$ENDIF}
    function CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function GridCallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
    function FromWinToUtf8(const FileName : String) : Boolean;
    function FromWinToDos(const FileName : String) : Boolean;
    function FromUtf8toDos(const FileName : String) : Boolean;
    function FromUtf8toWin(const FileName : String) : Boolean;
  public
    {$IFNDEF UTF}
    PHPEngine: TPHPEngine;
    PHPLibrary: TPHPLibrary;
    PS: TpsvPHP;
    {$ENDIF}
    script : TStringList;
  end;

var
  SM: TSM;

implementation

uses
  DM, DB, FIBQuery, pFIBQuery,
  RxStrUtils, Grids, synacode;

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
  fsGlobalUnit.AddMethod('function RenameFile(const OldName: string; const NewName: string): Boolean', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function OemToAnsiStr(const OemStr: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function AnsiToOemStr(const OemStr: string): string', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function BASE64_Decode(const S: String): String', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('function BASE64_Encode(const S: String): String', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromWinToUtf8(const FileName: String)', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromWinToDos(const FileName: String)', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromUtf8toDos(const FileName: String)', CallMethod, 'A4on.TV');
  fsGlobalUnit.AddMethod('procedure FromUtf8toWin(const FileName: String)', CallMethod, 'A4on.TV');

  with fsGlobalUnit do begin
    AddClass(TCustomGrid, 'TCustomControl');
    AddClass(TDrawGrid, 'TCustomGrid');
    with AddClass(TStringGrid, 'TDrawGrid') do begin
      AddIndexProperty('Cells', 'Integer,Integer', 'String', GridCallMethod);
    end;
  end;

  {$IFNDEF UTF}
  PHPEngine := TPHPEngine.Create(Self);

  with PHPEngine do begin
    Name := 'PHPEngine';
    ReportDLLError := False;
  end;

  PS := TpsvPHP.Create(Self);

  with PS do begin
    Name := 'PS';
    with Variables.Add do begin
      Name := 'ATIRRA_USER';
      Value := 'INIT';
    end;
    with Variables.Add do begin
      Name := 'ATIRRA_PASSWORD';
    end;
    with Variables.Add do begin 
      Name := 'ATIRRA_DB';
    end;
    with Variables.Add do begin 
      Name := 'ATIRRA_SERVER';
    end;
    with Variables.Add do begin 
      Name := 'ATIRRA_PATH';
    end;
    with Variables.Add do begin
      Name := 'ATIRRA_DBNAME';
    end;
    with Variables.Add do begin 
      Name := 'A4ON_USER';
      Value := 'INIT';
    end;
    with Variables.Add do begin 
      Name := 'A4ON_PASSWORD';
    end;
    with Variables.Add do begin 
      Name := 'A4ON_DB';
    end;
    with Variables.Add do begin
      Name := 'A4ON_SERVER';
    end;
    with Variables.Add do begin 
      Name := 'A4ON_PATH';
    end;
    with Variables.Add do begin 
      Name := 'A4ON_DBNAME';
    end;
    BeforeExecute := PSBeforeExecute;
  end;

  PHPLibrary := TPHPLibrary.Create(Self);

  with PHPLibrary do begin
    Name := 'PHPLibrary';
    LibraryName := 'ArrayLib';
    with Functions.Add do begin
      FunctionName := 'get_php_array';
    end;
  end;

  {$ENDIF}
end;

function TSM.CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
begin
  if      MethodName = 'FILEEXISTS'      then Result := FileExists(Params[0])
  else if MethodName = 'DELETEFILE'      then Result := SysUtils.DeleteFile(Params[0])
  else if MethodName = 'EXTRACTFILENAME' then Result := SysUtils.ExtractFileName(Params[0])
  else if MethodName = 'EXTRACTFILEPATH' then Result := SysUtils.ExtractFilePath(Params[0])
  else if MethodName = 'EXTRACTFILEDIR'  then Result := SysUtils.ExtractFileDir(Params[0])
  else if MethodName = 'EXTRACTFILEEXT'  then Result := SysUtils.ExtractFileExt(Params[0])
  else if MethodName = 'RENAMEFILE'      then Result := SysUtils.RenameFile(Params[0],Params[1])
  else if MethodName = 'OEMTOANSISTR'    then Result := OemToAnsiStr(Params[0])
  else if MethodName = 'BASE64_DECODE'   then Result := DecodeBase64(Params[0])
  else if MethodName = 'BASE64_ENCODE'   then Result := EncodeBase64(Params[0])
  else if MethodName = 'FROMWINTOUTF8'   then Result := FromWinToUtf8(Params[0])
  else if MethodName = 'FROMUTF8TODOS'   then Result := FromUtf8toDos(Params[0])
  else if MethodName = 'FROMUTF8TOWIN'   then Result := FromUtf8toWin(Params[0])
  else if MethodName = 'ANSITOOEMSTR'    then Result := StrToOem(Params[0])
  else if MethodName = 'FROMWINTODOS'    then Result := FromWinToDos(Params[0]);
end;

function TSM.GridCallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
begin
   if MethodName = 'CELLS.GET' then
      Result := TStringGrid(Instance).Cells[Params[0], Params[1]]
    else if MethodName = 'CELLS.SET' then
      TStringGrid(Instance).Cells[Params[0], Params[1]] := Params[2]
end;

{$IFNDEF UTF}
procedure TSM.PSBeforeExecute(Sender: TObject);
begin
  PS.Variables.ByName('A4ON_SERVER').Value   := dmMain.Server;
  PS.Variables.ByName('A4ON_DB').Value       := dmMain.database;
  PS.Variables.ByName('A4ON_USER').Value     := dmMain.User;
  PS.Variables.ByName('A4ON_PASSWORD').Value := dmMain.Password;
  PS.Variables.ByName('A4ON_DBNAME').Value   := dmMain.DBName;
  PS.Variables.ByName('A4ON_PATH').Value     := A4MainForm.ApplicationPath;
  PS.Variables.ByName('ATIRRA_SERVER').Value   := dmMain.Server;
  PS.Variables.ByName('ATIRRA_DB').Value       := dmMain.database;
  PS.Variables.ByName('ATIRRA_USER').Value     := dmMain.User;
  PS.Variables.ByName('ATIRRA_PASSWORD').Value := dmMain.Password;
  PS.Variables.ByName('ATIRRA_DBNAME').Value   := dmMain.DBName;
  PS.Variables.ByName('ATIRRA_PATH').Value     := A4MainForm.ApplicationPath;
end;
{$ENDIF}

procedure TSM.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(Script);
end;

{$IFNDEF UTF}
procedure TSM.AddPHPVariable(const Name, Value : string);
var
  phpVariable : TPHPVariable;
  i : Integer;
  vexist : boolean;
begin
  vexist := false;
  for i := 0 to PS.Variables.Count - 1 do vexist := vexist or (PS.Variables.Items[i].Name = Name);
  if vexist
  then PS.Variables.ByName(Name).Value    :=  Value
  else begin
    phpVariable := PS.Variables.Add;
    phpVariable.Name := Name;
    phpVariable.Value:= Value;
  end;
  script.Add('$'+Name+' ='''+Value+''';');
end;
{$ENDIF}

function TSM.FromWinToUtf8(const FileName : String) : Boolean;
var
  str : TStrings;
begin
  Result := False;
  if not FileExists(FileName) then Exit;

  str := TStringList.Create;
  try
    str.LoadFromFile(FileName, TEncoding.ANSI);
    str.SaveToFile(FileName, TEncoding.UTF8);
    Result := True;
  finally
    str.Free;
  end;
end;
function TSM.FromWinToDos(const FileName : String) : Boolean;
var
  str : TStrings;
begin
  Result := False;
  if not FileExists(FileName) then Exit;
  str := TStringList.Create;
  try
    str.LoadFromFile(FileName, TEncoding.ANSI);
    str.SaveToFile(FileName, TEncoding.ASCII);
    Result := True;
  finally
    str.Free;
  end;
end;

function TSM.FromUtf8toWin(const FileName : String) : Boolean;
var
  str : TStrings;
begin
  Result := False;
  if not FileExists(FileName) then Exit;

  str := TStringList.Create;
  try
    str.LoadFromFile(FileName, TEncoding.UTF8);
    str.SaveToFile(FileName, TEncoding.ANSI);
    Result := True;
  finally
    str.Free;
  end;
end;

function TSM.FromUtf8toDos(const FileName : String) : Boolean;
var
  str : TStrings;
begin
  Result := False;
  if not FileExists(FileName) then Exit;

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
