unit ChanSrcForma;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, OkCancel_frame, FIBDatabase,
  pFIBDatabase, StdCtrls, DBCtrls, Mask, DBCtrlsEh, ExtDlgs, uDBImages,
  CnErrorProvider, DBGridEh, DBLookupEh;

type

  TChanSrcForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    dsSource: TpFIBDataSet;
    srcSource: TDataSource;
    trWrite: TpFIBTransaction;
    edtNAME: TDBEditEh;
    Label1: TLabel;
    cnError: TCnErrorProvider;
    lbl1: TLabel;
    edtNAME1: TDBEditEh;
    edtURL: TDBEditEh;
    Label3: TLabel;
    dbmNOTICE: TDBMemoEh;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function CheckData: Boolean;
  public
    { Public declarations }
  end;

function EditChanSource(const aCS_ID: Int64; const Mode: integer = 1): Int64;

implementation

uses
  DM, PrjConst;

{$R *.dfm}

function EditChanSource(const aCS_ID: Int64; const Mode: integer = 1): Int64;
var
  ChanSrcForm: TChanSrcForm;
begin
  result := -1;

  ChanSrcForm := TChanSrcForm.Create(Application);
  with ChanSrcForm do
    try
      dsSource.ParamByName('CS_ID').AsInt64 := aCS_ID;
      dsSource.Open;
      if Mode <> 0 then begin
        if aCS_ID > 0 then
          dsSource.Edit
        else begin
          dsSource.Insert;
        end;
      end;

      if ShowModal = mrOk then begin
        if aCS_ID = -1 then
          dsSource['CS_ID'] := dmMain.dbTV.Gen_Id('GEN_UID', 1);
        dsSource.Post;
        result := dsSource['CS_ID'];
      end
      else begin
        if dsSource.State in [dsEdit, dsInsert] then
          dsSource.Cancel;
      end;
    finally
      free
    end;
end;

procedure TChanSrcForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    if CheckData then
      OkCancelFrame1bbOkClick(Sender);
end;

procedure TChanSrcForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if CheckData then
    OkCancelFrame1.actExitExecute(Sender);
end;

function TChanSrcForm.CheckData: Boolean;
begin
  result := true;
  if (edtNAME.Text.IsEmpty) then begin
    cnError.SetError(edtNAME, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    edtNAME.SetFocus;
    result := False;
  end
end;

end.
