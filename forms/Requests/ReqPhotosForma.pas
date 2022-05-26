unit ReqPhotosForma;

interface

uses
  Vcl.Menus, Data.DB, System.Classes, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Controls, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.Forms, Vcl.Graphics, System.SysUtils, System.Variants,
  Vcl.Dialogs, Winapi.Windows, System.UITypes,

  DBGridEh, DBCtrlsEh, DBLookupEh, frxClass, frxDBSet, FIBDataSet, pFIBDataSet,
  GridsEh, DBGridEhImpExp, FIBQuery, pFIBQuery, DBGridEhGrouping, MemTableDataEh,
  DataDriverEh, pFIBDataDriverEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  PrjConst, EhLibVCL, FIBDatabase, pFIBDatabase, DynVarsEh, PropFilerEh, PropStorageEh;

type
  TReqPhotosForm = class(TForm)
    pnlAll: TPanel;
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
    pnlMain: TPanel;
    imgJPG: TDBImageEh;
    spl1: TSplitter;
    dbgFiles: TDBGridEh;
    PropStorageEh: TPropStorageEh;
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
    procedure imgJPGDblClick(Sender: TObject);
  private
    FFirstOpen: Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    fSelectedRow: Integer; // выделенная строка в таблице платежей
    FullAccess: Boolean;
    FFilesAdd: Boolean;
    FFilesEdit: Boolean;
    procedure SetFilter;
  public
    { Public declarations }
  end;

var
  ReqPhotosForm: TReqPhotosForm;

implementation

uses DM, MAIN, AtrCommon, A4onTypeUnit, PeriodForma,
  AtrStrUtils, CF, CustomerForma, ReportPreview,
  Winapi.ShellAPI, RequestForma;

{$R *.dfm}

procedure TReqPhotosForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgFiles.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, Self.Name + '.' + dbgFiles.Name, false);

  if srcFiles.DataSet.Active then
    srcFiles.DataSet.Close;
  dsFileType.Close;
  ReqPhotosForm := nil;
  Action := caFree;
end;

procedure TReqPhotosForm.FormCreate(Sender: TObject);
begin
  FFirstOpen := True;
end;

procedure TReqPhotosForm.ppmSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;
begin
  A4MainForm.SaveDialog.FileName := rsPayments;
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

procedure TReqPhotosForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TReqPhotosForm.ppmCopyClick(Sender: TObject);

var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        DBGridEh_DoCopyAction(dbg, False)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;

end;

procedure TReqPhotosForm.actTypeFilterExecute(Sender: TObject);
begin
  actTypeFilter.Checked := not actTypeFilter.Checked;
  actTypeFilter.Checked := actTypeFilter.Checked and not VarIsNull(luPayment.KeyValue);
  if actTypeFilter.Checked then
  begin
    actTypeFilter.Caption := rsFilterOff;
    actTypeFilter.Hint := rsFilterOffCondition;
  end
  else
  begin
    actTypeFilter.Caption := rsFilterOn;
    actTypeFilter.Hint := rsFilterOnCondition;
  end;
  SetFilter;
end;

procedure TReqPhotosForm.actSetPeriodExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then
  begin
    fStartDate := bDate;
    fEndDate := eDate;
    SetFilter;
  end;
end;

procedure TReqPhotosForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgFiles.STFilter.Visible := actQuickFilter.Checked;
end;

procedure TReqPhotosForm.SetFilter;
begin
  dsFiles.Close;
  dsFiles.ParamByName('StartDate').AsDate := fStartDate;
  dsFiles.ParamByName('EndDate').AsDate := fEndDate;
  Caption := Format(rsFilesPeriod, [DateToStr(fStartDate), DateToStr(fEndDate)]);
  if actTypeFilter.Checked then
  begin
    dsFiles.ParamByName('source').AsString := ' AND r.RQ_TYPE = ' + VarToStr(luPayment.KeyValue);
    Caption := Caption + Format(rsType, [luPayment.DisplayTextForPaintCopy]);
  end
  else
    dsFiles.ParamByName('source').AsString := '';

  dsFiles.Open;
end;

procedure TReqPhotosForm.FormShow(Sender: TObject);
var
  i: Integer;
  vBalance: Boolean;
  Font_size: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  dbgFiles.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, Self.Name + '.' + dbgFiles.Name,
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);

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

  for i := 0 to dbgFiles.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgFiles.Columns[i].FieldName) = 'DEBT_SUM') then
      dbgFiles.Columns[i].Visible := not vBalance;
    if (AnsiUpperCase(dbgFiles.Columns[i].FieldName) = 'BALANCE') then
      dbgFiles.Columns[i].Visible := vBalance;
  end;

  if dmMain.SuperMode = 0 then
    dbgFiles.FooterRowCount := 0;
end;

procedure TReqPhotosForm.N1Click(Sender: TObject);
begin
  fStartDate := Now;
  fEndDate := Now;
  SetFilter;
end;

procedure TReqPhotosForm.N2Click(Sender: TObject);
begin
  fStartDate := Now - 7;
  fEndDate := Now;
  SetFilter;
end;

procedure TReqPhotosForm.dbgFilesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actEdit.Execute;
end;

procedure TReqPhotosForm.dbgFilesDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
  var GroupRowText: string);
var
  s: string;
  i: Integer;
begin
  s := GroupDataTreeNode.DisplayValue;
  i := Pos(s, GroupRowText);
  GroupRowText := Copy(GroupRowText, i, Length(GroupRowText));
end;

procedure TReqPhotosForm.dbgFilesDblClick(Sender: TObject);
var
  FileName: string;
begin
  if dbgFiles.DataSource.DataSet.RecordCount > 0 then
  begin
    FileName := GetTempDir + 'A4on\';
    if not DirectoryExists(FileName) then
      CreateDir(FileName);
    FileName := FileName + dsFiles.FieldByName('RQ_ID').AsString + '_' + dsFiles.FieldByName('FILE_ID')
      .AsString + '.jpg';

    TBlobField(dsFiles.FieldByName('JPG')).SaveToFile(FileName);
    ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TReqPhotosForm.bbDownClick(Sender: TObject);
begin
  pmPeriod.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TReqPhotosForm.N3Click(Sender: TObject);
begin
  fStartDate := MonthFirstDay(Now);
  fEndDate := MonthLastDay(Now);
  SetFilter;
end;

procedure TReqPhotosForm.N4Click(Sender: TObject);
begin
  fStartDate := (Now - 1);
  fEndDate := (Now - 1);
  SetFilter;
end;

procedure TReqPhotosForm.actPrintDocExecute(Sender: TObject);
var
  bm: TBookMark;
begin
  dsFiles.DisableControls;
  bm := dsFiles.GetBookmark;
  ShowReport(rsPayments);
  dsFiles.GotoBookmark(bm);
  dsFiles.EnableControls;
end;

procedure TReqPhotosForm.frxDBPaymentsCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgFiles.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > dbgFiles.SelectedRows.Count)
end;

procedure TReqPhotosForm.frxDBPaymentsFirst(Sender: TObject);
begin
  if dbgFiles.SelectedRows.Count > 0 then
  begin
    fSelectedRow := 1;
    dbgFiles.DataSource.DataSet.Bookmark := dbgFiles.SelectedRows[0];
  end
end;

procedure TReqPhotosForm.frxDBPaymentsNext(Sender: TObject);
begin
  if (dbgFiles.SelectedRows.Count > 0) then
  begin
    if fSelectedRow < dbgFiles.SelectedRows.Count then
      dbgFiles.DataSource.DataSet.Bookmark := dbgFiles.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TReqPhotosForm.imgJPGDblClick(Sender: TObject);
begin
  dbgFilesDblClick(Sender);
end;

procedure TReqPhotosForm.miAbonentClick(Sender: TObject);
begin
  if dsFiles.FieldByName('Customer_ID').IsNull then
    Exit;
  ShowCustomer(dsFiles.FieldValues['Customer_ID']);
end;

procedure TReqPhotosForm.actFilterCustomersExecute(Sender: TObject);
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

  if (grid.SelectedRows.Count = 0) then
  begin
    if not grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers.Add(IntToStr(grid.DataSource.DataSet['CUSTOMER_ID']));
  end
  else
  begin
    b := grid.DataSource.DataSet.GetBookmark;
    grid.DataSource.DataSet.DisableControls;
    grid.DataSource.DataSet.First;
    for i := 0 to grid.SelectedRows.Count - 1 do
    begin
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

procedure TReqPhotosForm.actDelExecute(Sender: TObject);
begin
  if not(FFilesEdit or FullAccess) then
    Exit;

  if (dsFiles.RecordCount = 0) or (dsFiles.FieldByName('FILE_ID').IsNull) then
    Exit;

  if MessageDlg(Format(ms_DELETE_PAY_DOC, [dsFiles.FieldByName('FILE_NOTICE').AsString,
    dsFiles.FieldByName('ADDED_ON').AsString]), mtConfirmation, [mbNo, mbYes], 0) = mrYes then
  begin
    dsFiles.DElete;
  end;
end;

procedure TReqPhotosForm.actEditExecute(Sender: TObject);
var
  aRequest: Integer;
  aCustomer: Integer;
  aNodeId: Integer;
  aMode: Byte;
  grid: TDBGridEh;
begin
  if not(dmMain.AllowedAction(rght_Request_full) or dmMain.AllowedAction(rght_Request_Add) or
    dmMain.AllowedAction(rght_Request_Edit) or dmMain.AllowedAction(rght_Request_Give) or
    dmMain.AllowedAction(rght_Request_Close) or dmMain.AllowedAction(rght_Request_Del) or
    dmMain.AllowedAction(rght_Request_DateChange) or dmMain.AllowedAction(rght_Request_Close_Day) or
    dmMain.AllowedAction(rght_Request_Unclose)) then
    Exit;

  grid := dbgFiles;

  if not(grid.DataSource.DataSet).Active then
    Exit;

  if (grid.DataSource.DataSet).FieldByName('RQ_ID').IsNull then
  begin
    aRequest := -1;
    aMode := 0;
  end
  else
  begin
    aRequest := (grid.DataSource.DataSet).FieldByName('RQ_ID').AsInteger;
    aMode := 1;
  end;

  aNodeId := -1;
  if (grid.DataSource.DataSet).FieldByName('RQ_CUSTOMER').IsNull then
  begin
    aCustomer := -1;
    if not(grid.DataSource.DataSet).FieldByName('NODE_ID').IsNull then
      aNodeId := (grid.DataSource.DataSet).FieldByName('NODE_ID').AsInteger;
  end
  else
  begin
    aCustomer := (grid.DataSource.DataSet).FieldByName('RQ_CUSTOMER').AsInteger;
  end;

  if aNodeId = -1 then
    aRequest := ReguestExecute(aRequest, aCustomer, aMode)
  else
    aRequest := ReguestNodeExecute(aRequest, aNodeId, aMode);

  if (aRequest <> -1) then
  begin
    // mtPlan.RefreshRecord;
    if grid.DataSource.DataSet.Active then
    begin
      if (grid.DataSource.DataSet.Active) and (not grid.DataSource.DataSet.FieldByName('RQ_ID').IsNull) then
        aRequest := grid.DataSource.DataSet['RQ_ID']
      else
        aRequest := -1;
      grid.DataSource.DataSet.Close;
      grid.DataSource.DataSet.Open;
      if aRequest > -1 then
        grid.DataSource.DataSet.Locate('RQ_ID', aRequest, []);
    end
    else
      grid.DataSource.DataSet.Active := True;
  end;

end;

procedure TReqPhotosForm.FormActivate(Sender: TObject);
var
  i: Integer;
  filter: string;
  inFilter: Boolean;
begin
  if FFirstOpen then
  begin
    FFirstOpen := False;
    Exit;
  end;

  if not((dsFiles.Active) and (dsFiles.RecordCount > 0) and (not dsFiles.FieldByName('Cf_Id').IsNull)) then
    dsFiles.CloseOpen(True)
  else
  begin
    inFilter := dsFiles.Filtered;
    filter := dsFiles.filter;
    i := dsFiles['Cf_Id'];
    dsFiles.CloseOpen(True);
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

procedure TReqPhotosForm.dbgFilesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not dsFiles.FieldByName('HIS_COLOR').IsNull then
    Background := StringToColor(dsFiles.FieldByName('HIS_COLOR').Value);
end;

procedure TReqPhotosForm.dbgFilesGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
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

end.
