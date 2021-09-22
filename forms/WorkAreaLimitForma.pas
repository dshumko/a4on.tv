unit WorkAreaLimitForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, StdCtrls, DBCtrls, DBCtrlsEh, DB,
  FIBDataSet, pFIBDataSet, Mask, DBLookupEh, DBGridEh;

type
  TWorkAreaLimitForm = class(TForm)
    frm1: TOkCancelFrame;
    lbl1: TLabel;
    cbbType: TDBLookupComboboxEh;
    srcRequestType: TDataSource;
    dsRequestType: TpFIBDataSet;
    edLimit: TDBNumberEditEh;
    Label1: TLabel;
    srcLimit: TDataSource;
    dsLimit: TpFIBDataSet;
    dbmNotice: TDBMemoEh;
    lbl2: TLabel;
    procedure dsLimitAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsLimitBeforePost(DataSet: TDataSet);
    procedure frm1bbOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fWA : Integer;
    fWI : Integer;
    procedure SetWA(Value : Integer);
    procedure SetRT(Value : Integer);
  public
    { Public declarations }
    property WA : Integer write SetWA;
    property WI : Integer write SetRT;
  end;

function WorkLimitEdit(const WA_ID : Integer; WORK_ID : Integer):Boolean;

implementation

uses
  DM;

{$R *.dfm}

function WorkLimitEdit(const WA_ID : Integer; WORK_ID : Integer):Boolean;
begin
  Result := False;
  with TWorkAreaLimitForm.Create(Application) do begin
    try
      WA := WA_ID;
      WI := WORK_ID;
      dsLimit.Open;
      if WORK_ID = -1
      then dsLimit.Insert
      else dsLimit.Edit;

      if ShowModal = mrOk
      then begin
         dsLimit.Post;
         Result := True;
      end
      else dsLimit.Cancel;
    finally
      Free;
    end;
  end;
end;


procedure TWorkAreaLimitForm.SetWA(Value : Integer);
begin
  fWA := Value;
  dsLimit.ParamByName('WA_ID').asInteger := Value;
end;

procedure TWorkAreaLimitForm.dsLimitAfterInsert(DataSet: TDataSet);
begin
  dsLimit.ParamByName('WA_ID').asInteger := fWA;
end;

procedure TWorkAreaLimitForm.dsLimitBeforePost(DataSet: TDataSet);
begin
  dsLimit['WA_ID'] := fWA;
end;

procedure TWorkAreaLimitForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsRequestType.Close;
end;

procedure TWorkAreaLimitForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then frm1bbOkClick(Sender);
end;

procedure TWorkAreaLimitForm.FormShow(Sender: TObject);
begin
dsRequestType.Open;
end;

procedure TWorkAreaLimitForm.frm1bbOkClick(Sender: TObject);
begin
  frm1.actExitExecute(Sender);

end;

procedure TWorkAreaLimitForm.SetRT(Value : Integer);
begin
  fWI := Value;
  dsLimit.ParamByName('W_ID').asInteger := Value;
end;

end.
