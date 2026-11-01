unit Mvd30903Client;

{
  MVD-30903-REST API client
  ------------------------------------------------------------
  Belarus MVD service 3.09.03:
  "Подтверждение операторами электросвязи сведений об абонентах"
}

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  OverbyteIcsSslHttpRest,
  OverbyteIcsTypes,
  OverbyteIcsUrl, // PContBodyJson
  OverbyteIcsWSocket;

const
  DocValid = 1;
  DocNotValid = 0;
  DocNeedRecheck = -1;

type
  EMvd30903Error = class(Exception);

  TMvdRequest = record
    Desc: string; // Идентификатор оператора электросвязи
    Serie: string; // Серия документа
    Number: string; // Номер документа
    Identif: string; // Идентификационный номер
    Surname: string; // Фамилия
    Name: string; // Имя
    Lastname: string; // Отчество (при наличии)
    UNP: string;
    region: string;
    district: string;
    city: string;
    street: string;
    house: string;
    housing: string;
    room: string;
  end;

  TMvdResult = class
  private
    FHttpStatusCode: Integer;
    FDocStatus: string;
    FErrorMessage: string;
    FRawResponse: string;
  public
    constructor Create;

    property HttpStatusCode: Integer read FHttpStatusCode;
    property DocText: string read FDocStatus;
    property ErrorMessage: string read FErrorMessage;
    property RawResponse: string read FRawResponse;

    function DocState: Integer;
    function IsSuccess: Boolean;
  end;

  TMvdApiClient = class
  private
    FHttp: TSslHttpRest;
    FBaseUrl: string;
    FToken: string;
    FTimeout: Integer;
    FAgent: string;
    FItsV2Version: Boolean;
    FData: String;

    procedure ConfigureHttp(const AsPost: Boolean = true);

    function v2BuildRequestJson(const APassport: TMvdRequest): String;
    procedure v2ParseResponse(const ARawResponse: string; AResult: TMvdResult);

    function v1BuildRequest(const APassport: TMvdRequest): String;
    procedure v1ParseResponse(const ARawResponse: string; AResult: TMvdResult);

  public
    constructor Create(const ABaseUrl: string; const AToken: string);
    destructor Destroy; override;

    function CheckDocument(const APassport: TMvdRequest): TMvdResult;
    procedure SplitNumber(const DocType: Integer; const s: string; var ser: string; var num: string);

    property BaseUrl: string read FBaseUrl write FBaseUrl;
    property Token: string read FToken write FToken;
    property Timeout: Integer read FTimeout write FTimeout;
    property UserAgent: string read FAgent write FAgent;
    property Data: String read FData;
  end;

implementation

{ TMvdResult }

constructor TMvdResult.Create;
begin
  inherited Create;
  FHttpStatusCode := 0;
  FDocStatus := '';
  FErrorMessage := '';
  FRawResponse := '';
end;

function TMvdResult.IsSuccess: Boolean;
begin
  Result := (FHttpStatusCode = 200) and (FErrorMessage = '') and (FDocStatus <> '');
end;

function TMvdResult.DocState: Integer;
begin
  if (FHttpStatusCode <> 200) then
    Result := DocNeedRecheck
  else if (FDocStatus = '') then
    Result := DocNeedRecheck
  else if FDocStatus.ToLower.Contains('выдан, действителен') then
    Result := DocValid
  else
    Result := DocNotValid;
end;

{ TMvdApiClient }
constructor TMvdApiClient.Create(const ABaseUrl: string; const AToken: string);
begin
  inherited Create;

  FBaseUrl := ABaseUrl.TrimRight(['/']) + '/';
  FToken := AToken;
  FTimeout := 30000;
  FAgent := 'a4on/1.0';
  FItsV2Version := not FBaseUrl.ToLower.Contains('/v1/');
  { Load ICS SSL support once for this client instance. }
  OverbyteIcsWSocket.LoadSsl;
  FHttp := TSslHttpRest.Create(nil);
end;

destructor TMvdApiClient.Destroy;
begin
  FreeAndNil(FHttp);

  { Release ICS SSL support. }
  OverbyteIcsWSocket.UnloadSsl;

  inherited Destroy;
end;

procedure TMvdApiClient.ConfigureHttp(const AsPost: Boolean = true);
begin
  FHttp.ResponseNoException := true;
  FHttp.Timeout := FTimeout;
  FHttp.Agent := FAgent;
  FHttp.ServerAuth := httpAuthBearer;
  FHttp.AuthBearerToken := FToken;
  FHttp.SslAllowSelfSign := False;
  FHttp.Accept := 'application/json';
  if AsPost then
  begin
    FHttp.ContentTypePost := 'application/json; charset=utf-8';
    FHttp.RestParams.PContent := PContBodyJson;
  end
  else
  begin
    FHttp.RestParams.PContent := PContUrlencoded;
  end;
end;

function TMvdApiClient.v2BuildRequestJson(const APassport: TMvdRequest): string;
var
  J: TJSONObject;
begin
  FData := '';
  J := TJSONObject.Create;
  try
    J.AddPair('desc', APassport.Desc);
    J.AddPair('desc_address', Format('%s, %s, %s, %s', [APassport.city, APassport.street, APassport.house,
      APassport.room]).Trim([' ', ',']));
    J.AddPair('sery', APassport.Serie);
    J.AddPair('num', APassport.Number);
    J.AddPair('identif', APassport.Identif);
    J.AddPair('surname', APassport.Surname);
    J.AddPair('name', APassport.Name);
    if APassport.Lastname <> '' then
      J.AddPair('lastname', APassport.Lastname);
    FData := J.ToJSON;
  finally
    J.Free;
  end;
end;

procedure TMvdApiClient.SplitNumber(const DocType: Integer; const s: string; var ser: string; var num: string);
begin
  // DocType
  // 0 - Паспорт. Содержит и серию и номер.
  // >0 - Биометрические документы не содержат серии документа, BY-не является серией, а относится к номеру.
  num := Trim(UpperCase(s));
  ser := '';
  if DocType = 1 then
  begin
    ser := Copy(num, 1, 2);
    num := Trim(Copy(num, 3, 15));
  end;
end;

procedure TMvdApiClient.v2ParseResponse(const ARawResponse: string; AResult: TMvdResult);
var
  Root: TJSONValue;
  Obj: TJSONObject;
  DocDto: TJSONObject;
  v: TJSONValue;
begin
  AResult.FRawResponse := ARawResponse;

  if ARawResponse.Trim = '' then
  begin
    AResult.FErrorMessage := 'Сервер вернул пустой ответ.';
    Exit;
  end;

  Root := TJSONObject.ParseJSONValue(ARawResponse);
  try
    if not Assigned(Root) then
    begin
      AResult.FErrorMessage := 'Ответ сервера не является корректным JSON.';
      Exit;
    end;

    if not(Root is TJSONObject) then
    begin
      AResult.FErrorMessage := 'Корневой объект ответа должен быть JSON object.';
      Exit;
    end;

    Obj := TJSONObject(Root);

    // Successful response: {"doc_dto":{"docstatustext":"..."}}
    v := Obj.GetValue('doc_dto');
    if Assigned(v) and (v is TJSONObject) then
    begin
      DocDto := TJSONObject(v);

      v := DocDto.GetValue('docstatustext');
      if Assigned(v) then
        AResult.FDocStatus := v.Value
      else
      begin
        v := DocDto.GetValue('docStatus');
        if Assigned(v) then
          AResult.FDocStatus := v.Value;
      end;
      Exit;
    end;

    // Error response: {"message":"..."}
    v := Obj.GetValue('message');
    if Assigned(v) then
      AResult.FErrorMessage := v.Value
    else
      AResult.FErrorMessage := 'Сервер вернул ошибку без поля message.';
  finally
    Root.Free;
  end;
end;

function TMvdApiClient.CheckDocument(const APassport: TMvdRequest): TMvdResult;
var
  Url: string;
  StatusCode: Integer;
begin
  Result := TMvdResult.Create;

  if FToken.Trim = '' then
    Result.FErrorMessage := 'Не задан Authorization Bearer token.'
  else if FBaseUrl.Trim = '' then
    Result.FErrorMessage := 'Не задан BaseUrl.'
  else if APassport.Number.Trim = '' then
    Result.FErrorMessage := 'Не задан номер документа.'
  else if APassport.Surname = '' then
    Result.FErrorMessage := 'Не задана Фамилия.'
  else if APassport.Name = '' then
    Result.FErrorMessage := 'Не задано Имя.'
  else if APassport.Lastname = '' then
    Result.FErrorMessage := 'Не задано Отчество.'
  else if APassport.Identif = '' then
    Result.FErrorMessage := 'Не задан идентификационный номер.';

  if not FItsV2Version then
  begin
    if APassport.UNP.IsEmpty then
      Result.FErrorMessage := 'Не задан УНП.'
    else if APassport.region.IsEmpty then
      Result.FErrorMessage := 'Не задана Область.'
    else if APassport.district.IsEmpty then
      Result.FErrorMessage := 'Не задан район.'
    else if APassport.city.IsEmpty then
      Result.FErrorMessage := 'Не задан город.'
    else if APassport.street.IsEmpty then
      Result.FErrorMessage := 'Не задана улица.'
    else if APassport.house.IsEmpty then
      Result.FErrorMessage := 'Не задан номер дома.';
  end;

  if (Result.FErrorMessage = '') then
  begin

    ConfigureHttp(FItsV2Version);
    if FItsV2Version then
    begin
      v2BuildRequestJson(APassport);
      Url := FBaseUrl + 'status/by-fio-identif';
      StatusCode := FHttp.RestRequest(httpPOST, Url, False, FData);
      Result.FHttpStatusCode := StatusCode;
      v2ParseResponse(FHttp.ResponseRaw, Result);
    end
    else
    begin
      v1BuildRequest(APassport);
      Url := FBaseUrl + 'mvd/passpData'; // + FData;
      StatusCode := FHttp.RestRequest(httpGET, Url, False, FData);
      Result.FHttpStatusCode := StatusCode;
      v1ParseResponse(FHttp.ResponseRaw, Result);
    end;

    // Network/internal errors can be reported through RequestDoneError.
    if (Result.FHttpStatusCode = 0) and (FHttp.RequestDoneError <> 0) and (Result.FErrorMessage = '') then
      Result.FErrorMessage := Format('Ошибка HTTP-клиента ICS: %d', [FHttp.RequestDoneError]);

    { If there is no JSON error text, provide a useful HTTP-level message. }
    if (Result.FHttpStatusCode <> 200) and (Result.ErrorMessage = '') then
    begin
      case Result.FHttpStatusCode of
        400:
          Result.FErrorMessage := '400 Bad Request: неверная структура запроса.';
        401:
          Result.FErrorMessage := '401 Unauthorized: несанкционированный доступ.';
        403:
          Result.FErrorMessage := '403 Forbidden: недостаточно прав.';
        500:
          Result.FErrorMessage := '500 Internal Server Error.';
        502:
          Result.FErrorMessage := '502 Bad Gateway.';
        504:
          Result.FErrorMessage := '504 Gateway Timeout.';
      else
        Result.FErrorMessage := Format('HTTP ошибка: %d.', [Result.FHttpStatusCode]);
      end;
    end;
  end;
end;

function TMvdApiClient.v1BuildRequest(const APassport: TMvdRequest): String;
begin

  FData := 'ser='+ UrlEncode(APassport.Serie) //
          + '&num='+ UrlEncode(APassport.Number) //
          + '&name='+ UrlEncode(APassport.Name);

  //if not APassport.Lastname.IsEmpty then
    FData := FData + '&lastname=' + UrlEncode(APassport.Lastname);

   FData := FData + '&identif=' + UrlEncode(APassport.Identif) //
          + '&unp='+ UrlEncode(APassport.unp) //
          + '&region='+ UrlEncode(APassport.region) //
          + '&district='+ UrlEncode(APassport.district) //
          + '&city='+ UrlEncode(APassport.city) //
          + '&street='+ UrlEncode(APassport.street) //
          + '&house='+ UrlEncode(APassport.house); //

  //if not APassport.housing.IsEmpty then
    FData := FData + '&housing=' + UrlEncode(APassport.housing);
  //if not APassport.room.IsEmpty then
    FData := FData + '&room=' + UrlEncode(APassport.room);


{
  FData := Format('surname=%s&name=%s&ser=%s&num=%s&identif=%s&unp=%s&region=%s&district=%s&city=%s&street=%s&house=%s',
    [UrlEncode(APassport.Surname), UrlEncode(APassport.Name), UrlEncode(APassport.Serie), UrlEncode(APassport.Number),
    UrlEncode(APassport.Identif), UrlEncode(APassport.UNP), UrlEncode(APassport.region), UrlEncode(APassport.district),
    UrlEncode(APassport.city), UrlEncode(APassport.street), UrlEncode(APassport.house)]);

  if not APassport.Lastname.IsEmpty then
    FData := FData + '&lastname=' + UrlEncode(APassport.Lastname);
  if not APassport.housing.IsEmpty then
    FData := FData + '&housing=' + UrlEncode(APassport.housing);
  if not APassport.room.IsEmpty then
    FData := FData + '&room=' + UrlEncode(APassport.room);

  // FData := UrlEncode(FData);
}
end;

procedure TMvdApiClient.v1ParseResponse(const ARawResponse: string; AResult: TMvdResult);
var
  Root: TJSONValue;
  Obj: TJSONObject;
  v: TJSONValue;
begin
  AResult.FRawResponse := ARawResponse;

  if ARawResponse.Trim = '' then
  begin
    AResult.FErrorMessage := 'Сервер вернул пустой ответ.';
    Exit;
  end;

  Root := TJSONObject.ParseJSONValue(ARawResponse);
  try
    if not Assigned(Root) then
    begin
      AResult.FErrorMessage := 'Ответ сервера не является корректным JSON.';
      Exit;
    end;

    if not(Root is TJSONObject) then
    begin
      AResult.FErrorMessage := 'Корневой объект ответа должен быть JSON object.';
      Exit;
    end;

    Obj := TJSONObject(Root);

    // Successful response: {"rs":"Машиночитаемый документ - MC2134811 - выдан, действителен, дата выдачи 11.06.2010"}
    v := Obj.GetValue('rs');
    if Assigned(v) and (v is TJSONObject) then
    begin
      AResult.FDocStatus := v.Value;
      Exit;
    end;

    // Error response: {"message":"..."}
    v := Obj.GetValue('message');
    if Assigned(v) then
      AResult.FErrorMessage := v.Value
    else
      AResult.FErrorMessage := 'Сервер вернул ошибку без поля message.';
  finally
    Root.Free;
  end;
end;

end.
