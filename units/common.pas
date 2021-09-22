unit Common;

interface

{$I defines.inc}

uses Classes, Forms, Controls , Graphics,SysUtils, Windows, Variants, RxStrUtils, DB;

type
  TShowFont = class(TControl)
  public
    property Font;
  end;

var
  DebugMode:Boolean = true;
//  gServerName:String;
//  gSysDbaPassword:String;
//  gServerProtocol:integer;
//  gLogonUserName,
//  gLogonUserPassword,
//  gLogonDataBase: String;
  gFR_FORMS_PATH : String;
  OPERATION_DATE : TDateTime;

//  gRoundPrecision:integer;
//  gEnterToTab : boolean = true;

  gCustActive:TColor;       //Подключен
  gCustInactive:TColor;     //Отключен
  gCustInactiveDebt:TColor; //Отключен и долг
  gCustPPAct:TColor;        //Повторно подключался

function LogEvent(const AUnit, ADescr, ANonice:String):boolean;
procedure SetGlobalConst;
function GetExePath: string;

procedure DatasetToFile(Dataset: TDataset; FileName: string);
procedure DatasetFromFile(Dataset: TDataset; FileName: string);

function AdvSelectDirectory(const Caption: string; const Root: WideString;
   var Directory: string; EditBox: Boolean = False; ShowFiles: Boolean = False;
   AllowCreateDirs: Boolean = True): Boolean;
procedure ComressStream( aSource, aTarget : TStream);
procedure DecompressStream(aSource, aTarget: TStream);

// получаем версию файла
function GetFileVersion(const FileName: TFileName; var Major, Minor, Release, Build: Integer): Boolean;
// Возвращает системный каталог, по умолчанию
function GetSpecialFolderPath(folder : integer=2) : string;
// Возвращает путь ко времменой папке
function GetTempDir: String;

implementation

uses
  DateUtils, IniFiles, ClipBrd, ShlObj, ActiveX, Zlib, ZlibConst, AtrStrUtils, SHFolder;

  function GetTempDir: String;
  var
     Buf: array[0..1023] of Char;
  begin
     SetString(Result, Buf, GetTempPath(Sizeof(Buf)-1, Buf));
  end;

 {
  Возвращает системный каталог, по умолчанию

     0: [Current User]\My Documents
     1: All Users\Application Data
     2: [User Specific]\Application Data
     3: Program Files
     4: All Users\Documents

 }
 function GetSpecialFolderPath(folder : integer=2) : string;
 const
   SHGFP_TYPE_CURRENT = 0;
 var
   path: array [0..MAX_PATH] of char;
   specialFolder : integer;
 begin
   specialFolder := CSIDL_PERSONAL;
   case folder of
     //[Current User]\My Documents
     0: specialFolder := CSIDL_PERSONAL;
     //All Users\Application Data
     1: specialFolder := CSIDL_COMMON_APPDATA;
     //[User Specific]\Application Data
     2: specialFolder := CSIDL_LOCAL_APPDATA;
     //Program Files
     3: specialFolder := CSIDL_PROGRAM_FILES;
     //All Users\Documents
     4: specialFolder := CSIDL_COMMON_DOCUMENTS;
   end;

   if SUCCEEDED(SHGetFolderPath(0,specialFolder,0,SHGFP_TYPE_CURRENT,@path[0])) then
     Result := path
   else
     Result := '';
 end;

function GetFileVersion(const FileName: TFileName; var Major, Minor,
Release, Build: Integer): Boolean;
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
VerSize: DWORD;
begin
  Result:= False;
  InfoSize:= GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then begin
          Major:= FI.dwFileVersionMS shr 16;
          Minor:= FI.dwFileVersionMS and $FFFF;
          Release:= FI.dwFileVersionLS shr 16;
          Build:= FI.dwFileVersionLS and $FFFF;
          Result:= True;
        end;
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

procedure ComressStream( aSource, aTarget : TStream);
var
  comprStream : TCompressionStream;
begin
  // compression level : (clNone, clFastest, clDefault, clMax)
  comprStream := TCompressionStream.Create( clMax, aTarget );
  try
    comprStream.CopyFrom( aSource, aSource.Size );
    comprStream.CompressionRate;
  finally
    comprStream.FreeAndNil;
  End;
End;

procedure DecompressStream(aSource, aTarget: TStream);
var decompStream : TDecompressionStream;
          nRead : Integer;
         buffer : array[0..1023] of Char;
begin
  decompStream := TDecompressionStream.Create( aSource );
  try
     repeat
       nRead:=decompStream.Read( buffer, 1024 );
       aTarget.Write( buffer, nRead );
     Until nRead = 0;
  finally
    decompStream.FreeAndNil;
  End;
End;

procedure SetGlobalConst;
begin
  DecimalSeparator := ',';
  DateSeparator    := '.';
  ShortDateFormat  := 'dd.mm.yyyy';
  ShortTimeFormat  := 'hh:mm:ss';
end;
function GetExePath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function FBdateToDate(const aFBDAte:String):TDateTime;
var
  y,m,d : Integer;
  s: string;
begin
//TODO:Дату из строки в TDate
  result := 0;
  if pos('-',aFBDate) = 0 then exit;
  y := StrToInt(copy(aFBDate,0,pos('-',aFBDate)-1));
  s := copy(aFBDate,pos('-',aFBDate)+1, 100);
  m := StrToInt(copy(s,0,pos('-',s)-1));
  s := copy(s,pos('-',s)+1, 100);
  d := StrToInt(s);
  result := EncodeDate(y,m,d);
end;
//Log Event in Database
//If AEvent_Id<0 then insert mode, else Update mode
//Return True if ok
function LogEvent(const AUnit, ADescr, ANonice:String):boolean;
var
  f: TextFile;
begin
  Result := False;
  if not DebugMode then exit;
  AssignFile(f, LogFileName);
  if (not FileExists(LogFileName)) then
    Rewrite(f)  //create
  else
    Append(f);

  if ioresult = 0 then
  begin
    Writeln(f, format('%10s:  %s  :%s :%s', [DateTimeToStr(now), AUnit, ADescr, ANonice]));
    Flush(f);
    CloseFile(f);
    Result := True;
  end;

end;


procedure DatasetToFile(Dataset: TDataset; FileName: string);
var
  body  : TStrings;
  bkmark: TBookmark;
  i : Integer;
  s : string;
begin
  body := TStringList.Create;
  try
    with DataSet do begin
      DisableControls;
      bkmark := GetBookmark;
      First;
      while (not EOF) do begin
        s:='';
        for i := 0 to FieldCount - 1 do
          if not Fields[i].IsNull
          then s:=s+Fields[i].FieldName+':'+Fields[i].AsString+#9;
        body.Add(s);
        Next;
      end;
      GotoBookmark(bkmark);
      EnableControls;
    end;
    body.SaveToFile(FileName);
  finally
    FreeAndNil(body);
  end;
end;

procedure DatasetFromFile(Dataset: TDataset; FileName: string);
var
  body  : TStrings;
  i,j,p : Integer;
  s,v : string;
  l : TStringArray;
begin
  body := TStringList.Create;
  try
    body.LoadFromFile(FileName);

    DataSet.DisableControls;
    if not DataSet.Active
    then DataSet.Open
    else while not DataSet.eof do DataSet.Delete;
    s := '';
    for i:=0 to (body.Count-1) do begin
      s := body[i];
      l:=explode(#9,s);
      if Length(l)>0
      then begin
        DataSet.append;
        for j := 0 to Length(l) - 1 do begin
          if l[j] = '' then Continue;
          p := Pos(':',l[j]);
          s := Copy(l[j],0,p-1);
          v := Copy(l[j],p+1,Length(l[j])-p);
          DataSet.FieldByName(s).AsString := v;
        end;
        DataSet.post;
      end;
    end;
    DataSet.First;
    DataSet.EnableControls;


  finally
    FreeAndNil(body);
  end;
end;

{ 
  This code shows the SelectDirectory dialog with additional expansions: 
  - an edit box, where the user can type the path name, 
  - also files can appear in the list, 
  - a button to create new directories. 


  Dieser Code zeigt den SelectDirectory-Dialog mit zusatzlichen Erweiterungen: 
  - eine Edit-Box, wo der Benutzer den Verzeichnisnamen eingeben kann, 
  - auch Dateien konnen in der Liste angezeigt werden, 
  - eine Schaltflache zum Erstellen neuer Verzeichnisse. 
}
function AdvSelectDirectory(const Caption: string; const Root: WideString;
   var Directory: string; EditBox: Boolean = False; ShowFiles: Boolean = False;
   AllowCreateDirs: Boolean = True): Boolean;
   // callback function that is called when the dialog has been initialized
  //or a new directory has been selected

  // Callback-Funktion, die aufgerufen wird, wenn der Dialog initialisiert oder
  //ein neues Verzeichnis selektiert wurde
  function SelectDirCB(Wnd: HWND; uMsg: UINT; lParam, lpData: lParam): Integer;
     stdcall;
   //var
     //PathName: array[0..MAX_PATH] of Char;
   begin
     case uMsg of
       BFFM_INITIALIZED: SendMessage(Wnd, BFFM_SETSELECTION, Ord(True), Integer(lpData));
       // include the following comment into your code if you want to react on the
      //event that is called when a new directory has been selected
      // binde den folgenden Kommentar in deinen Code ein, wenn du auf das Ereignis
      //reagieren willst, das aufgerufen wird, wenn ein neues Verzeichnis selektiert wurde
      {BFFM_SELCHANGED:
      begin
        SHGetPathFromIDList(PItemIDList(lParam), @PathName);
        // the directory "PathName" has been selected
        // das Verzeichnis "PathName" wurde selektiert
      end;}
     end;
     Result := 0;
   end;
 var
   WindowList: Pointer;
   BrowseInfo: TBrowseInfo;
   Buffer: PChar;
   RootItemIDList, ItemIDList: PItemIDList;
   ShellMalloc: IMalloc;
   IDesktopFolder: IShellFolder;
   Eaten, Flags: LongWord;
 const
   // necessary for some of the additional expansions
  // notwendig fur einige der zusatzlichen Erweiterungen
  BIF_USENEWUI = $0040;
   BIF_NOCREATEDIRS = $0200;
 begin
   Result := False;
   if not DirectoryExists(Directory) then
     Directory := '';
   FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
   if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
   begin
     Buffer := ShellMalloc.Alloc(MAX_PATH);
     try
       RootItemIDList := nil;
       if Root <> '' then
       begin
         SHGetDesktopFolder(IDesktopFolder);
         IDesktopFolder.ParseDisplayName(Application.Handle, nil,
           POleStr(Root), Eaten, RootItemIDList, Flags);
       end;
       OleInitialize(nil);
       with BrowseInfo do
       begin
         hwndOwner := Application.Handle;
         pidlRoot := RootItemIDList;
         pszDisplayName := Buffer;
         lpszTitle := PChar(Caption);
         // defines how the dialog will appear: 
        // legt fest, wie der Dialog erscheint: 
        ulFlags := BIF_RETURNONLYFSDIRS or BIF_USENEWUI or
           BIF_EDITBOX * Ord(EditBox) or BIF_BROWSEINCLUDEFILES * Ord(ShowFiles) or
           BIF_NOCREATEDIRS * Ord(not AllowCreateDirs);
         lpfn    := @SelectDirCB;
         if Directory <> '' then
           lParam := Integer(PChar(Directory));
       end;
       WindowList := DisableTaskWindows(0);
       try
         ItemIDList := ShBrowseForFolder(BrowseInfo);
       finally
         EnableTaskWindows(WindowList);
       end;
       Result := ItemIDList <> nil;
       if Result then
       begin
         ShGetPathFromIDList(ItemIDList, Buffer);
         ShellMalloc.Free(ItemIDList);
         Directory := Buffer;
       end;
     finally
       ShellMalloc.Free(Buffer);
     end;
   end;
 end;


{
  TVersionInfo = class(TComponent)
  private
    FVersionInfo : Pointer;
    FFileName : String;
    FLangCharSet : String;
    function GetCompanyName : String;
    function GetFileDescription : String;
    function GetFileVersion : String;
    function GetInternalName : String;
    function GetLegalCopyright : String;
    function GetOriginalFilename : String;
    function GetProductName : String;
    function GetProductVersion : String;
    procedure Init;
    procedure SetFileName(const Value : String);
    procedure Clear;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetValue(const ValueName : String; var Buffer : Pointer) : Boolean;
    function GetLocalValue(const ValueName : String) : String;
    property CompanyName : String read GetCompanyName;
    property FileDescription : String read GetFileDescription;
    property FileVersion : String read GetFileVersion;
    property InternalName : String read GetInternalName;
    property LegalCopyright : String read GetLegalCopyright;
    property OriginalFilename : String read GetOriginalFilename;
    property ProductName : String read GetProductName;
    property ProductVersion : String read GetProductVersion;
    property LangCharSet : String read FLangCharSet;
  published
    property FileName : String read FFileName write SetFileName;
  end;

procedure Register;

implementation

constructor TVersionInfo.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     FVersionInfo := nil;
     FFileName := Application.ExeName;
end;

destructor TVersionInfo.Destroy;
begin
     Clear;
     inherited Destroy;
end;

procedure TVersionInfo.Clear;
begin
     if FVersionInfo <> nil then FreeMem(FVersionInfo);
     FVersionInfo := nil;
end;

procedure TVersionInfo.SetFileName(const Value : String);
begin
     Clear;
     FFileName := Value;
end;

procedure TVersionInfo.Init;
type T = array [0..1] of WORD;
var Size, Fake : DWORD;
    P : ^T;
begin
     if FVersionInfo <> nil then exit;
     Size := GetFileVersionInfoSize(PChar(FFileName), Fake);
     if Size = 0 then raise Exception.Create('Error in detecting VersionInfo size!');
     GetMem(FVersionInfo, Size);
     try
        if not GetFileVersionInfo(PChar(FFileName), 0, Size, FVersionInfo) then
           raise Exception.Create('Error in detecting VersionInfo!');
     except
        FreeMem(FVersionInfo);
        FVersionInfo := nil;
        raise;
     end;
     GetValue('\VarFileInfo\Translation', Pointer(P));
     FLangCharSet := Format('%.4x%.4x', [P^[0], P^[1]]);
end;

function TVersionInfo.GetValue(const ValueName : String; var Buffer : Pointer) : Boolean;
var Size : UINT;
begin
     Init;
     Result := VerQueryValue(FVersionInfo, PChar(ValueName), Buffer, Size);
end;

function TVersionInfo.GetLocalValue(const ValueName : String) : String;
var P : Pointer;
begin
     Init;
     if GetValue('\StringFileInfo\' + FLangCharSet + '\' + ValueName, P) then Result := StrPas(P)
     else Result := '';
end;

function TVersionInfo.GetCompanyName : String;
begin
     Result := GetLocalValue('CompanyName');
end;

function TVersionInfo.GetFileDescription : String;
begin
     Result := GetLocalValue('FileDescription');
end;

function TVersionInfo.GetFileVersion : String;
begin
     Result := GetLocalValue('FileVersion');
end;

function TVersionInfo.GetInternalName : String;
begin
     Result := GetLocalValue('InternalName');
end;

function TVersionInfo.GetLegalCopyright : String;
begin
     Result := GetLocalValue('LegalCopyright');
end;

function TVersionInfo.GetOriginalFilename : String;
begin
     Result := GetLocalValue('OriginalFilename');
end;

function TVersionInfo.GetProductName : String;
begin
     Result := GetLocalValue('ProductName');
end;

function TVersionInfo.GetProductVersion : String;
begin
     Result := GetLocalValue('ProductVersion');
end;
}

initialization
  //Colors
  gCustActive       := clWindowText;  //Подключен
  gCustInactive     := clTeal;        //Отключен
  gCustInactiveDebt := clMaroon;      //Отключен и долг
  gCustPPAct        := clBlue;        //Повторно подключался за последний месяц
  OPERATION_DATE    := NOW;
  DebugMode         := FALSE;
end.
