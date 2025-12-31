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
    procedure edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function SaveFiles(const RQ_ID: Integer; const HOUSE_ID: Integer): Boolean;
  public
  end;

function EditFile(const RQ_ID: Integer; const HOUSE_ID: Integer = -1): Boolean;

implementation

uses
  System.Types, DM, AtrStrUtils;

{$R *.dfm}

function EditFile(const RQ_ID: Integer; const HOUSE_ID: Integer = -1): Boolean;
begin
  with TEditRFileForm.Create(Application) do
    try
      if ShowModal = mrOk then
        Result := SaveFiles(RQ_ID, HOUSE_ID)
      else
        Result := false
    finally
      free
    end;
end;

function TEditRFileForm.SaveFiles(const RQ_ID: Integer; const HOUSE_ID: Integer): Boolean;
var
  s, f: string;
  i: Integer;
  a: TStringDynArray;
begin
  try
    if edtFILE.Tag = 1 then
    begin
      with qryFile do
      begin
        ParamByName('RQ_ID').AsInteger := RQ_ID;
        ParamByName('HOUSE_ID').AsInteger := HOUSE_ID;
        ParamByName('Jpg').LoadFromFile(edtFILE.Hint);
        ParamByName('Notice').AsString := memNotice.Lines.Text + '(' + ExtractFileName(edtFILE.Hint) + ')';
        ExecQuery;
      end;
      Result := true;
    end
    else if edtFILE.Tag = 2 then
    begin
      a := Explode(',', edtFILE.Hint);
      for i := 0 to Length(a) -1 do
      begin
        with qryFile do
        begin
          ParamByName('RQ_ID').AsInteger := RQ_ID;
          ParamByName('HOUSE_ID').AsInteger := HOUSE_ID;
          ParamByName('Jpg').LoadFromFile(a[i]);
          ParamByName('Notice').AsString := memNotice.Lines.Text + '(' + ExtractFileName(a[i]) + ')';
          ExecQuery;
        end;
      end;
      Result := true;
    end
    else
      Result := false;
  except
    Result := false;
  end;
end;

procedure TEditRFileForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;

  if (edtFILE.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(edtFILE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtFILE);

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

procedure TEditRFileForm.edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s, f: string;
  i: Integer;
begin
  if dlgOpen.Execute then
  begin
    if (dlgOpen.Files.Count > 1) then
    begin
      for i := 0 to dlgOpen.Files.Count - 1 do
      begin
        s := ExtractFileName(dlgOpen.Files[i]) + ',' + s;
        f := dlgOpen.Files[i] + ',' + f;
      end;

      edtFILE.Text := s.Trim([',']);
      edtFILE.Hint := f.Trim([',']);
      edtFILE.Tag := 2;
    end
    else
    begin
      edtFILE.Text := ExtractFileName(dlgOpen.FileName);
      edtFILE.Hint := dlgOpen.FileName;
      edtFILE.Tag := 1;
    end;
  end;

  Handled := true;
end;

procedure TEditRFileForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

end.
