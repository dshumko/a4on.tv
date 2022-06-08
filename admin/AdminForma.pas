unit AdminForma;

{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ImgList,
  uFBServices, FIBDatabase, pFIBDatabase, RxPlacemnt, pFIBErrorHandler, FIB;

type
  TAdminForm = class(TForm)
    btnService: TButton;
    btnUsers: TButton;
    db: TpFIBDatabase;
    FormStorage: TFormStorage;
    ICONS_ACTIVE: TImageList;
    tr: TpFIBTransaction;
    tw: TpFIBTransaction;
    trq: TpFIBTransaction;
    twq: TpFIBTransaction;
    Button1: TButton;
    FibErrorHandler: TpFibErrorHandler;
    procedure FormShow(Sender: TObject);
    procedure btnServiceClick(Sender: TObject);
    procedure btnUsersClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FibErrorHandlerFIBErrorEvent(Sender: TObject;
      ErrorValue: EFIBError; KindIBError: TKindIBError;
      var DoRaise: Boolean);
  private
    { Private declarations }
    fUser : string;
    fDatabase : string;
    fPassword : string;
    fServer : string;
    fClientLib : string;
    function GetUser:string;
    function GetPassword:string;
    function GetDataBase:string;
    function GetServer:string;
    function GetClientLib:string;
  public
    { Public declarations }
    property User : string read GetUser;
    property Database : string read GetDatabase;
    property Password : string read GetPassword;
    property Server : string read GetServer;
    property ClientLib : string read GetClientLib;
  end;

var
  AdminForm: TAdminForm;

implementation

uses
  UserLoginDlg, ServiceForma, UsersForma, QueryForma;

{$R *.dfm}
function TAdminForm.GetUser:string;
begin
  Result:=fUser;
end;
function TAdminForm.GetDatabase:string;
begin
  Result:=fDataBase;
end;

function TAdminForm.GetPassword:string;
begin
  Result:=fPassword;
end;

function TAdminForm.GetServer:string;
begin
  Result:=fServer;
end;

function TAdminForm.GetClientLib:string;
begin
  Result:=fClientLib;
end;

procedure TAdminForm.FormShow(Sender: TObject);
var
 AServer, ADatabaseName, AUserName, APassword, AClientLib :String;
begin
{$IFDEF DEMOVERSION}
  Caption := Caption + ' Демоверсия';
{$ENDIF}
  ADatabaseName  := FormStorage.StoredValues.Values['DATABASE'].Value;
  AUserName := FormStorage.StoredValues.Values['USERNAME'].Value;
  AServer := FormStorage.StoredValues.Values['SERVER'].Value;
  AClientLib := FormStorage.StoredValues.Values['CONNECTDLL'].Value;
  APassword := '';

  if LoginDialog(AServer, ADatabaseName, AUserName, APassword, AClientLib)
  then begin
    db.ConnectParams.UserName := AUserName;
    db.ConnectParams.Password := APassword;
    db.LibraryName := AClientLib;
    db.DBName := AServer + ':' + ADatabaseName;
      try
        db.Open;
        FormStorage.StoredValues.Values['DATABASE'].Value := ADatabaseName;
        FormStorage.StoredValues.Values['USERNAME'].Value := AUserName;
        FormStorage.StoredValues.Values['SERVER'].Value := AServer;
        FormStorage.StoredValues.Values['CONNECTDLL'].Value := AClientLib;

        fUser := AUserName;
        fDatabase := ADatabaseName;
        fPassword := APassword;
        fServer := AServer;
        fClientLib := AClientLib;
      except
        on E:Exception do ShowMessage('Ошибка!'+#13+#10+ E.Message);
      end;
  end;
  if not db.Connected
  then close
  else db.Close;
end;

procedure TAdminForm.btnServiceClick(Sender: TObject);
begin
  if not Assigned(ServiceForm)
  then ServiceForm := TServiceForm.Create(Application);
  ServiceForm.Show;
end;

procedure TAdminForm.btnUsersClick(Sender: TObject);
begin
  if not Assigned(UsersForm)
  then UsersForm := TUsersForm.Create(Application);
  UsersForm.Show;
end;

procedure TAdminForm.Button1Click(Sender: TObject);
begin
  if not Assigned(QueryForm)
  then QueryForm := TQueryForm.Create(Application);
  QueryForm.Show;
end;

procedure TAdminForm.FibErrorHandlerFIBErrorEvent(Sender: TObject;
  ErrorValue: EFIBError; KindIBError: TKindIBError; var DoRaise: Boolean);
begin
  case KindIBError of
    keOther: begin
      //не найден файл базы данных
      case ErrorValue.IBErrorCode of
        335544344 : begin
          MessageDlg('Невозможно подключиться к базе данных.' +#13#13 + 'Причина ошибки:' +#13+ 'Не найден файл базы данных!', mtError, [mbOK], 0);
          DoRaise:=false;
        end;

        //неверно указано имя пользователя и пароль
        335544472 : begin
          MessageDlg('Невозможно подключиться к базе данных.' + #13#13+ 'Причина ошибки:' +#13+ 'Неверно указано имя пользователя или пароль.', mtError, [mbOK], 0);
          DoRaise:=False;
        end;

         //база данных не доступна
        335544375 : begin
          MessageDlg('Доступ к базе данных закрыт!' + #13#13 + 'Возможная причина: не запущен сервер Firebird!', mtError, [mbOK], 0);
          DoRaise:=False;
        end;

        //нет активной БД
        335544324 : begin
          MessageDlg('Нет подключения базе данных!', mtError, [mbOK], 0);
          DoRaise:=False;
        end;

        else begin
          MessageDlg('Неизвестная ошибка времени выполнения' + #13#13 + 'Номер ошибки:'+ IntToStr(ErrorValue.IBErrorCode) + #13#13 +'Текст ошибки:' + ErrorValue.IBMessage, mtError, [mbOK], 0);
          DoRaise:=False;
        end;
      end;
    end;
    keLostConnect: begin
      {
      DoRaise := false;
      if (MessageDlg('Обрыв соединения!'+#13+#10+'Восстановить (если нет. приложение будет закрыто)?'+#13+#10+'Задержка при восстановлении 30 секунд', mtWarning, [mbYes, mbNo], 0) = 0)
      then begin
        sleep(30000);
        try
          dbTV.RestoreConnect(Sender);
          showmessage('Связь восстановлена');
        except
          showmessage('Связь восстановить не удалось!');
          A4MainForm.close;
        end;
     end
     else
     }
      showmessage('Связь прервана. Приложение будет закрыто!');
      close;
    end;

  end;

end;

end.

