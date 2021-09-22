﻿unit MaterialForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DBLookupEh, Mask, DBCtrlsEh,
  DB, FIBDataSet, pFIBDataSet, Vcl.Buttons, DBGridEh, CnErrorProvider,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery;

type
  TMaterailForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblMatGroup: TDBLookupComboboxEh;
    DBMemo1: TDBMemoEh;
    DBEdit1: TDBEditEh;
    dsMGropups: TpFIBDataSet;
    srcMGropups: TDataSource;
    DBEdit2: TDBEditEh;
    lbl1: TLabel;
    edtM_NUMBER: TDBEditEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblCoslt: TLabel;
    edtCost: TDBNumberEditEh;
    lbl2: TLabel;
    lcbShippers: TDBLookupComboboxEh;
    lbl3: TLabel;
    edtCOST1: TDBNumberEditEh;
    dsShippers: TpFIBDataSet;
    srcShippers: TDataSource;
    CnErrors: TCnErrorProvider;
    Query: TpFIBQuery;
    trReadQ: TpFIBTransaction;
    chkItsEquipment: TDBCheckBoxEh;
    chkIsDigit: TDBCheckBoxEh;
    chkIsNet: TDBCheckBoxEh;
    lbl4: TLabel;
    lcbGR_ID: TDBLookupComboboxEh;
    dsDevType: TpFIBDataSet;
    srcDevType: TDataSource;
    edtFILE: TDBEditEh;
    btnScaner: TButton;
    btnOpenFile: TButton;
    lbl5: TLabel;
    dlgOpen: TOpenDialog;
    qReqFile: TpFIBQuery;
    qSaveFile: TpFIBQuery;
    dsDoc: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure edtM_NUMBERExit(Sender: TObject);
    procedure edtM_NUMBERChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
    procedure btnScanerClick(Sender: TObject);
    procedure edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dsDocAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FNeedCheckNN: Boolean;
    //FReadOnly: Boolean;
    FNeedDelete: Boolean;
    FFileForSave: String;
    function isValidNomNumber: Boolean;
    function GetFile: String;
    procedure SetFile(value: String);
    procedure ViewFile();
    procedure SaveFileToDB();
  public
    { Public declarations }
    property FileForSave: String read GetFile write SetFile;
  end;

var
  MaterailForm: TMaterailForm;

implementation

uses
  MaterialsForma, DM, PrjConst, ScanImageForma, AtrCommon, Winapi.ShellAPI;

{$R *.dfm}

procedure TMaterailForm.edtM_NUMBERChange(Sender: TObject);
begin
  FNeedCheckNN := True;
end;

procedure TMaterailForm.edtM_NUMBERExit(Sender: TObject);
begin
  if FNeedCheckNN then
    isValidNomNumber
end;

procedure TMaterailForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsMGropups.Close;
  dsShippers.Close;
  dsDevType.Close;
  dsDoc.Close;
end;

procedure TMaterailForm.FormCreate(Sender: TObject);
begin
  FNeedCheckNN := False;
end;

procedure TMaterailForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
  begin
    OkCancelFrame1bbOkClick(Sender);
  end;
end;

procedure TMaterailForm.FormShow(Sender: TObject);
begin
  dsMGropups.Open;
  dsShippers.Open;
  dsDevType.Open;
  if (not MaterialsForm.srcDataSource.DataSet.FieldByname('M_ID').IsNull) then
    dsDoc.ParamByName('MAT_ID').AsInteger := MaterialsForm.srcDataSource.DataSet.FieldByname('M_ID').AsInteger
  else
    dsDoc.ParamByName('MAT_ID').AsInteger := -1;
  dsDoc.Open;
end;

procedure TMaterailForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if isValidNomNumber then
  begin
    SaveFileToDB();
    ModalResult := mrOk;
  end;
end;

function TMaterailForm.isValidNomNumber: Boolean;
var
  s, n: string;
begin
  Result := True;

  n := Trim(edtM_NUMBER.Text);
  CnErrors.Dispose(edtM_NUMBER);
  if (n.isEmpty) then
    exit;

  if (MaterialsForm.srcDataSource.DataSet.FieldByname('M_ID').IsNull) then
    exit;

  s := '';
  Query.SQL.Clear;
  Query.SQL.Text := 'select first 1 NAME from MATERIALS where M_ID <> :MID and M_NUMBER = :MNUMBER';
  Query.ParamByName('MID').AsInteger := MaterialsForm.srcDataSource.DataSet.FieldByname('M_ID').AsInteger;
  Query.ParamByName('MNUMBER').AsString := n;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not(Query.FN('NAME').IsNull) then
    s := Query.FN('NAME').AsString;
  Query.Transaction.Commit;
  Query.Close;

  Result := (s = '');
  if not Result then
    CnErrors.SetError(edtM_NUMBER, Format(rsERROR_UNIQUE, [s]), iaMiddleLeft, bsNeverBlink);
end;

procedure TMaterailForm.btnOpenFileClick(Sender: TObject);
begin
  ViewFile();
end;

function TMaterailForm.GetFile: String;
begin
  Result := FFileForSave;
end;

procedure TMaterailForm.SetFile(value: String);
var
  s: String;
begin
  FFileForSave := value;
  if not value.isEmpty then
  begin
    s := ExtractFileExt(FFileForSave);
    if UpperCase(s) = '.TMP' then
    begin
      s := ExtractFileName(value);
      s := ChangeFileExt(s, '.JPG');
    end
    else
      s := ExtractFileName(value);
    edtFILE.Text := s;
    edtFILE.Hint := value;
    edtFILE.Tag := 1;
  end;
end;

procedure TMaterailForm.edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if dlgOpen.Execute then
  begin
    FileForSave := dlgOpen.FileName;
  end;

  Handled := True;
end;

procedure TMaterailForm.btnScanerClick(Sender: TObject);
var
  FileName: String;
  NeedSave: Boolean;
begin
  FileName := ScanDocument(False, NeedSave);
  FileForSave := FileName;
  edtFILE.Text := ExtractFileName(ChangeFileExt(FileName, '.jpg'));
  edtFILE.Enabled := False;
  FNeedDelete := True;
end;

procedure TMaterailForm.dsDocAfterOpen(DataSet: TDataSet);
begin
  if not dsDoc.FieldByname('Bl_Name').IsNull then
  begin
    edtFILE.Text := dsDoc.FieldByname('Bl_Name').AsString;
    FFileForSave := '';
  end;
end;

procedure TMaterailForm.ViewFile();
var
  FileName: string;
begin
  if dsDoc.RecordCount = 0 then
    exit;

  if dsDoc.FieldByname('BL_ID').IsNull then
  begin
    if edtFILE.Hint.isEmpty then
      exit;

    ShellExecute(Handle, 'open', PWideChar(edtFILE.Hint), nil, nil, SW_SHOWNORMAL);
  end;

  if dsDoc.FieldByname('Bl_Name').IsNull then
    exit;

  FileName := GetTempDir + 'A4on\';
  if not DirectoryExists(FileName) then
    CreateDir(FileName);
  FileName := FileName + dsDoc['Bl_Name'];
  qReqFile.ParamByName('BL_ID').AsInteger := dsDoc['BL_ID'];
  qReqFile.Transaction.StartTransaction;
  qReqFile.ExecQuery;
  qReqFile.FieldByname('Bl_Body').SaveToFile(FileName);
  qReqFile.Close;
  qReqFile.Transaction.Rollback;
  ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TMaterailForm.SaveFileToDB();
var
  fs: TFileStream;
begin
  if FFileForSave.IsEmpty then Exit;

  if (not MaterialsForm.srcDataSource.DataSet.FieldByname('M_ID').IsNull) then
  begin
    qSaveFile.ParamByName('Bl_Type').AsInteger := 4;
    qSaveFile.ParamByName('OWNER_ID').AsInteger := MaterialsForm.srcDataSource.DataSet.FieldByname('M_ID').AsInteger;
    qSaveFile.ParamByName('Bl_Name').AsString := edtFILE.Text;
    fs := TFileStream.Create(FFileForSave, fmShareDenyNone);
    try
      qSaveFile.ParamByName('Bl_Body').LoadFromStream(fs);
    finally
      fs.Free;
    end;
    qSaveFile.Transaction.StartTransaction;
    qSaveFile.ExecQuery;
    qSaveFile.Transaction.Commit;
  end;
end;

end.