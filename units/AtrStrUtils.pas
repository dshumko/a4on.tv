unit AtrStrUtils;

interface

uses
  System.Classes, System.SysUtils, System.Variants,
  Data.DB;

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';

type
  TStringArray = array of string;

function MonthFirstDay(const aDate: TDateTime): TDateTime;

// Возвращаем последнее число месяца
// соответствующего дате aDate
function MonthLastDay(const aDate: TDateTime): TDateTime;

function FBdateToDate(const aFBDAte: String): TDateTime;
function DateTOFBdate(const aDate: TDateTime): String;

// записать строку в буфер обмена
procedure StrToClipbrd(const StrValue: string);
// прочесть строку из буфера обмена
function GetStrFromClipbrd: string;

// аналог функции Explode PHP
function Explode(Ch: Char; const Text: string): TStringArray;

// проверка на корректность IP адреса
function CheckIP(const IP: string): Boolean;

// проверка на корректность MAC адреса
function CheckMAC(const MAC: string): Boolean;
// удаляет все неверные символы и ставит разделителем :
function ValidateMAC(const MAC: string): string;
// удаляем символ слева
// s - строка для поиска, chr - удаляемый символ
function LeftTrimChar(const S: string; const chr: Char): string;
// Добавляет слева символ до нужно длинны
function LeftPad(const S: string; const Ch: Char; const Len: Integer): string;

// удаляет символы из строки
function RemoveChars(const S: string; const Chrs: string): string;

// Get database beetween dates str
function GenerateBetweenDateSql(const aFieldName: String; const aDateFrom, aDateTo: TDateTime): string;

// Get date in Firebird format
function GetFirebirdDate(const aDate: TDateTime): string;

// перевод в транслит по СЭВ 1362-78
// А Б В Г Д Е Ё  Ж  З И Й К Л М Н О П Р С Т У Ф Х  Ц Ч  Ш  Щ   Ъ  Ы Ь Э  Ю  Я
// A B V G D E JO ZH Z I J K L M N O P R S T U F KH C CH SH SHH '' Y ' EH JU JA

function ToTranslit(const S: string): string;
function Translit(const S: string): string; // не меняет прбел на _
// перевод из транслита по СЭВ 1362-78
// А Б В Г Д Е Ё  Ж  З И Й К Л М Н О П Р С Т У Ф Х  Ц Ч  Ш  Щ   Ъ  Ы Ь Э  Ю  Я
// A B V G D E JO ZH Z I J K L M N O P R S T U F KH C CH SH SHH '' Y ' EH JU JA
function FromTranslit(const S: string): string;

// увеличить MAC адрес на значение step
function IncMAC(const MAC: string; const step: Integer = 1): String;

// оставляет в строке только цифры
function DigitsOnly(const S: string): string;

function GenPassword(const PWDlen: Integer = 8): String;

// перевод трех символьного кода iso в двухсимвольный
function LangISO6391toISO6392TCode(const LANG: String): String;
function LangISO6392TtoISO6391Code(const LANG: String): String;

// Проверка, заблокирован файл или нет. Если не блокирован то возвращает TRUE
function CheckFileNotLock(const Origin: string): Boolean;

function NormalizeFIO(const S: string): String;

function TrimAnd(const S: string): String;
// validate an IBAN
function CheckIBAN(iban: string): Boolean;
// проверка расчетного счета в РФ
function CheckRusBA(BA: string; BIK: String): Boolean;

// форматирование MAC как xxxx.xxxx.xxxx
function FormatMACas4Cd(const S: string): String;

// корректировка номера для страны
function CorrectPhone(const phone: string; const aCountry: String = 'BY'): string;

// Вывод месяца как строка, например 01.01.2013 - «1» января 2013
function MonthAsString(const D: TDateTime; const beforeDay: string = '«'; const AfterDay: string = '»'): string;

// Форматируем Фамилию как Ф***я
function HideSurname(const S: String): string;

implementation

uses
  Winapi.Windows,
  System.DateUtils, System.RegularExpressions,
  Vcl.Clipbrd,
  RxStrUtils;

const
  SErrWrongBase64EncodedString = 'Формат строки не соответствует способу кодирования Base64.';

  // IBAN = International Bank Account Number
  // Example : CH10002300A1023502601

function ChangeAlpha(input: string): string;
// A -> 10, B -> 11, C -> 12 ...
var
  a: Char;
begin
  Result := input;
  for a := 'A' to 'Z' do
  begin
    Result := StringReplace(Result, a, IntToStr(Ord(a) - 55), [rfReplaceAll]);
  end;
end;

function CalculateDigits(iban: string): Integer;
var
  v, l: Integer;
  alpha: string;
  number: Longint;
  rest: Integer;
begin
  iban := UpperCase(iban);
  if Pos('IBAN', iban) > 0 then
    Delete(iban, Pos('IBAN', iban), 4);
  iban := iban + Copy(iban, 1, 4);
  Delete(iban, 1, 4);
  iban := ChangeAlpha(iban);
  v := 1;
  l := 9;
  rest := 0;
  alpha := '';
  try
    while v <= Length(iban) do
    begin
      if l > Length(iban) then
        l := Length(iban);
      alpha := alpha + Copy(iban, v, l);
      number := StrToInt(alpha);
      rest := number mod 97;
      v := v + l;
      alpha := IntToStr(rest);
      l := 9 - Length(alpha);
    end;
  except
    rest := 0;
  end;
  Result := rest;
end;

function CheckIBAN(iban: string): Boolean;
begin
  if CalculateDigits(iban) = 1 then
    Result := True
  else
    Result := False;
end;

function CheckRusBA(BA: string; BIK: String): Boolean;
begin
  // https://github.com/Kholenkov/php-data-validation/blob/master/src/DataValidation.php
  Result := True;
end;

function ValidateMAC(const MAC: string): string;
var
  S: string;
  i: Integer;
begin
  Result := '';
  if Length(MAC) < 12 then
    Exit;
  S := AnsiUpperCase(MAC);
  for i := 1 to Length(S) do
  begin
    if CharInSet(S[i], ['0' .. '9']) then
      Result := Result + S[i]
    else if CharInSet(S[i], ['A' .. 'F']) then
      Result := Result + S[i];
  end;
  if Length(Result) = 12 then
  begin
    Result := Copy(Result, 1, 2) + ':' + Copy(Result, 3, 18);
    Result := Copy(Result, 1, 5) + ':' + Copy(Result, 6, 18);
    Result := Copy(Result, 1, 8) + ':' + Copy(Result, 9, 18);
    Result := Copy(Result, 1, 11) + ':' + Copy(Result, 12, 18);
    Result := Copy(Result, 1, 14) + ':' + Copy(Result, 15, 18);
  end
  else
    Result := '';
end;

// Get database beetween dates str
function GenerateBetweenDateSql(const aFieldName: String; const aDateFrom, aDateTo: TDateTime): string;
begin
  Result := '(' + aFieldName + ' between ''' + FormatDateTime('yyyy-mm-dd', aDateFrom) + ''' and ''' +
    FormatDateTime('yyyy-mm-dd', aDateTo) + ''')';
end;

// Get database beetween dates str
function GetFirebirdDate(const aDate: TDateTime): string;
begin
  Result := 'cast(''' + FormatDateTime('yyyy-mm-dd', aDate) + ''' as DATE)';
end;

function RemoveChars(const S: string; const Chrs: string): string;
var
  i, J: Integer;
begin
  Result := S;
  if Length(Chrs) = 0 then
    Exit;

  for J := 1 to Length(Chrs) do
  begin
    for i := Length(Result) downto 1 do
    begin
      if Result[i] = Chrs[J] then
        Delete(Result, i, 1);
    end;
  end;
end;

function DateTOFBdate(const aDate: TDateTime): String;
var
  y, m, D: word;
begin
  // TODO:Дату из строки в TDate
  try
    DecodeDate(aDate, y, m, D);
    Result := '''' + IntToStr(y) + '-' + IntToStr(m) + '-' + IntToStr(D) + '''';
  except
    Result := 'null';
  end;
end;

function FBdateToDate(const aFBDAte: String): TDateTime;
var
  y, m, D: Integer;
  S: string;
begin
  // TODO:Дату из строки в TDate
  Result := 0;
  if Pos('-', aFBDAte) = 0 then
    Exit;
  y := StrToInt(Copy(aFBDAte, 0, Pos('-', aFBDAte) - 1));
  S := Copy(aFBDAte, Pos('-', aFBDAte) + 1, 100);
  m := StrToInt(Copy(S, 0, Pos('-', S) - 1));
  S := Copy(S, Pos('-', S) + 1, 100);
  D := StrToInt(S);
  Result := EncodeDate(y, m, D);
end;

function LeftTrimChar(const S: string; const chr: Char): string;
var
  i, l: Integer;
begin
  l := Length(S);
  i := 1;
  while (i <= l) and (S[i] = chr) do
    Inc(i);
  Result := Copy(S, i, MaxInt);
end;

function LeftPad(const S: string; const Ch: Char; const Len: Integer): string;
var
  RestLen: Integer;
begin
  Result := S;
  RestLen := Len - Length(S);
  if RestLen < 1 then
    Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

// аналог функции Explode PHP
function Explode(Ch: Char; const Text: string): TStringArray;
var
  i, k, Len: Integer;
  Count: Integer;
begin
  if Text = '' then
  begin
    Result := nil;
    Exit;
  end; // if
  Count := 0;
  Len := Length(Text);
  for i := 1 to Len do
  begin
    if Text[i] = Ch then
      Inc(Count);
  end; // for i
  SetLength(Result, Count + 1);
  Count := 0;
  k := 1;
  for i := 1 to Len do
  begin
    if Text[i] = Ch then
    begin
      Result[Count] := Copy(Text, k, i - k);
      Inc(Count);
      k := i + 1;
    end; // if
  end;
  Result[Count] := Copy(Text, k, Len - k + 1);
end;

procedure StrToClipbrd(const StrValue: string);
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

// Возвращаем первое число месяца
// соответствующего дате aDate
function MonthFirstDay(const aDate: TDateTime): TDateTime;
var
  fYear, fMonth, fDay: word;
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

// перевод в транслит по СЭВ 1362-78
// А Б В Г Д Е Ё  Ж  З И Й К Л М Н О П Р С Т У Ф Х  Ц Ч  Ш  Щ   Ъ  Ы Ь Э  Ю  Я
// A B V G D E JO ZH Z I J K L M N O P R S T U F KH C CH SH SHH '' Y ' EH JU JA

function ToTranslit(const S: string): string;
const
  rus: string = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ ';
  lat: array [1 .. 67] of string = ('a', 'b', 'v', 'g', 'd', 'e', 'jo', 'zh', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
    'p', 'r', 's', 't', 'u', 'f', 'kh', 'c', 'ch', 'sh', 'shh', '''''', 'y', '''', 'eh', 'ju', 'ja', 'A', 'B', 'V', 'G',
    'D', 'E', 'JO', 'ZH', 'Z', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'KH', 'C', 'CH', 'SH',
    'SHH', '''''', 'Y', '''', 'EH', 'JU', 'JA', '_');
var
  p, i, l: Integer;
begin
  Result := '';
  l := Length(S);
  for i := 1 to l do
  begin
    p := Pos(S[i], rus);
    if p < 1 then
      Result := Result + S[i]
    else
      Result := Result + lat[p];
  end;
end;

function Translit(const S: string): string;
const
  rus: string = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ ';
  lat: array [1 .. 67] of string = ('a', 'b', 'v', 'g', 'd', 'e', 'jo', 'zh', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
    'p', 'r', 's', 't', 'u', 'f', 'kh', 'c', 'ch', 'sh', 'shh', '''''', 'y', '''', 'eh', 'ju', 'ja', 'A', 'B', 'V', 'G',
    'D', 'E', 'JO', 'ZH', 'Z', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'KH', 'C', 'CH', 'SH',
    'SHH', '''''', 'Y', '''', 'EH', 'JU', 'JA', ' ');
var
  p, i, l: Integer;
begin
  Result := '';
  l := Length(S);
  for i := 1 to l do
  begin
    p := Pos(S[i], rus);
    if p < 1 then
      Result := Result + S[i]
    else
      Result := Result + lat[p];
  end;
end;

// перевод из транслита по СЭВ 1362-78
// А Б В Г Д Е Ё  Ж  З И Й К Л М Н О П Р С Т У Ф Х  Ц Ч  Ш  Щ   Ъ  Ы Ь Э  Ю  Я
// A B V G D E JO ZH Z I J K L M N O P R S T U F KH C CH SH SHH '' Y ' EH JU JA
function FromTranslit(const S: string): string;
const
  rus1: string = 'абвгдезийклмнопрстуфцыАБВГДЕЗИЙКЛМНОПРСТУФЦЫЬ ';
  lat1: string = 'abvgdezijklmnoprstufcyABVGDEZIJKLMNOPRSTUFCY''_';
  rus2: string = 'ёжхчшэюяЁЖХЧШЭЮЯъ';
  lat2: array [1 .. 17] of string = ('jo', 'zh', 'kh', 'ch', 'sh', 'eh', 'ju', 'ja', 'JO', 'ZH', 'KH', 'CH', 'SH', 'EH',
    'JU', 'JA', '''''');
  // щ
  // 'shch'
var
  p, i, J, l: Integer;
  sub: string;
  C: Char;
begin
  Result := '';
  l := Length(S);
  i := 1;
  while i <= l do
  begin

    // проверим букву Щ
    if (i + 2) <= l then
    begin
      C := Char(32);
      sub := Copy(S, i, 3);
      if (sub = 'shh') then
        C := 'щ'
      else if (AnsiUpperCase(sub) = 'SHH') then
        C := 'Щ';
      if (C <> Char(32)) then
      begin
        Inc(i, 4);
        Result := Result + C;
        Continue;
      end;
    end;

    if (i + 1) <= l then
    begin
      C := Char(32);
      sub := Copy(S, i, 2);
      for J := 1 to 8 do
      begin
        if (sub = lat2[J]) then
          C := rus2[J]
        else if (AnsiUpperCase(sub) = lat2[J + 8]) then
          C := rus2[J + 8];
      end;
      if (C <> Char(32)) then
      begin
        Inc(i, 2);
        Result := Result + C;
        Continue;
      end;
    end;

    p := Pos(S[i], lat1);
    if p < 1 then
      Result := Result + S[i]
    else
      Result := Result + rus1[p];
    Inc(i);
  end;
end;

function IncMAC(const MAC: string; const step: Integer = 1): String;
var
  newMac: string;
  IntMac: array [0 .. 5] of Byte;
  J, o: Integer;
  i: Integer;
begin
  // 00:18:9b:47:29:4f

  for i := 0 to 5 do
  begin
    newMac := ExtractWord(i + 1, MAC, [':']);
    IntMac[i] := HEX2DEC(newMac);
  end;
  J := step;
  for i := 5 downto 0 do
  begin
    if (IntMac[i] + J) > 255 then
    begin
      o := (IntMac[i] + J);
      o := o mod 256;
      IntMac[i] := o;
      J := J - o;
    end
    else
    begin
      IntMac[i] := IntMac[i] + J;
      J := 0;
    end;
  end;

  newMac := Dec2Hex(IntMac[0], 2);
  newMac := newMac + ':' + Dec2Hex(IntMac[1], 2);
  newMac := newMac + ':' + Dec2Hex(IntMac[2], 2);
  newMac := newMac + ':' + Dec2Hex(IntMac[3], 2);
  newMac := newMac + ':' + Dec2Hex(IntMac[4], 2);
  newMac := newMac + ':' + Dec2Hex(IntMac[5], 2);

  Result := newMac;
end;

function DigitsOnly(const S: string): string;
var
  i, l: Integer;
begin
  Result := '';
  l := Length(S);
  for i := 1 to l do
  begin
    if CharInSet(S[i], ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
      Result := Result + S[i];
  end;
end;

function GenPassword(const PWDlen: Integer = 8): String;
const
  validchar: string = '0123456789abcdef';
var
  S: string;
  i: Integer;
begin
  S := '';
  Randomize;
  i := Length(validchar);
  while Length(S) < PWDlen do
    S := S + validchar[Random(i) + 1];
  Result := S;
end;

function LangISO6391toISO6392TCode(const LANG: String): String;
Var
  S: string;
begin
  S := UpperCase(LANG);
  Result := 'ru';
  // ENGLISH ENG, RUSSIAN RUS, LATVIAN LAV, LITHUANIAN LIT, ESTONIAN EST, BELARUSIAN BEL, UKRAINIAN UKR, GERMAN DEU, FRENCH FRA
  if S = 'ENG' then
    Result := 'en'
  else if S = 'LAV' then
    Result := 'lv'
  else if S = 'LIT' then
    Result := 'lt'
  else if S = 'EST' then
    Result := 'et'
  else if S = 'BEL' then
    Result := 'be'
  else if S = 'UKR' then
    Result := 'uk'
  else if S = 'DEU' then
    Result := 'de'
  else if S = 'FRA' then
    Result := 'fr'
end;

function LangISO6392TtoISO6391Code(const LANG: String): String;
Var
  S: string;
begin
  S := UpperCase(LANG);
  Result := 'RUS';
  // ENGLISH ENG, RUSSIAN RUS, LATVIAN LAV, LITHUANIAN LIT, ESTONIAN EST, BELARUSIAN BEL, UKRAINIAN UKR, GERMAN DEU, FRENCH FRA
  if S = 'EN' then
    Result := 'ENG'
  else if S = 'LV' then
    Result := 'LAV'
  else if S = 'LT' then
    Result := 'LIT'
  else if S = 'ET' then
    Result := 'EST'
  else if S = 'BE' then
    Result := 'BEL'
  else if S = 'UK' then
    Result := 'UKR'
  else if S = 'DE' then
    Result := 'DEU'
  else if S = 'FR' then
    Result := 'FRA'
end;

function CheckFileNotLock(const Origin: string): Boolean;
var
  HFileRes: HFILE;
begin
  Result := False;
  if not FileExists(Origin) then
    Exit;
  HFileRes := CreateFile(PChar(Origin), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
  Result := not Result;
end;

function NormalizeFIO(const S: string): String;
var
  sa: TStringArray;
  fio: String;
  i: Integer;
begin
  // Result := trim(s);
  sa := Explode('-', S);
  fio := AnsiUpperCase(Copy(sa[0], 1, 1)) + AnsiLowerCase(Copy(sa[0], 2, Length(sa[0]) - 1));
  for i := 1 to Length(sa) - 1 do
  begin
    fio := fio + '-' + AnsiUpperCase(Copy(sa[i], 1, 1)) + AnsiLowerCase(Copy(sa[i], 2, Length(sa[i]) - 1));
  end;
  Result := fio;
end;

function TrimAnd(const S: string): String;
var
  tmp: String;
begin
  tmp := trim(S);
  if (AnsiUpperCase(Copy(tmp, 1, 3)) = 'AND') then
    Result := Copy(tmp, 4, Length(tmp) - 3)
  else
    Result := S;
end;

function FormatMACas4Cd(const S: string): String;
var
  aMac: TStringArray;
begin
  Result := '';
  if CheckMAC(S) then
  begin
    aMac := Explode(':', S);
    Result := LowerCase(aMac[0] + aMac[1] + '.' + aMac[2] + aMac[3] + '.' + aMac[4] + aMac[5]);
  end;
end;

function CorrectPhone(const phone: string; const aCountry: String = 'BY'): string;
const
  pfRU: string = '^79[0-9]{9}$';
  pfBY: string = '^375(24|25|29|33|44)[1-9]{1}[0-9]{6}$';
  pfUA: string = '^380(50|63|66|67|68|91|92|93|94|95|96|97|98|99)[0-9]{7}$';

  function CorrectBY(const p: string): string;
  const
    prefix: string = '375';
  var
    l: Integer;
    S: string;
  begin
    Result := '';
    l := Length(p);
    case l of
      12:
        if Copy(p, 1, 3) = prefix then
          Result := p;
      9:
        Result := prefix + p; // 297346934
    else
      begin
        if l >= 11 then
        begin
          // 80297349634
          S := Copy(p, 1, 2);
          if S = '80' then
            Result := prefix + Copy(p, 3, 9);
        end;
      end;
    end;
    if not TRegEx.IsMatch(Result, pfBY) then
      Result := '';
  end;

  function CorrectUA(const p: string): string;
  const
    prefix: string = '380';
  begin
    Result := p;
    if not TRegEx.IsMatch(Result, pfUA) then
      Result := '';
  end;

  function CorrectRU(const p: string): string;
  const
    prefix: string = '7';
  var
    l: Integer;
  begin
    Result := '';
    l := Length(p);
    case l of
      11:
        if Copy(p, 1, 1) = '8' then
          Result := prefix + Copy(p, 2, 10);
      10:
        Result := prefix + p; // 297346934
    end;
    if not TRegEx.IsMatch(Result, pfRU) then
      Result := '';
  end;

var
  S: string;
  tp: string;
begin
  Result := '';
  tp := DigitsOnly(phone);
  if aCountry = 'BY' then
    S := pfBY
  else if aCountry = 'UA' then
    S := pfUA
  else
    S := pfRU;

  if not TRegEx.IsMatch(tp, S) then
  begin
    S := tp;
    if aCountry = 'BY' then
      Result := CorrectBY(S)
    else if aCountry = 'UA' then
      Result := CorrectUA(S)
    else
      Result := CorrectRU(S);
  end
  else
    Result := tp;
end;

function MonthAsString(const D: TDateTime; const beforeDay: string = '«'; const AfterDay: string = '»'): string;
const
  Mes: array [1 .. 12] of string = ('января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа',
    'сентября', 'октября', 'ноября', 'декабря');
var
  Year, Month, Day: word;
begin
  DecodeDate(D, Year, Month, Day);
  Result := beforeDay + IntToStr(Day) + AfterDay + ' ' + Mes[Month] + ' ' + IntToStr(Year);
end;

function HideSurname(const S: String): string;
begin
  Result := Copy(S, 1, 1) + '***' + Copy(S, Length(S), 1);
end;

initialization

end.
