#define MyAppName "A4on.TV"
;#define Client "Free" 
#define Client "ОАО «Спутник-ТВ»" 
#define City   "Осиповичи" 
#define SetupName "SputnikTV"
;#define City   "Каменка" 

#define MyAppVerName "23.5"
#define MyAppURL "http://A4on.TV"
#define MyAppExeName "A4ON.exe"

#define a4files "D:\PROJECTS\A4ON.TV\Sources\Install" 

#define EPG
;#define FBEMBDED

; Интсаляция Conax 
;#define CONAX 
;#define DIGIT 

#ifdef EPG
#undef FBEMBDED
#endif

;#define SMARTID

#define fbfiles "D:\RDBMS\Firebird\30x"

#if "Free" == Client
  #define ReadMeFile "readme_free.txt"
#else
  #define ReadMeFile "readme.txt"
#endif

#define FireBirdURL "http://www.firebirdsql.org/en/firebird-3-0/"

[Setup]
AppName={#MyAppName} ({#Client})
AppVerName={#MyAppName} {#MyAppVerName}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={code:GetNoSystemDrive}\A4ON.TV
DefaultGroupName={#MyAppName}
AppCopyright=Copyright (C) 2005-2023 Шумко Дмитрий
AppContact=post@a4on.tv
AppComments=Дистрибутив системы A4on.TV ( {#Client} {#City})
OutputDir=setup
UninstallDisplayIcon={app}\A4ON.exe
VersionInfoVersion={#MyAppVerName}

#if "Free" == Client
OutputBaseFilename=a4on_demo
LicenseFile={#a4files}\license_free.txt
#else
OutputBaseFilename=A4on_{#SetupName}
LicenseFile={#a4files}\license.rtf
#endif

Compression=lzma
SolidCompression=yes

SetupIconFile={#a4files}\images\a4on_setup.ico
;UninstallDisplayIcon={sys}\SHELL32.dll,130
WizardImageFile={#a4files}\images\WizardImageFile.bmp
WizardSmallImageFile={#a4files}\images\WizardSmallImageFile.bmp
PrivilegesRequired=admin

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon";   Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Types]
Name: ServerInstall; Description: "Многопользовательская - Сервер"
Name: ClientInstall; Description: "Многопользовательская - Клиент"
Name: SingleInstall; Description: "Однопользовательская установка"

[Components]
Name: ServerComponent; Description: "Установка на сервере";           Types: ServerInstall;
Name: ClientComponent; Description: "Установка на клиенте";           Types: ClientInstall;     Flags: fixed disablenouninstallwarning;
Name: SingleComponent; Description: "Однопользовательская установка"; Types: SingleInstall;

[Files]
Source: "compiler:IStool\isxdl.dll";                                                                                                          Flags: dontcopy
Source: "DB\*.FDB";                          DestDir: "{app}\DB";                Components: ServerComponent SingleComponent;                 Flags: ignoreversion recursesubdirs uninsneveruninstall
Source: "A4ON.exe";                          DestDir: "{app}";                   Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion
Source: "{#a4files}\libcrypto-3.dll";        DestDir: "{app}";                   Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion
Source: "{#a4files}\libssl-3.dll";           DestDir: "{app}";                   Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion
Source: "{#a4files}\legacy.dll";             DestDir: "{app}";                   Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion
Source: "{#a4files}\frx_pdfium.dll";         DestDir: "{app}";                   Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion
Source: "{#a4files}\local\*";                DestDir: "{localappdata}";          Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion recursesubdirs
Source: "{#a4files}\{#ReadMeFile}";          DestDir: "{app}";DestName:"readme.txt";Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion isreadme
;Source: "WWW\*";                     DestDir: "{app}\WWW";                       Components: ServerComponent;                                 Flags: ignoreversion

#ifdef SMARTID
Source: "{#a4files}\smartid\*";      DestDir: "{app}\smartid";                   Components: ServerComponent ClientComponent SingleComponent; Flags: ignoreversion
#endif

;Source: "Convert\*";             DestDir: "{app}\Convert";    Components: ServerComponent SingleComponent;                 Flags: ignoreversion recursesubdirs
;Source: "Scripts\*";             DestDir: "{app}\Scripts";    Components: ServerComponent SingleComponent;                 Flags: ignoreversion recursesubdirs

; Firebird client
Source: "{#fbfiles}\fbclient.dll";           DestDir: "{app}";                   Components: ClientComponent SingleComponent;                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\firebird.msg ";          DestDir: "{app}";                   Components: ClientComponent SingleComponent;                 Flags: overwritereadonly sharedfile
#ifdef FBEMBDED
Source: "{#fbfiles}\plugins\*";              DestDir: "{app}\plugins";           Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\ib_util.dll";            DestDir: "{app}";                   Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\icudt52.dll";            DestDir: "{app}";                   Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\icudt52l.dat";           DestDir: "{app}";                   Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\icuin52.dll";            DestDir: "{app}";                   Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\icuuc52.dll";            DestDir: "{app}";                   Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\msvcp100.dll";           DestDir: "{app}";                   Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
Source: "{#fbfiles}\msvcr100.dll";           DestDir: "{app}";                   Components: SingleComponent;                                 Flags: overwritereadonly sharedfile
#else
;Source: "{#fbfiles}\system32\vccrt10_Win32.msi";DestDir:"{tmp}";MinVersion: 0,5.0;Components: ClientComponent;
#endif

#ifdef CONAX
Source: "CONAX\*";                   DestDir: "{app}\CONAX";                     Components: ServerComponent SingleComponent;                 Flags: ignoreversion
#endif

#ifdef DIGIT
Source: "Digit\*";                   DestDir: "{app}\Digit\";                    Components: ServerComponent;                                 Flags: ignoreversion recursesubdirs
#endif

#ifdef EPG
Source: "{#a4files}\EPG_PERL\*";     DestDir: "{app}\EPG\";                      Components: ServerComponent;                                 Flags: ignoreversion recursesubdirs
Source: "{#fbfiles}\fbclient.dll";DestDir:"{app}\EPG\perl\lib\auto\DBD\Firebird";Components: ServerComponent;                                 Flags: overwritereadonly sharedfile

[Dirs]
Name: "{app}\tmp\";                                                              Components: ServerComponent;

[Registry]
Root:HKLM;Subkey:"SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; Components: ServerComponent; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\EPG\perl\"; Check: NeedsAddPath('\EPG\perl\')
#endif

[Icons]
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; WorkingDir: {app};        Components: ServerComponent ClientComponent SingleComponent; Parameters: /p:masterkey
Name: "{group}\{#MyAppName}";       Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; WorkingDir: {app};        Components: ServerComponent ClientComponent SingleComponent; 
#ifdef EPG
Name: "{userdesktop}\OpenEPG.cmd";  Filename: "{app}\EPG\OpenEPG.cmd"; Tasks: desktopicon; WorkingDir: "{app}\EPG\"; Components: ServerComponent;
#endif

[Run]
;Filename: msiexec.exe; Parameters: "/qn /norestart /i ""{tmp}\vccrt10_Win32.msi"" /L*v ""{tmp}\vccrt10_Win32.log"" "; Components: ClientComponent;
;Filename: "{app}\{#MyAppExeName}";    Description: "{cm:LaunchProgram,{#MyAppName}}"; Flags: nowait postinstall skipifsilent; Parameters: /p:masterkey
#ifdef EPG
;Filename: "{app}\Service_Install.bat";  Parameters: "install"; Description: "Установить OpenEPG как сервис"; Flags: nowait postinstall
#endif

[UninstallRun]
Filename: "{app}\a4on.ini";  Parameters: "uninstall";
#ifdef EPG
; Filename: "{app}\Service_Remove.bat";  Parameters: "uninstall";
#endif

[UninstallDelete]
#ifdef EPG
Name: "{app}\*.ini";                  Type: filesandordirs
Name: "{app}\tmp\";                   Type: filesandordirs
#endif

[Code]
#ifdef UNICODE
  #define AW "W"
#else
  #define AW "A"
#endif
type
  TDriveType = (
    dtUnknown,
    dtNoRootDir,
    dtRemovable,
    dtFixed,
    dtRemote,
    dtCDROM,
    dtRAMDisk
  );
  TDriveTypes = set of TDriveType;


const
  DRIVE_FIXED = 3;

  PING_TIMEOUT             = 500;
  INADDR_NONE              = $FFFFFFFF;
  SOCKET_ERROR             = (-1);

  IP_SUCCESS               = 0;
  IP_BUF_TOO_SMALL         = (11000 + 1);
  IP_DEST_NET_UNREACHABLE  = (11000 + 2);
  IP_DEST_HOST_UNREACHABLE = (11000 + 3);
  IP_DEST_PROT_UNREACHABLE = (11000 + 4);
  IP_DEST_PORT_UNREACHABLE = (11000 + 5);
  IP_NO_RESOURCES          = (11000 + 6);
  IP_BAD_OPTION            = (11000 + 7);
  IP_HW_ERROR              = (11000 + 8);
  IP_PACKET_TOO_BIG        = (11000 + 9);
  IP_REQ_TIMED_OUT         = (11000 + 10);
  IP_BAD_REQ               = (11000 + 11);
  IP_BAD_ROUTE             = (11000 + 12);
  IP_TTL_EXPIRED_TRANSIT   = (11000 + 13);
  IP_TTL_EXPIRED_REASSEM   = (11000 + 14);
  IP_PARAM_PROBLEM         = (11000 + 15);
  IP_SOURCE_QUENCH         = (11000 + 16);
  IP_OPTION_TOO_BIG        = (11000 + 17);
  IP_BAD_DESTINATION       = (11000 + 18);
  IP_ADDR_DELETED          = (11000 + 19);
  IP_SPEC_MTU_CHANGE       = (11000 + 20);
  IP_MTU_CHANGE            = (11000 + 21);
  IP_UNLOAD                = (11000 + 22);
  IP_ADDR_ADDED            = (11000 + 23);
  IP_GENERAL_FAILURE       = (11000 + 50);
  IP_PENDING               = (11000 + 255);

type
  ICMP_OPTIONS = record
    Ttl         : Byte;
    Tos         : Byte;
    Flags       : Byte;
    OptionsSize : Byte;
    OptionsData : Longint;
  end;

  ICMP_ECHO_REPLY = record
    Address       : Longint;
    status        : Longint;
    RoundTripTime : Longint;
    DataSize      : Longint;
    Reserved      : Integer;
    DataPointer   : Longint;
    Options       : ICMP_OPTIONS;
    Data          : string;
  end;

var
  IPPage             : TInputQueryWizardPage;
  FBSrvPage          : TWizardPage;
  FinishedInstall    : Boolean;
  ISFirebirdCheckBox : TCheckBox;
  IPadres            : string;
  



function GetLogicalDriveStrings(nBufferLength: DWORD; lpBuffer: string): DWORD; external 'GetLogicalDriveStrings{#AW}@kernel32.dll stdcall';
function GetDriveType(lpRootPathName: string): UINT;                            external 'GetDriveType{#AW}@kernel32.dll stdcall';
function inet_addr(sAddr: string): Longint;                                     external 'inet_addr@wsock32.dll stdcall';
function IcmpCreateFile(): HWND;                                                external 'IcmpCreateFile@icmp.dll stdcall';
function IcmpCloseHandle(IcmpHandle: Longint): Longint;                         external 'IcmpCloseHandle@icmp.dll stdcall';
function IcmpSendEcho(IcmpHandle: HWND;
                      DestinationAddress: Longint;
                      RequestData: string;
                      RequestSize: Longint;
                      RequestOptions: Longint;
                      var ReplyBuffer: ICMP_ECHO_REPLY;
                      ReplySize: Longint;
                      Timeout: Longint): Longint;                               external 'IcmpSendEcho@icmp.dll stdcall';
procedure isxdl_AddFile(URL, Filename: AnsiString);                             external 'isxdl_AddFile@files:isxdl.dll stdcall';
function isxdl_DownloadFiles(hWnd: Integer): Integer;                           external 'isxdl_DownloadFiles@files:isxdl.dll stdcall';
function isxdl_SetOption(Option, Value: AnsiString): Integer;                   external 'isxdl_SetOption@files:isxdl.dll stdcall';

function GetNoSystemDrive(sd: string): string;
var
  i         : Integer;
  DriveCount: Integer;
  S         : string;
  SysDrive  : String;
  DriveRoot : string;
  ADrives   : array of string;
  dt        : TDriveType;
begin

//  DriveCount := GetLogicalDrives(DriveArray, AFilter);
  SysDrive := ExpandConstant('{sd}'); 
  DriveCount := 0;
  SetArrayLength(ADrives, 0);
  SetLength(S, 65);
  I := GetLogicalDriveStrings(64, S);
  if I <> 0 then
  begin
    SetLength(S, I);  
    I := Pos(#0, S);
    while I > 0 do
    begin
      DriveRoot := Copy(S, 1, 2);
      dt := TDriveType(GetDriveType(DriveRoot));
      if (dt in [dtFixed]) and (DriveRoot <> SysDrive) then
      begin
        SetArrayLength(ADrives, GetArrayLength(ADrives) + 1);
        ADrives[High(ADrives)] := DriveRoot;
      end;
      Delete(S, 1, I);
      I := Pos(#0, S);
    end;
    DriveCount := GetArrayLength(ADrives);
  end;

  if (DriveCount <> 0)
  then Result:=  ADrives[0]
  else Result:= SysDrive;
end;

function GetFirebirdDir: string;
var
  FirebirdDir: String;
begin
  FirebirdDir := '';
  if not IsWin64 then begin
    RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Firebird Project\Firebird Server\Instances','DefaultInstance', FirebirdDir)
  end;
  
  if not FileExists(FirebirdDir+'databases.conf') then begin
    FirebirdDir := 'C:\Program Files\Firebird\Firebird_3_0\';
    if not FileExists(FirebirdDir+'databases.conf') then begin
      FirebirdDir := 'C:\Program Files (x86)\Firebird\Firebird_3_0\';
      if not FileExists(FirebirdDir+'databases.conf') then begin
        FirebirdDir := '';
      end;
    end;
  end;
  
  Result := FirebirdDir;
end;

function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment', 'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  
  Result := Pos(';' + ExpandConstant('{app}') + Param + ';', ';' + OrigPath + ';') = 0;
end;

procedure DownloadFebird;
var
  hWnd: Integer;
  URL, FileName, FB: String;
  ResultCode: Integer;
begin
  FB := '3.0';
  isxdl_SetOption('label', 'Загрузка Firebird');
  isxdl_SetOption('description', 'Пожалуйста подождите пока инсталятор загрузит файлы на Ваш компьютер.');

  //turn off isxdl resume so it won't leave partially downloaded files behind
  //resuming wouldn't help anyway since we're going to download to {tmp}
  isxdl_SetOption('resume', 'false');

  hWnd := StrToInt(ExpandConstant('{wizardhwnd}'));

  if ISFirebirdCheckBox.Checked then begin
    URL := 'http://a4on.tv/uploads/files/Firebird-'+FB+'.exe';
    FileName := ExpandConstant('{tmp}\Firebird-'+FB+'.exe');
    isxdl_AddFile(URL, FileName);
  end;

  if isxdl_DownloadFiles(hWnd) <> 0
  then
    Exec(ExpandConstant('{tmp}\Firebird-'+FB+'.exe'), '', '', SW_SHOW, ewWaitUntilTerminated, ResultCode)
  else begin
    SuppressibleMsgBox('Инсталятор не смог загрузить Firebird. Повторите попытку позже или загрузите Firebird '+FB+' самостоятельно.' + #13#13 + 'Продолжаем установку.', mbError, mb_Ok, idOk);
    ShellExec('open', '{#FireBirdURL}', '', '', SW_SHOWNORMAL, ewNoWait, ResultCode);
  end;
end;

function HasWI30: boolean;
var
  VersionMS, VersionLS: Cardinal;
begin
  GetVersionNumbers(ExpandConstant('{sys}') + '\msi.dll', VersionMS, VersionLS);
  Result := False;
  if (VersionMS >= $00030000) then  // $00030000 = версия 3,0
    Result := True;
end;

function HasNotWI30: boolean;
//Used to check if O/S does NOT have minimum version of Windows Installer
begin
  result := NOT HasWI30;
end;

function AddTextToFile(strFilename, strAddLine: String): Boolean;
var
  iLineCounter  : Integer;
  a_strTextfile : TArrayOfString;
  add_str       : TArrayOfString;
  fAlreadyExist : Boolean;
  fFileExist    : Boolean;

begin
  { Load textfile into string array }
  fAlreadyExist := False;
  fFileExist := FileExists(strFilename);
  if fFileExist 
  Then begin
    LoadStringsFromFile(strFilename, a_strTextfile);
    for iLineCounter := 0 to GetArrayLength(a_strTextfile)-1 do begin
      if (a_strTextfile[iLineCounter] = strAddLine) then
        fAlreadyExist := True
    end;
    if not fAlreadyExist 
    then begin
      SetArrayLength(add_str, 1);
      add_str[0] :=  #13 + #10 + strAddLine;
      fAlreadyExist := SaveStringsToFile(strFilename, add_str, true);
    end;
  end;
  Result := fFileExist;
end;

procedure LogoOnClick(Sender: TObject);
var ResCode: Integer;
begin
  ShellExec('', 'http://wiki.a4on.tv', '' , '', SW_SHOW, ewNoWait, ResCode)
end; 

procedure CreateINI(strFilename, strAddLine: String);
var
  text : TArrayOfString;
begin
  SetArrayLength(text, 6);
  text[0] := '[MAIN]';
  text[1] := 'CHARSET=UTF8';
  text[2] := 'KEYBOARD=RU';
  text[3] := 'CONNECTDLL=fbclient.dll';
  text[4] := '[DATABASES]';
  text[5] := strAddLine;
  SaveStringsToFile(strFilename, text, False)
end;

procedure CreateOpenEpgINI(strFilename, strAddLine: String);
var
  text : TArrayOfString;
begin
  SetArrayLength(text, 20);
  text[0] := '[EPG]                         ; Настройки. текст после ; комментарий. строки которые закоментированы, это значения по умолчанию ';
  text[1] := 'DB_NAME = ' + strAddLine + ' ; база данных с epg';
  text[2] := ';DB_USER = SYSDBA             ; пользователь Firebird для чтения базы данных A4on.TV';
  text[3] := ';DB_PSWD = masterkey          ; пароль пользователя Firebird ';
  text[4] := 'DAYS    = 3                   ; на какое количество дней формировать EIT';
  text[5] := 'TMP     = '+ExpandConstant('{app}')+'\tmp\     ; где храним временные файлы, если не укажем, то в каталоге программы';
  text[6] := ';RELOAD_TIME = 5              ; Через сколько минут перечитывать поток (переформируем текущий/следующий)';
  text[7] := ';EXPORT_TS   = 0              ; Экспортировать TS в файл 1. не эксп. = 0';
  text[8] := ';NETWORK_ID  = 1              ; NID сети с которой работает генератор на случай если у оператора много сетей и одна БД';
  text[9] := ';BIND_IP = 192.168.1.3        ; Через какой сетевой интерфейс вещать или 0.0.0.0 если вещать на все интерфейсы';
  text[10]:= ';READ_EPG = 60                ; Через сколько минут будем проверять данные в базе A4on.TV (смотрим обновилось ли расписание)';
  text[11]:= ';RUS_PAGE = 1                 ; согласно EN ISO/IEC 8859-5 [27] Latin/Cyrillic alphabe может быть 1 = \0x01 (Table A.3) , а может быть 2 = \0x10\0x00\0x5 (Table A.4)';
  text[12]:= ';DESC_LEN = 500               ; Сколько символов в расширеном описании';
  text[13]:= ';TEXT_IN_UTF = 0              ; Передавать текст событий в UTF8 а не в ISO. Не все устройства поддерживают';
  text[14]:= ';LONGREADLEN=1000             ; Если возникает ошибка LongReadLen, снимите комментарий. 1000 можно уменьшить.';
  text[15]:= ';REGION_ID = 0                ; Region_ID для TOT';
  text[16]:= ';PF_ONLY   = 1                ; Для не текущего TS создавать только таблица текущая/следующая программа (present/following). 1 = только p/f, 0 = всю программу shedule';
  text[17]:= 'USEMEMORY = 1                 ; Где создавать временные файлы EIT. 1 = в памяти, 0 = в файле';
  text[18]:= ';DESC_FORMAT = AGE GENR YEAR CNTR DESC ACTR DRCT  ; Формат описания AGE - возраст, DESC - описание, GENR - жанр, YEAR-год, ACTR-актеры, DRCT-режиссер, CNTR-страна';
  text[19]:= ';TTL = 5                      ; Время жизни UDP пакетов';
  
  if not FileExists(strFilename)
  then SaveStringsToUTF8File(strFilename, text, False);
end;

procedure CreateLastLoggedINI(strFilename, strAddLine: String);
var
  text : String;
begin
  text := '[MAIN]'+ #13#10 + 
          'LASTDATABASE='+strAddLine + #13#10
          'LASTUSERNAME=SYSDBA';
  SaveStringToFile(strFilename, text, False)
end;

function GetPingResult(status: Longint): string;
begin
  case status of
    IP_SUCCESS:               Result:= 'Ping IP: success';
    IP_BUF_TOO_SMALL:         Result:= 'Ping IP: buf too small';
    IP_DEST_NET_UNREACHABLE:  Result:= 'Ping IP: destination net unreachable';
    IP_DEST_HOST_UNREACHABLE: Result:= 'Ping IP: запрошенный компьютер не отвечает';
    IP_DEST_PROT_UNREACHABLE: Result:= 'Ping IP: destination protocol unreachable';
    IP_DEST_PORT_UNREACHABLE: Result:= 'Ping IP: destination port unreachable';
    IP_NO_RESOURCES:          Result:= 'Ping IP: no resources';
    IP_BAD_OPTION:            Result:= 'Ping IP: bad option';
    IP_HW_ERROR:              Result:= 'Ping IP: ошибка оборудования';
    IP_PACKET_TOO_BIG:        Result:= 'Ping IP: packet too big';
    IP_REQ_TIMED_OUT:         Result:= 'Ping IP: request timed out';
    IP_BAD_REQ:               Result:= 'Ping IP: bad request';
    IP_BAD_ROUTE:             Result:= 'Ping IP: bad route';
    IP_TTL_EXPIRED_TRANSIT:   Result:= 'Ping IP: ttl expired transit';
    IP_TTL_EXPIRED_REASSEM:   Result:= 'Ping IP: ttl expired reassem';
    IP_PARAM_PROBLEM:         Result:= 'Ping IP: parameter problem';
    IP_SOURCE_QUENCH:         Result:= 'Ping IP: source quench';
    IP_OPTION_TOO_BIG:        Result:= 'Ping IP: option too big';
    IP_BAD_DESTINATION:       Result:= 'Ping IP: bad destination';
    IP_ADDR_DELETED:          Result:= 'Ping IP: address deleted';
    IP_SPEC_MTU_CHANGE:       Result:= 'Ping IP: spec mtu change';
    IP_MTU_CHANGE:            Result:= 'Ping IP: mtu change';
    IP_UNLOAD:                Result:= 'Ping IP: unload';
    IP_ADDR_ADDED:            Result:= 'Ping IP: address added';
    IP_GENERAL_FAILURE:       Result:= 'Ping IP: general failure';
    IP_PENDING:               Result:= 'Ping IP: pending';
    INADDR_NONE:              Result:= 'Ping IP: не верный IP адрес';
    SOCKET_ERROR:             Result:= 'Ping IP: can''t open port';
  else                        Result:= 'Unknown  status';
  end;
end;

function Ping(sAddr, sendData: string): Longint;
var
  hPort  : HWND;
  dwAddr : Longint;
  ECHO   : ICMP_ECHO_REPLY;
begin
  dwAddr:= inet_addr(sAddr);
  if dwAddr <> INADDR_NONE then
    begin
      hPort:= IcmpCreateFile();
      if hPort <> 0 then
        begin
          IcmpSendEcho(hPort, dwAddr, sendData, Length(sendData),
                       0, ECHO, SizeOf(ECHO), PING_TIMEOUT);
          IcmpCloseHandle(hPort);

          Result:= ECHO.status;
        end
        else Result:= SOCKET_ERROR;
    end
    else Result:= INADDR_NONE;
end;

function CreateCustomOptionPage(AAfterId: Integer; ACaption, ASubCaption, AIconFileName, ALabel1Caption, ALabel2Caption,
  ACheckCaption: String; var CheckBox: TCheckBox): TWizardPage;
var
  Page   : TWizardPage;
  Label1, 
  Label2 : TNewStaticText;
begin
  Page := CreateCustomPage(AAfterID, ACaption, ASubCaption);

  Label1 := TNewStaticText.Create(Page);
  with Label1 do begin
    AutoSize := False;
    Left     := WizardForm.SelectDirLabel.Left;
    Width    := Page.SurfaceWidth - Left;
    WordWrap := True;
    Caption  := ALabel1Caption;
    Parent   := Page.Surface;
  end;
  WizardForm.AdjustLabelHeight(Label1);

  Label2 := TNewStaticText.Create(Page);
  with Label2 do begin
    Top := Label1.Top + Label1.Height + ScaleY(12);
    Caption := ALabel2Caption;
    Parent := Page.Surface;
  end;
  WizardForm.AdjustLabelHeight(Label2);

  CheckBox := TCheckBox.Create(Page);
  with CheckBox do begin
    Top     := Label2.Top + Label2.Height + ScaleY(12);
    Width   := Page.SurfaceWidth;
    Caption := ACheckCaption;
    Parent  := Page.Surface;
  end;

  Result := Page;
end;

procedure InitializeWizard;
var
  Caption, 
  SubCaption1  : String;
  IconFileName : String;
  Label1Caption: String;
  Label2Caption: String;
  CheckCaption : String;
begin
  IpPage := CreateInputQueryPage(wpSelectProgramGroup,
    'Укажите сервер БД', 'Необходимо указать сервер СУБД Firebird',
    'Пожалуйста, укажите IP адрес компьютера на котором установлен сервер Firebird' +
    'и расположена база данных ПО "A4on.TV".');
  IPPage.Add('IP адрес (например 192.168.1.1):', False);
  IPPage.Values[0] := '192.168.1.1';
  Caption := 'Firebird SQL';
  SubCaption1 := 'Желаете ли Вы загрузить и установить Firebird?';
  Label1Caption := ' Для работы A4ON.TV необходим работающий сервер Firebird.' + #13#10#13#10 +
    'Firebird (FirebirdSQL) — компактная, кроссплатформенная, свободная система управления базами данных (СУБД), ' +
    ' работающая на GNU/Linux, Microsoft Windows и разнообразных Unix платформах.' + #13#10#13#10 +
    'Более подробную информацию о сервере СУБ Firebird смотрите на сайте http://www.firebirdsql.org.';
  Label2Caption := 'Отметьте, если вы желаете загрузить и установить Firebird и нажмите Далее';
  CheckCaption := '&Загрузить и установит Firebird';

  FBSrvPage := CreateCustomOptionPage(wpSelectProgramGroup, Caption, SubCaption1, IconFileName, Label1Caption, Label2Caption, CheckCaption, ISFirebirdCheckBox);
  ISFirebirdCheckBox.Checked := (GetFirebirdDir = '');
end;

function InitializeSetup(): Boolean;
begin
  Result := true;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
var
  chkFB  : Boolean;
  chkNet : Boolean;
begin
  case PageID of 
    IpPage.ID    : Result := (IsComponentSelected('ServerComponent')) or (IsComponentSelected('SingleComponent'));
    FBSrvPage.ID : begin
                    if (IsComponentSelected('ServerComponent'))
                    then begin
                      chkFB := (GetFirebirdDir <> '')
                      chkNet := true;
                      Result := chkFB and chkNet;
                    end
                    else 
                      Result := True;
                  end;
    else Result := False;
  end
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  { Fill the 'Ready Memo' with the normal settings and the custom settings }
  S := MemoUserInfoInfo + NewLine + MemoDirInfo + NewLine + MemoTypeInfo + NewLine +  MemoGroupInfo + NewLine + MemoTasksInfo + NewLine;
  // S := GetFirebirdDir+'databases.conf' + NewLine + S;
  Result := S;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
    FinishedInstall := True;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  str: string;
  res: Longint;
begin
  if CurPageID = IPPage.ID then begin
      IPadres := IpPage.Values[0];
      res     := Ping(IpPage.Values[0], 'test');
      str     := GetPingResult(res);
      if str = 'Ping IP: success'
      then Result := true
      else begin
        str    := 'Указанный IP адрес не отвечает'+#13#10+str + #13#10 + 'Вы желаете продолжить установку?'
        Result := MsgBox(str, mbConfirmation, MB_YESNO) = IDYES;
      end;
  end
  else begin
     if (CurPageID = FBSrvPage.ID)
     then begin
       if ((ISFirebirdCheckBox.Checked) and (IsComponentSelected('ServerComponent'))) 
       then begin
         if not IsWin64 then begin
           DownloadFebird;
           Result := True;
         end
         else begin
           ShellExec('', 'https://www.firebirdsql.org/en/firebird-3-0/', '', '', SW_SHOW, ewNoWait, res);            
           MsgBox('Пожалуйста, перед установкой A4on.TV '#13#10'инсталируйте сервер Firebird 3.0 самостоятельно'#13#10'После чего, продолжите установку A4on.TV', mbInformation, MB_OK);
           Result := True;
         end
        end
     end
     else Result := True;
  end
end;

procedure DeinitializeSetup();
var
  ININame  : String;
  DB, ALIAS: String;
  Contora  : String;
begin
  if FinishedInstall then begin

    Contora := '{#SetupName}';

    #if "Free" == Client
    DB    := 'DB\A4ON_FREE.FDB';
    ALIAS := 'A4ON_FREE';
    #else
    DB    := 'DB\A4ON_DB.FDB';
    ALIAS := 'A4ON_DB';
    #endif

    if IsComponentSelected('ServerComponent')
    then begin
      ININame := GetFirebirdDir+'databases.conf';
      AddTextToFile(ININame, ALIAS+'='+ExpandConstant('{app}')+'\'+DB ); // если на сервере то пропишем в файл databases.conf путь к БД
      DB      := '127.0.0.1:'+ALIAS;
    end
    else begin
      if IsComponentSelected('ClientComponent')
      then DB := IPadres+':'+ALIAS
      else DB := ExpandConstant('{app}')+'\'+DB;
    end;

    #ifdef EPG
    ININame   := ExpandConstant('{app}')+'\EPG\OpenEPG.INI';
    CreateOpenEpgINI(ININame, DB);
    #endif

    ININame   := ExpandConstant('{localappdata}')+'\A4on.TV\LAST_LOGGED.ini';
    CreateLastLoggedINI(ININame, DB)
    ININame   := ExpandConstant('{app}')+'\a4on.ini';
    CreateINI(ININame, Contora+'='+DB);

  end;

 end;