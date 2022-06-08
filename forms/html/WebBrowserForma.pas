unit WebBrowserForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Imaging.jpeg,
  Langji.Wke.Webbrowser, Langji.Wke.types, Langji.Wke.lib;

type
  TWebBrowserForm = class(TForm)
    WkeWebBrowser1: TWkeWebbrowser;
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebBrowserForm: TWebBrowserForm;

implementation

{$R *.dfm}

uses
  AtrCommon, PrjConst, DM;

function GetUserCacheFolder(): string;
var
  s: string;
  f: string;
begin
  s := rsAplicationName;
  f := GetSpecialFolderPath();
  if f <> '' then
    f := f + '\' + s + '\Cache\'
  else
    f := ExtractFilePath(Application.ExeName) + 'FILTERS\';
  ForceDirectories(f);
  Result := f
end;

procedure TWebBrowserForm.Button4Click(Sender: TObject);
begin
  WkeWebBrowser1.ExecuteJavascript
    ('$(''input[name="auth_name"]'').val(''asgard'');$(''input[name="auth_pass"]'').val(''YW0y6PRz'');document.forms[0].submit();');
end;

procedure TWebBrowserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  WebBrowserForm := nil;
end;

procedure TWebBrowserForm.FormCreate(Sender: TObject);
begin
  // WkeWebBrowser1.GlobalHttpProxy :='119.101.55.158:40773';
  WkeWebBrowser1.UserAgent := 'miniblink A4on.TV';
  WkeWebBrowser1.LocalStoragePath := GetUserCacheFolder();
  WkeWebBrowser1.CookiePath := GetUserCacheFolder();
end;

procedure TWebBrowserForm.FormShow(Sender: TObject);
var
  mapUrl : string;
begin
  mapUrl := dmMain.GetSettingsValue('MAP_URL');
  WkeWebBrowser1.PostURL(mapUrl, 'auth_name=asgard&auth_pass=YW0y6PRz');
  // WkeWebBrowser1.LoadUrl(mapUrl);
end;

end.
