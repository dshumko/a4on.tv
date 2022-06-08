unit CustFilesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus, Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.Buttons,
  DBGridEh, DBCtrlsEh, DBLookupEh, frxClass, frxDBSet, FIBDataSet, pFIBDataSet, GridsEh, DBGridEhImpExp, FIBQuery, pFIBQuery,
  DBGridEhGrouping, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL, FIBDatabase, pFIBDatabase, DynVarsEh;

type
  TCustFilesForm = class(TForm)
    pnlAll: TPanel;
    dbgFiles: TDBGridEh;
    alGuide: TActionList;
    actAct: TAction;
    actDel: TAction;
    actSearch: TAction;
    actSetPeriod: TAction;
    actTypeFilter: TAction;
    actPrintDoc: TAction;
    actQuickFilter: TAction;
    gridPopUp: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    dsFiles: TpFIBDataSet;
    srcFiles: TDataSource;
    frxDBPayments: TfrxDBDataset;
    ToolBar3: TToolBar;
    ToolButton6: TToolButton;
    ToolButton16: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    Panel4: TPanel;
    luPayment: TDBLookupComboboxEh;
    ToolButton20: TToolButton;
    ToolButton7: TToolButton;
    ToolButton27: TToolButton;
    pmPeriod: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolButton2: TToolButton;
    MainMenu1: TMainMenu;
    N5: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    btn1: TToolButton;
    btn2: TToolButton;
    btnFilterCustomers: TToolButton;
    actFilterCustomers: TAction;
    pmGridClick: TPopupMenu;
    miPayDoc: TMenuItem;
    miAbonent: TMenuItem;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsFileType: TpFIBDataSet;
    srcFileType: TDataSource;
    qRead: TpFIBQuery;
    btnEdit: TToolButton;
    actEdit: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure actTypeFilterExecute(Sender: TObject);
    procedure actSetPeriodExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dbgFilesDblClick(Sender: TObject);
    procedure actActExecute(Sender: TObject);
    procedure bbDownClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure actPrintDocExecute(Sender: TObject);
    procedure frxDBPaymentsCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxDBPaymentsFirst(Sender: TObject);
    procedure frxDBPaymentsNext(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgFilesKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dbgFilesDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
      var GroupRowText: string);
    procedure actFilterCustomersExecute(Sender: TObject);
    procedure miAbonentClick(Sender: TObject);
    procedure dbgFilesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actEditExecute(Sender: TObject);
    procedure dbgFilesGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure FormCreate(Sender: TObject);
  private
    FFirstOpen : Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    fSelectedRow: Integer; // выделенная строка в таблице платежей
    FullAccess: Boolean;
    FFilesAdd: Boolean;
    FFilesEdit: Boolean;
    procedure SetFilter;
    function GetOrderClause(grid: TDBGridEh): string;
  public
    { Public declarations }
  end;

var
  CustFilesForm: TCustFilesForm;

implementation

uses
  Winapi.ShellAPI,
  DM, MAIN, AtrCommon, A4onTypeUnit, PeriodForma, AtrStrUtils, CF, CustomerForma, ReportPreview, TextEditForma, EditCFileForma;

{$R *.dfm}

procedure TCustFilesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgFiles.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, Self.Name + '.' + dbgFiles.Name, false);

  if srcFiles.DataSet.Active then
    srcFiles.DataSet.Close;
  dsFileType.Close;
  CustFilesForm := nil;
  Action := caFree;
end;

procedure TCustFilesForm.FormCreate(Sender: TObject);
begin
  FFirstOpen := True;
end;

procedure TCustFilesForm.ppmSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;
begin
  A4MainForm.SaveDialog.FileName := rsPayments;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then begin
      case A4MainForm.SaveDialog.FilterIndex of
        1: begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2: begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3: begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4: begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5: begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;

end;

procedure TCustFilesForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TCustFilesForm.ppmCopyClick(Sender: TObject);

var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        DBGridEh_DoCopyAction(dbg, False)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;

end;

procedure TCustFilesForm.actTypeFilterExecute(Sender: TObject);
begin
  actTypeFilter.Checked := not actTypeFilter.Checked;
  actTypeFilter.Checked := actTypeFilter.Checked and not VarIsNull(luPayment.KeyValue);
  if actTypeFilter.Checked then begin
    actTypeFilter.Caption := rsFilterOff;
    actTypeFilter.Hint := rsFilterOffCondition;
  end
  else begin
    actTypeFilter.Caption := rsFilterOn;
    actTypeFilter.Hint := rsFilterOnCondition;
  end;
  SetFilter;
end;

procedure TCustFilesForm.actSetPeriodExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then begin
    fStartDate := bDate;
    fEndDate := eDate;
    SetFilter;
  end;
end;

procedure TCustFilesForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgFiles.STFilter.Visible := actQuickFilter.Checked;
end;

procedure TCustFilesForm.SetFilter;
begin
  dsFiles.Close;
  dsFiles.ParamByName('StartDate').AsDate := fStartDate;
  dsFiles.ParamByName('EndDate').AsDate := fEndDate;
  Caption := Format(rsFilesPeriod, [DateToStr(fStartDate), DateToStr(fEndDate)]);
  if actTypeFilter.Checked then begin
    dsFiles.ParamByName('source').AsString := ' AND CF.Cf_Type = ' + VarToStr(luPayment.KeyValue);
    Caption := Caption + Format(rsType, [luPayment.DisplayTextForPaintCopy]);
  end
  else
    dsFiles.ParamByName('source').AsString := '';
  dsFiles.OrderClause := GetOrderClause(dbgFiles);
  dsFiles.Open;
end;

procedure TCustFilesForm.FormShow(Sender: TObject);
var
  i: Integer;
  vBalance: Boolean;
  Font_size: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TDBGridEh then begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  dbgFiles.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, Self.Name + '.' + dbgFiles.Name,
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);

  FFilesAdd := dmMain.AllowedAction(rght_Customer_Files_Add);
  FFilesEdit := dmMain.AllowedAction(rght_Customer_Files_Edit);

  fEndDate := Now;
  fStartDate := MonthFirstDay(dmMain.CurrentMonth);
  SetFilter;
  dsFileType.Open;

  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_Customer_full);
  actEdit.Visible := (FFilesEdit or FullAccess);
  actDel.Visible := (FFilesEdit or FullAccess);

  vBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');

  for i := 0 to dbgFiles.Columns.Count - 1 do begin
    if (AnsiUpperCase(dbgFiles.Columns[i].FieldName) = 'DEBT_SUM') then
      dbgFiles.Columns[i].Visible := not vBalance;
    if (AnsiUpperCase(dbgFiles.Columns[i].FieldName) = 'BALANCE') then
      dbgFiles.Columns[i].Visible := vBalance;
  end;

  if dmMain.SuperMode = 0 then
    dbgFiles.FooterRowCount := 0;
end;

procedure TCustFilesForm.N1Click(Sender: TObject);
begin
  fStartDate := Now;
  fEndDate := Now;
  SetFilter;
end;

procedure TCustFilesForm.N2Click(Sender: TObject);
begin
  fStartDate := Now - 7;
  fEndDate := Now;
  SetFilter;
end;

procedure TCustFilesForm.dbgFilesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actEdit.Execute;
end;

procedure TCustFilesForm.dbgFilesDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
  var GroupRowText: string);
var
  s: string;
  i: Integer;
begin
  s := GroupDataTreeNode.DisplayValue;
  i := Pos(s, GroupRowText);
  GroupRowText := Copy(GroupRowText, i, Length(GroupRowText));
end;

procedure TCustFilesForm.dbgFilesDblClick(Sender: TObject);
var
  FileName: string;
begin
  if dbgFiles.DataSource.DataSet.RecordCount > 0 then begin
    //
    FileName := GetTempDir + 'A4on\';
    if not DirectoryExists(FileName) then
      CreateDir(FileName);
    FileName := FileName + dsFiles['FILENAME'];
    qRead.ParamByName('CF_ID').AsInteger := dsFiles['CF_ID'];
    qRead.Transaction.StartTransaction;
    qRead.ExecQuery;
    qRead.FieldByName('content').SaveToFile(FileName);
    qRead.Close;
    qRead.Transaction.Rollback;
    ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
  end;

end;

procedure TCustFilesForm.actActExecute(Sender: TObject);
var
  txt: String;
begin
  if (dsFiles.RecordCount = 0) or (dsFiles.FieldByName('Cf_Id').IsNull) then
    Exit;
  txt := '';
  if EditText(txt, Format(rsFileAct, [dsFiles['Name']]), rsFileActNotice) then begin
    dsFiles.Edit;
    dsFiles['ANotice'] := txt;
    dsFiles['Act'] := 1;
    dsFiles.Post;
    dsFiles.Refresh;
  end;
end;

procedure TCustFilesForm.bbDownClick(Sender: TObject);
begin
  pmPeriod.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TCustFilesForm.N3Click(Sender: TObject);
begin
  fStartDate := MonthFirstDay(Now);
  fEndDate := MonthLastDay(Now);
  SetFilter;
end;

procedure TCustFilesForm.N4Click(Sender: TObject);
begin
  fStartDate := (Now - 1);
  fEndDate := (Now - 1);
  SetFilter;
end;

procedure TCustFilesForm.actPrintDocExecute(Sender: TObject);
var
  bm: TBookMark;
begin
  dsFiles.DisableControls;
  bm := dsFiles.GetBookmark;
  ShowReport(rsPayments);
  dsFiles.GotoBookmark(bm);
  dsFiles.EnableControls;
end;

procedure TCustFilesForm.frxDBPaymentsCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgFiles.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > dbgFiles.SelectedRows.Count)
end;

procedure TCustFilesForm.frxDBPaymentsFirst(Sender: TObject);
begin
  if dbgFiles.SelectedRows.Count > 0 then begin
    fSelectedRow := 1;
    dbgFiles.DataSource.DataSet.Bookmark := dbgFiles.SelectedRows[0];
  end
end;

procedure TCustFilesForm.frxDBPaymentsNext(Sender: TObject);
begin
  if (dbgFiles.SelectedRows.Count > 0) then begin
    if fSelectedRow < dbgFiles.SelectedRows.Count then
      dbgFiles.DataSource.DataSet.Bookmark := dbgFiles.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TCustFilesForm.miAbonentClick(Sender: TObject);
begin
  if dsFiles.FieldByName('Customer_ID').IsNull then
    Exit;
  ShowCustomer(dsFiles.FieldValues['Customer_ID']);
end;

procedure TCustFilesForm.actFilterCustomersExecute(Sender: TObject);
var
  grid: TDBGridEh;
  i: Integer;
  b: TBookMark;
  customers: TStringList;
  s: string;
begin
  grid := dbgFiles;

  customers := TStringList.Create;
  customers.Sorted := True;
  customers.Duplicates := dupIgnore;

  if (grid.SelectedRows.Count = 0) then begin
    if not grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers.Add(IntToStr(grid.DataSource.DataSet['CUSTOMER_ID']));
  end
  else begin
    b := grid.DataSource.DataSet.GetBookmark;
    grid.DataSource.DataSet.DisableControls;
    grid.DataSource.DataSet.First;
    for i := 0 to grid.SelectedRows.Count - 1 do begin
      grid.DataSource.DataSet.Bookmark := grid.SelectedRows[i];
      if not grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers.Add(IntToStr(grid.DataSource.DataSet['CUSTOMER_ID']));
    end;
    grid.DataSource.DataSet.GotoBookmark(b);
    grid.DataSource.DataSet.EnableControls;
  end;

  if (customers.Count > 0) then
    s := customers.CommaText
  else
    s := '';

  FreeAndNil(customers);

  if (s <> '') then
    ShowCustomers(7, s);
end;

procedure TCustFilesForm.actDelExecute(Sender: TObject);
begin
  if not(FFilesEdit or FullAccess) then
    Exit;

  if (dsFiles.RecordCount = 0) or (dsFiles.FieldByName('Cf_Id').IsNull) then
    Exit;

  if MessageDlg(Format(ms_DELETE_ACT, [dsFiles.FieldByName('NAME').AsString, dsFiles.FieldByName('ADDED_ON').AsString]),
    mtConfirmation, [mbNo, mbYes], 0) = mrYes then begin
    dsFiles.Edit;
    dsFiles['ANotice'] := '';
    dsFiles['Act'] := 0;
    dsFiles.Post;
    dsFiles.Refresh;
  end;
  dsFiles.Delete;

end;

procedure TCustFilesForm.actEditExecute(Sender: TObject);
var
  ci : TCustomerInfo;
begin
  if not((dmMain.AllowedAction(rght_Customer_full)) or (dmMain.AllowedAction(rght_Customer_Files_Edit))) then
    Exit;

  if ((not dsFiles.Active) or (dsFiles.RecordCount = 0)) then
    Exit;

  if (dsFiles.FieldByName('NAME').IsNull) or (dsFiles.FieldByName('CF_ID').IsNull) or
    (dsFiles.FieldByName('CUSTOMER_ID').IsNull) then
    Exit;

  with ci do begin
    CUSTOMER_ID := dsFiles['CUSTOMER_ID'];
  end;

  if EditFile(ci, dsFiles['NAME'], dsFiles['CF_ID']) then begin
    dsFiles.Refresh;
  end
end;

procedure TCustFilesForm.FormActivate(Sender: TObject);
var
  i: integer;
  filter: string;
  inFilter: Boolean;
begin
  if FFirstOpen then begin
    FFirstOpen := False;
    Exit;
  end;

  if not((dsFiles.Active) and (dsFiles.RecordCount > 0) and
    (not dsFiles.FieldByName('Cf_Id').IsNull)) then
    dsFiles.CloseOpen(True)
  else begin
    inFilter := dsFiles.Filtered;
    filter := dsFiles.filter;
    i := dsFiles['Cf_Id'];
    dsFiles.CloseOpen(true);
    if inFilter then
    begin
      dsFiles.filter := filter;
      dsFiles.Filtered := inFilter;
      if dbgFiles.SearchPanel.SearchingText <> '' then
        dbgFiles.SearchPanel.ApplySearchFilter;
    end;
    dsFiles.Locate('Cf_Id', i, []);
  end;
end;

procedure TCustFilesForm.dbgFilesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not dsFiles.FieldByName('HIS_COLOR').IsNull then
    Background := StringToColor(dsFiles.FieldByName('HIS_COLOR').Value);
end;

procedure TCustFilesForm.dbgFilesGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
var
  i: Integer;
begin
  if (DataCol = 1) and (Row = 0) then begin
    i := (Sender as TDBGridEh).SelectedRows.Count;
    if i > 1 then
      Text := IntToStr(i);
  end;
end;

function TCustFilesForm.GetOrderClause(grid: TDBGridEh): string;
var
  s: string;
  i, J: Integer;
begin
  J := grid.SortMarkedColumns.Count;
  s := '';
  for i := 0 to pred(J) do begin
    s := s + grid.SortMarkedColumns[i].FieldName;
    if grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      s := s + ' desc';
    if i <> pred(J) then
      s := s + ', ';
  end;
  Result := s;
end;

end.
