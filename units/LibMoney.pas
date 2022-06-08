unit LibMoney;
{$I defines.inc}

interface

(*
  c=0 - 21.05 -> "Двадцать один рубль 05 копеек."
  с=1 - 21.05 -> "двадцать один"
  c=2 - 21.05 -> "21-05", 21.00 -> "21="
*)

function MoneyToStr(n: double; c: byte = 0): string;
function NumToStr(n: double; c: byte = 0): string;
function F2W(number: Currency): String; stdcall;

implementation

uses
  System.SysUtils;

function F2W(number: Currency): String; stdcall;
// у меня эта функция реализована в DLL
var
  FiguresInWord: string;
const
  s1: array [0 .. 19] of string = ('ноль', 'один', 'два', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять',
    'десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать',
    'восемнадцать', 'девятнадцать');
  s10: array [2 .. 9] of string = ('двадцать', 'тридцать', 'сорок', 'пятьдесят', 'шестьдесят', 'семьдесят',
    'восемьдесят', 'девяносто');
  s100: array [1 .. 9] of string = ('сто', 'двести', 'триста', 'четыреста', 'пятьсот', 'шестьсот', 'семьсот',
    'восемьсот', 'девятьсот');

  function f(s: string; t: Boolean): Integer;
  var
    i: Integer;
    r: string;
  begin
    FiguresInWord := '';
    i := StrToInt(s);
    s := IntToStr(i); // убираем нули впереди
    if i > 99 then
    begin
      r := r + s100[StrToInt(s[1])] + ' ';
      Delete(s, 1, 1);
      i := StrToInt(s);
    end;
    if i > 19 then
    begin
      r := r + s10[StrToInt(s[1])] + ' ';
      Delete(s, 1, 1);
      i := StrToInt(s);
    end;
    if (i > 9) and (i < 20) then
      r := r + s1[i]
    else if i <> 0 then
      if t then
      begin
        if i = 1 then
          r := r + 'одна'
        else if i = 2 then
          r := r + 'две'
        else
          r := r + s1[i];
      end
      else
        r := r + s1[i];
    FiguresInWord := FiguresInWord + r;
    result := i;
  end;

var
  i, l, n, c: Integer;
  s, r: string;
  fs: TFormatSettings;
begin
  fs := TFormatSettings.Create;
  r := '';
  { ---------------------------- отбрасываем дробную часть }
  number := number * 100;
  number := System.Round(number);
  number := number / 100;
  s := FloatToStr(number);
  i := Pos(fs.DecimalSeparator, s);
  l := Length(s);
  Delete(s, i, l - i + 1);
  l := Length(s);
  i := StrToInt(s);
  { ---------------------------- }
  c := l mod 3;
  if (c = 0) and (l > 0) then
    c := 3;
  if i > 999999999 then
    i := 0;
  if i > 999999 then
  begin
    n := f(Copy(s, 1, c), false);
    r := r + FiguresInWord;
    if n = 1 then
      r := r + ' миллион '
    else if (n = 2) or (n = 3) or (n = 4) then
      r := r + ' миллиона '
    else
      r := r + ' миллионов ';
    Delete(s, 1, c);
    c := 3;
  end;
  if i > 999 then
  begin
    n := f(Copy(s, 1, c), true);
    r := r + FiguresInWord;
    if n = 1 then
      r := r + ' тысяча '
    else if (n = 2) or (n = 3) or (n = 4) then
      r := r + ' тысячи '
    else if Copy(s, 1, c) <> '000' then
      r := r + ' тысяч ';
    Delete(s, 1, c);
  end;
  n := f(s, false);
  r := r + FiguresInWord;
  if n < 5 then
  begin
    if n = 1 then
      r := r + ' рубль '
    else if (n = 2) or (n = 3) or (n = 4) then
      r := r + ' рубля '
    else
      r := r + ' рублей ';
  end
  else
    r := r + ' рублей ';

  s := FloatToStrF(number, ffCurrency, 15, 2);
  i := Pos(fs.DecimalSeparator, s);
  r := r + Copy(s, i + 1, 2);
  n := StrToInt(Copy(s, i + 1, 2));
  if (n > 4) and (n < 21) then
    r := r + ' копеек'
  else
  begin
    n := StrToInt(Copy(s, i + 2, 1));
    if n = 1 then
      r := r + ' копейка'
    else if (n = 2) or (n = 3) or (n = 4) then
      r := r + ' копейки'
    else
      r := r + ' копеек';
  end;

  s := AnsiUpperCase(Copy(r, 1, 1));
  Delete(r, 1, 1);
  r := Concat(s, r);

  result := r;
end;

// Еще одна

function NumToStr(n: double; c: byte = 0): string;
(*
  c=0 - 21.05 -> 'Двадцать один рубль 05 копеек.'
  с=1 - 21.05 -> 'двадцать один'
  c=2 - 21.05 -> '21-05', 21.00 -> '21='
*)
const
  digit: array [0 .. 9] of string = ('ноль', 'оди', 'два', 'три', 'четыр', 'пят', 'шест', 'сем', 'восем', 'девят');

var
  ts, mln, mlrd, SecDes: Boolean;
  len: byte;
  summa: string;

  function NumberString(const number: string): string;
  var
    d, Pos: byte;

    function DigitToStr: string;
    begin
      result := '';
      if (d <> 0) and ((Pos = 11) or (Pos = 12)) then
        mlrd := true;
      if (d <> 0) and ((Pos = 8) or (Pos = 9)) then
        mln := true;
      if (d <> 0) and ((Pos = 5) or (Pos = 6)) then
        ts := true;
      if SecDes then
      begin
        case d of
          0:
            result := 'десять ';
          2:
            result := 'двенадцать '
        else
          result := digit[d] + 'надцать '
        end;
        case Pos of
          4:
            result := result + 'тысяч ';
          7:
            result := result + 'миллионов ';
          10:
            result := result + 'миллиардов '
        end;
        SecDes := false;
        mln := false;
        mlrd := false;
        ts := false
      end
      else
      begin
        if (Pos = 2) or (Pos = 5) or (Pos = 8) or (Pos = 11) then
          case d of
            1:
              SecDes := true;
            2, 3:
              result := digit[d] + 'дцать ';
            4:
              result := 'сорок ';
            9:
              result := 'девяносто ';
            5 .. 8:
              result := digit[d] + 'ьдесят '
          end;
        if (Pos = 3) or (Pos = 6) or (Pos = 9) or (Pos = 12) then
          case d of
            1:
              result := 'сто ';
            2:
              result := 'двести ';
            3:
              result := 'триста ';
            4:
              result := 'четыреста ';
            5 .. 9:
              result := digit[d] + 'ьсот '
          end;
        if (Pos = 1) or (Pos = 4) or (Pos = 7) or (Pos = 10) then
          case d of
            1:
              result := 'один ';
            2, 3:
              result := digit[d] + ' ';
            4:
              result := 'четыре ';
            5 .. 9:
              result := digit[d] + 'ь '
          end;
        if Pos = 4 then
        begin
          case d of
            0:
              if ts then
                result := 'тысяч ';
            1:
              result := 'одна тысяча ';
            2:
              result := 'две тысячи ';
            3, 4:
              result := result + 'тысячи ';
            5 .. 9:
              result := result + 'тысяч '
          end;
          ts := false
        end;
        if Pos = 7 then
        begin
          case d of
            0:
              if mln then
                result := 'миллионов ';
            1:
              result := result + 'миллион ';
            2, 3, 4:
              result := result + 'миллиона ';
            5 .. 9:
              result := result + 'миллионов '
          end;
          mln := false
        end;
        if Pos = 10 then
        begin
          case d of
            0:
              if mlrd then
                result := 'миллиардов ';
            1:
              result := result + 'миллиард ';
            2, 3, 4:
              result := result + 'миллиарда ';
            5 .. 9:
              result := result + 'миллиардов '
          end;
          mlrd := false
        end
      end
    end;

  begin
    result := '';
    ts := false;
    mln := false;
    mlrd := false;
    SecDes := false;
    len := Length(number);
    if (len = 0) or (number = '0') then
      result := digit[0]
    else
      for Pos := len downto 1 do
      begin
        d := StrToInt(Copy(number, len - Pos + 1, 1));
        result := result + DigitToStr
      end
  end;

  function MoneyString(const number: string): string;
  var
    s: string;
    n: string;
  begin
    len := Length(number);
    n := Copy(number, 1, len - 3);
    result := NumberString(n);
    s := AnsiUpperCase(result[1]);
    Delete(result, 1, 1);
    result := s + result;
    if len < 2 then
    begin
      if len = 0 then
        n := '0';
      len := 2;
      n := '0' + n
    end;
    result := trim(result);
    if Copy(n, len - 1, 1) = '1' then
      result := '(' + result + ') рублей'
    else
    begin
      case StrToInt(Copy(n, len, 1)) of
        1:
          result := '(' + result + ') рубль';
        2, 3, 4:
          result := '(' + result + ') рубля'
      else
        result := '(' + result + ') рублей'
      end
    end;

    len := Length(number);
    n := Copy(number, len - 1, len);
    if Copy(n, 1, 1) = '1' then
      n := n + ' копеек.'
    else
    begin
      case StrToInt(Copy(n, 2, 1)) of
        1:
          n := n + ' копейка.';
        2, 3, 4:
          n := n + ' копейки.'
      else
        n := n + ' копеек.'
      end
    end;
    result := result + ' ' + n
  end;

// Основная часть
begin
  case c of
    0:
      result := MoneyString(FormatFloat('0.00', n));
    1:
      result := NumberString(FormatFloat('0', n));
    2:
      begin
        summa := FormatFloat('0.00', n);
        len := Length(summa);
        if Copy(summa, len - 1, 2) = '00' then
        begin
          Delete(summa, len - 2, 3);
          result := summa + '='
        end
        else
        begin
          Delete(summa, len - 2, 1);
          insert('-', summa, len - 2);
          result := summa;
        end;
      end
  end;
end;

function MoneyToStr(n: double; c: byte = 0): string;
begin
  result := NumToStr(n, c);
end;

end.
