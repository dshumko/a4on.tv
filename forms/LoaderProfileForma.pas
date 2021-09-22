unit LoaderProfileForma;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, RxToolEdit, Mask, DBCtrlsEh, Menus,
  DBCtrls, DB, DBLookupEh, AtrStrUtils, DBGrids, ComCtrls,
  MemTableDataEh, MemTableEh, PrjConst, DBGridEh, VKDBFDataSet;

type

  TLoaderProfileForm = class(TForm)
    grpProfHead: TGroupBox;
    pnlBtns: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Panel1: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl2: TLabel;
    Label1: TLabel;
    DirFiles: TDirectoryEdit;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Label13: TLabel;
    srcmdsFileFormat: TDataSource;
    edtProfile: TDBEditEh;
    edtFileExt: TDBEditEh;
    cbdbCodePage: TDBComboBoxEh;
    cbbPaymentSrc: TDBLookupComboboxEh;
    dbchckbxhDataRemZero1: TDBCheckBoxEh;
    lbl5: TLabel;
    dbedtHeadRemCh1: TDBEditEh;
    btnDel: TButton;
    lbl8: TLabel;
    cbFileFormat: TDBComboBoxEh;
    pgcFileFormats: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
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
    lbl6: TLabel;
    lbl7: TLabel;
    edtHeaderFrom: TDBNumberEditEh;
    edtHeaderTo: TDBNumberEditEh;
    edtHNc: TDBNumberEditEh;
    edtheadSumCol: TDBNumberEditEh;
    edtheadDateCol: TDBNumberEditEh;
    edtheadNumLine: TDBNumberEditEh;
    edtheadSumLine: TDBNumberEditEh;
    edtheadDateLine: TDBNumberEditEh;
    dbedtHeadSprt: TDBEditEh;
    dbedtHeadRemCh: TDBEditEh;
    dbedtheadDateFmt: TDBEditEh;
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
    edtDataRemCh: TEdit;
    grp1: TGroupBox;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtACCOUNT: TDBNumberEditEh;
    edtFIO: TDBNumberEditEh;
    edtADRESS: TDBNumberEditEh;
    edtSUMMA: TDBNumberEditEh;
    edtDATE: TDBNumberEditEh;
    dbedtheadDateFmt1: TDBEditEh;
    dbchckbxhDataRemZero: TDBCheckBoxEh;
    dbedtHeadRemCh2: TDBEditEh;
    dbedtHeadSprt1: TDBEditEh;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    lbl4: TLabel;
    feExample: TFilenameEdit;
    src: TDataSource;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit4: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    srcFieldName: TDataSource;
    lcbDBF_FIO: TDBLookupComboboxEh;
    lcbDBF_ADRES: TDBLookupComboboxEh;
    lcbDBF_SUM: TDBLookupComboboxEh;
    lcbDBF_date: TDBLookupComboboxEh;
    lcbDBF_account: TDBLookupComboboxEh;
    DirArch: TDirectoryEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lcbDBFPAYMENT_NO: TDBLookupComboboxEh;
    Label5: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    Label6: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    Label7: TLabel;
    DBNumberEditEh3: TDBNumberEditEh;
    Label8: TLabel;
    DBNumberEditEh4: TDBNumberEditEh;
    Label9: TLabel;
    DBNumberEditEh5: TDBNumberEditEh;
    Label10: TLabel;
    lcbDBF_HOUSE: TDBLookupComboboxEh;
    Label11: TLabel;
    lcbDBF_FLAT: TDBLookupComboboxEh;
    Label12: TLabel;
    lcbDBF_NOTICE: TDBLookupComboboxEh;
    Label14: TLabel;
    lcbDBF_KORP: TDBLookupComboboxEh;
    Label15: TLabel;
    DBNumberEditEh6: TDBNumberEditEh;
    memDBFFields: TMemTableEh;
    lbl27: TLabel;
    edtNOTICE1: TDBNumberEditEh;
    Label16: TLabel;
    lcbEXT_ID: TDBLookupComboboxEh;
    spl1: TSplitter;
    Splitter1: TSplitter;
    tsXLS: TTabSheet;
    chkNotLoadLast: TDBCheckBoxEh;
    chkSkipEmpDate: TDBCheckBoxEh;
    Label17: TLabel;
    edtheadSrcLine: TDBNumberEditEh;
    edtheadSrcCol: TDBNumberEditEh;
    procedure btnDelClick(Sender: TObject);
    procedure HeaderInfoChange(Sender: TObject);
    procedure dataInfoChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbchkHeaderExistClick(Sender: TObject);
    procedure cbFileFormatChange(Sender: TObject);
    procedure DBFAfterClose(DataSet: TDataSet);
    procedure DBFAfterOpen(DataSet: TDataSet);
    procedure DirFilesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtACCOUNTChange(Sender: TObject);
    procedure edtACCOUNTEnter(Sender: TObject);
    procedure feExampleChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FileStrings: TStringList;
    dbf: TVKDBFNTX;
    procedure initGrid(SG: TStringGrid; const Rows: Integer; const sa: TStringArray);
    procedure ReadTabFile;
    procedure ReadHeaderFile;
    procedure ParseFile(const FileName: string);
    procedure LoadDBF;
    procedure ShowGridColumn(SG: TStringGrid; const aCol: Integer);
    procedure ClearGridColumn(SG: TStringGrid);
  public
    { Public declarations }
    procedure AddFiledsToMemDS;
  end;

function EditProfile(const ProfName: string): Boolean;

implementation

uses
  WorkWithGrids, LoaderReestrForma, StrUtils;

{$R *.dfm}

function EditProfile(const ProfName: string): Boolean;
var
  LoaderProfileForm: TLoaderProfileForm;
  insert: Boolean;
begin
  result := false;
  insert := (ProfName = 'AUTONAMEFORINSERTNEWPROF');
  LoaderProfileForm := TLoaderProfileForm.Create(Application);
  try
    if insert then
      LoaderReestrForm.mdsFileFormats.insert
    else
    begin
      if LoaderReestrForm.mdsFileFormats.Locate('Profile', ProfName, [loCaseInsensitive]) then
      begin
        LoaderReestrForm.mdsFileFormats.Edit;
        LoaderProfileForm.AddFiledsToMemDS;
      end;
    end;
    LoaderProfileForm.dbchkHeaderExistClick(Application);
    if (LoaderReestrForm.mdsFileFormats.State in [dsEdit, dsInsert]) then
      LoaderProfileForm.ShowModal;
  finally
    LoaderProfileForm.Free;
  end;
end;

procedure TLoaderProfileForm.btnDelClick(Sender: TObject);
begin
  if Application.MessageBox(PWideChar(rsLoaderProfileDelete), PWideChar(rsConfirm),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
  begin
    if (LoaderReestrForm.mdsFileFormats.State in [dsEdit, dsInsert]) then
      LoaderReestrForm.mdsFileFormats.Post;
    if LoaderReestrForm.mdsFileFormats.RecordCount > 0 then
      LoaderReestrForm.mdsFileFormats.Delete;
  end;
  ModalResult := mrCancel;
end;

procedure TLoaderProfileForm.ShowGridColumn(SG: TStringGrid; const aCol: Integer);
var
  NewSel: TGridRect;
begin
  NewSel.Left := aCol;
  NewSel.Top := 0;
  NewSel.Right := aCol;
  NewSel.Bottom := SG.ColCount - 1;
  SG.Selection := NewSel;
end;

procedure TLoaderProfileForm.ClearGridColumn(SG: TStringGrid);
var
  NewSel: TGridRect;
begin
  NewSel.Left := 1;
  NewSel.Top := 1;
  NewSel.Right := 1;
  NewSel.Bottom := 1;
  SG.Selection := NewSel;
end;

procedure TLoaderProfileForm.LoadDBF;
begin
  dbf.Close;
  dbf.OEM := (cbdbCodePage.Value = 0);
  dbf.DBFFileName := AnsiString(feExample.FileName);
  dbf.Open;
end;

procedure TLoaderProfileForm.HeaderInfoChange(Sender: TObject);
begin
  if not FileExists(feExample.FileName) then
    Exit;
  ParseFile(feExample.FileName);
  try
    ReadHeaderFile;
  except
  end;
end;

procedure TLoaderProfileForm.dataInfoChange(Sender: TObject);
begin
  if not FileExists(feExample.FileName) then
    Exit;
  ParseFile(feExample.FileName);
  try
    ReadTabFile;
  except
  end;
end;

procedure TLoaderProfileForm.btnCancelClick(Sender: TObject);
begin
  LoaderReestrForm.mdsFileFormats.Cancel;
end;

procedure TLoaderProfileForm.btnOkClick(Sender: TObject);
begin
  if edtProfile.Text = '' then
  begin
    edtProfile.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

  if not(LoaderReestrForm.mdsFileFormats.State in [dsInsert, dsEdit]) then
  begin
    ModalResult := mrOk;
    Exit;
  end;

  if DirFiles.Text = '' then
    LoaderReestrForm.mdsFileFormats.FieldByName('FileDir').Clear
  else
  begin
    LoaderReestrForm.mdsFileFormats.FieldByName('FileDir').AsString := DirFiles.Text;
  end;

  if DirArch.Text = '' then
    LoaderReestrForm.mdsFileFormats.FieldByName('ArchDir').Clear
  else
    LoaderReestrForm.mdsFileFormats.FieldByName('ArchDir').AsString := DirArch.Text;

  LoaderReestrForm.mdsFileFormats.Post;
  ModalResult := mrOk;
end;

procedure TLoaderProfileForm.dbchkHeaderExistClick(Sender: TObject);
begin
  if dbchkHeaderExist.Checked then
  begin
    grpFileHead.Height := 165;
  end
  else
  begin
    grpFileHead.Height := 16;
  end;
end;

procedure TLoaderProfileForm.cbFileFormatChange(Sender: TObject);
var
  i: Integer;
begin
  if TryStrToInt(cbFileFormat.Value, i) then
    pgcFileFormats.ActivePageIndex := i;
end;

procedure TLoaderProfileForm.DBFAfterClose(DataSet: TDataSet);
begin
  memDBFFields.Close;
end;

procedure TLoaderProfileForm.DBFAfterOpen(DataSet: TDataSet);
var
  i: Integer;
begin
  memDBFFields.Open;
  memDBFFields.EmptyTable;
  for i := 0 to dbf.FieldCount - 1 do
  begin
    memDBFFields.Append;
    memDBFFields['name'] := dbf.Fields[i].FieldName;
    memDBFFields.Post;
  end;
end;

procedure TLoaderProfileForm.DirFilesChange(Sender: TObject);
begin
  feExample.InitialDir := DirFiles.Text;
end;

procedure TLoaderProfileForm.FormDestroy(Sender: TObject);
begin
  if dbf.Active then
    dbf.Close;
  dbf.Free;
  FileStrings.Free;
end;

procedure TLoaderProfileForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TLoaderProfileForm.FormCreate(Sender: TObject);
begin
  FileStrings := TStringList.Create;
  dbf := TVKDBFNTX.Create(Self);
  with dbf do
  begin
    Name := 'DBF';
    AccessMode.AccessMode := 18;
    AccessMode.OpenReadWrite := True;
    AccessMode.ShareExclusive := True;
    SetDeleted := false;
    FastPostRecord := false;
    LookupOptions := [];
    AfterOpen := DBFAfterOpen;
    AfterClose := DBFAfterClose;
    TrimInLocate := false;
    TrimCType := false;
    BufferSize := 4096;
    WaitBusyRes := 3000;
    CreateNow := false;
    DbfVersion := xBaseIII;
    LobBlockSize := 512;
    LockProtocol := lpClipperLock;
    LobLockProtocol := lpClipperLock;
  end;
  src.DataSet := dbf;
end;

procedure TLoaderProfileForm.ParseFile(const FileName: string);
begin
  if FileExists(FileName) then
    FileToStrings(FileName, FileStrings, LoaderReestrForm.mdsFileFormats['CodePage'], true);
end;

procedure TLoaderProfileForm.initGrid(SG: TStringGrid; const Rows: Integer; const sa: TStringArray);
var
  i: Integer;
begin
  i := length(sa);
  SG.ColCount := i + 1;
  if SG.ColCount > 1 then
    SG.FixedCols := 1;
  i := Rows;
  SG.RowCount := i + 1;
  SG.FixedRows := 1;
  SG.ColWidths[0] := 30;
  for i := 1 to SG.RowCount - 1 do
  begin
    SG.RowHeights[i] := SG.Canvas.TextHeight('IWg') + 5;
    SG.Cells[0, i] := IntToStr(i);
  end;
  for i := 1 to SG.ColCount - 1 do
  begin
    SG.Cells[i, 0] := IntToStr(i);
    SG.ColWidths[i] := SG.Canvas.TextWidth(sa[i - 1]) + 10;
  end;
end;

procedure TLoaderProfileForm.ReadTabFile;
var
  i, b, j: Integer;
  S: string;
  Les_Strings: TStringList;
  sa: TStringArray;
  sprt: Char;
begin
  Les_Strings := TStringList.Create;
  try
    S := LoaderReestrForm.mdsFileFormats['DataSprt'];
    if (AnsiUpperCase(S) = '\T') then
      sprt := #09
    else if (AnsiUpperCase(S) = '\_') then
      sprt := ' '
    else
      sprt := S[1];
    if LoaderReestrForm.mdsFileFormats['DataFrom'] <= 0 then
      b := FileStrings.Count + LoaderReestrForm.mdsFileFormats['DataFrom'] - 1
    else
      b := LoaderReestrForm.mdsFileFormats['DataFrom'] - 1;

    if LoaderReestrForm.mdsFileFormats['DataTo'] > FileStrings.Count then
    begin
      LoaderReestrForm.mdsFileFormats['DataTo'] := 0;
    end;

    if LoaderReestrForm.mdsFileFormats['DataTo'] <= 0 then
      j := FileStrings.Count + LoaderReestrForm.mdsFileFormats['DataTo'] - 1
    else
      j := LoaderReestrForm.mdsFileFormats['DataTo'] - 1;

    for i := b to j do
      Les_Strings.Add(FileStrings[i]);

    S := Les_Strings[0];
    sa := Explode(sprt, S);
    initGrid(stgData, Les_Strings.Count, sa);

    for i := 0 to Les_Strings.Count - 1 do
    begin
      S := Les_Strings[i];
      sa := Explode(sprt, S);
      for j := 0 to length(sa) - 1 do
      begin
        stgData.Cells[j + 1, i + 1] :=
          RemoveChars(sa[j], ReplaceStr(LoaderReestrForm.mdsFileFormats.FieldByName('DataRemCh').AsString, '\_', ' '));
      end;
    end;
  finally
    Les_Strings.Free;
  end;

end;

procedure TLoaderProfileForm.ReadHeaderFile;
var
  i, b, j: Integer;
  S: string;
  Les_Strings: TStringList;
  sa: TStringArray;
  sprt: Char;
begin
  Les_Strings := TStringList.Create;
  try
    S := LoaderReestrForm.mdsFileFormats['Headsprt'];

    if (AnsiUpperCase(S) = '\T') then
      sprt := #09
    else if (AnsiUpperCase(S) = '\_') then
      sprt := ' '
    else
      sprt := S[1];
    if LoaderReestrForm.mdsFileFormats['HeaderFrom'] <= 0 then
      b := FileStrings.Count + LoaderReestrForm.mdsFileFormats['HeaderFrom'] - 1
    else
      b := LoaderReestrForm.mdsFileFormats['HeaderFrom'] - 1;

    if LoaderReestrForm.mdsFileFormats['HeaderTo'] <= 0 then
      j := FileStrings.Count + LoaderReestrForm.mdsFileFormats['HeaderTo'] - 1
    else
      j := LoaderReestrForm.mdsFileFormats['HeaderTo'] - 1;

    for i := b to j do
      Les_Strings.Add(FileStrings[i]);

    S := Les_Strings[0];

    sa := Explode(sprt, S);
    initGrid(stgHead, Les_Strings.Count, sa);

    for i := 0 to Les_Strings.Count - 1 do
    begin
      S := Les_Strings[i];
      S := RemoveChars(S, ReplaceStr(LoaderReestrForm.mdsFileFormats.FieldByName('HeadRemCh').AsString, '\_', ' '));
      sa := Explode(sprt, S);
      for j := 0 to length(sa) - 1 do
      begin
        stgHead.Cells[j + 1, i + 1] := sa[j];
      end;
    end;

  finally
    Les_Strings.Free;
  end;

end;

procedure TLoaderProfileForm.edtACCOUNTChange(Sender: TObject);
begin
  if not(Sender is TDBNumberEditEh) then
    Exit;
  if VarIsNumeric((Sender as TDBNumberEditEh).Value) then
    ShowGridColumn(stgData, (Sender as TDBNumberEditEh).Value)
  else
    ClearGridColumn(stgData);
end;

procedure TLoaderProfileForm.edtACCOUNTEnter(Sender: TObject);
begin
  if not(Sender is TDBNumberEditEh) then
    Exit;
  if VarIsNumeric((Sender as TDBNumberEditEh).Value) then
    ShowGridColumn(stgData, (Sender as TDBNumberEditEh).Value)
  else
    ClearGridColumn(stgData);
end;

procedure TLoaderProfileForm.feExampleChange(Sender: TObject);
begin
  if cbFileFormat.Value = 0 then
    ShowFileInStringGrid(sgFile, feExample.FileName, cbdbCodePage.Value, true)
  else
    LoadDBF;
end;

procedure TLoaderProfileForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  stgData.DefaultRowHeight := stgData.Canvas.TextHeight('Ig') + 3;
  for i := 0 to pgcFileFormats.PageCount - 1 do
    pgcFileFormats.Pages[i].TabVisible := false;
  if LoaderReestrForm.mdsFileFormats.FieldByName('FileType').isNull then
    pgcFileFormats.ActivePageIndex := 0
  else
    pgcFileFormats.ActivePageIndex := LoaderReestrForm.mdsFileFormats.FieldByName('FileType').AsInteger;

  if LoaderReestrForm.mdsFileFormats.FieldByName('FileDir').isNull then
    DirFiles.Text := ''
  else
    DirFiles.Text := LoaderReestrForm.mdsFileFormats.FieldByName('FileDir').AsString;

  if LoaderReestrForm.mdsFileFormats.FieldByName('ArchDir').isNull then
    DirArch.Text := ''
  else
    DirArch.Text := LoaderReestrForm.mdsFileFormats.FieldByName('ArchDir').AsString;
end;

procedure TLoaderProfileForm.AddFiledsToMemDS;
  procedure AddFld(const S: string; lc: TDBLookupComboboxEh);
  begin
    if not srcmdsFileFormat.DataSet.FieldByName(S).isNull then
    begin
      memDBFFields.Append;
      memDBFFields['name'] := srcmdsFileFormat.DataSet.FieldByName(S).AsString;
      memDBFFields.Post;
      lc.Text := srcmdsFileFormat.DataSet.FieldByName(S).AsString;
    end;
  end;

begin
  if pgcFileFormats.ActivePageIndex <> 1 then
    Exit;
  memDBFFields.Open;
  memDBFFields.EmptyTable;
  AddFld('DBF_account', lcbDBF_account);
  AddFld('DBF_FIO', lcbDBF_FIO);
  AddFld('DBF_ADRES', lcbDBF_ADRES);
  AddFld('DBF_HOUSE', lcbDBF_HOUSE);
  AddFld('DBF_KORP', lcbDBF_KORP);
  AddFld('DBF_FLAT', lcbDBF_FLAT);
  AddFld('DBF_SUM', lcbDBF_SUM);
  AddFld('DBF_date', lcbDBF_date);
  AddFld('DBFPAYMENT_NO', lcbDBFPAYMENT_NO);
  AddFld('DBF_NOTICE', lcbDBF_NOTICE);
  AddFld('DBF_EXTERNAL', lcbEXT_ID);

end;

end.
