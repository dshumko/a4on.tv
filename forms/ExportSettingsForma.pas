unit ExportSettingsForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.ToolWin,
  Vcl.DBCtrls, Vcl.Menus, Vcl.ActnList,
  MemTableDataEh, GridsEh, DBGridEh, MemTableEh, DBCtrlsEh, RxToolEdit, FIBDataSet, pFIBDataSet, OkCancel_frame,
  ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh,
  FIBDatabase, pFIBDatabase;

type
  TExportSettingsForm = class(TForm)
    pnlGrid: TPanel;
    pnlData: TPanel;
    pnl1: TPanel;
    lbl4: TLabel;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl8: TLabel;
    edtDirFiles: TDirectoryEdit;
    edtProfile: TDBEditEh;
    cbbCodePage: TDBComboBoxEh;
    cbbFileFormat: TDBComboBoxEh;
    pgcFileBody: TPageControl;
    tsTXT: TTabSheet;
    lbl1: TLabel;
    lbl3: TLabel;
    tsDBF: TTabSheet;
    dbgDBF: TDBGridEh;
    DBGridEh1: TDBGridEh;
    tlb1: TToolBar;
    btn1: TToolButton;
    btnNew: TToolButton;
    btn3: TToolButton;
    btnEdit: TToolButton;
    btn5: TToolButton;
    btnDEl: TToolButton;
    btn7: TToolButton;
    btnOk: TToolButton;
    btn8: TToolButton;
    btnCancel: TToolButton;
    srcTypes: TDataSource;
    srcDBF: TDataSource;
    dsTypes: TpFIBDataSet;
    dbmmoBody: TDBMemoEh;
    dbmmoHead: TDBMemoEh;
    dbmmofooter: TDBMemoEh;
    pmMemo: TPopupMenu;
    lbl5: TLabel;
    okcnclfrm1: TOkCancelFrame;
    dbnvgrDBF: TDBNavigator;
    lbl6: TLabel;
    edt1: TDBEditEh;
    pmTotal: TPopupMenu;
    pnl2: TPanel;
    lbl2: TLabel;
    lbl10: TLabel;
    edtSEP: TDBEditEh;
    memDBF: TMemTableEh;
    dbmmoNotice: TDBMemoEh;
    actList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure miClick(Sender: TObject);
    procedure srcTypesDataChange(Sender: TObject; Field: TField);
    procedure srcTypesStateChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dsTypesBeforePost(DataSet: TDataSet);
    procedure dbgDBFExit(Sender: TObject);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
    procedure dsTypesNewRecord(DataSet: TDataSet);
    procedure cbbFileFormatChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
  private
    { Private declarations }
    procedure TextToDataset();
    function DatasetToTxt(): string;
  public
    { Public declarations }
  end;

implementation

uses
  System.StrUtils,
  MAIN, DM, AtrStrUtils;

{$R *.dfm}

procedure TExportSettingsForm.actAddExecute(Sender: TObject);
begin
  if dsTypes.State = dsBrowse then
  begin
    pnlData.Enabled := True;
    dsTypes.Insert;
    edtProfile.SetFocus;
    actAdd.Enabled := False;
    actDel.Enabled := False;
    actEdit.Enabled := False;
  end;
end;

procedure TExportSettingsForm.actDelExecute(Sender: TObject);
begin
  if dsTypes.RecordCount = 0 then
    Exit;

  If MessageDLG(Format(rsDeleteExportProfile, [dsTypes['NAME']]), mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mrYes then
    Exit;
  dsTypes.Delete;
end;

procedure TExportSettingsForm.actEditExecute(Sender: TObject);
begin
  if dsTypes.State = dsBrowse then
  begin
    pnlData.Enabled := True;
    dsTypes.Edit;
    edtProfile.SetFocus;
    actAdd.Enabled := False;
    actDel.Enabled := False;
    actEdit.Enabled := False;
  end;
end;

procedure TExportSettingsForm.btnCancelClick(Sender: TObject);
begin
  dsTypes.Cancel;
  pnlData.Enabled := False;
  actAdd.Enabled := True;
  actDel.Enabled := True;
  actEdit.Enabled := True;
end;

procedure TExportSettingsForm.btnOkClick(Sender: TObject);
begin
  if (dmMain.AllowedAction(rght_Dictionary_full)) then
    dsTypes.Post
  else
    dsTypes.Cancel;
  pnlData.Enabled := False;
  actAdd.Enabled := True;
  actDel.Enabled := True;
  actEdit.Enabled := True;
end;

procedure TExportSettingsForm.FormShow(Sender: TObject);
var
  i: Integer;
  val: TStringArray;
begin
  for i := 0 to pgcFileBody.PageCount - 1 do
    pgcFileBody.Pages[i].TabVisible := False;

  val := Explode(';', export_fields);
  for i := 0 to Length(val) - 1 do
  begin
    pmMemo.Items.Add(NewItem(val[i], 0, False, True, miClick, 0, 'mi' + IntToStr(i)));
  end;

  val := Explode(';', export_fields_total);
  for i := 0 to Length(val) - 1 do
  begin
    pmTotal.Items.Add(NewItem(val[i], 0, False, True, miClick, 0, 'mi' + IntToStr(i)));
  end;

  dsTypes.Open;
end;

procedure TExportSettingsForm.miClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then
    (ActiveControl as TDBMemoEh).SelText := (Sender as TMenuItem).Caption;
end;

procedure TExportSettingsForm.okcnclfrm1bbOkClick(Sender: TObject);
begin
  if dsTypes.State in [dsEdit, dsInsert] then
    dsTypes.Post;
end;

procedure TExportSettingsForm.srcTypesDataChange(Sender: TObject; Field: TField);
begin
  if srcTypes.State = dsBrowse then
  begin
    if not dsTypes.FieldByName('FILE_FORMAT').IsNull then
      pgcFileBody.ActivePageIndex := dsTypes.FieldByName('FILE_FORMAT').AsInteger
    else
      pgcFileBody.ActivePageIndex := -1;

    if pgcFileBody.ActivePageIndex = 1 then
      TextToDataset();

    edtDirFiles.Text := dsTypes.FieldByName('FILE_DIR').AsString;
  end;
end;

procedure TExportSettingsForm.srcTypesStateChange(Sender: TObject);
begin
  btnOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  btnCancel.Enabled := btnOk.Enabled;
  btnNew.Enabled := not btnOk.Enabled;
  btnEdit.Enabled := not btnOk.Enabled and ((Sender as TDataSource).DataSet.RecordCount > 0);
  btnDEl.Enabled := not btnOk.Enabled and ((Sender as TDataSource).DataSet.RecordCount > 0);

  dbgDBF.Enabled := btnOk.Enabled;
  dbnvgrDBF.Enabled := btnOk.Enabled;

  edtDirFiles.ReadOnly := not btnOk.Enabled;
end;

procedure TExportSettingsForm.TextToDataset();
var
  i: Integer;
  val: TStringArray;
  s: string;
begin
  if memDBF.Active then
    memDBF.Close;
  memDBF.Open;
  memDBF.EmptyTable;
  if dsTypes.FieldByName('FILE_BODY').IsNull then
    Exit;
  for i := 0 to dbmmoBody.Lines.Count - 1 do
  begin
    s := dbmmoBody.Lines[i];
    val := Explode('&', s);
    if Length(val) > 4 then
    begin
      s := val[0];
      // вернем обратно символ & который заменили при сохранении на [~@#~]
      s := ReplaceStr(s, '[~@#~]', '&');
      memDBF.Append;
      memDBF['FLDDATA'] := s;
      if val[1] <> '' then
        memDBF['FLDNAME'] := val[1];
      if val[2] <> '' then
        memDBF['FLDTYPE'] := val[2];
      if val[3] <> '' then
        memDBF['FLDSIZE'] := StrToInt(val[3]);
      if val[4] <> '' then
        memDBF['FLDPERC'] := StrToInt(val[4]);
      memDBF.Post;
    end;
  end;
end;

function TExportSettingsForm.DatasetToTxt(): string;
var
  l, s: string;
begin
  Result := '';
  if not memDBF.Active then
    Exit;
  memDBF.First;
  while not memDBF.EOF do
  begin
    l := '';
    if memDBF.FieldByName('FLDDATA').IsNull then
      s := ''
    else
      s := memDBF.FieldByName('FLDDATA').AsString;
    s := ReplaceStr(s, '&', '[~@#~]');
    l := l + s + '&';
    if memDBF.FieldByName('FLDNAME').IsNull then
      s := ''
    else
      s := AnsiUpperCase(memDBF.FieldByName('FLDNAME').AsString);
    l := l + s + '&';
    if memDBF.FieldByName('FLDTYPE').IsNull then
      s := ''
    else
      s := AnsiUpperCase(memDBF.FieldByName('FLDTYPE').AsString);
    l := l + s + '&';
    if memDBF.FieldByName('FLDSIZE').IsNull then
      s := ''
    else
      s := memDBF.FieldByName('FLDSIZE').AsString;
    l := l + s + '&';
    if memDBF.FieldByName('FLDPERC').IsNull then
      s := ''
    else
      s := memDBF.FieldByName('FLDPERC').AsString;
    l := l + s + '&';
    Result := Result + l + rsEOL;
    memDBF.Next;
  end;
end;

procedure TExportSettingsForm.dbgDBFExit(Sender: TObject);
begin
  if memDBF.State in [dsEdit, dsInsert] then
    memDBF.Post;

end;

procedure TExportSettingsForm.dsTypesBeforePost(DataSet: TDataSet);
begin
  dsTypes.FieldByName('FILE_DIR').AsString := edtDirFiles.Text;
  if cbbFileFormat.Value = 1 then
    dsTypes['FILE_BODY'] := DatasetToTxt();
end;

procedure TExportSettingsForm.dsTypesNewRecord(DataSet: TDataSet);
begin
  dsTypes['FILE_FORMAT'] := 0;
  dsTypes['FILE_CODEPAGE'] := 1;
  pgcFileBody.ActivePageIndex := 0;
end;

procedure TExportSettingsForm.cbbFileFormatChange(Sender: TObject);
begin
  if not(VarIsNull(cbbFileFormat.Value) or (cbbFileFormat.Text = '')) then
    pgcFileBody.ActivePageIndex := cbbFileFormat.Value
  else
    pgcFileBody.ActivePageIndex := -1;
end;

end.
