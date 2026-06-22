unit MVDRequest;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON,
  System.Net.HttpClient,
  System.NetConsts,
  System.Net.HttpClientComponent,
  System.Net.URLClient;

type
  TMVDResponse = record
    Success: Boolean;
    HttpCode: Integer;
    Response: string;
    ErrorMessage: string;
  end;

  TCompany = record
    NAME: string;
    REGION: string;
    DISTRICT: string;
    CITY: string;
    STREET: string;
    HOUSE: string;
    HOUSING: string;
    ROOM: string;
    UNP: string;
  end;

  TMVDHttpRequester = class
  private
    FHttpClient: THTTPClient;
    FToken: string;
    FUrl: string;
    FDataTemplate: String;
    FCompany: TCompany;
    procedure SplitNumber(const s: string; var ser: string; var num: string);
    procedure ValidateServerCertificate(const Sender: TObject; const ARRequest: TURLRequest;
      const Certificate: TCertificate; var Accept: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    property Token: string read FToken write FToken;
    property URL: string read FUrl write FUrl;
    property Company: TCompany read FCompany write FCompany;
    function CheckPassport(const N: string; const ID: string; const F: string; const I: string; const O: string = '')
      : TMVDResponse;
  end;

implementation

constructor TMVDHttpRequester.Create;
begin
  inherited Create;
  FHttpClient := THTTPClient.Create;
  FHttpClient.OnValidateServerCertificate := ValidateServerCertificate;
  FHttpClient.ContentType := 'application/json';
  FHttpClient.CustomHeaders['Accept'] := 'application/json';
  FHttpClient.CustomHeaders['cache-control'] := 'no-cache';

  FDataTemplate := '{"desc":"[COMPANY]","desc_address":"[CITY] [STREET] [HOUSE]",' +
    '"sery":"[SER]","num":"[NUM]","identif":"[IDENTIF]",' +
    '"surname":"[SURNAME]","name":"[NAME]","lastname":"[LASTNAME]"}'
  {
    url := Format('surname=%s&name=%s&lastname=%s', [UrlEncode(eSURNAME), UrlEncode(eFIRSTNAME), UrlEncode(eMIDLENAME)
    ]) + Format('&ser=%s&num=%s&identif=%s', [UrlEncode(ps), UrlEncode(pn), UrlEncode(ePERSONAL_N)]) +
    Format('&unp=%s&region=%s&district=%s&city=%s&street=%s&house=%s&housing=%s&room=%s',
    [UrlEncode(unp), UrlEncode(dmMain.GetCompanyValue('REGION')), UrlEncode(dmMain.GetCompanyValue('DISTRICT')),
    UrlEncode(dmMain.GetCompanyValue('CITY')), UrlEncode(dmMain.GetCompanyValue('STREET')),
    UrlEncode(dmMain.GetCompanyValue('HOUSE')), UrlEncode(dmMain.GetCompanyValue('HOUSING')),
    UrlEncode(dmMain.GetCompanyValue('ROOM'))]);
  }

end;

destructor TMVDHttpRequester.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

procedure TMVDHttpRequester.ValidateServerCertificate(const Sender: TObject; const ARRequest: TURLRequest;
  const Certificate: TCertificate; var Accept: Boolean);
begin
  // Set Accept to True to bypass all SSL validation errors
  // (expired certs, self-signed, hostname mismatch, etc.)
  Accept := True;
end;

procedure TMVDHttpRequester.SplitNumber(const s: string; var ser: string; var num: string);
var
  v: string;
begin
  v := Trim(UpperCase(s));
  ser := Copy(v, 1, 2);
  num := Trim(Copy(v, 3, 15));
end;

function TMVDHttpRequester.CheckPassport(const N: string; const ID: string; const F: string; const I: string;
  const O: string = ''): TMVDResponse;
var
  Response: IHTTPResponse;
  RequestBody: TStringStream;
  Data: TJSONObject;
  ser: string;
  num: string;
begin
  try
    // Стварэнне JSON дадзеных
    // Стварэнне HTTP кліента
    // Налада загалоўкаў
    FHttpClient.CustomHeaders['Authorization'] := 'Bearer ' + FToken;

    // Стварэнне JSON дадзеных
    SplitNumber(N, ser, num);
    Data := TJSONObject.Create;
    RequestBody := TStringStream.Create('', TEncoding.UTF8);
    try
      Data.AddPair('desc', Company.NAME);
      Data.AddPair('desc_address', Company.CITY);
      Data.AddPair('sery', ser);
      Data.AddPair('num', num);
      Data.AddPair('identif', ID);
      Data.AddPair('surname', F);
      Data.AddPair('name', I);
      Data.AddPair('lastname', O);
      RequestBody.WriteString(Data.ToString);
      RequestBody.Position := 0;

      Response := FHttpClient.Post(FUrl, RequestBody);
      Result.Success := (Response.StatusCode = 200);
      Result.HttpCode := Response.StatusCode;
      Result.ErrorMessage := Response.StatusText;
      Result.Response := Response.ContentAsString;
      {
      Writeln('Адпраўка запыту...');
      Writeln('URL: ', URL);
      Writeln('Дадзеныя: ', RequestBody.DataString);

      Writeln('HTTP код: ', Result.HttpCode.ToString);
      Writeln('Апісанне: ', Result.ErrorMessage);
      Writeln('Адказ сервера: ', Result.Response);
      }
    finally
      RequestBody.Free;
      Data.Free;
    end;

  except
    on E: Exception do begin
      Result.Success := False;
      Result.ErrorMessage := E.Message;
      Result.Response := '';
    end;
  end;
end;

end.