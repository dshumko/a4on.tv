unit EditRFileForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons,
  FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst, pFIBQuery;

type
  TEditRFileForm = class(TForm)
    memNotice: TDBMemoEh;
    Label1: TLabel;
    CnErrors: TCnErrorProvider;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtFILE: TDBEditEh;
    lblFileCh: TLabel;
    dlgOpen: TOpenDialog;
    qryFile: TpFIBQuery;
    procedure btnOkClick(Sender: TObject);
    procedure edtFILEEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
  end;

function EditFile(const RQ_ID: Integer; const HOUSE_ID: Integer = -1): Boolean;

implementation

uses
  DM;

{$R *.dfm}

function EditFile(const RQ_ID: Integer; const HOUSE_ID: Integer = -1): Boolean;
begin
  with TEditRFileForm.Create(Application) do
    try
      if ShowModal = mrOk
      then begin
        qryFile.ParamByName('RQ_ID').AsInteger := RQ_ID;
        qryFile.ParamByName('HOUSE_ID').AsInteger := HOUSE_ID;
        qryFile.ParamByName('Jpg').LoadFromFile(edtFILE.Hint);
        qryFile.ParamByName('Notice').AsString := memNotice.Lines.Text+'('+ExtractFileName(edtFILE.Hint)+')';
        qryFile.ExecQuery;
        result := true;
      end
      else begin
        result := false;
      end;
    finally free
    end;
end;

procedure TEditRFileForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;

  if (edtFILE.Text = '')
  then begin
    errors := true;
    CnErrors.SetError(edtFILE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtFILE);

  if not errors
  then ModalResult := mrOk
  else ModalResult := mrNone;
end;

procedure TEditRFileForm.edtFILEEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if dlgOpen.Execute
  then begin
    edtFILE.Text := ExtractFileName(dlgOpen.FileName);
    edtFILE.Hint := dlgOpen.FileName;
    edtFILE.Tag := 1;
  end;

  Handled := True;
end;

procedure TEditRFileForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then btnOkClick(Sender);
end;

end.
