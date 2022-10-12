unit MatDocUnitForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Types, System.UITypes, System.Classes, System.SysUtils, System.Actions,
  Data.DB,
  Vcl.Menus, Vcl.ActnList, Vcl.Controls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Forms, Vcl.Graphics, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,
  DBGridEhGrouping, DynVarsEh, DBGridEh, FIBDataSet, GridsEh, EhLibFIB, DBGridEhImpExp, DBGridEhFindDlgs, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider, DBLookupEh, EhLibVCL, DBCtrlsEh, PrjConst,
  Vcl.Mask, FIBDatabase, pFIBDatabase, pFIBDataSet, MemTableDataEh,
  MemTableEh;

type
  TMatDocUnitForm = class(TForm)
    dbGrid: TDBGridEh;
    srcDataSource: TDataSource;
    Actions: TActionList;
    pmPopUp: TPopupMenu;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep1: TMenuItem;
    pmgSaveSelection: TMenuItem;
    pnlEdit: TPanel;
    btnSaveLink: TBitBtn;
    btnDelete: TBitBtn;
    CnErrors: TCnErrorProvider;
    mniN1: TMenuItem;
    splPG: TSplitter;
    mmoNotice: TDBMemoEh;
    lbl4: TLabel;
    lbl41: TLabel;
    edtSERIAL: TDBEditEh;
    edtMAC: TDBEditEh;
    dsDMUnits: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    edCount: TDBNumberEditEh;
    actGenerate: TAction;
    pnlBtn: TPanel;
    btnClose: TButton;
    mtUnits: TMemTableEh;
    btnSave: TButton;
    actClipPast: TAction;
    miClipPast: TMenuItem;
    btnClipPast: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure pmgSaveSelectionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure FormCreate(Sender: TObject);
    procedure dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure actClipPastExecute(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure mtUnitsNewRecord(DataSet: TDataSet);
    procedure actGenerateExecute(Sender: TObject);
    procedure dbGridColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbGridColumns1GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
    fMatDocID: Integer;
    fMaterialID: Integer;
    fRowID: Integer;
    FRecordCount: Integer;
    function GetCount: Integer;
    procedure OpenDataset();
    function SaveUnits(): Boolean;
    function GenUNITS: Boolean;
  public
    property MatDocID: Integer read fMatDocID write fMatDocID;
    property MaterialID: Integer read fMaterialID write fMaterialID;
    property RowID: Integer read fRowID write fRowID;
    property UnitsCount: Integer read FRecordCount;
  end;

function InputUnits(const aDocID: Integer; const aMatID: Integer; const aRowID: Integer;
  const ReadOnly: Boolean = False): Integer;

implementation

uses
  DM, MAIN, AtrStrUtils, CnBigNumber,
  System.StrUtils, Vcl.Clipbrd, Vcl.Dialogs;

{$R *.dfm}

function InputUnits(const aDocID: Integer; const aMatID: Integer; const aRowID: Integer;
  const ReadOnly: Boolean = False): Integer;
var
  mfu: TMatDocUnitForm;
begin
  Result := -1;
  mfu := TMatDocUnitForm.Create(Application);
  try
    mfu.MatDocID := aDocID;
    mfu.MaterialID := aMatID;
    mfu.RowID := aRowID;
    mfu.pnlEdit.Visible := not ReadOnly;
    mfu.btnSave.Visible := not ReadOnly;
    if mfu.ShowModal = mrOk then
      if not ReadOnly then
        Result := mfu.UnitsCount;
  finally
    mfu.free;
  end;
end;

  function HasCyrChar(S: String): Boolean;
  const
    rus: string = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
  var
    p, i: Integer;
  begin
    Result := false;
    if (Copy(S, 1, 6) = 'ПРОДАН') then
      exit;

    for i := 1 to Length(S) do
    begin
      p := Pos(S[i], rus);
      if p > 1 then
      begin
        Result := True;
        Break;
      end;
    end;
  end;

procedure TMatDocUnitForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRecordCount := mtUnits.RecordCount;
  mtUnits.Close;
  Action := caFree;
end;

procedure TMatDocUnitForm.OpenDataset;
begin
  dsDMUnits.ParamByName('doc_id').AsInteger := fMatDocID;
  dsDMUnits.ParamByName('mat_id').AsInteger := fMaterialID;
  dsDMUnits.ParamByName('id').AsInteger := fRowID;
  dsDMUnits.Open;
  if not mtUnits.Active then
    mtUnits.Open;
  mtUnits.DisableControls;
  mtUnits.EmptyTable;
  while not dsDMUnits.EOF do
  begin
    mtUnits.Append;
    mtUnits['Doc_Id'] := fMatDocID;
    mtUnits['M_Id'] := fMaterialID;
    mtUnits['Id'] := fRowID;
    mtUnits['Serial'] := dsDMUnits['Serial'];
    if not dsDMUnits.FieldByName('Mac').IsNull then
      mtUnits['Mac'] := ValidateMAC(dsDMUnits['Mac']);
    if not dsDMUnits.FieldByName('Notice').IsNull then
      mtUnits['Notice'] := dsDMUnits['Notice'];
    mtUnits.Post;
    dsDMUnits.Next;
  end;
  dsDMUnits.Close;
  mtUnits.First;
  mtUnits.EnableControls;
end;

procedure TMatDocUnitForm.actClipPastExecute(Sender: TObject);
var
  i: Integer;
  s: String;
  sL: TStringList;
  Delimiters: String;
  sa: TStringDynArray;
begin
  if not Clipboard.HasFormat(CF_TEXT) then
    Exit;

  s := Clipboard.AsText;
  // разделитель ; или табуляция
  Delimiters := ';' + Char(9);

  if not mtUnits.Active then
    mtUnits.Open;
  mtUnits.DisableControls;
  mtUnits.EmptyTable;

  sL := TStringList.Create;
  try
    sL.Text := s;
    for i := 0 to sL.Count - 1 do
    begin
      s := sL[i];
      sa := SplitString(s, Delimiters);
      if Length(sa) > 0 then
      begin
        mtUnits.Append;
        mtUnits['Doc_Id'] := fMatDocID;
        mtUnits['M_Id'] := fMaterialID;
        mtUnits['Id'] := fRowID;
        mtUnits['Serial'] := sa[0];
        if Length(sa) > 1 then
        begin
          mtUnits['Mac'] := ValidateMAC(sa[1]);
          if Length(sa) > 2 then
            mtUnits['Notice'] := sa[2];
        end;
        mtUnits.Post;
      end;
    end;
  finally
    sL.free;
  end;
  mtUnits.First;
  mtUnits.EnableControls;
end;

procedure TMatDocUnitForm.actGenerateExecute(Sender: TObject);
begin
  GenUNITS;
end;

procedure TMatDocUnitForm.btnDeleteClick(Sender: TObject);
begin
  if not(mtUnits.Active or (mtUnits.RecordCount = 0)) then
    Exit;

  if mtUnits.FieldByName('SERIAL').IsNull then
    Exit;

  if Application.MessageBox(PWideChar(format(rsDeleteRecord, [mtUnits.FieldByName('SERIAL').AsString])),
    PWideChar(rsDeleteFromDoc), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    mtUnits.Delete;
  end;

  FRecordCount := mtUnits.RecordCount;
end;

procedure TMatDocUnitForm.btnSaveClick(Sender: TObject);
begin
  if SaveUnits() then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

function TMatDocUnitForm.SaveUnits(): Boolean;
begin
  dsDMUnits.ParamByName('doc_id').AsInteger := fMatDocID;
  dsDMUnits.ParamByName('mat_id').AsInteger := fMaterialID;
  dsDMUnits.ParamByName('id').AsInteger := fRowID;
  dsDMUnits.Open;
  while not dsDMUnits.EOF do
    dsDMUnits.Delete;

  if mtUnits.Active then
  begin
    mtUnits.DisableControls;
    mtUnits.First;
    while not mtUnits.EOF do
    begin
      dsDMUnits.Append;
      dsDMUnits['Doc_Id'] := fMatDocID;
      dsDMUnits['M_Id'] := fMaterialID;
      dsDMUnits['Id'] := fRowID;
      dsDMUnits['Serial'] := mtUnits['Serial'];
      if not mtUnits.FieldByName('Mac').IsNull then
        dsDMUnits['Mac'] := ValidateMAC(mtUnits['Mac']);
      if not mtUnits.FieldByName('Notice').IsNull then
        dsDMUnits['Notice'] := mtUnits['Notice'];
      dsDMUnits.Post;
      mtUnits.Next;
    end;
  end;
  dsDMUnits.Close;
  mtUnits.EnableControls;

  dsDMUnits.Close;
  Result := True;
end;

procedure TMatDocUnitForm.srcDataSourceStateChange(Sender: TObject);
begin
  if mtUnits.State = dsEdit then
  begin
    mtUnits['ERROR'] := '';
  end;
end;

procedure TMatDocUnitForm.btnSaveLinkClick(Sender: TObject);
begin
  if (not mtUnits.Active) then
    OpenDataset;

  if edtSERIAL.Text.IsEmpty then
    Exit;

  if not edtMAC.Text.IsEmpty then
    edtMAC.Text := ValidateMAC(edtMAC.Text);
  if edCount.Text.IsEmpty then
  begin
    if (mtUnits.State in [dsEdit]) then
    begin
      //
      mtUnits.Post;
    end
    else
    begin
      mtUnits.Append;
      mtUnits['Doc_Id'] := fMatDocID;
      mtUnits['M_Id'] := fMaterialID;
      mtUnits['Serial'] := edtSERIAL.Text;
      if not edtMAC.Text.IsEmpty then
        mtUnits['Mac'] := edtMAC.Text;
      mtUnits['Notice'] := mmoNotice.Lines.Text;
      mtUnits.Post;
    end;
  end
  else
  begin
    actGenerate.Execute;
    edCount.Text := '';
  end;
  FRecordCount := mtUnits.RecordCount;
end;

procedure TMatDocUnitForm.FormCreate(Sender: TObject);
begin
  fMatDocID := -1;
  fMaterialID := -1;
  FRecordCount := 0;
end;

procedure TMatDocUnitForm.FormShow(Sender: TObject);
var
  i, c: Integer;
  Font_size: Integer;
  Font_name, s: string;
  Row_height: Integer;
begin
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
      for c := 0 to (Components[i] as TDBGridEh).Columns.Count - 1 do
      begin
        s := (Components[i] as TDBGridEh).Columns[c].FieldName.toUpper;
        if (s.Contains('NOTICE') or s.Contains('DESCRIPTION')) and
          (not Assigned((Components[i] as TDBGridEh).Columns[c].OnGetCellParams)) then
          (Components[i] as TDBGridEh).Columns[c].OnGetCellParams := dbGridColumnsGetCellParams
      end;
    end;
  end;

  OpenDataset;
end;

procedure TMatDocUnitForm.pmgCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;
begin
  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
      begin
        // Экспорт информации
        if (dmMain.AllowedAction(rght_Export)) then
          DBGridEh_DoCopyAction(dbg, False);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TMatDocUnitForm.pmgSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin
  inherited;
  // Экспорт информации
  if (not dmMain.AllowedAction(rght_Export)) then
    Exit;

  A4MainForm.SaveDialog.FileName := rsTable;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then
    begin
      case A4MainForm.SaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5:
          begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;
end;

procedure TMatDocUnitForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TMatDocUnitForm.dbGridColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if EditMode then
    exit;

  if HasCyrChar(Params.Text) then
    Params.Background := clYellow;
end;

procedure TMatDocUnitForm.dbGridColumns1GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if EditMode then
    exit;

  if HasCyrChar(Params.Text) then
    Params.Background := clYellow;
end;

procedure TMatDocUnitForm.dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, ' ', [rfReplaceAll]);
end;

procedure TMatDocUnitForm.dbGridDblClick(Sender: TObject);
begin
  //
end;

procedure TMatDocUnitForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (not mtUnits.FieldByName('ERROR').IsNull) and (mtUnits['ERROR'] <> '') then
    Background := clRed;
end;

procedure TMatDocUnitForm.dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
var
  i: Integer;
begin
  if (DataCol = 1) and (Row = 0) then
  begin
    i := (Sender as TDBGridEh).SelectedRows.Count;
    if i > 1 then
      Text := IntToStr(i);
  end;
end;

function TMatDocUnitForm.GetCount: Integer;
begin
  Result := FRecordCount;
end;

procedure TMatDocUnitForm.mtUnitsNewRecord(DataSet: TDataSet);
begin
  mtUnits['ERROR'] := '';
end;

function TMatDocUnitForm.GenUNITS: Boolean;
var
  Count: Integer;
  t, m, i: Integer;
  mac, serial, s, e: String;
  StartMac: TCnBigNumber;
  StartSerial: TCnBigNumber;

  function formatAsMac(const bnMAC: TCnBigNumber): String;
  var
    hex: string;
  begin
    hex := BigNumberToHex(bnMAC);
    Result := Copy(hex, 1, 2) + ':' + Copy(hex, 3, 2) + ':' + Copy(hex, 5, 2) + ':' + Copy(hex, 7, 2) + ':' +
      Copy(hex, 9, 2) + ':' + Copy(hex, 11, 2);
  end;

begin
  if (not mtUnits.Active) then
    OpenDataset;

  if edtSERIAL.Text.IsEmpty then
    Exit;

  Count := 1;
  Result := False;

  StartSerial := TCnBigNumber.Create;
  BigNumberClear(StartSerial);
  StartMac := TCnBigNumber.Create;
  BigNumberClear(StartMac);

  if not TryStrToInt(edCount.Value, Count) then
    Count := 1;

  serial := edtSERIAL.Text.Trim;
  if not serial.IsEmpty then
  begin
    StartSerial.SetDec(serial);
    if not BigNumberSubWord(StartSerial, 1) then
      serial := '';
  end;

  mac := ValidateMAC(edtMAC.Text);
  mac := StringReplace(mac, ':', '', [rfReplaceAll]);
  if not mac.IsEmpty then
  begin
    StartMac.SetHex(mac);
    if not BigNumberSubWord(StartMac, 1) then
      mac := '';
  end;
  // для начала уменьшим на единицу. потом будем накидывать
  // избавляет от лишней логики
  if (MessageDlg(format(rsCREATE_DIGIT_CARDS, [edCount.Value, edtSERIAL.Text]), mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  begin
    mtUnits.DisableControls;
    for i := 0 to Count - 1 do
    begin
      mtUnits.Append;
      if (not serial.IsEmpty) and (BigNumberAddWord(StartSerial, 1)) then
        mtUnits.FieldByName('SERIAL').AsString := StartSerial.DecString
      else
        mtUnits.FieldByName('SERIAL').AsString := edtSERIAL.Text;
      if (not mac.IsEmpty) and (BigNumberAddWord(StartMac, 1)) then
        mtUnits.FieldByName('MAC').AsString := formatAsMac(StartMac);
      mtUnits.FieldByName('NOTICE').AsString := mmoNotice.Lines.Text;
      mtUnits.Post;
    end;
    mtUnits.First;
    mtUnits.EnableControls;
    Result := True;
  end;
end;

end.
