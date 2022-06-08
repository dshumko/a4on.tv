unit GvMoney;

interface

type
  TValuteType= (vUnknown,vBYB,vRUR,vUSD,vEUR,vUAG);
  TGender= (gNone, gMan, gWoman);
  TPadeg= (wpNone, wpIE, wpRE, wpRM);

  TValuteInfo= record
    vType: TValuteType;
    Sign: String[3];
    Code: Integer;
    OldCode: Integer;
    Gender: TGender;
    Name: Array [wpIE..wpRM] of String[40];
    ShortName: String[10];
    CntGender: TGender;
    Cnt: Array [wpIE..wpRM] of String[20];
  end;

const

  Valutes: Array[vUnknown..vUAG] of TValuteInfo = (
    (vType: vBYB; Sign: ''; Code: 0; OldCode: 0; Gender: gMan;
    Name: ('рубль ', 'рубля ', 'рублей ');
    CntGender: gNone; Cnt: ('', '', '')),

    (vType: vBYB; Sign: 'BYB'; Code: 974; OldCode: 834; Gender: gMan;
    Name: ('белорусский рубль ', 'белорусских рубля ', 'белорусских рублей ');
    ShortName: 'бел. руб.'; CntGender: gWoman; Cnt: ('копейка', 'копейки', 'копеек')),

    (vType: vRUR; Sign: 'RUR'; Code: 643; OldCode: 858; Gender: gMan;
    Name: ('российский рубль ', 'российских рубля ', 'российских рублей ');
    ShortName: 'руб. РФ'; CntGender: gWoman; Cnt: ('копейка', 'копейки', 'копеек')),

    (vType: vUSD; Sign: 'USD'; Code: 840; OldCode: 001; Gender: gMan;
    Name: ('доллар США ', 'доллара США ', 'долларов США ');
    ShortName: 'USD'; CntGender: gMan; Cnt: ('цент', 'цента', 'центов')),

    (vType: vEUR; Sign: 'EUR'; Code: 45; OldCode: 048; Gender: gWoman;
    Name: ('евро ', 'евро ', 'евро ');
    ShortName: 'Euro'; CntGender: gMan; Cnt: ('цент', 'цента', 'центов')),

    (vType: vUAG; Sign: 'UAG'; Code: 980; OldCode: 833; Gender: gWoman;
    Name: ('гривна ', 'гривны ', 'гривен ');
    ShortName: 'UAG'; CntGender: gWoman; Cnt: ('копейка', 'копейки', 'копеек')));

function ValuteBySign(Signature: String): TValuteType;

function ValuteByCode(Code: Integer): TValuteType;

function ValuteByOldCode(OldCode: Integer): TValuteType;

function MoneyToPropis(Money: Double; vType: TValuteType): String;

function MoneyToStrShort(Money: Double; vType: TValuteType): String;

function MoneyToStr(Money: Double; vType: TValuteType): String;

function ValuteNameByOldCode(OldCode: Integer): String;

implementation

uses
  System.SysUtils, System.Math,
  GvStr, GvMath;

var
  Rod: Byte;

type
  TStepenType=(x0, x3, x6, x9, x12);
  TStepenInfo=Record
    x10: Int64;
    Gender: TGender;
    Name: Array [wpIE..wpRM] of String[20];
  end;

const
  Stepen: Array [x0..x12] of TStepenInfo =(
    (x10: 1; Gender: gNone; Name: ('','','')),
    (x10: 1000; Gender: gWoman; Name: ('тысяча ', 'тысячи ', 'тысяч ')),
    (x10: 1000000; Gender: gMan; Name: ('миллион ', 'миллиона ', 'миллионов ')),
    (x10: 1000000000; Gender: gMan; Name: ('миллиард ', 'миллиарда ', 'миллиардов ')),
    (x10: 1000000000000; Gender: gMan; Name: ('триллион ', 'триллиона ', 'триллионов ')));

  ShortStepen: Array [x0..x12] of TStepenInfo =(
    (x10: 1; Gender: gNone; Name: ('','','')),
    (x10: 1000; Gender: gWoman; Name: ('тыс. ', 'тыс. ', 'тыс. ')),
    (x10: 1000000; Gender: gMan; Name: ('млн. ', 'млн. ', 'млн. ')),
    (x10: 1000000000; Gender: gMan; Name: ('млрд. ', 'млрд. ', 'млрд. ')),
    (x10: 1000000000000; Gender: gMan; Name: ('трлн. ', 'трлн. ', 'трлн. ')));


  Num10x2: Array [1..9] of String[20]=
           ('сто ', 'двести ', 'триста ', 'четыреста ', 'пятьсот ',
            'шестьсот ', 'семьсот ', 'восемьсот ', 'девятьсот ');

  Num10x1: Array [2..9] of String[20]=
           ('двадцать ', 'тридцать ', 'сорок ', 'пятьдесят ',
            'шестьдесят ', 'семьдесят ', 'восемьдесят ', 'девяносто ');

  Num1_19: Array [gMan..gWoman, 1..19] of String[20]=
           (('один ', 'два ', 'три ', 'четыре ', 'пять ', 'шесть ',
            'семь ', 'восемь ', 'девять ', 'десять ', 'одиннадцать ',
            'двенадцать ', 'тринадцать ', 'четырнадцать ', 'пятнадцать ',
            'шестнадцать ', 'семнадцать ', 'восемнадцать ', 'девятнадцать '),
           ('одна ', 'две ', 'три ', 'четыре ', 'пять ', 'шесть ',
            'семь ', 'восемь ', 'девять ', 'десять ', 'одиннадцать ',
            'двенадцать ', 'тринадцать ', 'четырнадцать ', 'пятнадцать ',
            'шестнадцать ', 'семнадцать ', 'восемнадцать ', 'девятнадцать '));

function ValuteBySign(Signature: String): TValuteType;
begin
  Signature:= UpperCase(Signature);
  Result:= High(result);
  while Valutes[Result].Sign <> Signature do Dec(Result);
end;

function ValuteByCode(Code: Integer): TValuteType;
begin
  Result:= High(result);
  while Valutes[Result].Code <> Code do Dec(Result);
end;

function ValuteByOldCode(OldCode: Integer): TValuteType;
begin
  Result:= High(result);
  while Valutes[Result].OldCode <> OldCode do Dec(Result);
end;

function ValuteNameByOldCode(OldCode: Integer): String;
begin
  result:= Valutes[ValuteByOldCode(OldCode)].Name[wpIE];
end;

function DetectPadeg(Value: Int64): TPadeg;
var
  r: Integer;
begin
  result:= wpRM;
  Value:= Value mod 100;
  if Value = 0 then Exit;
  r:= Value div 10;
  if r in [2..9] then Dec(Value, r*10);
  Case Value of
    1: Result:= wpIE;
    2..4: Result:= wpRE;
  end;
end;

function DecodeTriada(Value: Word; Stepen: TStepenInfo; Short: Boolean): String;
var
  r: Byte;
begin
  Result:= '';
  r:= Value div 100;
  if Short then
    Result:= Result+IntToStr(Value)+' '
  else
  begin
    if r in [1..9] then
    begin
      Result:= Result+Num10x2[r];
      Dec(Value, r*100);
    end;
    r:= Value div 10;
    if r in [2..9] then
    begin
      Result:= Result+Num10x1[r];
      Dec(Value, r*10);
    end;
    if Value in [1..19] then
      Result:= Result+Num1_19[Stepen.Gender, Value];
  end;
  if Result <> '' then
    Result:= Result+Stepen.Name[DetectPadeg(Value)];
end;

function DecodeIntPropis(Money: Double; Valute: TValuteType; Short: Boolean): String;
var
  Value: Int64;
  Triada: Word;
  i: TStepenType;
  Padeg: TPadeg;
  Step: TStepenInfo;
begin
  Value:= Trunc(Money);
  if Value=0 then Result:= 'ноль ';
  For i:= x12 downto x3 do
  begin
    if Short then Step:= ShortStepen[i] else Step:= Stepen[i];
    Triada:= Value div Step.x10;
    if Triada<>0 then
    begin
      Dec(Value, Triada*Step.x10);
      Result:= Result + DecodeTriada(Triada, Step, Short);
    end;
  end;
  if Value=0 then
    Padeg:= wpRM
  else
  begin
    if Short then Step:= ShortStepen[x0] else Step:= Stepen[x0];
    Step.Gender:= Valutes[Valute].Gender;
    Result:= Result + DecodeTriada(Value, Step, Short);
  end;
  if Short then
    Result:= Result+Valutes[Valute].ShortName
  else
    Result:= Result+Valutes[Valute].Name[DetectPadeg(Value)];
end;

function DecodeFracPropis(Money: Double; Valute: TValuteType): String;
var
  r, Value: Integer;
  Padeg: TPadeg;
begin
  if Valutes[Valute].CntGender = gNone then Exit;
  Value:= Trunc(Frac(Money)*100);
  Result:= FillFront(IntToStr(Value), 2, '0')+#32;
  Result:= Result+ Valutes[Valute].Cnt[DetectPadeg(Value)];
end;

function MoneyToPropis(Money: Double; vType: TValuteType): String;
begin
  Money:= Abs(Money);
  result:= Trim(DecodeIntPropis(Money, vType, false)+DecodeFracPropis(Money, vType));
end;

function MoneyToStrShort(Money: Double; vType: TValuteType): String;
begin
  Money:= Abs(Money);
  result:= Trim(DecodeIntPropis(Money, vType, true)+DecodeFracPropis(Money, vType));
end;

function MoneyToStr(Money: Double; vType: TValuteType): String;
var
  Value: Int64;
  Padeg: TPadeg;
begin
  Money:= Abs(Money);
  Value:= Trunc(Money);
  Result:= IntToStr(Value);
  Padeg:= DetectPadeg(Value);
  if Valutes[vType].CntGender <> gNone then
    Result:= Result+'.'+FillFront(IntToStr(Trunc(Frac(Money)*100)), 2, '0');
  Result:= Trim(Result+#32+Valutes[vType].Name[Padeg]);
end;

end.
