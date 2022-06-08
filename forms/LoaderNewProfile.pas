unit LoaderNewProfile;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls, Vcl.Mask, Vcl.Menus, Vcl.DBCtrls,
  Vcl.DBGrids, Vcl.ComCtrls,
  RxToolEdit, DBCtrlsEh, DBGridEh, DBLookupEh, AtrStrUtils, VKDBFDataSet, MemTableDataEh, MemTableEh, PrjConst, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, CnButtons, RxLookup, FIBDataSet, pFIBDataSet;

type
  TLoaderProfileNew = class(TForm)
    pnlBtns: TPanel;
    btnDel: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    pgcFileFormats: TPageControl;
    ts1: TTabSheet;
    pnl2: TPanel;
    sgFile: TStringGrid;
    grpFileHead: TGroupBox;
    stgHead: TStringGrid;
    pnlHeadHead: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    edtHeaderFrom: TDBNumberEditEh;
    edtHeaderTo: TDBNumberEditEh;
    edtHNc: TDBNumberEditEh;
    edtheadSumCol: TDBNumberEditEh;
    edtheadDateCol: TDBNumberEditEh;
    edtheadNumLine: TDBNumberEditEh;
    edtheadSumLine: TDBNumberEditEh;
    edtheadDateLine: TDBNumberEditEh;
    edName1HeadSprt: TDBEditEh;
    edName1HeadRemCh: TDBEditEh;
    edName1headDateFmt: TDBEditEh;
    dbchkHeaderExist: TDBCheckBox;
    grpFileData: TGroupBox;
    stgData: TStringGrid;
    pnlHeadData: TScrollBox;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    edtDataTo: TDBNumberEditEh;
    edtDataFrom: TDBNumberEditEh;
    grp1: TGroupBox;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    edtDATEFMT: TDBEditEh;
    dbchckbxhDataRemZero: TDBCheckBoxEh;
    edtDataRemCh: TDBEditEh;
    edName1DataSprt: TDBEditEh;
    ts2: TTabSheet;
    pnl3: TPanel;
    grp2: TGroupBox;
    pnl4: TPanel;
    edt1: TEdit;
    grp3: TGroupBox;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    edName1DATEfmt1: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    memDBFFields: TMemTableEh;
    srcFieldName: TDataSource;
    src: TDataSource;
    ts3: TTabSheet;
    ts4: TTabSheet;
    lbl47: TLabel;
    lbl48: TLabel;
    DBNumberEditEh7: TDBNumberEditEh;
    edtACCOUNT: TDBEditEh;
    edtFIO: TDBEditEh;
    edtADRESS: TDBEditEh;
    edtSUMMA: TDBEditEh;
    edtDATE: TDBEditEh;
    edtEXTID: TDBEditEh;
    edtNOTICE: TDBEditEh;
    edtNOTICE1: TDBEditEh;
    edtHOUSE: TDBEditEh;
    edtKORP: TDBEditEh;
    edtFLAT: TDBEditEh;
    dbgrd1: TDBGrid;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo8: TRxDBLookupCombo;
    RxDBLookupCombo9: TRxDBLookupCombo;
    RxDBLookupCombo10: TRxDBLookupCombo;
    pnlTop: TPanel;
    lbl1: TLabel;
    edtProfile: TDBEditEh;
    lbl8: TLabel;
    cbFileFormat: TDBComboBoxEh;
    lbl2: TLabel;
    cbdbCodePage: TDBComboBoxEh;
    edtFileExt: TDBEditEh;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    edtFilesDir: TDBEditEh;
    edtArhDir: TDBEditEh;
    pnlProfilePay: TPanel;
    lbl6: TLabel;
    lcbPaymentSrc: TDBLookupComboboxEh;
    chkDataRemZero1: TDBCheckBoxEh;
    lbl5: TLabel;
    edtName1DecimalSprt: TDBEditEh;
    dsFileFormats: TpFIBDataSet;
    srcFileFormats: TDataSource;
    pnlExample: TPanel;
    edtExample: TDBEditEh;
    lbl27: TLabel;
    dlgOpen: TOpenDialog;
    procedure HeaderInfoChange(Sender: TObject);
    procedure DataInfoChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure dbchkHeaderExistClick(Sender: TObject);
    procedure cbFileFormatChange(Sender: TObject);
    procedure DBFAfterClose(DataSet: TDataSet);
    procedure DBFAfterOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtACCOUNTEnter(Sender: TObject);
    procedure edtExampleChange(Sender: TObject);
    procedure edtExampleEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dsFileFormatsNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FileStrings: TStringList;
    DBF: TVKDBFNTX;
    procedure initGrid(SG: TStringGrid; const Rows: Integer; const sa: TStringArray);
    procedure ReadTabFile;
    procedure ReadHeaderFile;
    procedure ParseFile(const FileName: string);
    procedure ShowGridColumn(SG: TStringGrid; const aCol: Integer);
    procedure ClearGridColumn(SG: TStringGrid);
  public
    { Public declarations }
  end;

procedure EditProfile(const ProfileName: string = ''; const ProfileType: Integer = 0);

implementation

uses
  MAIN, WorkWithGrids;

{$R *.dfm}

procedure EditProfile(const ProfileName: string = ''; const ProfileType: Integer = 0);
begin
  with TLoaderProfileNew.Create(Application) do begin
    dsFileFormats.ParamByName('PROFILE').Value := ProfileName;
    dsFileFormats.Open;
    if ProfileName = '' then begin
      dsFileFormats.Insert;
      dsFileFormats.FieldByName('PROFTYPE').Value := ProfileType;      
    end
    else begin
      dsFileFormats.Edit;
    end;

    ShowModal;
  end;
end;

procedure TLoaderProfileNew.btnCancelClick(Sender: TObject);
begin
  dsFileFormats.Cancel;
end;

procedure TLoaderProfileNew.btnDelClick(Sender: TObject);
begin
  if Application.MessageBox(PWideChar(rsLoaderProfileDelete), PWideChar(rsConfirm),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then begin
    if dsFileFormats.State = dsInsert then
      dsFileFormats.Cancel
    else begin
      if dsFileFormats.State = dsEdit then
        dsFileFormats.Cancel;
      dsFileFormats.Delete;
    end;
    ModalResult := mrCancel;
  end;
end;

procedure TLoaderProfileNew.btnOKClick(Sender: TObject);
begin
  if edtFilesDir.Text = '' then
    dsFileFormats.FieldByName('FileDir').Clear
  else begin
    dsFileFormats.FieldByName('FileDir').AsString := edtFilesDir.Text;
  end;
  if edtArhDir.Text = '' then
    dsFileFormats.FieldByName('ArchDir').Clear
  else
    dsFileFormats.FieldByName('ArchDir').AsString := edtArhDir.Text;
end;

procedure TLoaderProfileNew.FormCreate(Sender: TObject);
begin
  FileStrings := TStringList.Create;
  DBF := TVKDBFNTX.Create(Self);
  with DBF do begin
    Name := 'DBF';
    SetDeleted := False;
    FastPostRecord := False;
    LookupOptions := [];
    AfterOpen := DBFAfterOpen;
    AfterClose := DBFAfterClose;
    TrimInLocate := False;
    TrimCType := False;
    BufferSize := 4096;
    WaitBusyRes := 3000;
    CreateNow := False;
    DbfVersion := xBaseIII;
    LobBlockSize := 512;
    LockProtocol := lpClipperLock;
    LobLockProtocol := lpClipperLock;
  end;
  src.DataSet := DBF;
end;

procedure TLoaderProfileNew.FormDestroy(Sender: TObject);
begin
  if DBF.Active then
    DBF.Close;
  DBF.Free;
  FileStrings.Free;
end;

procedure TLoaderProfileNew.FormShow(Sender: TObject);
var
  i: Integer;
begin
  stgData.DefaultRowHeight := stgData.Canvas.TextHeight('Ig') + 3;
  for i := 0 to pgcFileFormats.PageCount - 1 do
    pgcFileFormats.Pages[i].TabVisible := False;
  if dsFileFormats.FieldByName('FileType').isNull then
    pgcFileFormats.ActivePageIndex := 0
  else
    pgcFileFormats.ActivePageIndex := dsFileFormats.FieldByName('FileType').AsInteger;

  if dsFileFormats.FieldByName('FileDir').isNull then
    edtFilesDir.Text := ''
  else
    edtFilesDir.Text := dsFileFormats.FieldByName('FileDir').AsString;

  if dsFileFormats.FieldByName('ArchDir').isNull then
    edtArhDir.Text := ''
  else
    edtArhDir.Text := dsFileFormats.FieldByName('ArchDir').AsString;
end;

procedure TLoaderProfileNew.cbFileFormatChange(Sender: TObject);
begin
  if (cbFileFormat.Text <> '') then begin
    pgcFileFormats.ActivePageIndex := cbFileFormat.Value;
    case cbFileFormat.Value of
      0:
        edtFileExt.Text := '*.txt';
      1:
        edtFileExt.Text := '*.dbf';
      2:
        edtFileExt.Text := '*.xls*';
      3:
        edtFileExt.Text := '*.xml';
    else
      edtFileExt.Text := '*.*';
    end;
  end;
end;

procedure TLoaderProfileNew.dbchkHeaderExistClick(Sender: TObject);
begin
  if dbchkHeaderExist.Checked then begin
    grpFileHead.Height := 165;
  end
  else begin
    grpFileHead.Height := 15;
  end;
end;

procedure TLoaderProfileNew.DBFAfterClose(DataSet: TDataSet);
begin
  memDBFFields.Close;
end;

procedure TLoaderProfileNew.DBFAfterOpen(DataSet: TDataSet);
var
  i: Integer;
begin
  if (not memDBFFields.Active) then
    memDBFFields.Open;
  memDBFFields.EmptyTable;
  for i := 0 to DBF.FieldCount - 1 do begin
    memDBFFields.Append;
    memDBFFields['name'] := DBF.Fields[i].FieldName;
    memDBFFields.Post;
  end;
end;

procedure TLoaderProfileNew.edtACCOUNTEnter(Sender: TObject);
begin
  if not(Sender is TDBEditEh) then
    Exit;
  try
    ShowGridColumn(stgData, (Sender as TDBEditEh).Value);
  except
    ClearGridColumn(stgData);
  end;
end;

procedure TLoaderProfileNew.edtExampleChange(Sender: TObject);
begin
  if not FileExists(edtExample.Text) then
    Exit;

  if (cbdbCodePage.Text = '') then begin
    ShowMessage('Выберите кодировку файла!');
    cbdbCodePage.SetFocus;
    edtExample.Text := '';
    Exit;
  end;

  if cbFileFormat.Value = 0 then
    ShowFileInStringGrid(sgFile, edtExample.Text, cbdbCodePage.Value)

  else if cbFileFormat.Value = 1 then begin
    DBF.Close;
    DBF.OEM := (cbdbCodePage.Value = 0);
    DBF.DBFFileName := edtExample.Text;
    DBF.Open;
  end;
end;

procedure TLoaderProfileNew.ParseFile(const FileName: string);
begin
  if FileExists(FileName) then
    FileToStrings(FileName, FileStrings, dsFileFormats.FieldByName('CodePage').AsInteger);
end;

// Инициализация стринггрида

procedure TLoaderProfileNew.initGrid(SG: TStringGrid; const Rows: Integer; const sa: TStringArray);
var
  i: Integer;
begin
  i := length(sa);
  SG.ColCount := i + 1;
  i := Rows;
  SG.RowCount := i + 1;
  SG.FixedCols := 1;
  SG.FixedRows := 1;
  SG.ColWidths[0] := 30;
  for i := 1 to SG.RowCount - 1 do begin
    SG.RowHeights[i] := SG.Canvas.TextHeight('IWg') + 5;
    SG.Cells[0, i] := IntToStr(i);
  end;
  for i := 1 to SG.ColCount - 1 do begin
    SG.Cells[i, 0] := IntToStr(i);
    SG.ColWidths[i] := SG.Canvas.TextWidth(sa[i - 1]) + 10;
  end;
end;

// Чтение заголовка

procedure TLoaderProfileNew.ReadHeaderFile;
var
  i, b, j: Integer;
  S: string;
  Les_Strings: TStringList;
  sa: TStringArray;
  sprt: Char;
begin
  Les_Strings := TStringList.Create;
  try
    S := dsFileFormats['Headsprt'];

    if (UpperCase(S) = '\T') then
      sprt := #09
    else
      sprt := S[1];
    if dsFileFormats['HeaderFrom'] <= 0 then
      b := FileStrings.Count + dsFileFormats['HeaderFrom'] - 1
    else
      b := dsFileFormats['HeaderFrom'] - 1;

    if dsFileFormats['HeaderTo'] <= 0 then
      j := FileStrings.Count + dsFileFormats['HeaderTo'] - 1
    else
      j := dsFileFormats['HeaderTo'] - 1;

    for i := b to j do
      Les_Strings.Add(FileStrings[i]);

    S := Les_Strings[0];

    sa := Explode(sprt, S);
    initGrid(stgHead, Les_Strings.Count, sa);

    for i := 0 to Les_Strings.Count - 1 do begin
      S := Les_Strings[i];
      S := RemoveChars(S, dsFileFormats.FieldByName('HeadRemCh').AsString);
      sa := Explode(sprt, S);
      for j := 0 to length(sa) - 1 do begin
        stgHead.Cells[j + 1, i + 1] := sa[j];
      end;
    end;

  finally
    Les_Strings.Free;
  end;

end;

procedure TLoaderProfileNew.HeaderInfoChange(Sender: TObject);
begin
  if not FileExists(edtExample.Text) then
    Exit;
  ParseFile(edtExample.Text);
  try
    ReadHeaderFile;
  except
  end;
end;

procedure TLoaderProfileNew.DataInfoChange(Sender: TObject);
begin
  if not FileExists(edtExample.Text) then
    Exit;
  ParseFile(edtExample.Text);
  try
    ReadTabFile;
  except
  end;
end;

procedure TLoaderProfileNew.ReadTabFile;
var
  i, b, j: Integer;
  S: string;
  Les_Strings: TStringList;
  sa: TStringArray;
  sprt: Char;
begin
  Les_Strings := TStringList.Create;
  try
    S := dsFileFormats['DataSprt'];
    if (UpperCase(S) = '\T') then
      sprt := #09
    else
      sprt := S[1];
    if dsFileFormats['DataFrom'] <= 0 then
      b := FileStrings.Count + dsFileFormats['DataFrom'] - 1
    else
      b := dsFileFormats['DataFrom'] - 1;

    if dsFileFormats['DataTo'] <= 0 then
      j := FileStrings.Count + dsFileFormats['DataTo'] - 1
    else
      j := dsFileFormats['DataTo'] - 1;

    for i := b to j do
      Les_Strings.Add(FileStrings[i]);

    S := Les_Strings[0];
    sa := Explode(sprt, S);
    initGrid(stgData, Les_Strings.Count, sa);

    for i := 0 to Les_Strings.Count - 1 do begin
      S := Les_Strings[i];
      sa := Explode(sprt, S);
      for j := 0 to length(sa) - 1 do begin
        stgData.Cells[j + 1, i + 1] := sa[j];
      end;
    end;
  finally
    Les_Strings.Free;
  end;
end;

procedure TLoaderProfileNew.ShowGridColumn(SG: TStringGrid; const aCol: Integer);
var
  NewSel: TGridRect;
begin
  NewSel.Left := aCol;
  NewSel.Top := 0;
  NewSel.Right := aCol;
  NewSel.Bottom := SG.ColCount - 1;
  SG.Selection := NewSel;
end;

procedure TLoaderProfileNew.ClearGridColumn(SG: TStringGrid);
var
  NewSel: TGridRect;
begin
  NewSel.Left := 1;
  NewSel.Top := 1;
  NewSel.Right := 1;
  NewSel.Bottom := 1;
  SG.Selection := NewSel;
end;

procedure TLoaderProfileNew.edtExampleEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  dlgOpen.InitialDir := edtFilesDir.Text;
  dlgOpen.Filter := edtFileExt.Text;
  if dlgOpen.Execute then
    edtExample.Text := dlgOpen.FileName;
  Handled := True;
end;

procedure TLoaderProfileNew.dsFileFormatsNewRecord(DataSet: TDataSet);
begin
  dsFileFormats.FieldByName('filetype').Value := 0;
  dsFileFormats.FieldByName('codepage').Value := 0;
  dsFileFormats.FieldByName('paymentsrc').Value := 0;
  dsFileFormats.FieldByName('fileext').Value := '*.*';
  dsFileFormats.FieldByName('kopeyki').Value := 0;
  dsFileFormats.FieldByName('decimalsprt').Value := '.';
  dsFileFormats.FieldByName('headerexist').Value := 0;
  dsFileFormats.FieldByName('headsprt').Value := ';';
  dsFileFormats.FieldByName('headdatefmt').Value := 'DD/MM/YYYY';
  dsFileFormats.FieldByName('datasprt').Value := ';';
  dsFileFormats.FieldByName('dataremzero').Value := 0;
  dsFileFormats.FieldByName('datafrom').Value := 0;
  dsFileFormats.FieldByName('datato').Value := 0;
  dsFileFormats.FieldByName('datefmt').Value := 'DD/MM/YYYY';
end;

end.
