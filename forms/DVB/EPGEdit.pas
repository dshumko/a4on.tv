unit EPGEdit;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  OkCancel_frame, DBCtrlsEh, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TEPGEditEvent = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    dsProgramma: TpFIBDataSet;
    srcProgramma: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    DBEditEh1: TDBEditEh;
    edStartDate: TDBDateTimeEditEh;
    edStopDate: TDBDateTimeEditEh;
    DBEditEh2: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBMemo1: TDBMemoEh;
    edStopTime: TDBDateTimeEditEh;
    edStartTime: TDBDateTimeEditEh;
    DBEditEh6: TDBEditEh;
    edtDVBGENRES: TDBEditEh;
    SpeedButton1: TSpeedButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditEPGEvent(const CH_ID:Integer; const Start_time : TDateTime): boolean;

implementation

uses
  DM, DVBGanresForma;

{$R *.dfm}

function EditEPGEvent(const CH_ID:Integer; const Start_time : TDateTime): boolean;
begin
  with TEPGEditEvent.Create(Application) do
  try
    dsProgramma.ParamByName('CH_ID').AsInteger := CH_ID;
    dsProgramma.ParamByName('Start_time').AsDateTime := Start_time;
    dsProgramma.Open;
    if Start_time = 0
    then begin
      dsProgramma.Insert;
      dsProgramma['CH_ID']      := CH_ID;
      dsProgramma['DATE_START'] := Now();
      dsProgramma['DATE_STOP']  := Now()+(1 / 24);
    end
    else begin
      edStartDate.ReadOnly := True;
      edStartTime.ReadOnly := True;
      dsProgramma.Edit;
    end;
    if ShowModal = mrOk
    then begin
      if dsProgramma.State in [dsEdit, dsInsert]
      then dsProgramma.Post;
      result := True;
    end
    else result := false;
    if dsProgramma.State in [dsEdit, dsInsert]
    then dsProgramma.Cancel;
  finally
    free
  end;
end;

procedure TEPGEditEvent.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then ModalResult := mrOk;
end;

procedure TEPGEditEvent.SpeedButton1Click(Sender: TObject);
begin
  edtDVBGENRES.Text := SelectDVBGanres(edtDVBGENRES.Text);
end;

end.
