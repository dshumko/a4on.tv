unit FeedbackForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  DBCtrlsEh;

type
  TFeedbackForm = class(TForm)
    memMessage: TDBMemoEh;
    Panel1: TPanel;
    Label1: TLabel;
    edSubject: TDBEditEh;
    Panel2: TPanel;
    btnSend: TButton;
    Button1: TButton;
    edFile: TDBEditEh;
    Label2: TLabel;
    FileOpenDialog: TOpenDialog;
    procedure btnSendClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FeedbackForm: TFeedbackForm;

implementation

{$R *.dfm}
uses
  {$IFNDEF VER300}
  EConsts, ETypes, EClasses, EHash, ESysInfo, ESend, ESendAPIMantis,
  {$ENDIF}
  AtrCommon, DM;

procedure TFeedbackForm.btnSendClick(Sender: TObject);
var
  {$IFNDEF VER300}
  Options: TEurekaModuleOptions;
  {$ENDIF}
  Files: TStringList;
  cr : TCursor;
  Major, Minor, Release, Build: Integer;
  s : string;
  resp : TResponse;
begin
  if edSubject.Text = ''
  then begin
    edSubject.SetFocus;
    Exit;
  end;

  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  {$IFNDEF VER300}
  Options := TEurekaModuleOptions.Create('');
  Files := TStringList.Create;
  try
    AtrCommon.GetFileVersion(Application.ExeName, Major, Minor, Release, Build);
    s := IntToStr(Major) +'.'+ IntToStr(Minor) + ' (build '+ IntToStr(Build) +')';

    Options.SendMantisURL  := 'bugs.a4on.tv';
    Options.SendMantisPort := 0;
    Options.SendMantisSSL  := False;

    Options.SendMantisLogin    := 'elog';
    Options.SendMantisPassword := 'pwd4log';

    Options.SendMantisProject  := 'a4on.tv';
    Options.SendMantisCategory := 'Feedback';

    // 1: store your text message
    if memMessage.Lines.Text <> ''
    then Options.CustomField[sifBugText]           := memMessage.Lines.Text
    else Options.CustomField[sifBugText]           := edSubject.Text;
    Options.CustomField[sifBugType]                := edSubject.Text;

    // 2: you have to redefine BugID, so it will unique identify this message
    Options.CustomField[sifBugID]                  := IntToHex(CRC32Hash(Options.CustomField[sifBugType] + Options.CustomField[sifBugText]), 8); // s+'_'+IntToHex(CRC32Hash(Random(999999).ToString) , 8);

    // 3: (optional) add additional text, if needed
    Options.CustomField[sifMessage]                := dmMain.mdsCompany['NAME'] + ' ' + s;
    Options.CustomField[sifStepsToReproduce]       := dmMain.mdsCompany['NAME'] + ' ' + s;

    // 4: (optional) fill other informational fields
    Options.CustomField[sifBugAppVersion]          := ESysInfo.GetVersionNumber;
    Options.CustomField[sifBuild]                  := ESysInfo.GetVersionNumber;
    Options.CustomField[sifMachineID]              := ESysInfo.GetComputerName;
    Options.CustomField[sifOSBuild]                := ESysInfo.GetOSBuild;
    Options.CustomField[sifOSType]                 := ESysInfo.GetOSTypeStr;
    Options.CustomField[sifPlatform]               := ESysInfo.GetPlatform;

    // 5: (optional) attach some files, if needed
    if edFile.Text <> ''
    then Files.Add(edFile.Text);

    resp := EurekaLogSend(TELTrackerMantisSender, Options, Files);
    ShowMessage(resp.ErrorMessage + resp.SuccessMessage);
  finally
    FreeAndNil(Files);
    FreeAndNil(Options);
  end;
  {$ENDIF}
  Screen.Cursor := cr;
  Close;
end;

procedure TFeedbackForm.Button1Click(Sender: TObject);
begin
  if FileOpenDialog.Execute
  then edFile.Text := FileOpenDialog.FileName
  else edFile.Text := '';
end;

procedure TFeedbackForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FeedbackForm := nil;
  Action := caFree;
end;

procedure TFeedbackForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then btnSendClick(sender);
end;

end.
