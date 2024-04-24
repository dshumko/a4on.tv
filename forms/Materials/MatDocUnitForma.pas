unit MatDocUnitForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Types, System.UITypes, System.Classes, System.SysUtils, System.Actions,
  Data.DB,
  Vcl.Menus, Vcl.ActnList, Vcl.Controls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Forms, Vcl.Graphics, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,
  DBGridEhGrouping, DynVarsEh, DBGridEh, FIBDataSet, GridsEh, EhLibFIB, DBGridEhFindDlgs, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider, DBLookupEh, EhLibVCL, DBCtrlsEh, PrjConst,
  Vcl.Mask, FIBDatabase, pFIBDatabase, pFIBDataSet, MemTableDataEh,
  MemTableEh, amSplitter;

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
    procedure dbGridColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbGridColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
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
  System.StrUtils, System.Math, Vcl.Clipbrd, Vcl.Dialogs;

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
  Result := False;
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
  S: String;
  sL: TStringList;
  Delimiters: String;
  sa: TStringDynArray;
begin
  if not Clipboard.HasFormat(CF_TEXT) then
    exit;

  S := Clipboard.AsText;
  // разделитель ; или табуляция
  Delimiters := ';' + Char(9);

  if not mtUnits.Active then
    mtUnits.Open;
  mtUnits.DisableControls;
  mtUnits.EmptyTable;

  sL := TStringList.Create;
  try
    sL.Text := S;
    for i := 0 to sL.Count - 1 do
    begin
      S := sL[i];
      sa := SplitString(S, Delimiters);
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
    exit;

  if mtUnits.FieldByName('SERIAL').IsNull then
    exit;

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
    exit;

  if not edtMAC.Text.IsEmpty then
    edtMAC.Text := ValidateMAC(edtMAC.Text);

  actGenerate.Execute;
  edCount.Text := '';

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
  Font_name, S: string;
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
        S := (Components[i] as TDBGridEh).Columns[c].FieldName.toUpper;
        if (S.Contains('NOTICE') or S.Contains('DESCRIPTION')) and
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
        A4MainForm.CopyDBGrid(dbg);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TMatDocUnitForm.pmgSaveSelectionClick(Sender: TObject);
begin
  inherited;

  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TMatDocUnitForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TMatDocUnitForm.dbGridColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if EditMode then
    exit;

  if HasCyrChar(Params.Text) then
    Params.Background := clYellow;
end;

procedure TMatDocUnitForm.dbGridColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
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
  i: Integer;
  mac, serial, S: String;
  biStartMac: TCnBigNumber;
  biStartSerial: TCnBigNumber;
  itsBigInt: Boolean;

  digits: Integer;
  pref, newN: string;
  exitRepeat: Boolean;
  StartN: int64;

  function lpad(const S: string; const n: Integer): string;
  begin
    Result := S;
    while Length(Result) < n do
      Result := '0' + Result;
  end;

  function rpad(const S: string; const n: Integer): string;
  var
    l: Integer;
  begin
    Result := S;
    l := Length(Result);
    if l < n then
    begin
      while Length(Result) < n do
        Result := Result + '0';
    end
    else
      Result := Result.Substring(l - n);
  end;

  function formatAsMac(const bnMAC: TCnBigNumber): String;
  var
    hex: string;
  begin
    hex := BigNumberToHex(bnMAC);
    Result := Copy(hex, 1, 2) + ':' + Copy(hex, 3, 2) + ':' + Copy(hex, 5, 2) + ':' + Copy(hex, 7, 2) + ':' +
      Copy(hex, 9, 2) + ':' + Copy(hex, 11, 2);
  end;

  function AddSum(const card: string): string;
  var
    i, sum, j: Integer;
    S, r, p, o: string;
  begin
    Result := card;
    if not card.toUpper.Contains('[S') then
      exit;

    i := Pos('[S', card.toUpper);
    j := Pos(']', card, i + 2);
    r := Copy(card, i, j - i + 1);
    p := LeftStr(card, i - 1);
    o := RightStr(card, card.Length - j);
    sum := 0;
    for i := 1 to p.Length do
    begin
      if TryStrToInt(p[i], j) then
        sum := sum + j
    end;
    for i := 1 to o.Length do
    begin
      if TryStrToInt(o[i], j) then
        sum := sum + j
    end;
    S := r.toUpper.Replace('[', '').Replace(']', '').Replace('S', '');
    if not TryStrToInt(S, i) then
      i := 0;

    Result := p + rpad(IntToStr(sum), i) + o;
  end;

begin
  Result := False;
  if (not mtUnits.Active) then
    OpenDataset;

  if edtSERIAL.Text.IsEmpty then
    exit;

  Count := 1;
  Result := False;
  itsBigInt := False;
  digits := 0;

  biStartSerial := TCnBigNumber.Create;
  BigNumberClear(biStartSerial);
  biStartMac := TCnBigNumber.Create;
  BigNumberClear(biStartMac);

  if (edCount.Text.IsEmpty) or (not TryStrToInt(edCount.Value, Count)) then
    Count := 1;

  serial := edtSERIAL.Text.Trim;
  // проверим может это цифровой серийник
  if (Count > 1) and (not serial.IsEmpty) then
  begin
    biStartSerial.SetDec(AnsiString(serial));
    S := UpperCase(biStartSerial.DecString);
    itsBigInt := (S = UpperCase(serial));
    if (itsBigInt) and (not BigNumberSubWord(biStartSerial, 1)) then
      serial := '';
  end;

  // не число
  if (Count > 1) and (not itsBigInt) then
  begin
    // попытка преобразовать номер в число
    // если не удалось, попытаемся вырезать часть кода и в число
    i := 0;
    repeat
      i := i + 1;
      digits := Trunc(Log10(Count)) + i;
      newN := RightStr(serial, digits);
      pref := LeftStr(serial, Length(serial) - digits);
      if TryStrToInt64(newN, StartN) then
        exitRepeat := not(Length(IntToStr(StartN + Count)) > digits)
      else
      begin
        StartN := -1;
        exitRepeat := True;
      end;
    until (exitRepeat);
  end;

  mac := ValidateMAC(edtMAC.Text);
  if (Count > 1) then
  begin
    mac := StringReplace(mac, ':', '', [rfReplaceAll]);
    if (not mac.IsEmpty) then
    begin
      biStartMac.SetHex(AnsiString(mac));
      if not BigNumberSubWord(biStartMac, 1) then
        mac := '';
    end;
  end;
  // для начала уменьшим на единицу. потом будем накидывать
  // избавляет от лишней логики
  if (Count = 1) or // если много то спрсим
    (MessageDlg(format(rsCREATE_DIGIT_CARDS, [edCount.Value, edtSERIAL.Text]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
  begin
    mtUnits.DisableControls;
    for i := 0 to Count - 1 do
    begin
      mtUnits.Append;
      if (Count > 1) then
      begin
        if itsBigInt then
        begin
          if (BigNumberAddWord(biStartSerial, 1)) then
            newN := biStartSerial.DecString;
        end
        else
        begin
          newN := pref + lpad(IntToStr(StartN + i), digits);
          newN := AddSum(newN);
        end;
        if (not mac.IsEmpty) and (BigNumberAddWord(biStartMac, 1)) then
          mtUnits.FieldByName('MAC').AsString := formatAsMac(biStartMac);
      end
      else
      begin
        newN := edtSERIAL.Text;
        if (not mac.IsEmpty) then
          mtUnits.FieldByName('MAC').AsString := mac;
      end;
      mtUnits.FieldByName('SERIAL').AsString := newN;
      mtUnits.FieldByName('NOTICE').AsString := mmoNotice.Lines.Text;
      mtUnits.Post;
    end;
    mtUnits.First;
    mtUnits.EnableControls;
    Result := True;
  end;
end;

end.
