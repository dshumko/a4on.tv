unit NodeLayouteForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, DB, FIBDataSet, pFIBDataSet, DBGridEh, StdCtrls,
  DBCtrls, Mask, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery,
  PrjConst, System.UITypes, A4onTypeUnit;

type

  TNodeLayouteForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    srcDevType: TDataSource;
    dsDevType: TpFIBDataSet;
    dbluDevType: TDBLookupComboboxEh;
    memNotice: TDBMemoEh;
    lblAttribute: TLabel;
    CnErrors: TCnErrorProvider;
    ednCount: TDBNumberEditEh;
    lbl1: TLabel;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  public
  end;

function EditLayoute(var NodeLayoutItem: TNodeLayoutItem): Boolean;

implementation

uses DM, pFIBQuery;

{$R *.dfm}

function EditLayoute(var NodeLayoutItem: TNodeLayoutItem): Boolean;
begin
  with TNodeLayouteForm.Create(Application) do
  begin
    try
      dsDevType.ParamByName('M_TYPE').VALUE := NodeLayoutItem.M_TYPE;
      dsDevType.ParamByName('NODE_ID').VALUE := NodeLayoutItem.NODE_ID;
      dsDevType.Open;

      if NodeLayoutItem.M_TYPE <> -1 then
      begin
        dbluDevType.VALUE := NodeLayoutItem.M_TYPE;
        dbluDevType.Enabled := false;
      end;

      if NodeLayoutItem.quant <> 0 then
        ednCount.VALUE := NodeLayoutItem.quant;

      memNotice.Lines.Text := NodeLayoutItem.notice;

      if ShowModal = mrOk then
      begin
        NodeLayoutItem.M_TYPE := dbluDevType.VALUE;
        NodeLayoutItem.quant := ednCount.VALUE;
        NodeLayoutItem.notice := memNotice.Lines.Text;
        NodeLayoutItem.Name := dbluDevType.Text;
        result := true;
      end
      else
        result := false;

      if dsDevType.Active then
        dsDevType.Close;
    finally
      free
    end;
  end;
end;

procedure TNodeLayouteForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TNodeLayouteForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if (dbluDevType.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(dbluDevType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbluDevType);

  if (ednCount.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(ednCount, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(ednCount);

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

end.
