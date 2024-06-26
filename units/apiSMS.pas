﻿unit apiSMS;

{ DEFINE TEST_SMS }

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.DateUtils, System.Types, System.Generics.Collections,
  Data.DB,
  Vcl.Dialogs,
  httpsend, SynaUtil, FIBQuery, pFIBQuery, JsonDataObjects, A4onTypeUnit;

const
  // Константы для отправки SMS
  API_URL: String = 'https://a4on.tv/sms/sms/';

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
    function SendBatch(var ErrorText: String; const batchCnt: Integer = 0): Integer;
    function SendAll(var ErrorText: String): Integer;
    function CheckAll: Integer;
    function StatusList(list: TSMSList): Integer;
    constructor Create(const user: string; const key: string; const country: string = 'BY');
    destructor Destroy; override;
  end;

implementation

uses
  System.RegularExpressions, System.Character, mormot.crypt.core, ZLibExGZ, DM, AtrStrUtils;

const
  ENG_SET = ['_', '!', '"', '#', '%', '&', '''', '(', ')', '*', ':', '+', ';', ',', '<', '-', '=', '.', '>', '/', '?',
    'A' .. 'Z', 'a' .. 'z', '0' .. '9'];

constructor TSMSapi.Create(const user: string; const key: string; const country: string = 'BY');
begin
  fA4ON_USER := user;
  fA4ON_KEY := key;
  if AnsiUpperCase(country) = 'BY' then
    fCountry := cBY
  else if AnsiUpperCase(country) = 'UA' then
    fCountry := cUA
  else
    fCountry := cRU;

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
  soData['hash'] := string(MD5(s));

  strmData := TStringStream.Create(soData.ToString, TEncoding.UTF8);
  try
    // strmData.WriteString();

    fHTTP.TargetHost := 'a4on.tv';
    fHTTP.Protocol := '1.1';
    fHTTP.MimeType := 'application/x-www-form-urlencoded';
    // fHTTP.Headers.Add('Accept-Encoding: gzip,deflate');
    fHTTP.Document.LoadFromStream(strmData);
{$IFDEF TEST_SMS}
    fHTTP.Document.SaveToFile(action + '.request.js'); // for debug
{$ENDIF}
    fHTTP.HTTPMethod('post', API_URL + action + '/');
    strmData.Clear;
    HeadersToList(fHTTP.Headers);
    if Trim(fHTTP.Headers.Values['Content-Encoding']) = 'gzip' then
    begin
      GZDecompressStream(fHTTP.Document, strmData);
      Result := strmData.DataString;
    end
    else
    begin
      strmData.LoadFromStream(fHTTP.Document);
{$IFDEF TEST_SMS}
      fHTTP.Document.SaveToFile(action + '.Answer.js'); // for debug
{$ENDIF}
      Result := strmData.DataString;
    end;
  finally
    strmData.Free;
  end
end;

function TSMSapi.BalanceFromA4on: Integer;
var
  Str: string;
  Obj: JsonDataObjects.TJSONObject;
begin
  Result := 0;
  Obj := JsonDataObjects.TJSONObject.Create;
  try
    Str := POST2A4ON('balance', Obj);
  finally
    Obj.Free;
  end;

  Obj := TJSONObject.Parse(Str) as TJSONObject;
  try
    if Obj.IndexOf('sms_count') >= 0 then
    begin
      Result := Obj['sms_count'];
    end
    else
    begin
      if Obj.IndexOf('error') >= 0 then
        fError := Obj['error'];

      if Obj.IndexOf('text') >= 0 then
        fError := fError + ':' + Obj['text'];
    end
  finally
    Obj.Free;
  end;
end;

function TSMSapi.GetBalance: Integer;
begin
  Result := fBalance;
end;

function TSMSapi.CorrectPhone(const phone: string): string;
var
  s: string;
  tp: string;
begin
  Result := '';
  tp := DigitsOnly(phone);
  case fCountry of
    cRU:
      s := 'RU';
    cUA:
      s := 'UA';
  else
    s := 'BY'
  end;
  Result := AtrStrUtils.CorrectPhone(phone, s);
end;

function TSMSapi.SMSCount(const Text: string): Integer;
var
  isCYR: Boolean;
  i: Integer;
  c: Char;
begin
  Result := 1;
  isCYR := False;
  i := 1;
  while (not isCYR) and (i < Length(Text)) do
  begin
    c := Text[i];
    if not CharInSet(c, ENG_SET) then
      isCYR := True;
    i := i + 1;
  end;

  i := Length(Text);
  if isCYR then
  begin
    if i <= 70 then
      Result := 1
    else if i <= 134 then
      Result := 2
    else if i <= 201 then
      Result := 3
    else if i <= 268 then
      Result := 4
    else if i <= 335 then
      Result := 5
    else if i <= 402 then
      Result := 6
    else if i <= 469 then
      Result := 7
    else if i <= 536 then
      Result := 8
    else
      Result := 9;
  end
  else
  begin
    if i <= 160 then
      Result := 1
    else if i <= 306 then
      Result := 2
    else if i <= 459 then
      Result := 3
    else if i <= 612 then
      Result := 4
    else if i <= 765 then
      Result := 5
    else if i <= 918 then
      Result := 6
    else if i <= 1071 then
      Result := 7
    else if i <= 1224 then
      Result := 8
    else
      Result := 9;
  end;
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
  if not Assigned(list) then
    Exit;
  if list.Count = 0 then
    Exit;

  Obj := JsonDataObjects.TJSONObject.Create;

  for i := 0 to list.Count - 1 do
  begin
    Str := CorrectPhone(list[i].phone);
    if Str <> '' then
    begin
      // если корректный номер - то продолжим
      ChildObj := Obj.A['messages'].AddObject;
      ChildObj['a4id'] := list[i].a4ID;
      ChildObj['phone'] := Str;
      ChildObj['text'] := list[i].Text;
      if list[i].date <> 0 then
        ChildObj['date'] := FormatDateTime('YYYY-mm-dd', list[i].date) + 'T' + FormatDateTime('hh:nn:00+00:00',
          list[i].date);
    end
    else
    begin
      sms := list[i];
      sms.status := -6; // неверный номер
      list[i] := sms;
    end;
  end;

  if Obj.Count > 0 then
  begin
    try
      Str := POST2A4ON('send', Obj);
    finally
      Obj.Free;
    end;

    Obj := TJSONObject.Parse(Str) as TJSONObject;
    try
      if Obj.IndexOf('sms_count') = 0 then
        fBalance := Obj['sms_count'];

      // Если массив с заданным именем найден
      if Obj.IndexOf('messages') >= 0 then
      begin
        // Получили массив по имени
        for i := 0 to Obj['messages'].Count - 1 do
        begin
          a4ID := Obj['messages'].Items[i]['a4id'];
          for j := 0 to list.Count - 1 do
            if a4ID = list[j].a4ID then
            begin
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
  else
    Obj.Free;

end;

function TSMSapi.SendBatch(var ErrorText: String; const batchCnt: Integer = 0): Integer;
var
  i: Integer;
  ReadfromDB: TpFIBQuery;
  UpdateInDB: TpFIBQuery;
  SMSList: TSMSList;
  sms: TSMS;
  sqlPart: string;
  sendedSmsCount: Integer;
  CountSMS: Integer;
  CountReciver: Integer;
  // trR  : TpFIBTransaction;
  // trW  : TpFIBTransaction;
begin
  Result := 0;
  ErrorText := '';

  ReadfromDB := TpFIBQuery.Create(nil);
  UpdateInDB := TpFIBQuery.Create(nil);
  SMSList := TSMSList.Create;

  if batchCnt > 0 then
    sqlPart := ' first ' + batchCnt.ToString
  else
    sqlPart := '';

  try
    ReadfromDB.DataBase := dmMain.dbTV;
    ReadfromDB.Transaction := dmMain.trReadQ;
    ReadfromDB.SQL.Add('select ' + sqlPart + ' m.reciver as PHONE, M.Mes_Text, m.Mes_Id  ');
    ReadfromDB.SQL.Add(' from messages m where m.mes_result = 0 and m.Mes_Type = ''SMS'' ');
    ReadfromDB.SQL.Add(' order by m.mes_prior, m.Mes_Id desc ');

    UpdateInDB.DataBase := dmMain.dbTV;
    UpdateInDB.Transaction := dmMain.trWriteQ;
    UpdateInDB.SQL.Text := ' update Messages set Mes_Result = :Mes_Result, ext_id = :ext_id where Mes_Id = :Mes_Id ';

    sendedSmsCount := 0;
    CountReciver := 0;
    repeat
    begin
      SMSList.Clear;

      ReadfromDB.Transaction.StartTransaction;
      ReadfromDB.ExecQuery;
      while not ReadfromDB.EOF do
      begin
        sms.a4ID := ReadfromDB.fn('Mes_Id').AsInteger;
        sms.phone := ReadfromDB.fn('PHONE').AsString;
        sms.Text := ReadfromDB.fn('Mes_Text').AsString;
        CountSMS := SMSCount(sms.Text);
        if (sendedSmsCount + CountSMS) < fBalance then
        begin
          sendedSmsCount := sendedSmsCount + CountSMS;
          SMSList.Add(sms);
        end;
        Inc(CountReciver);
        ReadfromDB.NEXT;
      end;
      ReadfromDB.Close;
      ReadfromDB.Transaction.Commit;

      if SMSList.Count > 0 then
      begin
        // если есть что отправлять
        SendList(SMSList);
        for i := 0 to SMSList.Count - 1 do
        begin
          if (SMSList[i].status <> 0) or (SMSList[i].smsID <> 0) then begin
            UpdateInDB.Transaction.StartTransaction;
            UpdateInDB.ParamByName('Mes_Id').AsInteger := SMSList[i].a4ID;
            UpdateInDB.ParamByName('Mes_Result').AsInteger := SMSList[i].status;
            UpdateInDB.ParamByName('ext_id').AsInteger := SMSList[i].smsID;
            UpdateInDB.ExecQuery;
            UpdateInDB.Transaction.Commit;
          end;
        end;
      end
    end
    until (SMSList.Count = 0);
  finally
    SMSList.Free;
    ReadfromDB.Free;
    UpdateInDB.Free;
  end;

  Result := sendedSmsCount;
end;

function TSMSapi.SendAll(var ErrorText: String): Integer;
begin
  Result := SendBatch(ErrorText);
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
  if not Assigned(list) then
    Exit;
  if list.Count = 0 then
    Exit;

  Obj := JsonDataObjects.TJSONObject.Create;

  for i := 0 to list.Count - 1 do
  begin
    // если корректный номер - то продолжим
    ChildObj := Obj.A['messages'].AddObject;
    ChildObj['a4id'] := list[i].a4ID;
    ChildObj['smsId'] := list[i].smsID;
  end;

  if Obj.Count > 0 then
  begin
    try
      Str := POST2A4ON('status', Obj);
    finally
      Obj.Free;
    end;

    Obj := TJSONObject.Parse(Str) as TJSONObject;
    try
      if Obj.IndexOf('sms_count') = 0 then
        fBalance := Obj['sms_count'];

      // Если массив с заданным именем найден
      if Obj.IndexOf('messages') >= 0 then
      begin
        // Получили массив по имени
        for i := 0 to Obj['messages'].Count - 1 do
        begin
          a4ID := Obj['messages'].Items[i]['a4id'];
          for j := 0 to list.Count - 1 do
            if a4ID = list[j].a4ID then
            begin
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
  else
    Obj.Free;

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
    rSMS.SQL.Add
      ('select Mes_Id, ext_id from messages m where m.mes_result = 1 and (not ext_id is NULL) and m.Mes_Type = ''SMS'' ');

    rSMS.Transaction.StartTransaction;
    rSMS.ExecQuery;
    while not rSMS.EOF do
    begin
      sms.a4ID := rSMS.fn('Mes_Id').AsInteger;
      sms.smsID := rSMS.fn('ext_id').AsInteger;
      SMSList.Add(sms);
      rSMS.NEXT;
    end;
    rSMS.Transaction.Commit;

    if SMSList.Count > 0 then
    begin
      // если есть что отправлять
      StatusList(SMSList);
      uSMS.DataBase := dmMain.dbTV;
      uSMS.Transaction := dmMain.trWriteQ;
      uSMS.SQL.Text := ' update Messages set Mes_Result = :Mes_Result where Mes_Id = :Mes_Id ';
      for i := 0 to SMSList.Count - 1 do
      begin
        // 18, 19 - в очереди на сервере отправки смс
        if not(SMSList[i].status in [0, 1, 18, 19]) then
        begin
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
