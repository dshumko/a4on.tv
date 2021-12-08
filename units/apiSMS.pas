unit apiSMS;

{ DEFINE TEST_SMS}

interface

uses SysUtils, Classes, DateUtils, Types, Windows, vcl.dialogs,
  httpsend, SynaUtil, DB, FIBQuery, pFIBQuery,
  System.Generics.Collections, JsonDataObjects,
  A4onTypeUnit;

const
  // Константы для отправки SMS по SMTP
  API_URL: String = 'http://a4on.tv/sms/sms/';

type

  TSMSapi = class
  private
    fA4ON_USER: string;
    fA4ON_KEY: string;
    fError: String;
    fHTTP: THTTPSend;
    fBalance: Integer;
    fCountry: TCountry;
    function GetBalance: Integer;
    function BalanceFromA4on: Integer;
    function CorrectPhone(const phone: string): string;
    function POST2A4ON(const action: string; soData: JsonDataObjects.TJSONObject): string;
  public
    property ErrorText: string read fError;
    property Balance: Integer read GetBalance;
    // Отправить список смс и вернуть кол-во отправленных смс
    function SMSCount(const Text: string): Integer;
    function SendList(list: TSMSList): Integer;
    function SendAll(var ErrorText: String): Integer;
    function CheckAll: Integer;
    function StatusList(list: TSMSList): Integer;
    constructor Create(const user: string; const key: string; const country: string = 'RU');
    destructor Destroy; override;
  end;

implementation

uses SynCrypto, ZLibExGZ, RegularExpressions, DM, AtrStrUtils;

constructor TSMSapi.Create(const user: string; const key: string; const country: string = 'RU');
begin
  fA4ON_USER := user;
  fA4ON_KEY := key;
  if AnsiUpperCase(country) = 'BY'
  then fCountry := cBY
  else if AnsiUpperCase(country) = 'UA'
  then fCountry := cUA
  else fCountry := cRU;

  fHTTP := THTTPSend.Create;
  // Получим баланс сразу
  fBalance := BalanceFromA4on();
end;

destructor TSMSapi.Destroy;
begin
  FreeAndNil(fHTTP);
  inherited Destroy;
end;

function TSMSapi.POST2A4ON(const action: string; soData: JsonDataObjects.TJSONObject): string;
var
  strmData: TStringStream;
  s: UTF8String;
begin
  fError := '';
  soData['login'] := fA4ON_USER;
  soData['password'] := fA4ON_KEY;
  s := soData.ToString;
  soData['hash'] := MD5(s);

  strmData := TStringStream.Create(soData.ToString, TEncoding.UTF8);
  try
    // strmData.WriteString();

    fHTTP.TargetHost := 'a4on.tv';
    fHTTP.Protocol := '1.1';
    fHTTP.MimeType := 'application/x-www-form-urlencoded';
    // fHTTP.Headers.Add('Accept-Encoding: gzip,deflate');
    fHTTP.Document.LoadFromStream(strmData);
    {$IFDEF TEST_SMS}
    fHTTP.Document.SaveToFile('b:\' + action + '.request.JDO.js'); // for debug
    {$ENDIF}
    fHTTP.HTTPMethod('post', API_URL + action + '/');
    strmData.Clear;
    HeadersToList(fHTTP.Headers);
    if Trim(fHTTP.Headers.Values['Content-Encoding']) = 'gzip'
    then begin
      GZDecompressStream(fHTTP.Document, strmData);
      Result := strmData.DataString;
    end
    else begin
      strmData.LoadFromStream(fHTTP.Document);
      {$IFDEF TEST_SMS}
      fHTTP.Document.SaveToFile('b:\' + action + '.Answer.js'); // for debug
      {$ENDIF}
      Result := strmData.DataString;
    end;
  finally strmData.Free;
  end

end;

function TSMSapi.BalanceFromA4on: Integer;
var
  Str: string;
  Obj: JsonDataObjects.TJSONObject;
begin
  Result := 0;
  Obj := JsonDataObjects.TJSONObject.Create;
  try Str := POST2A4ON('balance', Obj);
  finally Obj.Free;
  end;

  Obj := TJSONObject.Parse(Str) as TJSONObject;
  try
    if Obj.IndexOf('sms_count') >= 0
    then begin
      Result := Obj['sms_count'];
    end
    else begin
      if Obj.IndexOf('error') >= 0
      then fError := Obj['error'];

      if Obj.IndexOf('text') >= 0
      then fError := fError + ':' + Obj['text'];
    end
  finally Obj.Free;
  end;
end;

function TSMSapi.GetBalance: Integer;
begin
  Result := fBalance;
end;

function TSMSapi.CorrectPhone(const phone: string): string;
const
  pfRU: string = '^79[0-9]{9}$';
  pfBY: string = '^375(24|25|29|33|44)[1-9]{1}[0-9]{6}$';
  pfUA: string = '^380(50|63|66|67|68|91|92|93|94|95|96|97|98|99)[0-9]{7}$';

  function CorrectBY(const p: string): string;
  const
    prefix: string = '375';
  var
    l: Integer;
    s: string;
  begin
    Result := '';
    l := Length(p);
    case l of
      12: if Copy(p, 1, 3) = prefix then Result := p;
      9: Result := prefix + p; // 297346934
    else begin
        if l >= 11
        then begin
          // 80297349634
          s := Copy(p, 1, 2);
          if s = '80'
          then Result := prefix + Copy(p, 3, 9);
        end;
      end;
    end;
    if not TRegEx.IsMatch(Result, pfBY)
    then Result := '';
  end;

  function CorrectUA(const p: string): string;
  const
    prefix: string = '380';
  begin
    Result := p;
    if not TRegEx.IsMatch(Result, pfUA)
    then Result := '';
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
      11: if Copy(p, 1, 1) = '8' then Result := prefix + Copy(p, 2, 10);
      10: Result := prefix + p; // 297346934
    end;
    if not TRegEx.IsMatch(Result, pfRU)
    then Result := '';
  end;

var
  s: string;
  tp: string;
begin
  Result := '';
  tp := DigitsOnly(phone);
  case fCountry of
    cRU: s := pfRU;
    cBY: s := pfBY;
    cUA: s := pfUA;
  end;

  if not TRegEx.IsMatch(tp, s)
  then begin
    s := tp;
    case fCountry of
      cRU: Result := CorrectRU(s);
      cBY: Result := CorrectBY(s);
      cUA: Result := CorrectUA(s);
    end;
  end
  else Result := tp;
end;

function TSMSapi.SMSCount(const Text: string): Integer;
begin
  Result := 1;
  // public function abtSMScount($text) {
  // /* Считаем Приблизительное количество SMS в сообщении
  // SMS	CYR 	ENG
  // 1 	70  	160
  // 2 	134 	306
  // 3 	201 	459
  // 4 	268 	612
  // */
  // $len = mb_strlen($text, 'UTF-8');
  // $cnt = 0;
  // if (preg_match('/[А-Я\^\{\}\[\]\|\\\~]/i',$text)) {
  // if ($len<=70) 						  $cnt = 1;
  // elseif (($len>70)   and ($len < 134)) $cnt = 2;
  // elseif (($len>=134) and ($len < 201)) $cnt = 3;
  // elseif (($len>=201) and ($len < 268)) $cnt = 4;
  // elseif (($len>=268) and ($len < 335)) $cnt = 5;
  // else 								  $cnt = 6;
  // }
  // else {
  // if ($len <= 160)					  $cnt = 1;
  // elseif (($len>=160) and ($len < 306)) $cnt = 2;
  // elseif (($len>=134) and ($len < 459)) $cnt = 3;
  // elseif (($len>=201) and ($len < 612)) $cnt = 4;
  // elseif (($len>=268) and ($len < 765)) $cnt = 5;
  // else 								  $cnt = 6;
  // }
  // return $cnt;
  // }

end;

function TSMSapi.SendList(list: TSMSList): Integer;
var
  sms: TSMS;
  Str: string;
  i, j: Integer;
  a4ID: Integer;
  Obj, ChildObj: JsonDataObjects.TJSONObject;
begin
  Result := 0;
  if not Assigned(list)
  then Exit;
  if list.Count = 0
  then Exit;

  Obj := JsonDataObjects.TJSONObject.Create;

  for i := 0 to list.Count - 1 do begin
    Str := CorrectPhone(list[i].phone);
    if Str <> ''
    then begin
      // если корректный номер - то продолжим
      ChildObj := Obj.A['messages'].AddObject;
      ChildObj['a4id'] := list[i].a4ID;
      ChildObj['phone'] := Str;
      ChildObj['text'] := list[i].Text;
      if list[i].date <> 0
      then ChildObj['date'] := FormatDateTime('YYYY-mm-dd', list[i].date) + 'T' + FormatDateTime('hh:nn:00+00:00',
          list[i].date);
    end
    else begin
      sms := list[i];
      sms.status := -6; // не верный номер
      list[i] := sms;
    end;
  end;

  if Obj.Count > 0
  then begin
    try
      Str := POST2A4ON('send', Obj);
    finally
      Obj.Free;
    end;

    Obj := TJSONObject.Parse(Str) as TJSONObject;
    try
      if Obj.IndexOf('sms_count') = 0
      then fBalance := Obj['sms_count'];

      // Если массив с заданным именем найден
      if Obj.IndexOf('messages') >= 0
      then begin
        // Получили массив по имени
        for i := 0 to Obj['messages'].Count - 1 do begin
        a4ID := Obj['messages'].Items[i]['a4id'];
        for j := 0 to list.Count - 1 do
          if a4ID = list[j].a4ID
          then begin
            sms := list[j];
            sms.smsID := Obj['messages'].Items[i]['smsId'];
            sms.status := Obj['messages'].Items[i]['state'];
            sms.Text := Obj['messages'].Items[i]['text'];
            list[j] := sms;
          end;
        end;
        Result := Obj['messages'].Count;
      end;
    finally
      Obj.Free;
    end;
  end
  else Obj.Free;

end;

function TSMSapi.SendAll(var ErrorText: String): Integer;
var
  i: Integer;
  rSMS: TpFIBQuery;
  uSMS: TpFIBQuery;
  SMSList: TSMSList;
  sms: TSMS;
  // trR  : TpFIBTransaction;
  // trW  : TpFIBTransaction;
begin
  Result := 0;
  ErrorText := '';

  rSMS := TpFIBQuery.Create(nil);
  uSMS := TpFIBQuery.Create(nil);
  SMSList := TSMSList.Create;
  try
    rSMS.DataBase := dmMain.dbTV;
    rSMS.Transaction := dmMain.trReadQ;
    rSMS.SQL.Add('select m.reciver as PHONE, M.Mes_Text, m.Mes_Id  ');
    rSMS.SQL.Add(' from messages m                                 ');
    rSMS.SQL.Add(' where m.mes_result = 0 and m.Mes_Type = ''SMS'' ');
    rSMS.SQL.Add(' order by m.mes_prior desc                       ');

    rSMS.Transaction.StartTransaction;
    rSMS.ExecQuery;
    while not rSMS.EOF do begin
      sms.a4ID := rSMS.fn('Mes_Id').AsInteger;
      sms.phone := rSMS.fn('PHONE').AsString;
      sms.Text := rSMS.fn('Mes_Text').AsString;
      SMSList.Add(sms);
      rSMS.NEXT;
    end;
    rSMS.Transaction.Commit;

    if SMSList.Count > 0
    then begin
      // если есть что отправлять
      SendList(SMSList);
      uSMS.DataBase := dmMain.dbTV;
      uSMS.Transaction := dmMain.trWriteQ;
      uSMS.SQL.Text := ' update Messages set Mes_Result = :Mes_Result, ext_id = :ext_id where Mes_Id = :Mes_Id ';
      for i := 0 to SMSList.Count - 1 do begin
        uSMS.Transaction.StartTransaction;
        uSMS.ParamByName('Mes_Id').AsInteger := SMSList[i].a4ID;
        uSMS.ParamByName('Mes_Result').AsInteger := SMSList[i].status;
        uSMS.ParamByName('ext_id').AsInteger := SMSList[i].smsID;
        uSMS.ExecQuery;
        uSMS.Transaction.Commit;
      end;
    end;
  finally
    SMSList.Free;
    rSMS.Free;
    uSMS.Free;
  end;
end;

function TSMSapi.StatusList(list: TSMSList): Integer;
var
  sms: TSMS;
  Str: string;
  i, j: Integer;
  a4ID: Integer;
  Obj, ChildObj: JsonDataObjects.TJSONObject;
begin
  Result := 0;
  if not Assigned(list)
  then Exit;
  if list.Count = 0
  then Exit;

  Obj := JsonDataObjects.TJSONObject.Create;

  for i := 0 to list.Count - 1 do begin
    // если корректный номер - то продолжим
    ChildObj := Obj.A['messages'].AddObject;
    ChildObj['a4id'] := list[i].a4ID;
    ChildObj['smsId'] := list[i].smsID;
  end;

  if Obj.Count > 0
  then begin
    try
      Str := POST2A4ON('status', Obj);
    finally
      Obj.Free;
    end;

    Obj := TJSONObject.Parse(Str) as TJSONObject;
    try
      if Obj.IndexOf('sms_count') = 0
      then fBalance := Obj['sms_count'];

      // Если массив с заданным именем найден
      if Obj.IndexOf('messages') >= 0
      then begin
        // Получили массив по имени
        for i := 0 to Obj['messages'].Count - 1 do begin
        a4ID := Obj['messages'].Items[i]['a4id'];
        for j := 0 to list.Count - 1 do
          if a4ID = list[j].a4ID
          then begin
            sms := list[j];
            sms.status := Obj['messages'].Items[i]['state'];
            list[j] := sms;
          end;
        end;
        Result := Obj['messages'].Count;
      end;
    finally
      Obj.Free;
    end;
  end
  else Obj.Free;

end;

function TSMSapi.CheckAll: Integer;
var
  SMSList: TSMSList;
  sms: TSMS;
  i: Integer;
  rSMS: TpFIBQuery;
  uSMS: TpFIBQuery;
begin

  Result := 0;
  SMSList := TSMSList.Create;
  rSMS := TpFIBQuery.Create(nil);
  uSMS := TpFIBQuery.Create(nil);
  try
    rSMS.DataBase := dmMain.dbTV;
    rSMS.Transaction := dmMain.trReadQ;
    rSMS.SQL.Add('select Mes_Id, ext_id from messages m where m.mes_result = 1 and (not ext_id is NULL) and m.Mes_Type = ''SMS'' ');

    rSMS.Transaction.StartTransaction;
    rSMS.ExecQuery;
    while not rSMS.EOF do begin
      sms.a4ID := rSMS.fn('Mes_Id').AsInteger;
      sms.smsID := rSMS.fn('ext_id').AsInteger;
      SMSList.Add(sms);
      rSMS.NEXT;
    end;
    rSMS.Transaction.Commit;

    if SMSList.Count > 0
    then begin
      // если есть что отправлять
      StatusList(SMSList);
      uSMS.DataBase := dmMain.dbTV;
      uSMS.Transaction := dmMain.trWriteQ;
      uSMS.SQL.Text := ' update Messages set Mes_Result = :Mes_Result where Mes_Id = :Mes_Id ';
      for i := 0 to SMSList.Count - 1 do begin
        // 18, 19 - в очереди на сервере отправки смс
        if not (SMSList[i].status in [0,1,18,19])  then begin
          uSMS.Transaction.StartTransaction;
          uSMS.ParamByName('Mes_Id').AsInteger := SMSList[i].a4ID;
          uSMS.ParamByName('Mes_Result').AsInteger := SMSList[i].status;
          // uSMS.ParamByName('ext_id').AsInteger := SMSList[i].smsID;
          uSMS.ExecQuery;
          uSMS.Transaction.Commit;
        end;
      end;
      Result := SMSList.Count;
    end;
  finally
    SMSList.Free;
    rSMS.Free;
    uSMS.Free;
  end;
end;

end.
