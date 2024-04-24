unit HtmlForma;
{ DEFINE INDY}
interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.ActnList, Vcl.Menus,
  Vcl.ComCtrls,
  SynEditHighlighter, OverbyteIcsWndControl, OverbyteIcsTnCnx, DBCtrlsEh, HTMLUn2, HtmlView,
{$IFDEF INDY}
  IdBaseComponent,
  IdComponent, IdGlobal,
  IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
{$ELSE}
  httpsend, ssl_openssl3, synautil,
{$ENDIF}
  UrlConn,
  PropFilerEh, PropStorageEh, Langji.Wke.Webbrowser;

type
  THtmlForm = class(TForm)
    pnlControl: TPanel;
    HostLabel: TLabel;
    Label1: TLabel;
    HostEdit: TEdit;
    DataEdit: TEdit;
    SendButton: TButton;
    btnClose: TButton;
    actlst1: TActionList;
    actShowControl: TAction;
    edtPSWD: TDBEditEh;
    edtUSR: TDBEditEh;
    pmHTML: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PropStorageEh: TPropStorageEh;
    pgcHB: TPageControl;
    tsViewer: TTabSheet;
    htmlviewer: THtmlViewer;
    tsBrowser: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure SendButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actShowControlExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure htmlviewerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure htmlviewerImageRequest(Sender: TObject; const SRC: string; var Stream: TStream);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
{$IFDEF INDY}
    HTTP: TIdHTTP;
    IOHandlerSSL: TIdSSLIOHandlerSocketOpenSSL;
{$ELSE}
    HTTP: THTTPSend;
{$ENDIF}
    fExitOnExucute: Boolean;
    fUrl: String;
    fUser: String;
    fPswd: String;
    fData: String;
    FImageStreams: TList;
    fWkeWebbrowser: TWkeWebbrowser;
    procedure GetFromUrl;
    procedure SetOnExit(value: Boolean);
    procedure SetUser(value: String);
    procedure SetUrl(value: String);
    procedure SetPswd(value: String);
    procedure SetData(value: String);
    procedure FreeStreamList();
  public
    property ExitOnExucute: Boolean write SetOnExit;
    property HttpUrl: string read fUrl write SetUrl;
    property HttpUser: string read fUser write SetUser;
    property HttpPswd: string read fPswd write SetPswd;
    property HttpData: string read fData write SetData;
    { Public declarations }
  end;

function GetHtml(const Url: string = 'localhost'; const User: string = ''; const Pswd: string = '';
  const Data: string = ''; const ExExit: Boolean = False; const Title: string = ''): string;

procedure ShowHtml(const Url: string = 'localhost'; const html: string = ''; const Title: string = '');

implementation

uses
  System.StrUtils,
  AtrCommon, PrjConst, MAIN, URLSubs;

{$IFNDEF INDY}
const
  HTTPVer  = '1.1'; // '1.0'
  DefUserAgent = 'Mozilla/5.0 (Windows NT 6.1; rv:17.0; A4on.TV) Gecko/17.0 Firefox/17.0';
{$ENDIF}

{$R *.dfm}

function GetHtml(const Url: string = 'localhost'; const User: string = ''; const Pswd: string = '';
  const Data: string = ''; const ExExit: Boolean = False; const Title: string = ''): string;
var
  HtmlForm: THtmlForm;
begin
  Result := '';

  HtmlForm := THtmlForm.Create(Application);
  with HtmlForm do
  begin
    try
      ExitOnExucute := ExExit;
      HttpUrl := Url;
      HttpUser := User;
      HttpPswd := Pswd;
      HttpData := Data;

      if not Title.IsEmpty then
        Caption := Title;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure ShowHtml(const Url: string = 'localhost'; const html: string = ''; const Title: string = '');
var
  HtmlForm: THtmlForm;
begin
  HtmlForm := THtmlForm.Create(Application);
  with HtmlForm do
  begin
    try
      ExitOnExucute := False;
      pnlControl.Visible := False;
      HttpUrl := Url;

      if not Title.IsEmpty then
        Caption := Title;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure THtmlForm.actShowControlExecute(Sender: TObject);
begin
  pnlControl.Visible := True;
end;

procedure THtmlForm.FormCreate(Sender: TObject);
begin
{$IFDEF INDY}
  IOHandlerSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  HTTP := TIdHTTP.Create(Self);
  IOHandlerSSL.Name := 'IOHandlerSSL';
  IOHandlerSSL.MaxLineAction := maException;
  IOHandlerSSL.Port := 0;
  IOHandlerSSL.DefaultPort := 0;
  HTTP.Name := 'HTTP';
  HTTP.AllowCookies := True;
  HTTP.HTTPOptions := [hoForceEncodeParams];
{$ELSE}
  HTTP := THTTPSend.Create;
  HTTP.Protocol := HTTPVer;
  HTTP.UserAgent := DefUserAgent;
  HTTP.Timeout := 10000;
{$ENDIF}
  fExitOnExucute := False;
  FImageStreams := TList.Create;
end;

procedure THtmlForm.FreeStreamList();
var
  I: Integer;
begin
  for I := 0 to FImageStreams.Count - 1 do
  begin
    if assigned(FImageStreams[I]) then
      TMemoryStream(FImageStreams[I]).Free;
  end;
end;

procedure THtmlForm.FormDestroy(Sender: TObject);
begin
{$IFDEF INDY}
  FreeAndNil(IOHandlerSSL);
{$ENDIF}
  FreeAndNil(HTTP);

  if assigned(fWkeWebbrowser) then
    fWkeWebbrowser.Free;

  FreeStreamList();
  FImageStreams.Free;
end;

procedure THtmlForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    modalResult := mrOk;
end;

procedure THtmlForm.FormShow(Sender: TObject);
begin
  tsBrowser.TabVisible := False;
  tsViewer.TabVisible := False;
  if fExitOnExucute then
  begin
    if (fUser = '') and (fPswd = '') and FileExists(ExtractFilePath(Application.ExeName) + 'miniblink.dll') then
    begin
      fWkeWebbrowser := TWkeWebbrowser.Create(Self);

      fWkeWebbrowser.Name := 'WkeWebBrowser';
      fWkeWebbrowser.Parent := tsBrowser;
      fWkeWebbrowser.Align := alClient;
      fWkeWebbrowser.Color := clWhite;
      fWkeWebbrowser.Taborder := 0;
      fWkeWebbrowser.UserAgent := 'miniblink A4on.TV';
      fWkeWebbrowser.CspEnabled := True;
      fWkeWebbrowser.Headless := False;
      fWkeWebbrowser.TouchEnabled := False;
      fWkeWebbrowser.DragEnabled := False;
      fWkeWebbrowser.LocalStoragePath := GetUserCacheFolder();
      fWkeWebbrowser.CookiePath := GetUserCacheFolder();
      fWkeWebbrowser.Visible := True;

      pgcHB.ActivePage := tsBrowser;
    end
    else
      pgcHB.ActivePage := tsViewer;
    GetFromUrl;
  end
  else
  begin
    if (fUser = '') and (fPswd = '') and FileExists(ExtractFilePath(Application.ExeName) + 'miniblink.dll') then
      pgcHB.ActivePage := tsBrowser
    else
      pgcHB.ActivePage := tsViewer;

    GetFromUrl;
  end;
end;

procedure THtmlForm.SendButtonClick(Sender: TObject);
begin
  fData := DataEdit.Text;
  GetFromUrl;
end;

procedure THtmlForm.SetUser(value: String);
begin
  fUser := value;
end;

procedure THtmlForm.SetUrl(value: String);
begin
  fUrl := value;
end;

procedure THtmlForm.SetPswd(value: String);
begin
  fPswd := value;
  pnlControl.Visible := not fExitOnExucute;
end;

procedure THtmlForm.SetData(value: String);
begin
  fData := value;
end;

procedure THtmlForm.SetOnExit(value: Boolean);
begin
  fExitOnExucute := value;
  pnlControl.Visible := not fExitOnExucute;
end;

procedure THtmlForm.GetFromUrl;
var
  sResponse: string;
  JsonToSend: TStringStream;
{$IFNDEF INDY}
  meth: string;
{$ENDIF}
begin
  FreeStreamList();

  if assigned(fWkeWebbrowser) then
  begin
    if not fData.IsEmpty then
      fWkeWebbrowser.PostURL(fUrl, fData)
    else
      fWkeWebbrowser.LoadURL(fUrl)
  end
  else
  begin

    if not fData.IsEmpty then
      JsonToSend := TStringStream.Create(fData, TEncoding.UTF8)
    else
      JsonToSend := TStringStream.Create('', TEncoding.UTF8);

    try
{$IFDEF INDY}
      HTTP.Request.CharSet := 'utf-8';
      if fUser <> '' then
      begin
        HTTP.Request.BasicAuthentication := True;
        HTTP.Request.Username := fUser;
        HTTP.Request.Password := fPswd;
      end;
      if fUrl.StartsWith('https', True) then
        HTTP.IOHandler := IOHandlerSSL;
      try
        if fData.IsEmpty then
        begin
          sResponse := HTTP.Get(fUrl);
        end
        else
          sResponse := HTTP.Post(fUrl, JsonToSend);
      except
        on E: Exception do
          ShowMessage('Error on request: '#13#10 + E.Message);
      end;
{$ELSE}
      try
        if fUser <> '' then
        begin
          HTTP.Username := fUser;
          HTTP.Password := fPswd;
        end;
        if fData.IsEmpty then
          meth := 'GET'
        else
        begin
          meth := 'POST';
          HTTP.MimeType := 'application/x-www-form-urlencoded';
          HTTP.Document.LoadFromStream(JsonToSend);
        end;
        if HTTP.HTTPMethod(meth, fUrl) then
        begin
          if Pos('200 OK', HTTP.Headers.Text) <> 0 then
          begin
            JsonToSend.Clear;
            JsonToSend.CopyFrom(HTTP.Document, 0);
            sResponse := JsonToSend.DataString;
          end;
        end
        else
          ShowMessage(rsDownloadError);
      except
        on E: Exception do
          ShowMessage('Error on request: '#13#10 + E.Message);
      end;
{$ENDIF}
    finally
      if not fData.IsEmpty then
        JsonToSend.Free;
    end;

    if sResponse <> '' then
    begin
      if pgcHB.ActivePage <> tsViewer then
        pgcHB.ActivePage := tsViewer;
      htmlviewer.LoadFromString(sResponse);
    end;
  end;
end;

procedure THtmlForm.htmlviewerImageRequest(Sender: TObject; const SRC: string; var Stream: TStream);

var
  AStream: TMemoryStream;
{$IFNDEF INDY}
  vHTTP: THTTPSend;
  vRes: Boolean;
{$ENDIF}
begin
{$IFDEF INDY}
  if (GetProtocol(SRC) = GetProtocol(fUrl)) then
  begin

    AStream := TMemoryStream.Create;
    try
      HTTP.Get(SRC, AStream);
      Stream := AStream;
      FImageStreams.Add(AStream);
    finally
      AStream.Free;
      Stream := Nil;
    end;
  end;
{$ELSE}
  vHTTP := THTTPSend.Create;
  vHTTP.Protocol := HTTPVer;
  vHTTP.UserAgent := DefUserAgent;
  AStream := TMemoryStream.Create;
  try
    try
      vRes := vHTTP.HTTPMethod('GET', SRC);
      if vRes then
      begin
        AStream.LoadFromStream(vHTTP.Document);
        Stream := AStream;
        FImageStreams.Add(AStream);
      end;
    except
      AStream.Free;
      Stream := Nil;
    end;
  finally
    FreeAndNil(vHTTP);
  end;
{$ENDIF}
end;

procedure THtmlForm.htmlviewerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin
    if (Key = Word('A')) then
      htmlviewer.SelectAll;
    if (Key = Word('C')) then
      htmlviewer.CopyToClipboard;
  end;

end;

procedure THtmlForm.N1Click(Sender: TObject);
begin
  htmlviewer.CopyToClipboard;
end;

procedure THtmlForm.N2Click(Sender: TObject);
begin
  htmlviewer.SelectAll;
end;

end.
