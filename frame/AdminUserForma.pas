unit AdminUserForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  IB_Services;

type
  TAdminUserForm = class(TForm)
    pFIBStatisticalService1: TpFIBStatisticalService;
    pFIBBackupService1: TpFIBBackupService;
    pFIBRestoreService1: TpFIBRestoreService;
    pFIBValidationService: TpFIBValidationService;
    pFIBSecurityService1: TpFIBSecurityService;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure pFIBValidationServiceTextNotify(Sender: TObject;
      const Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminUserForm: TAdminUserForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TAdminUserForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  AdminUserForm := nil;
end;

procedure TAdminUserForm.Button1Click(Sender: TObject);
begin
{
with TpFIBXXXService.Create(nil) do
try
  ServerName := <server_name>;
  Protocol := <net_protocol>;
  UserName := <user_name>;
  Password := <password>;
  Atach;
  try
    //выполняемая работа
  finally
    Deatach;
  end;
finally
  Free;
end;
}
end;

procedure TAdminUserForm.Button2Click(Sender: TObject);
begin
  with pFIBValidationService do
  try
    Attach;
    try
      Memo1.Lines.Clear;
      ServiceStart;
      while not Eof do GetNextLine;
    finally
      Detach;
    end;
  Except
  end;
end;

procedure TAdminUserForm.pFIBValidationServiceTextNotify(Sender: TObject;
  const Text: String);
begin
  Memo1.Lines.Add(Text);
end;

end.
