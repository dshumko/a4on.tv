unit EditNFileForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, DBGridEh, StdCtrls,
  DBCtrls, Mask, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery,
  PrjConst, System.UITypes, Vcl.Buttons, pFIBQuery;

type
  TEditNFileForm = class(TForm)
    srcFiles: TDataSource;
    dsFiles: TpFIBDataSet;
    dbluFileType: TDBLookupComboboxEh;
    memNotice: TDBMemoEh;
    Label1: TLabel;
    Label2: TLabel;
    edtNAME: TDBEditEh;
    CnErrors: TCnErrorProvider;
    dsFile: TpFIBDataSet;
    srcCustFile: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtFILE: TDBEditEh;
    lblFileCh: TLabel;
    dlgOpen: TOpenDialog;
    qUpdate: TpFIBQuery;
    procedure btnOkClick(Sender: TObject);
    procedure edtFILEEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  Private
  Public
  end;

function EditFile(const NODE_ID: Integer; const Name: string; const NF_ID: Integer = -1): Boolean;

implementation

uses DM;

{$R *.dfm}

function EditFile(const NODE_ID: Integer; const Name: string; const NF_ID: Integer = -1): Boolean;
var
  ForInsert: Boolean;
  i: Integer;
begin

  with TEditNFileForm.Create(Application) do
    try
      dsFiles.Open;
      dsFile.ParamByName('NF_ID').AsInteger := NF_ID;
      dsFile.Open;
      ForInsert := (NF_ID = -1);
      if ForInsert
      then dsFile.Insert
      else dsFile.Edit;

      if ShowModal = mrOk
      then begin
        if ForInsert
        then i := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID',1)
        else i := NF_ID;

        dsFile.FieldByName('NF_ID').AsInteger := i;
        dsFile.FieldByName('NODE_ID').AsInteger := NODE_ID;
        dsFile.Post;
        result := true;
        if (ForInsert) or (edtFILE.Tag = 1)
        then begin
          try
            qUpdate.ParamByName('NF_ID').AsInteger := i;
            qUpdate.ParamByName('CONTENT').LoadFromFile(edtFILE.Hint);
            qUpdate.Transaction.StartTransaction;
            qUpdate.ExecQuery;
            qUpdate.Transaction.Commit;
          except
            qUpdate.Transaction.Rollback;
            dsFile.Delete;
            result := False;
          end;
        end;
      end
      else begin
        dsFile.Cancel;
        result := false;
      end;
      if dsFiles.Active
      then dsFiles.Close;
    finally free
    end;
end;

procedure TEditNFileForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if (dbluFileType.Text = '')
  then begin
    errors := true;
    CnErrors.SetError(dbluFileType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(dbluFileType);

  if (edtNAME.Text = '')
  then begin
    errors := true;
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtNAME);

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

procedure TEditNFileForm.edtFILEEditButtons0Click(Sender: TObject;
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

procedure TEditNFileForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then btnOkClick(Sender);
end;

end.
