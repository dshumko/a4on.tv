unit AtrCommon;

interface

{$I defines.inc}

uses
  Winapi.Windows,
  System.Classes, System.SysUtils, System.Variants,
  Data.DB,
  Vcl.Forms, Vcl.Controls, Vcl.Graphics;

type
  TShowFont = class(TControl)
  public
    property Font;
  end;

  TStringArray = array of string;

var
  DebugMode: Boolean = true;
  // gServerName:String;
  // gSysDbaPassword:String;
  // gServerProtocol:integer;
  // gLogonUserName,
  // gLogonUserPassword,
  // gLogonDataBase: String;
  // gFR_FORMS_PATH: String;
  OPERATION_DATE: TDateTime;

  // gRoundPrecision:integer;
  // gEnterToTab : boolean = true;

  gCustDisconted: TColor; // Разорван договор
  gCustActive: TColor; // Подключен
  gCustInactive: TColor; // Отключен
  gCustActiveDebt: TColor; // Подключен и долг
  gCustInactiveDebt: TColor; // Отключен и долг
  gCustPPAct: TColor; // Повторно подключался

function LogEvent(const AUnit, ADescr, ANonice: String): Boolean;
procedure SetKeyboardLayout(const aLayout: String);
function MonthFirstDay(const aDate: TDateTime): TDateTime;
function MonthLastDay(const aDate: TDateTime): TDateTime;

function GenerateBetweenDateSql(aFieldName: String; aDateFrom, aDateTo: TDateTime): string;
procedure SetGlobalConst;
function GetExePath: string;

function FBdateToDate(const aFBDAte: String): TDateTime;
function DateTOFBdate(const aDate: TDate): String;

{ защита от крупных шрифтов }
function IsSmallFonts: Boolean; { Значение функции TRUE если мелкий шрифт }
procedure UpdateFonts(Control: TWinControl);

procedure DatasetToJson(DS: TDataset; const FileName: string);
function DatasetToJsonStr(DS: TDataset): string;
procedure DatasetFromJson(DS: TDataset; const FileName: string);
procedure DatasetFromJsonStr(DS: TDataset; const AJson: string);

procedure DatasetToINI(Dataset: TDataset; const FileName: string);
procedure DatasetFromINI(Dataset: TDataset; const FileName: string);
// записать строку в буфер обмена
procedure StrToClipbrd(StrValue: string);
// прочесть строку из буфера обмена
function GetStrFromClipbrd: string;

// аналог функции Explode PHP
function Explode(Ch: Char; const Text: string): TStringArray;

// проверка на корректность IP адреса
function CheckIP(const IP: string): Boolean;

// проверка на корректность MAC адреса
function CheckMAC(const MAC: string): Boolean;

// переведем маску вида /24 в 255.255.255.0
function IntToMask(const int_mask: Integer): String;

function AdvSelectDirectory(const Caption: string; const Root: WideString; var Directory: string;
  EditBox: Boolean = False; ShowFiles: Boolean = False; AllowCreateDirs: Boolean = true): Boolean;

// This function will evaluate a DateTime string in accordance to the DateTime specifier format string supplied. The following specifiers are supported ...
//
// dd                        the day as a number with a leading zero or space (01-31).
// ddd                        the day as an abbreviation (Sun-Sat)
// dddd                        the day as a full name (Sunday-Saturday)
// mm                        the month as a number with a leading zero or space (01-12).
// mmm                the month as an abbreviation (Jan-Dec)
// mmmm                the month as a full name (January-December)
// yy                        the year as a two-digit number (00-99).
// yyyy                        the year as a four-digit number (0000-9999).
// hh                        the hour with a leading zero or space (00-23)
// nn                        the minute with a leading zero or space (00-59).
// ss                        the second with a leading zero or space (00-59).
// zzz                        the millisecond with a leading zero (000-999).
// ampm                Specifies am or pm flag hours (0..12)
// ap                        Specifies a or p flag hours (0..12)
function DateTimeStrEval(const DateTimeFormat: string; const DateTimeStr: string): TDateTime;

// удаляем символ слева
// s - строка для поиска, chr - elfkztvsq cbvdjk
function LeftTrimChar(const S: string; const chr: Char): string;

procedure ComressStream(aSource, aTarget: TStream);
procedure DecompressStream(aSource, aTarget: TStream);

// получаем версию файла
function GetFileVersion(const FileName: TFileName; var Major, Minor, Release, Build: Integer): Boolean;
// удаляет символы из строки
function RemoveChars(const S: string; Chrs: string): string;
// Возвращает системный каталог, по умолчанию
function GetSpecialFolderPath(folder: Integer = 2): string;
// Возвращает путь ко времменой папке
function GetTempDir: String;
// Возвращает имя временного файла
function GetTempA4onFile(const ext: string = ''): String;
// Возвращает имя файла из урл
function GetFileNameFromURL(const S: string): string;
// ждем пока файл освободится для записи
function WaitForFileWrite(const FileName: String): Boolean;
// Удаляем каталог со всеми файлами и подкаталогами
procedure DeleteDir(const DirName: string);
// Получить временную папку
function FileGetTempFolder: string;
// Получить временное имя файла
function FileGetTempName(const Prefix: string): string;
// Procedure PostKeyEx
procedure PostKeyExHWND(hWindow: HWnd; key: Word; const shift: TShiftState; specialkey: Boolean);
// Каталог для кэша WKE браузера
function GetUserCacheFolder(): string;

procedure PutStringIntoClipBoard(const Str: WideString);
function GetStringFromClipboard: WideString;

procedure Jpeg2Png(aPicStream: TMemoryStream);
procedure Png2Jpeg(aPicStream: TMemoryStream);

function myQuestion(const Caption, Text: String): Boolean;
// Работаем под wine
function GetWineAvail: Boolean;

implementation

uses
  Winapi.Messages, Winapi.ShlObj, Winapi.ActiveX, Winapi.SHFolder,
  System.DateUtils, System.IniFiles, System.ZLib, System.ZLibConst, System.IOUtils,
  Vcl.Clipbrd, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  JsonDataObjects, PrjConst;

function GetTempDir: String;
begin
  Result := System.IOUtils.TPath.GetTempPath;
  Result := Result + 'A4on\';
  if not DirectoryExists(Result) then
    CreateDir(Result);
end;

function GetTempA4onFile(const ext: string = ''): String;
var
  TempPath, TmpFile, Prefix: string;
begin
  TmpFile := 'a4_' + FormatDateTime('yymmddhhnnssz', now());
  TempPath := GetTempDir;
  Result := TempPath + TmpFile + ext;
  if FileExists(Result) then
    DeleteFile(Result);
end;

procedure DeleteDir(const DirName: string);
var
  Path: string;
  F: TSearchRec;
begin
  Path := DirName + '\*.*';
  if System.SysUtils.FindFirst(Path, faAnyFile, F) = 0 then
  begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
          begin
            DeleteDir(DirName + '\' + F.Name);
          end;
        end
        else
          System.SysUtils.DeleteFile(DirName + '\' + F.Name);
      until System.SysUtils.FindNext(F) <> 0;
    finally
      System.SysUtils.FindClose(F);
    end;
  end;
  System.SysUtils.RemoveDir(DirName);
end;

function RemoveChars(const S: string; Chrs: string): string;
var
  I, J: Integer;
begin
  Result := S;
  if Length(Chrs) = 0 then
    Exit;

  for J := 0 to Length(Chrs) do
    for I := Length(Result) downto 1 do
    begin
      if Result[I] = Chrs[J] then
        Delete(Result, I, 1);
    end;
end;

function GetFileVersion(const FileName: TFileName; var Major, Minor, Release, Build: Integer): Boolean;
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  Result := False;
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
        begin
          Major := FI.dwFileVersionMS shr 16;
          Minor := FI.dwFileVersionMS and $FFFF;
          Release := FI.dwFileVersionLS shr 16;
          Build := FI.dwFileVersionLS and $FFFF;
          Result := true;
        end;
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

procedure ComressStream(aSource, aTarget: TStream);
var
  comprStream: TCompressionStream;
begin
  // compression level : (clNone, clFastest, clDefault, clMax)
  comprStream := TCompressionStream.Create(clMax, aTarget);
  try
    comprStream.CopyFrom(aSource, aSource.Size);
    comprStream.CompressionRate;
  finally
    comprStream.Free;
  End;
End;

procedure DecompressStream(aSource, aTarget: TStream);
var
  decompStream: TDecompressionStream;
  nRead: Integer;
  buffer: array [0 .. 1023] of Char;
begin
  decompStream := TDecompressionStream.Create(aSource);
  try
    repeat
      nRead := decompStream.Read(buffer, 1024);
      aTarget.Write(buffer, nRead);
    Until nRead = 0;
  finally
    decompStream.Free;
  End;
End;

function DateTOFBdate(const aDate: TDate): String;
var
  y, m, d: Word;
begin
  // TODO:Дату из строки в TDate
  try
    DecodeDate(aDate, y, m, d);
    Result := '''' + IntToStr(y) + '-' + IntToStr(m) + '-' + IntToStr(d) + '''';
  except
    Result := 'null';
  end;

end;

function LeftTrimChar(const S: string; const chr: Char): string;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] = chr) do
    Inc(I);
  Result := Copy(S, I, MaxInt);
end;

// =============================================================================
// Evaluate a date time string into a TDateTime obeying the
// rules of the specified DateTimeFormat string
// eg. DateTimeStrEval('dd-MMM-yyyy hh:nn','23-May-2002 12:34)
//
// Delphi 6 Specific in DateUtils can be translated to ....
//
// YearOf()
//
// function YearOf(const AValue: TDateTime): Word;
// var LMonth, LDay : word;
// begin
// DecodeDate(AValue,Result,LMonth,LDay);
// end;
//
// TryEncodeDateTime()
//
// function TryEncodeDateTime(const AYear,AMonth,ADay,AHour,AMinute,ASecond,
// AMilliSecond : word;
// out AValue : TDateTime): Boolean;
// var LTime : TDateTime;
// begin
// Result := TryEncodeDate(AYear, AMonth, ADay, AValue);
// if Result then begin
// Result := TryEncodeTime(AHour, AMinute, ASecond, AMilliSecond, LTime);
// if Result then
// AValue := AValue + LTime;
// end;
// end;
//
// (TryEncodeDate() and TryEncodeTime() is the same as EncodeDate() and
// EncodeTime() with error checking and boolean return value)
//
// =============================================================================

function DateTimeStrEval(const DateTimeFormat: string; const DateTimeStr: string): TDateTime;
var
  I, ii, iii: Integer;
  Retvar: TDateTime;
  Tmp, Fmt, Data, Mask, Spec: string;
  Year, Month, Day, Hour, Minute, Second, MSec: Word;
  AmPm: Integer;

  fs: TFormatSettings;

begin

  fs := TFormatSettings.Create;

  Year := YearOf(now());
  Month := 1;
  Day := 1;
  Hour := 0;
  Minute := 0;
  Second := 0;
  MSec := 0;
  Fmt := AnsiUpperCase(DateTimeFormat);
  Data := AnsiUpperCase(DateTimeStr);
  I := 1;
  Mask := '';
  AmPm := 0;

  while I < Length(Fmt) do
  begin
    if CharInSet(Fmt[I], ['A', 'P', 'D', 'M', 'Y', 'H', 'N', 'S', 'Z']) then
    begin
      // Start of a date specifier
      Mask := Fmt[I];
      ii := I + 1;

      // Keep going till not valid specifier
      while true do
      begin
        if ii > Length(Fmt) then
          Break; // End of specifier string
        Spec := Mask + Fmt[ii];

        if (Spec = 'DD') or (Spec = 'DDD') or (Spec = 'DDDD') or (Spec = 'MM') or (Spec = 'MMM') or (Spec = 'MMMM') or
          (Spec = 'YY') or (Spec = 'YYY') or (Spec = 'YYYY') or (Spec = 'HH') or (Spec = 'NN') or (Spec = 'SS') or
          (Spec = 'ZZ') or (Spec = 'ZZZ') or (Spec = 'AP') or (Spec = 'AM') or (Spec = 'AMP') or (Spec = 'AMPM') then
        begin
          Mask := Spec;
          Inc(ii);
        end
        else
        begin
          // End of or Invalid specifier
          Break;
        end;
      end;

      // Got a valid specifier ? - evaluate it from data string
      if (Mask <> '') and (Length(Data) > 0) then
      begin
        // Day 1..31
        if (Mask = 'DD') then
        begin
          Day := StrToIntDef(trim(Copy(Data, 1, 2)), 0);
          Delete(Data, 1, 2);
        end;

        // Day Sun..Sat (Just remove from data string)
        if Mask = 'DDD' then
          Delete(Data, 1, 3);

        // Day Sunday..Saturday (Just remove from data string LEN)
        if Mask = 'DDDD' then
        begin
          Tmp := Copy(Data, 1, 3);
          for iii := 1 to 7 do
          begin
            if Tmp = AnsiUpperCase(Copy(fs.LongDayNames[iii], 1, 3)) then
            begin
              Delete(Data, 1, Length(fs.LongDayNames[iii]));
              Break;
            end;
          end;
        end;

        // Month 1..12
        if (Mask = 'MM') then
        begin
          Month := StrToIntDef(trim(Copy(Data, 1, 2)), 0);
          Delete(Data, 1, 2);
        end;

        // Month Jan..Dec
        if Mask = 'MMM' then
        begin
          Tmp := Copy(Data, 1, 3);
          for iii := 1 to 12 do
          begin
            if Tmp = AnsiUpperCase(Copy(fs.LongMonthNames[iii], 1, 3)) then
            begin
              Month := iii;
              Delete(Data, 1, 3);
              Break;
            end;
          end;
        end;

        // Month January..December
        if Mask = 'MMMM' then
        begin
          Tmp := Copy(Data, 1, 3);
          for iii := 1 to 12 do
          begin
            if Tmp = AnsiUpperCase(Copy(fs.LongMonthNames[iii], 1, 3)) then
            begin
              Month := iii;
              Delete(Data, 1, Length(fs.LongMonthNames[iii]));
              Break;
            end;
          end;
        end;

        // Year 2 Digit
        if Mask = 'YY' then
        begin
          Year := StrToIntDef(Copy(Data, 1, 2), 0);
          Delete(Data, 1, 2);
          if Year < fs.TwoDigitYearCenturyWindow then
            Year := (YearOf(Date) div 100) * 100 + Year
          else
            Year := (YearOf(Date) div 100 - 1) * 100 + Year;
        end;

        // Year 4 Digit
        if Mask = 'YYYY' then
        begin
          Year := StrToIntDef(Copy(Data, 1, 4), 0);
          Delete(Data, 1, 4);
        end;

        // Hours
        if Mask = 'HH' then
        begin
          Hour := StrToIntDef(trim(Copy(Data, 1, 2)), 0);
          Delete(Data, 1, 2);
        end;

        // Minutes
        if Mask = 'NN' then
        begin
          Minute := StrToIntDef(trim(Copy(Data, 1, 2)), 0);
          Delete(Data, 1, 2);
        end;

        // Seconds
        if Mask = 'SS' then
        begin
          Second := StrToIntDef(trim(Copy(Data, 1, 2)), 0);
          Delete(Data, 1, 2);
        end;

        // Milliseconds
        if (Mask = 'ZZ') or (Mask = 'ZZZ') then
        begin
          MSec := StrToIntDef(trim(Copy(Data, 1, 3)), 0);
          Delete(Data, 1, 3);
        end;

        // AmPm A or P flag
        if (Mask = 'AP') then
        begin
          if Data[1] = 'A' then
            AmPm := -1
          else
            AmPm := 1;
          Delete(Data, 1, 1);
        end;

        // AmPm AM or PM flag
        if (Mask = 'AM') or (Mask = 'AMP') or (Mask = 'AMPM') then
        begin
          if Copy(Data, 1, 2) = 'AM' then
            AmPm := -1
          else
            AmPm := 1;
          Delete(Data, 1, 2);
        end;

        Mask := '';
        I := ii;
      end;
    end
    else
    begin
      // Remove delimiter from data string
      if Length(Data) > 1 then
        Delete(Data, 1, 1);
      Inc(I);
    end;
  end;

  if AmPm = 1 then
    Hour := Hour + 12;
  if not TryEncodeDateTime(Year, Month, Day, Hour, Minute, Second, MSec, Retvar) then
    Retvar := 0.0;
  Result := Retvar;
end;

// аналог функции Explode PHP
function Explode(Ch: Char; const Text: string): TStringArray;
var
  I, k, Len: Integer;
  Count: Integer;
begin
  if Text = '' then
  begin
    Result := nil;
    Exit;
  end; // if
  Count := 0;
  Len := Length(Text);
  for I := 1 to Len do
  begin
    if Text[I] = Ch then
      Inc(Count);
  end; // for i
  SetLength(Result, Count + 1);
  Count := 0;
  k := 1;
  for I := 1 to Len do
  begin
    if Text[I] = Ch then
    begin
      Result[Count] := Copy(Text, k, I - k);
      Inc(Count);
      k := I + 1;
    end; // if
  end;
  Result[Count] := Copy(Text, k, Len - k + 1);
end;

procedure SetGlobalConst;
{$IFDEF MSWINDOWS}
var
  fs: TFormatSettings;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
{$WARN SYMBOL_PLATFORM OFF}
  fs := TFormatSettings.Create(LOCALE_SYSTEM_DEFAULT);
  fs.DecimalSeparator := ',';
  fs.DateSeparator := '.';
  fs.ShortDateFormat := 'dd.mm.yyyy';
  fs.ShortTimeFormat := 'hh:mm:ss';
{$WARN SYMBOL_PLATFORM ON}
{$ENDIF}
end;

function IsSmallFonts: Boolean; { Значение функции TRUE если мелкий шрифт }
var
  DC: HDC;
begin
  DC := GetDC(0);
  Result := (GetDeviceCaps(DC, LOGPIXELSX) = 96);
  { В случае крупного шрифта будет 120 }
  ReleaseDC(0, DC);
end;

{ защита от крупных шрифтов }
procedure UpdateFonts(Control: TWinControl);
var
  I: Integer;

  procedure UpdateFont(Font: TFont);
  begin
    if CompareText(Font.Name, 'MS Sans Serif') <> 0 then
      Exit;
    Font.Name := 'Tahoma';
  end;

begin
  if IsSmallFonts then
    Exit;
  with Control do
  begin
    UpdateFont(TShowFont(Control).Font);
    for I := 0 to ControlCount - 1 do
    begin
      UpdateFont(TShowFont(Controls[I]).Font);
      if Controls[I] is TWinControl then
        UpdateFonts(Controls[I] as TWinControl);
    end;
  end;

end;

function GetExePath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function FBdateToDate(const aFBDAte: String): TDateTime;
var
  y, m, d: Integer;
  S: string;
begin
  // TODO:Дату из строки в TDate
  Result := 0;
  if pos('-', aFBDAte) = 0 then
    Exit;
  y := StrToInt(Copy(aFBDAte, 0, pos('-', aFBDAte) - 1));
  S := Copy(aFBDAte, pos('-', aFBDAte) + 1, 100);
  m := StrToInt(Copy(S, 0, pos('-', S) - 1));
  S := Copy(S, pos('-', S) + 1, 100);
  d := StrToInt(S);
  Result := EncodeDate(y, m, d);
end;

// Log Event in Database
// If AEvent_Id<0 then insert mode, else Update mode
// Return True if ok
function LogEvent(const AUnit, ADescr, ANonice: String): Boolean;
var
  F: TextFile;
begin
  Result := False;
  if not DebugMode then
    Exit;
  AssignFile(F, LogFileName);
  if (not FileExists(LogFileName)) then
    Rewrite(F) // create
  else
    Append(F);

  if ioresult = 0 then
  begin
    Writeln(F, format('%10s:  %s  :%s :%s', [DateTimeToStr(now), AUnit, ADescr, ANonice]));
    Flush(F);
    CloseFile(F);
    Result := true;
  end;

end;

procedure SetKeyboardLayout(const aLayout: String);
var
  Layout: array [0 .. KL_NAMELENGTH] of Char;
begin
  if AnsiUpperCase(aLayout) = 'RU' then
    LoadKeyboardLayout(StrCopy(Layout, '00000419'), KLF_ACTIVATE);
  if AnsiUpperCase(aLayout) = 'EN' then
    LoadKeyboardLayout(StrCopy(Layout, '00000409'), KLF_ACTIVATE);
  if AnsiUpperCase(aLayout) = 'UA' then
    LoadKeyboardLayout(StrCopy(Layout, '00000422'), KLF_ACTIVATE);
  if AnsiUpperCase(aLayout) = 'LV' then
    LoadKeyboardLayout(StrCopy(Layout, '00000426'), KLF_ACTIVATE);
  if AnsiUpperCase(aLayout) = 'KA' then
    LoadKeyboardLayout(StrCopy(Layout, '00010437'), KLF_ACTIVATE);
  if aLayout = 'ქარ' then
    LoadKeyboardLayout(StrCopy(Layout, '00010437'), KLF_ACTIVATE);
end;

// Возвращаем первое число месяца
// соответствующего дате aDate
function MonthFirstDay(const aDate: TDateTime): TDateTime;
var
  fYear, fMonth, fDay: Word;
begin
  // Используем функции модуля SysUtils
  DecodeDate(aDate, fYear, fMonth, fDay);
  Result := EncodeDate(fYear, fMonth, 1);
end;

// Возвращаем последнее число месяца
// соответствующего дате aDate
function MonthLastDay(const aDate: TDateTime): TDateTime;
begin
  Result := EndOfTheMonth(aDate);
end;

procedure DatasetToJson(DS: TDataset; const FileName: string);
var
  bkmark: TBookmark;
  I: Integer;
  Obj, ChildObj: TJsonObject;
begin
  if DS.RecordCount = 0 then
    Exit;

  Obj := TJsonObject.Create;
  try
    DS.DisableControls;
    bkmark := DS.GetBookmark;
    DS.First;
    while (not DS.EOF) do
    begin
      ChildObj := Obj.A['records'].AddObject;
      for I := 0 to DS.FieldCount - 1 do
      begin
        if (not DS.Fields[I].IsNull) then
        begin
          case DS.Fields[I].DataType of
            ftInteger, ftSmallint:
              ChildObj.I[DS.Fields[I].FieldName] := DS.Fields[I].AsInteger;
            ftDate, ftDateTime:
              ChildObj.d[DS.Fields[I].FieldName] := DS.Fields[I].AsDateTime;
            ftString:
              ChildObj.S[DS.Fields[I].FieldName] := DS.Fields[I].AsString;
            ftFloat:
              ChildObj.F[DS.Fields[I].FieldName] := DS.Fields[I].AsFloat;
            ftBoolean:
              ChildObj.B[DS.Fields[I].FieldName] := DS.Fields[I].AsBoolean;
          end;
        end;
      end;
      DS.Next;
    end;
    DS.GotoBookmark(bkmark);
    DS.EnableControls;

    Obj.SaveToFile(FileName);
  finally
    Obj.Free;
  end;
end;

function DatasetToJsonStr(DS: TDataset): string;
var
  bkmark: TBookmark;
  I: Integer;
  NeedSave: Boolean;
  Obj, ChildObj: TJsonObject;
begin
  if DS.RecordCount = 0 then
    Exit;

  Obj := TJsonObject.Create;
  NeedSave := (DS.RecordCount > 0) and (DS.FieldCount > 0);
  try
    DS.DisableControls;
    bkmark := DS.GetBookmark;
    DS.First;
    while (not DS.EOF) do
    begin
      ChildObj := Obj.A['records'].AddObject;
      for I := 0 to DS.FieldCount - 1 do
      begin
        if (not DS.Fields[I].IsNull) then
        begin
          case DS.Fields[I].DataType of
            ftInteger, ftSmallint:
              ChildObj.I[DS.Fields[I].FieldName] := DS.Fields[I].AsInteger;
            ftDate, ftDateTime:
              ChildObj.d[DS.Fields[I].FieldName] := DS.Fields[I].AsDateTime;
            ftString:
              ChildObj.S[DS.Fields[I].FieldName] := DS.Fields[I].AsString;
            ftFloat:
              ChildObj.F[DS.Fields[I].FieldName] := DS.Fields[I].AsFloat;
            ftBoolean:
              ChildObj.B[DS.Fields[I].FieldName] := DS.Fields[I].AsBoolean;
          end;
        end;
      end;
      DS.Next;
    end;
    DS.GotoBookmark(bkmark);
    DS.EnableControls;
    if NeedSave then
      Result := Obj.ToString;
  finally
    Obj.Free;
  end;
end;

procedure DatasetFromJsonStr(DS: TDataset; const AJson: string);
var
  J, I: Integer;
  Obj, O: TJsonObject;
begin
  Obj := TJsonObject.Parse(AJson) as TJsonObject;
  try
    DS.DisableControls;
    for I := 0 to Obj.A['records'].Count - 1 do
    begin
      DS.Append;
      O := Obj.A['records'][I];
      for J := 0 to DS.FieldCount - 1 do
      begin
        if (O.Contains(DS.Fields[J].FieldName)) then
        begin
          case DS.Fields[J].DataType of
            ftInteger, ftSmallint:
              DS.Fields[J].AsInteger := O.I[DS.Fields[J].FieldName];
            ftDate, ftDateTime:
              DS.Fields[J].AsDateTime := O.d[DS.Fields[J].FieldName];
            ftString:
              DS.Fields[J].AsString := O.S[DS.Fields[J].FieldName];
            ftFloat:
              DS.Fields[J].AsFloat := O.F[DS.Fields[J].FieldName];
            ftBoolean:
              DS.Fields[J].AsBoolean := O.B[DS.Fields[J].FieldName];
          end;
        end;
      end;
      DS.post;
    end;

    DS.First;
    DS.EnableControls;
  finally
    Obj.Free;
  end;
end;

procedure DatasetFromJson(DS: TDataset; const FileName: string);
var
  JsonStr: string;
  FileStream: TFileStream;
  Bytes: TBytes;
begin
  if not FileExists(FileName) then
    Exit;

  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    if FileStream.Size > 0 then
    begin
      SetLength(Bytes, FileStream.Size);
      FileStream.Read(Bytes[0], FileStream.Size);
    end;
    JsonStr := TEncoding.UTF8.GetString(Bytes);

    // JsonStr := Stream.ToString;
  finally
    FileStream.Free;
  end;
  // JsonStr := TFile.ReadAllText(FileName, TEncoding.UTF8);
  DatasetFromJsonStr(DS, JsonStr);
end;

procedure DatasetToINI(Dataset: TDataset; const FileName: string);
var
  Ini: TIniFile;
  bkmark: TBookmark;
  I, r: Integer;
  v: Integer;
  n: String;
begin
  Ini := TIniFile.Create(FileName);
  try
    with Dataset do
    begin
      DisableControls;
      bkmark := GetBookmark;
      First;
      Ini.WriteInteger('Common', 'Records', RecordCount);
      r := 0;
      while (not EOF) do
      begin
        for I := 0 to FieldCount - 1 do
        begin
          n := 'RECORD' + IntToStr(r);
          if (Fields[I].DataType in [ftInteger, ftSmallint]) and (not Fields[I].IsNull) then
            Ini.WriteInteger(n, Fields[I].FieldName, Fields[I].AsInteger);
          if (Fields[I].DataType in [ftDate, ftDateTime]) and (not Fields[I].IsNull) then
            Ini.WriteString(n, Fields[I].FieldName, Fields[I].AsString);
          if (Fields[I].DataType in [ftString]) and (not Fields[I].IsNull) then
            Ini.WriteString(n, Fields[I].FieldName, Fields[I].AsString);
          if (Fields[I].DataType in [ftFloat]) and (not Fields[I].IsNull) then
            Ini.WriteFloat(n, Fields[I].FieldName, Fields[I].AsFloat);
          if (Fields[I].DataType in [ftBoolean]) and (not Fields[I].IsNull) then
          begin
            if Fields[I].AsBoolean then
              v := 1
            else
              v := 0;
            Ini.WriteInteger(n, Fields[I].FieldName, v);
          end
        end;
        r := r + 1;
        Next;
      end;

      GotoBookmark(bkmark);
      EnableControls;
    end;

  finally
    Ini.Free;
  end;
end;

procedure DatasetFromINI(Dataset: TDataset; const FileName: string);
var
  Ini: TIniFile;
  J, I, r: Integer;
  v: Integer;
  n: string;
begin
  Ini := TIniFile.Create(FileName);
  try
    with Dataset do
    begin
      DisableControls;
      J := Ini.ReadInteger('Common', 'Records', 0);
      for r := 0 to (J - 1) do
      begin
        Append;
        n := 'RECORD' + IntToStr(r);
        for I := 0 to FieldCount - 1 do
        begin
          if (Fields[I].DataType in [ftInteger, ftSmallint]) then
            try
              Fields[I].AsInteger := Ini.ReadInteger(n, Fields[I].FieldName, -32768);
              if Fields[I].AsInteger = -32768 then
                Fields[I].Clear;
            except
            end;
          if (Fields[I].DataType in [ftFloat]) then
            try
              Fields[I].AsFloat := Ini.ReadFloat(n, Fields[I].FieldName, -999999879);
              if Fields[I].AsFloat = -999999879 then
                Fields[I].Clear;
            except
            end;
          if (Fields[I].DataType in [ftString]) then
            try
              Fields[I].AsString := Ini.ReadString(n, Fields[I].FieldName, 'null');
              if Fields[I].AsString = 'null' then
                Fields[I].Clear;
            except
            end;
          if (Fields[I].DataType in [ftDate, ftDateTime]) then
            try
              Fields[I].AsString := Ini.ReadString(n, Fields[I].FieldName, '01.01.1900');
              if Fields[I].AsString = '01.01.1900' then
                Fields[I].Clear;
            except
            end;
          if (Fields[I].DataType in [ftBoolean]) then
            try
              v := Ini.ReadInteger(n, Fields[I].FieldName, -1);
              if v = -1 then
                Fields[I].Clear
              else
                Fields[I].AsBoolean := (v = 1);
            except
            end;
        end;
        post;
      end;
      First;
      EnableControls;
    end;
  finally
    Ini.Free;
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
function AdvSelectDirectory(const Caption: string; const Root: WideString; var Directory: string;
  EditBox: Boolean = False; ShowFiles: Boolean = False; AllowCreateDirs: Boolean = true): Boolean;
// callback function that is called when the dialog has been initialized
// or a new directory has been selected

// Callback-Funktion, die aufgerufen wird, wenn der Dialog initialisiert oder
// ein neues Verzeichnis selektiert wurde
  function SelectDirCB(Wnd: HWnd; uMsg: UINT; lParam, lpData: lParam): Integer; stdcall;
  // var
  // PathName: array[0..MAX_PATH] of Char;
  begin
    case uMsg of
      BFFM_INITIALIZED:
        SendMessage(Wnd, BFFM_SETSELECTION, Ord(true), Integer(lpData));
      // include the following comment into your code if you want to react on the
      // event that is called when a new directory has been selected
      // binde den folgenden Kommentar in deinen Code ein, wenn du auf das Ereignis
      // reagieren willst, das aufgerufen wird, wenn ein neues Verzeichnis selektiert wurde
      { BFFM_SELCHANGED:
        begin
        SHGetPathFromIDList(PItemIDList(lParam), @PathName);
        // the directory "PathName" has been selected
        // das Verzeichnis "PathName" wurde selektiert
        end; }
    end;
    Result := 0;
  end;

var
  WindowList: Pointer;
  BrowseInfo: TBrowseInfo;
  buffer: PChar;
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
  FillChar(BrowseInfo, Sizeof(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
  begin
    buffer := ShellMalloc.Alloc(MAX_PATH);
    try
      RootItemIDList := nil;
      if Root <> '' then
      begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil, POleStr(Root), Eaten, RootItemIDList, Flags);
      end;
      OleInitialize(nil);
      with BrowseInfo do
      begin
        hwndOwner := Application.Handle;
        pidlRoot := RootItemIDList;
        pszDisplayName := buffer;
        lpszTitle := PChar(Caption);
        // defines how the dialog will appear:
        // legt fest, wie der Dialog erscheint:
        ulFlags := BIF_RETURNONLYFSDIRS or BIF_USENEWUI or BIF_EDITBOX * Ord(EditBox) or BIF_BROWSEINCLUDEFILES *
          Ord(ShowFiles) or BIF_NOCREATEDIRS * Ord(not AllowCreateDirs);
        lpfn := @SelectDirCB;
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
        ShGetPathFromIDList(ItemIDList, buffer);
        ShellMalloc.Free(ItemIDList);
        Directory := buffer;
      end;
    finally
      ShellMalloc.Free(buffer);
    end;
  end;
end;

// проверка на корректность IP адреса
function CheckIP(const IP: string): Boolean;
var
  i1, i2, i3, i4: Integer;
  S: string;
  ar: TStringArray;
begin
  Result := False;
  S := IP;
  if Length(S) < 7 then
    Exit;
  ar := Explode('.', S);
  i1 := Length(ar);
  if i1 <> 4 then
    Exit;
  try
    i1 := StrToInt(ar[0]);
    i2 := StrToInt(ar[1]);
    i3 := StrToInt(ar[2]);
    i4 := StrToInt(ar[3]);
    Result := (i1 < 256) and (i2 < 256) and (i3 < 256) and (i4 < 256);
  except
  end;

end;

// проверка на корректность MAC адреса
function CheckMAC(const MAC: string): Boolean;
var
  S: string;
  // ar : TStringArray;
begin
  Result := False;

  S := MAC;
  if Length(S) <> 17 then
    Exit;
  S := AnsiUpperCase(S);
  S := StringReplace(S, ':', '', [rfReplaceAll]);
  S := StringReplace(S, 'A', '', [rfReplaceAll]);
  S := StringReplace(S, 'B', '', [rfReplaceAll]);
  S := StringReplace(S, 'C', '', [rfReplaceAll]);
  S := StringReplace(S, 'D', '', [rfReplaceAll]);
  S := StringReplace(S, 'E', '', [rfReplaceAll]);
  S := StringReplace(S, 'F', '', [rfReplaceAll]);
  S := StringReplace(S, '0', '', [rfReplaceAll]);
  S := StringReplace(S, '1', '', [rfReplaceAll]);
  S := StringReplace(S, '2', '', [rfReplaceAll]);
  S := StringReplace(S, '3', '', [rfReplaceAll]);
  S := StringReplace(S, '4', '', [rfReplaceAll]);
  S := StringReplace(S, '5', '', [rfReplaceAll]);
  S := StringReplace(S, '6', '', [rfReplaceAll]);
  S := StringReplace(S, '7', '', [rfReplaceAll]);
  S := StringReplace(S, '8', '', [rfReplaceAll]);
  S := StringReplace(S, '9', '', [rfReplaceAll]);
  Result := S = '';
end;

// переведем маску вида /24 в 255.255.255.0
function IntToMask(const int_mask: Integer): String;
begin
  // 32 раза херак и в продакшн
  case int_mask of
    0:
      Result := '0.0.0.0';
    1:
      Result := '128.0.0.0';
    2:
      Result := '192.0.0.0';
    3:
      Result := '224.0.0.0';
    4:
      Result := '240.0.0.0';
    5:
      Result := '248.0.0.0';
    6:
      Result := '252.0.0.0';
    7:
      Result := '254.0.0.0';
    8:
      Result := '255.0.0.0';
    9:
      Result := '255.128.0.0';
    10:
      Result := '255.192.0.0';
    11:
      Result := '255.224.0.0';
    12:
      Result := '255.240.0.0';
    13:
      Result := '255.248.0.0';
    14:
      Result := '255.252.0.0';
    15:
      Result := '255.254.0.0';
    16:
      Result := '255.255.0.0';
    17:
      Result := '255.255.128.0';
    18:
      Result := '255.255.192.0';
    19:
      Result := '255.255.224.0';
    20:
      Result := '255.255.240.0';
    21:
      Result := '255.255.248.0';
    22:
      Result := '255.255.252.0';
    23:
      Result := '255.255.254.0';
    24:
      Result := '255.255.255.0';
    25:
      Result := '255.255.255.128';
    26:
      Result := '255.255.255.192';
    27:
      Result := '255.255.255.224';
    28:
      Result := '255.255.255.240';
    29:
      Result := '255.255.255.248';
    30:
      Result := '255.255.255.252';
    31:
      Result := '255.255.255.254';
    32:
      Result := '255.255.255.255';
  else
    Result := '';
  end;
end;

{
  Возвращает системный каталог, по умолчанию

  0: [Current User]\My Documents
  1: All Users\Application Data
  2: [User Specific]\Application Data
  3: Program Files
  4: All Users\Documents

}
function GetSpecialFolderPath(folder: Integer = 2): string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  Path: array [0 .. MAX_PATH] of Char;
  specialFolder: Integer;
begin
  specialFolder := CSIDL_PERSONAL;
  case folder of
    // [Current User]\My Documents
    0:
      specialFolder := CSIDL_PERSONAL;
    // All Users\Application Data
    1:
      specialFolder := CSIDL_COMMON_APPDATA;
    // [User Specific]\Application Data
    2:
      specialFolder := CSIDL_LOCAL_APPDATA;
    // Program Files
    3:
      specialFolder := CSIDL_PROGRAM_FILES;
    // All Users\Documents
    4:
      specialFolder := CSIDL_COMMON_DOCUMENTS;
  end;

  if SUCCEEDED(SHGetFolderPath(0, specialFolder, 0, SHGFP_TYPE_CURRENT, @Path[0])) then
    Result := Path
  else
    Result := '';
end;

function GetFileNameFromURL(const S: string): string;
var
  I: Integer;
begin
  Result := S;
  for I := Length(S) downto 1 do
    if (S[I] = '/') then
    begin
      Result := Copy(S, I + 1, Length(S));
      Break;
    end;
  I := pos('?', Result);
  if I > 0 then
    Result := Copy(Result, 1, I - 1);
end;

function WaitForFileWrite(const FileName: String): Boolean;
var
  hFile: THandle;
  I: Integer;
  CanWrite: Boolean;
begin
  // Если файл есть. проверим не залочен ли он
  if FileExists(FileName) then
  begin
    I := 0;
    Repeat
      hFile := CreateFile(PChar(FileName), GENERIC_WRITE, 0, nil, OPEN_EXISTING, 0, 0);
      if hFile <> ERROR_SHARING_VIOLATION then
        CanWrite := true
      else
        CanWrite := False;
      CloseHandle(hFile);
      if not CanWrite then
        Sleep(500);
      Inc(I);
    until ((I > 3) or CanWrite);
  end
  else
    CanWrite := true;

  Result := CanWrite;
end;

// Get Oracle beetween dates str
function GenerateBetweenDateSql(aFieldName: String; aDateFrom, aDateTo: TDateTime): string;
begin
  Result := '(' + aFieldName + ' between ''' + FormatDateTime('yyyy-mm-dd', aDateFrom) + ''' and ''' +
    FormatDateTime('yyyy-mm-dd', aDateTo) + ''')';
end;

procedure StrToClipbrd(StrValue: string);
var
  // S: string;
  hMem: THandle;
  pMem: PChar;
begin
  hMem := GlobalAlloc(GHND or GMEM_SHARE, Length(StrValue) + 1);
  if hMem <> 0 then
  begin
    pMem := GlobalLock(hMem);
    if pMem <> nil then
    begin
      StrPCopy(pMem, StrValue);
      GlobalUnlock(hMem);
      if OpenClipboard(0) then
      begin
        EmptyClipboard;
        SetClipboardData(CF_TEXT, hMem);
        CloseClipboard;
      end
      else
        GlobalFree(hMem);
    end
    else
      GlobalFree(hMem);
  end;
end;

function GetStrFromClipbrd: string;
begin
  if Clipboard.HasFormat(CF_TEXT) then
    Result := Clipboard.AsText
  else
  begin
    Result := '';
  end;
end;

procedure PostKeyExHWND(hWindow: HWnd; key: Word; const shift: TShiftState; specialkey: Boolean);
type
  TBuffers = array [0 .. 1] of TKeyboardState;
var
  pKeyBuffers: ^TBuffers;
  lParam: LongWord;
begin
  (* check if the target window exists *)
  if IsWindow(hWindow) then
  begin
    (* set local variables to default values *)
    // pKeyBuffers := nil; // hide compiler Hint
    lParam := MakeLong(0, MapVirtualKey(key, 0));

    (* modify lparam if special key requested *)
    if specialkey then
      lParam := lParam or $1000000;

    (* allocate space for the key state buffers *)
    New(pKeyBuffers);
    try
      (* Fill buffer 1 with current state so we can later restore it.
        Null out buffer 0 to get a "no key pressed" state. *)
      GetKeyboardState(pKeyBuffers^[1]);
      FillChar(pKeyBuffers^[0], Sizeof(TKeyboardState), 0);

      (* set the requested modifier keys to "down" state in the buffer *)
      if ssShift in shift then
        pKeyBuffers^[0][VK_SHIFT] := $80;
      if ssAlt in shift then
      begin
        (* Alt needs special treatment since a bit in lparam needs also be set *)
        pKeyBuffers^[0][VK_MENU] := $80;
        lParam := lParam or $20000000;
      end;
      if ssCtrl in shift then
        pKeyBuffers^[0][VK_CONTROL] := $80;
      if ssLeft in shift then
        pKeyBuffers^[0][VK_LBUTTON] := $80;
      if ssRight in shift then
        pKeyBuffers^[0][VK_RBUTTON] := $80;
      if ssMiddle in shift then
        pKeyBuffers^[0][VK_MBUTTON] := $80;

      (* make out new key state array the active key state map *)
      SetKeyboardState(pKeyBuffers^[0]);
      (* post the key messages *)
      if ssAlt in shift then
      begin
        PostMessage(hWindow, WM_SYSKEYDOWN, key, lParam);
        PostMessage(hWindow, WM_SYSKEYUP, key, lParam or $C0000000);
      end
      else
      begin
        PostMessage(hWindow, WM_KEYDOWN, key, lParam);
        PostMessage(hWindow, WM_KEYUP, key, lParam or $C0000000);
      end;
      (* process the messages *)
      Application.ProcessMessages;

      (* restore the old key state map *)
      SetKeyboardState(pKeyBuffers^[1]);
    finally
      (* free the memory for the key state buffers *)
      if pKeyBuffers <> nil then
        Dispose(pKeyBuffers);
    end; { If }
  end;
end; { PostKeyEx }

function FileGetTempName(const Prefix: string): string;
var
  TempPath, TempFile: string;
  r: Cardinal;
begin
  Result := '';
  r := GetTempPath(0, nil);
  SetLength(TempPath, r);
  r := GetTempPath(r, PChar(TempPath));
  if r <> 0 then
  begin
    SetLength(TempPath, StrLen(PChar(TempPath)));
    SetLength(TempFile, MAX_PATH);
    r := GetTempFileName(PChar(TempPath), PChar(Prefix), 0, PChar(TempFile));
    if r <> 0 then
    begin
      SetLength(TempFile, StrLen(PChar(TempFile)));
      Result := TempFile;
    end;
  end;
  if Result = '' then
  begin
    Result := ExtractFilePath(Application.ExeName) + Prefix + '.update';
    // .TrimRight(['\', '/']);
  end
end;

function FileGetTempFolder: string;
var
  TempPath: string;
  r: Cardinal;
begin
  Result := '';
  r := GetTempPath(0, nil);
  SetLength(TempPath, r);
  r := GetTempPath(r, PChar(TempPath));
  if r <> 0 then
  begin
    SetLength(TempPath, StrLen(PChar(TempPath)));
    Result := TempPath;
  end;
end;

function GetUserCacheFolder(): string;
var
  S: string;
  F: string;
begin
  S := rsAplicationName;
  F := GetSpecialFolderPath();
  if F <> '' then
    F := F + '\' + S + '\Cache\'
  else
    F := ExtractFilePath(Application.ExeName) + 'FILTERS\';
  ForceDirectories(F);
  Result := F
end;

procedure PutStringIntoClipBoard(const Str: WideString);
var
  Size: Integer;
  Data: THandle;
  DataPtr: Pointer;
begin
  Size := Length(Str);
  if Size = 0 then
    Exit;
  Clipboard.Clear;
  if not IsClipboardFormatAvailable(CF_UNICODETEXT) then
    Clipboard.AsText := Str
  else
  begin
    Size := Size shl 1 + 2;
    Data := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, Size);
    try
      DataPtr := GlobalLock(Data);
      try
        Move(Pointer(Str)^, DataPtr^, Size);
        Clipboard.SetAsHandle(CF_UNICODETEXT, Data);
      finally
        GlobalUnlock(Data);
      end;
    except
      GlobalFree(Data);
      raise;
    end;
  end;
end;

function GetStringFromClipboard: WideString;
var
  Data: THandle;
begin
  if not IsClipboardFormatAvailable(CF_UNICODETEXT) then
    Result := Clipboard.AsText
  else
  begin
    Clipboard.Open;
    Data := GetClipboardData(CF_UNICODETEXT);
    try
      if Data <> 0 then
        Result := PWideChar(GlobalLock(Data))
      else
        Result := '';
    finally
      if Data <> 0 then
        GlobalUnlock(Data);
      Clipboard.Close;
    end;
  end;
end;

function myQuestion(const Caption, Text: String): Boolean;
begin
  Result := Application.MessageBox(PChar(Text), PChar(Caption), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES;
end;

procedure Jpeg2Png(aPicStream: TMemoryStream);
var
  JPG: TJpegImage;
  PNG: TPngImage;
  BMP: TBitmap;
begin
  JPG := TJpegImage.Create;
  PNG := TPngImage.Create;
  BMP := TBitmap.Create;
  try
    aPicStream.Position := 0;
    JPG.LoadFromStream(aPicStream);
    BMP.PixelFormat := pf24Bit;
    BMP.Width := JPG.Width;
    BMP.Height := JPG.Height;
    BMP.Canvas.Draw(0, 0, JPG);
    PNG.Assign(BMP);
    aPicStream.Clear;
    aPicStream.Position := 0;
    PNG.SaveToStream(aPicStream);
  finally
    FreeAndNil(JPG);
    FreeAndNil(PNG);
    FreeAndNil(BMP);
  end;
end; (* все работает *)

procedure Png2Jpeg(aPicStream: TMemoryStream);
var
  JPG: TJpegImage;
  PNG: TPngImage;
  BMP: TBitmap;
begin
  JPG := TJpegImage.Create;
  PNG := TPngImage.Create;
  BMP := TBitmap.Create;
  try
    aPicStream.Position := 0;
    PNG.LoadFromStream(aPicStream);
    BMP.PixelFormat := pf24Bit;
    BMP.Width := PNG.Width;
    BMP.Height := PNG.Height;
    BMP.Canvas.Draw(0, 0, PNG);
    JPG.Assign(BMP);
    aPicStream.Clear;
    aPicStream.Position := 0;
    JPG.SaveToStream(aPicStream);
  finally
    FreeAndNil(JPG);
    FreeAndNil(PNG);
    FreeAndNil(BMP);
  end;
end; (* все работает *)

function GetWineAvail: Boolean;
var
  H: Cardinal;
begin
  Result := False;
  H := LoadLibrary('ntdll.dll');
  if H > 0 then
  begin
    Result := Assigned(GetProcAddress(H, 'wine_get_version'));
    FreeLibrary(H);
  end;
end;

initialization

// Colors
gCustActive := clWindowText; // Подключен
gCustInactive := clTeal; // Отключен
gCustDisconted := clGray; // Разорван договор
gCustActiveDebt := clRed; // Подключен и долг
gCustInactiveDebt := clMaroon; // Отключен и долг
gCustPPAct := clBlue; // Повторно подключался за последний месяц
OPERATION_DATE := now;
DebugMode := False;

end.
