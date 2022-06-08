unit RequestResultsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  OkCancel_frame, FIBDataSet, pFIBDataSet, DBCtrlsEh, PrjConst;

type
  TRequestResult = class(TForm)
    frmOk: TOkCancelFrame;
    lbl1: TLabel;
    edNAME: TDBEditEh;
    chkFINISHED: TDBCheckBoxEh;
    srcResult: TDataSource;
    dsResult: TpFIBDataSet;
    mmoNOTICE: TDBMemoEh;
    lbl2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frmOkbbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function RequestResultModify(const RR_ID : Integer;
                             const RT_ID : Integer;
                             const RT_NAME : string) : Boolean;

implementation

{$R *.dfm}

function RequestResultModify(const RR_ID : Integer;
                             const RT_ID : Integer;
                             const RT_NAME : string) : Boolean;
begin
  Result := False;
  with TRequestResult.Create(Application) do
  try
    dsResult.ParamByName('rr_id').AsInteger := rr_id;
    dsResult.Open;
    if RR_ID = -1
    then begin
      dsResult.Insert;
      dsResult['FINISHED'] := 1;
      dsResult['RT_ID'] := RT_ID;
      Caption := rsNewResult;
    end
    else begin
      Caption := rsResultFor;
      dsResult.Edit;
    end;
    Caption := Caption + RT_NAME;
    if ShowModal = mrOk
    then begin
      if edNAME.Text <>''
      then begin
        Result := True;
        dsResult.Post;
      end;
    end;
    if dsResult.State in [dsInsert, dsEdit]
    then dsResult.Cancel;
  finally
    Free;
  end;
end;

procedure TRequestResult.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then frmOkbbOkClick(Sender);
end;

procedure TRequestResult.frmOkbbOkClick(Sender: TObject);
begin
  frmOk.actExitExecute(Sender);

end;

end.
