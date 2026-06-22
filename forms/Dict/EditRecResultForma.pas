unit EditRecResultForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst,
  CnClasses, Vcl.Buttons;

type
  TEditRecResultForm = class(TForm)
    memNotice: TDBMemoEh;
    lblResult: TLabel;
    CnErrors: TCnErrorProvider;
    chkBid: TDBCheckBoxEh;
    chkTask: TCheckBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtName: TDBEditEh;
    procedure CheckData;
    procedure SaveResult;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
  private
    FResult_ID: Integer;
    FType_ID: Integer;
    procedure SetID(value: Integer);
  public
    property Result_ID: Integer read FResult_ID write SetID;
  end;

function EditRecResult(const aResult_ID: Integer): Integer;

implementation

uses
  System.RegularExpressions,
  DM, pFIBQuery;

{$R *.dfm}

function EditRecResult(const aResult_ID: Integer): Integer;
begin
  Result := -1;
  with TEditRecResultForm.Create(Application) do
    try
      Result_ID := aResult_ID; // если отрицательное значение, то это тип
      if (ShowModal = mrOk) then
        Result := Result_ID;
    finally
      free
    end;
end;

procedure TEditRecResultForm.btnOkClick(Sender: TObject);
begin
  CheckData;
end;

procedure TEditRecResultForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    CheckData;
end;

procedure TEditRecResultForm.CheckData;
var
  errors: Boolean;
begin
  errors := false;
  if (edtName.Text = '') then begin
    errors := true;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  if not errors then
    SaveResult
  else
    ModalResult := mrNone;
end;

procedure TEditRecResultForm.SaveResult;
var
  fq: TpFIBQuery;
  sql: string;
begin

  if FResult_ID < 0 then begin
    // если отрицательное значение, то это тип
    sql := 'insert into Objects (O_Type, O_Name, O_Description, O_Deleted, O_Check, O_Numericfield)' + //
      'values (81, :O_Name, :O_Description, 0, :O_Check, :O_Numericfield)' + //
      'returning O_Id';
  end
  else
    sql := 'update Objects set O_Name = :O_Name, O_Description = :O_Description, O_Check = :O_Check, ' +
      ' O_Numericfield = :O_Numericfield where O_Id = :O_Id and O_Type = 81';

  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trWriteQ;
    fq.sql.Text := sql;

    if FResult_ID > 0 then
      fq.ParamByName('O_Id').AsInteger := FResult_ID;

    fq.ParamByName('O_Name').AsString := edtName.Text;
    fq.ParamByName('O_Description').AsString := memNotice.Lines.Text;
    fq.ParamByName('O_Numericfield').AsInteger := FType_ID;

    sql := '';
    if chkBid.Checked then
      sql := '"bid": true';
    if chkTask.Checked then
      sql := sql + ',"task": true';
    sql := '{' + sql.TrimLeft([',']) + '}';
    fq.ParamByName('O_Check').AsString := sql;

    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    fq.Transaction.Commit;

    if FResult_ID < 0 then
      FResult_ID := fq.fn('O_Id').AsInteger;

    fq.Close;
  finally
    fq.free;
  end;

  ModalResult := mrOk;
end;

procedure TEditRecResultForm.SetID(value: Integer);
var
  fq: TpFIBQuery;
  s: string;
begin
  FResult_ID := value;
  if FResult_ID < 0 then begin
    FType_ID := -1 * FResult_ID;
    Exit;
  end;

  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trReadQ;
    fq.sql.Text := 'select O_NAME, O_DESCRIPTION, O_Check, O_Numericfield from OBJECTS ' +
      ' where O_TYPE = 81 and O_ID = :O_ID';

    fq.ParamByName('O_ID').AsInteger := FResult_ID;
    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    if not fq.fn('O_NAME').IsNull then begin
      edtName.Text := fq.fn('O_NAME').AsString;
      FType_ID := fq.fn('O_Numericfield').AsInteger;
      if not fq.fn('O_DESCRIPTION').IsNull then
        memNotice.Lines.Text := fq.fn('O_DESCRIPTION').AsString;
      if not fq.fn('O_Check').IsNull then begin
        chkBid.Checked := pos('"bid"', fq.fn('O_Check').AsString) > 0;
        chkTask.Checked := pos('"task"', fq.fn('O_Check').AsString) > 0;
      end;
    end;
    fq.Transaction.Commit;
    fq.Close;
  finally
    fq.free;
  end;

end;

end.
