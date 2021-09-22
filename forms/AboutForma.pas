unit AboutForma;
{$I defines.inc}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,
  ActnList, Vcl.Imaging.pngimage, CnWaterImage, System.Actions, PrjConst;

type
  TAboutForm = class(TForm)
    Email: TStaticText;
    ActionList1: TActionList;
    ActionExit: TAction;
    CnWaterImage1: TCnWaterImage;
    WWW: TStaticText;
    lblVersion: TStaticText;
    procedure ActionExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EmailClick(Sender: TObject);
    procedure WWWClick(Sender: TObject);
    procedure CnWaterImage1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses AtrCommon, TetrisForm, atrCmdUtils, ShellAPI, MAIN;

{$R *.dfm}

procedure TAboutForm.ActionExitExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
var
  Major, Minor, Release, Build: Integer;
  s : string;
begin
  AtrCommon.GetFileVersion(Application.ExeName, Major, Minor, Release, Build);
  lblVersion.Caption := lblVersion.Caption + IntToStr(Major) +'.'+ IntToStr(Minor);

   lblVersion.Caption:=lblVersion.Caption +' (build '+ IntToStr(Build) +')';

  {$IFDEF DEMOVERSION}
   lblVersion.Caption:=lblVersion.Caption + ' FREE' + rsDEMO;
  {$ENDIF}

  {$IFDEF BETAVERSION}
  lblVersion.Caption:=lblVersion.Caption + ' BETA';
  {$ENDIF}
   s := '';
  {$IFDEF DIGIT}
   S := s+'D';
  {$ENDIF}
  {$IFDEF LAN}
   S := s+'L';
  {$ENDIF}
   if s <> '' then lblVersion.Caption:=lblVersion.Caption + ' '+s;

   Email.Caption := rsEMAIL;
   WWW.Caption   := rsApplicationFullNAME;
end;

procedure TAboutForm.WWWClick(Sender: TObject);
var
  s: string;
begin
  s := 'http://'+rsWWW;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, '', s);
end;

procedure TAboutForm.CnWaterImage1DblClick(Sender: TObject);
begin
  with TFormTetris.Create(Application) do
    Show;
end;

procedure TAboutForm.EmailClick(Sender: TObject);
var
  s : string;
begin
  s := 'mailto:' + Email.Caption+'?subject=A4on.TV';
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, '', s);
end;

end.
