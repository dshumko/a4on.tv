unit MatDocsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin,
  GridForma, ToolCtrlsEh, DBGridEhToolCtrls, CnErrorProvider, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, FIBDataSet,
  pFIBDataSet,
  frxClass, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, MemTableDataEh, MemTableEh, amSplitter,
  PrnDbgeh;

type
  TMatDocsForm = class(TGridForm)
    pnlDetail: TPanel;
    dbgDetail: TDBGridEh;
    dsDocs: TpFIBDataSet;
    dsMaterials: TpFIBDataSet;
    srcMaterials: TDataSource;
    spl1: TSplitter;
    pmBTN: TPopupMenu;
    N1: TMenuItem;
    actDocMove: TAction;
    actDocOUT: TAction;
    actDocInventory: TAction;
    N2: TMenuItem;
    actDocOUT1: TMenuItem;
    N3: TMenuItem;
    btn1: TToolButton;
    btnPrint: TToolButton;
    actPrint: TAction;
    frxReport: TfrxReport;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    btnFilterDate: TToolButton;
    pmPeriod: TPopupMenu;
    MenuItem1: TMenuItem;
    N4: TMenuItem;
    MenuItem2: TMenuItem;
    miMonth: TMenuItem;
    actFilterDate: TAction;
    actDocInvent: TAction;
    N5: TMenuItem;
    dsFilter: TMemTableEh;
    pmFilter: TPopupMenu;
    N31: TMenuItem;
    N53: TMenuItem;
    N42: TMenuItem;
    N36: TMenuItem;
    btnFilterNew: TToolButton;
    actEnableFilter: TAction;
    actFilterSet: TAction;
    mmMaterialDoc: TMainMenu;
    L1: TMenuItem;
    miDocInvent: TMenuItem;
    miDocMove: TMenuItem;
    miNew: TMenuItem;
    N7: TMenuItem;
    miDocInventory: TMenuItem;
    miFilterSet: TMenuItem;
    miFilterDate: TMenuItem;
    miPrint: TMenuItem;
    miN8: TMenuItem;
    N8: TMenuItem;
    miEdit: TMenuItem;
    N9: TMenuItem;
    actPaymentDelete1: TMenuItem;
    miN10: TMenuItem;
    miQuickFilter: TMenuItem;
    btn2: TToolButton;
    btnOpenMat: TToolButton;
    actOpenMat: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actDocMoveExecute(Sender: TObject);
    procedure actDocOUTExecute(Sender: TObject);
    procedure actDocInventoryExecute(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actDeleteExecute(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure miMonthClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure actFilterDateExecute(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure actDocInventExecute(Sender: TObject);
    procedure actSetFilterNewExecute(Sender: TObject);
    procedure actEnableFilterExecute(Sender: TObject);
    procedure actFilterSetExecute(Sender: TObject);
    procedure actOpenMatExecute(Sender: TObject);
    procedure dsFilterNewRecord(DataSet: TDataSet);
  private
    FFirstOpen: Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    FFullAccess: Boolean;
    FAccessNew: Boolean;
    FAccessMove: Boolean;
    FAccessOut: Boolean;
    FAccessInv: Boolean;
    FViewAll: Boolean;
    FCanEdit: Boolean;
    procedure AddReport(const report_id: Integer; const variable: string; const value: Variant;
      const AsNew: Boolean = False);
    procedure LoadReportBody(const fReport_ID: Integer);
    procedure SetMatDocDateFilter;
    procedure InitForm;
    procedure InitSecurity;
    // procedure SetDefaultFilter;
    function GenerateFilter: string;
  public
    { Public declarations }
  end;

var
  MatDocsForm: TMatDocsForm;

implementation

uses
  MAIN, DM, PrjConst, synacode, PeriodForma, AtrStrUtils, AtrCommon, MatCorrectionDocForma, MatIncomeDocForma,
  MatMoveDocForma, MaterialsForma,
  MatOutDocForma, MatInventoryDocForma, MatDocFilter;

const
  const_default_filter: string = ' 1=1 ';

{$R *.dfm}

procedure TMatDocsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsMaterials.Close;
  dsDocs.Close;
  MatDocsForm := nil;
end;

procedure TMatDocsForm.InitSecurity;
var
  s: String;
begin
  inherited;
  FFullAccess := dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full);
  // dmMain.AllowedAction(rght_Dictionary_Materials) and
  FAccessNew := dmMain.AllowedAction(rght_Dictionary_MatDocNew);
  FAccessMove := dmMain.AllowedAction(rght_Dictionary_MatDocMove);
  FAccessOut := dmMain.AllowedAction(rght_Dictionary_MatDocOUT);
  FAccessInv := dmMain.AllowedAction(rght_Dictionary_MatDocInvent);
  FViewAll := dmMain.AllowedAction(rght_Dictionary_MatDocsView);

  FCanEdit := FFullAccess or dmMain.AllowedAction(rght_Dictionary_MatDoc_CreateEdit) or
    dmMain.AllowedAction(rght_Dictionary_MatDoc_Close);

  actNew.Visible := FFullAccess or (FAccessNew and FCanEdit);
  actDocMove.Visible := FFullAccess or (FAccessMove and FCanEdit);
  actDocOUT.Visible := FFullAccess or (FAccessOut and FCanEdit);
  actDocInventory.Visible := FFullAccess or (FAccessInv and FCanEdit);

  // если не все типы, то поставим фильтр
  if not(FFullAccess or FViewAll) then
  begin
    s := '';
    if FAccessNew then
      s := s + '1,';
    if FAccessMove then
      s := s + '2,';
    if FAccessOut then
      s := s + '3,';
    if FAccessInv then
      s := s + '4,5,';
    s := s.TrimRight([',']);
    if s.IsEmpty then
      s := '-1';
    dsDocs.SelectSQL.Add(format(' and D.Dt_Id in (%s) ', [s]));
  end;
  dsDocs.SelectSQL.Add('order by d.DOC_Date desc, d.DOC_N');
end;

procedure TMatDocsForm.InitForm;
var
  fVisibleCost: Boolean;
  i: Integer;
begin
  fVisibleCost := (dmMain.AllowedAction(rght_Material_Cost) or FFullAccess);
  for i := 0 to dbgDetail.Columns.Count - 1 do
  begin
    if dbgDetail.Columns[i].FieldName = 'COST' then
      dbgDetail.Columns[i].Visible := fVisibleCost
    else if dbgDetail.Columns[i].FieldName = 'SHIPPER_COST' then
      dbgDetail.Columns[i].Visible := fVisibleCost
    else if dbgDetail.Columns[i].FieldName = 'SHIPPER_ITOGO' then
      dbgDetail.Columns[i].Visible := fVisibleCost
    else if dbgDetail.Columns[i].FieldName = 'ITOGO' then
      dbgDetail.Columns[i].Visible := fVisibleCost;
  end;
end;

procedure TMatDocsForm.FormShow(Sender: TObject);
begin
  inherited;
  FFirstOpen := True;
  InitForm;
  InitSecurity;
  fStartDate := MonthFirstDay(now);
  fEndDate := MonthLastDay(now);
  SetMatDocDateFilter;
end;

procedure TMatDocsForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if (dsDocs.IsEmpty) or (dsDocs.FieldByName('DOC_ID').IsNull) then
    exit;

  if dsDocs.FieldByName('DT_ID').IsNull then
    exit;

  case dsDocs['DT_ID'] of
    1:
      if (FFullAccess or FAccessNew) then
        MaterialIncomeDocument(dsDocs['DOC_ID']); // Приход материалов
    2:
      if (FFullAccess or FAccessMove) then
        MaterialMoveDocument(dsDocs['DOC_ID']); // Перемещение по складам
    3:
      if (FFullAccess or FAccessOut) then
        MaterialOutDocument(dsDocs['DOC_ID']); // Списание материалов
    4:
      if (FFullAccess or FAccessInv) then
        MaterialCorrectionDocument(dsDocs['DOC_ID']); // Инвентаризация
    5:
      if (FFullAccess or FAccessInv) then
        MaterialInventoryDocument(dsDocs['DOC_ID']); // Инвентаризация
  end;
end;

procedure TMatDocsForm.actFilterDateExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  inherited;
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then
  begin
    fStartDate := bDate;
    fEndDate := eDate;
    SetMatDocDateFilter;
  end;
end;

procedure TMatDocsForm.actFilterSetExecute(Sender: TObject);
var
  filter: string;
begin
  inherited;
  if not(srcDataSource.DataSet is TpFIBDataSet) then
    exit;

  filter := '';

  with TMatDocFilterForm.Create(Application) do
    try
      if ShowModal = mrOk then
      begin
        actEnableFilter.Checked := True;
        filter := GenerateFilter;
      end;
    finally
      Free;
    end;

  if (dsDocs.Filtered) then
  begin
    dsDocs.filter := '';
    dsDocs.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsDocs.Close;
    dsDocs.ParamByName('Filter').value := filter;
    dsDocs.Open;
  end;
end;

procedure TMatDocsForm.FormActivate(Sender: TObject);
var
  i: Integer;
  filter: string;
  inFilter: Boolean;
begin
  inherited;
  i := -1;
  if FFirstOpen then
  begin
    FFirstOpen := False;
    exit;
  end;

  if dsDocs.Active then
  begin
    if not dsDocs.FieldByName('Doc_Id').IsNull then
      i := dsDocs['Doc_Id'];
    inFilter := dsDocs.Filtered;
    filter := dsDocs.filter;
    dsDocs.CloseOpen(True);
    if inFilter then
    begin
      dsDocs.filter := filter;
      dsDocs.Filtered := inFilter;
      if dbGrid.SearchPanel.SearchingText <> '' then
        dbGrid.SearchPanel.ApplySearchFilter;
    end;
    if i <> -1 then
      dsDocs.Locate('Doc_Id', i, []);
  end
  else
    miMonthClick(Sender);

  if dsMaterials.Active then
    dsMaterials.CloseOpen(True)
  else
    dsMaterials.Open;
end;

procedure TMatDocsForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (FFullAccess or (FAccessNew and FCanEdit)) then
    MaterialIncomeDocument(-1);
end;

procedure TMatDocsForm.actOpenMatExecute(Sender: TObject);
begin
  inherited;
  if Not Assigned(MaterialsForm) then
    MaterialsForm := TMaterialsForm.Create(Application);
  MaterialsForm.Show;
end;

procedure TMatDocsForm.actDocMoveExecute(Sender: TObject);
begin
  inherited;
  if not(FFullAccess or (FAccessMove and FCanEdit)) then
    exit;
  MaterialMoveDocument(-1);
end;

procedure TMatDocsForm.actDocOUTExecute(Sender: TObject);
begin
  inherited;
  if not(FFullAccess or (FAccessOut and FCanEdit)) then
    exit;
  MaterialOutDocument(-1);
end;

procedure TMatDocsForm.actDocInventExecute(Sender: TObject);
begin
  inherited;
  if not(FFullAccess or (FAccessInv and FCanEdit)) then
    exit;
  MaterialInventoryDocument(-1);
end;

procedure TMatDocsForm.actDocInventoryExecute(Sender: TObject);
begin
  inherited;
  if not(FFullAccess or (FAccessInv and FCanEdit)) then
    exit;
  MaterialInventoryDocument(-1);
end;

procedure TMatDocsForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (not dsDocs.FieldByName('Doc_Closed').IsNull) // Подключен
  then
  begin
    if (dsDocs['Doc_Closed'] = 0) then
      AFont.Style := AFont.Style + [fsBold]
    else
      AFont.Style := AFont.Style - [fsBold];
  end;
end;

procedure TMatDocsForm.dsFilterNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsFilter['CLOSED'] := False;
end;

procedure TMatDocsForm.LoadReportBody(const fReport_ID: Integer);
var
  Stream: TStream;
begin
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').value := fReport_ID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        frxReport.LoadFromStream(Stream);
        frxReport.FileName := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        frxReport.PreviewForm.Caption := frxReport.FileName;
      finally
        Stream.Free;
      end;
    end;
  finally
    if dmMain.fdsLoadReport.Active then
      dmMain.fdsLoadReport.Close;
  end;
end;

procedure TMatDocsForm.AddReport(const report_id: Integer; const variable: string; const value: Variant;
  const AsNew: Boolean = False);
var
  vi: Integer;
begin
  LoadReportBody(report_id);
  vi := frxReport.Variables.IndexOf(variable);
  if vi > 0 then
    frxReport.Variables[variable] := value;

  frxReport.PrepareReport(AsNew);
end;

procedure TMatDocsForm.actPrintExecute(Sender: TObject);
var
  i, ri: Integer;
  b: TBookMark;
  FirstReport: Boolean;
begin
  inherited;
  if dsDocs.RecordCount = 0 then
    exit;

  // with TReportChild.Create(Application) do begin
  FirstReport := True;
  if (dbGrid.SelectedRows.Count = 0) then
  begin
    if not dbGrid.DataSource.DataSet.FieldByName('DT_REPORT').IsNull then
    begin
      ri := dmMain.GET_ID_REPORT_BY_PATH(dbGrid.DataSource.DataSet['DT_REPORT']);
      if ri >= 0 then
      begin
        AddReport(ri, 'DOC_ID', dbGrid.DataSource.DataSet['DOC_ID'], FirstReport);
        FirstReport := False;
      end;
    end;
  end
  else
  begin
    if MessageDlg(rsMadDocsPrint, mtConfirmation, mbOKCancel, 0) = mrOk then
    begin
      b := dbGrid.DataSource.DataSet.GetBookmark;
      dbGrid.DataSource.DataSet.First;
      dbGrid.DataSource.DataSet.Disablecontrols;
      for i := 0 to dbGrid.SelectedRows.Count - 1 do
      begin
        dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[i];
        if not dbGrid.DataSource.DataSet.FieldByName('DT_REPORT').IsNull then
        begin
          ri := dmMain.GET_ID_REPORT_BY_PATH(dbGrid.DataSource.DataSet['DT_REPORT']);
          if ri >= 0 then
          begin
            AddReport(ri, 'DOC_ID', dbGrid.DataSource.DataSet['DOC_ID'], FirstReport);
            FirstReport := False;
          end;
        end;
      end;
      dbGrid.DataSource.DataSet.GotoBookmark(b);
      dbGrid.DataSource.DataSet.EnableControls;
    end;
  end;

  if not FirstReport then
  begin
    frxReport.ReportOptions.Name := frxReport.FileName;
    frxReport.ShowPreparedReport;
  end;
end;

procedure TMatDocsForm.FormCreate(Sender: TObject);
begin
  inherited;
  dmMain.frxAddFunctions(frxReport);
  actOpenMat.Visible := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_View) or
    dmMain.AllowedAction(rght_Dictionary_Materials) or dmMain.AllowedAction(rght_Materials_full);
end;

function TMatDocsForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  inherited;
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

procedure TMatDocsForm.actDeleteExecute(Sender: TObject);
var
  CanDelete: Boolean;
begin
  inherited;
  if (not dsDocs.FieldByName('Doc_Closed').IsNull) and (dsDocs['Doc_Closed'] = 1) then
  begin
    ShowMessage(rsERROR_MATDOC_CLOSED);
    exit;
  end;

  case dsDocs['DT_ID'] of
    1:
      CanDelete := (FFullAccess or FAccessNew); // Приход материалов
    2:
      CanDelete := (FFullAccess or FAccessMove); // Перемещение по складам
    3:
      CanDelete := (FFullAccess or FAccessOut); // Списание материалов
    4:
      CanDelete := (FFullAccess or FAccessInv); // Инвентаризация
  else
    CanDelete := FFullAccess;
  end;

  if (CanDelete) and (MessageDlg(format(rsDeleteRecord, [dsDocs['DOC_N']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
  begin
    dsDocs.Delete;
    dsDocs.UpdateTransaction.Commit;
  end;
end;

procedure TMatDocsForm.MenuItem2Click(Sender: TObject);
begin
  inherited;
  fStartDate := now - 7;
  fEndDate := now;
  SetMatDocDateFilter;
end;

procedure TMatDocsForm.miMonthClick(Sender: TObject);
begin
  inherited;
  fStartDate := MonthFirstDay(now);
  fEndDate := MonthLastDay(now);
  SetMatDocDateFilter;
end;

procedure TMatDocsForm.MenuItem1Click(Sender: TObject);
begin
  inherited;
  fStartDate := now;
  fEndDate := now;
  SetMatDocDateFilter;
end;

procedure TMatDocsForm.N4Click(Sender: TObject);
begin
  inherited;
  fStartDate := (now - 1);
  fEndDate := (now - 1);
  SetMatDocDateFilter;
end;

procedure TMatDocsForm.SetMatDocDateFilter;
var
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    actEnableFilter.Checked := True;
    dsFilter.Close;
    dsFilter.Open;
    dsFilter.EmptyTable;
    dsFilter.Append;
    dsFilter['dStart'] := fStartDate;
    dsFilter['dEnd'] := fEndDate;
    dsFilter['MD_STATE'] := -1;
    dsFilter['CLOSED'] := False;
    dsFilter.Post;
    dsDocs.ParamByName('Filter').value := GenerateFilter;
    dsDocs.CloseOpen(True);
    dsMaterials.CloseOpen(True);
    actEnableFilter.Checked := True;
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TMatDocsForm.ToolButton1Click(Sender: TObject);
begin
  inherited;
  if (actNew.Visible) then
    MaterialIncomeDocument(-1)
  else if actDocMove.Visible then
    MaterialMoveDocument(-1)
  else if actDocOUT.Visible then
    MaterialOutDocument(-1)
  else if actDocInventory.Visible then
    MaterialInventoryDocument(-1);
end;

function TMatDocsForm.GenerateFilter: string;

  function RecordToFilter: string;
  var
    tmpSQL: string;
  begin
    tmpSQL := '';

    if (not dsFilter.FieldByName('MD_TYPE').IsNull) then
      tmpSQL := tmpSQL + format(' and ( D.Dt_Id = %d) ', [dsFilter.FieldByName('MD_TYPE').AsInteger]);

    if ((not dsFilter.FieldByName('dStart').IsNull) or (not dsFilter.FieldByName('dEnd').IsNull)) then
    begin
      if ((not dsFilter.FieldByName('dStart').IsNull) and (dsFilter.FieldByName('dEnd').IsNull)) then
        tmpSQL := tmpSQL + format(' and ( d.doc_date >= ''%s'') ',
          [FormatDateTime('yyyy-mm-dd', dsFilter.FieldByName('dStart').AsDateTime)])
      else if ((dsFilter.FieldByName('dStart').IsNull) and (not dsFilter.FieldByName('dEnd').IsNull)) then
        tmpSQL := tmpSQL + format(' and ( d.doc_date <= ''%s'') ',
          [FormatDateTime('yyyy-mm-dd', dsFilter.FieldByName('dEnd').AsDateTime)])
      else
        tmpSQL := tmpSQL + format(' and ( d.doc_date between ''%s'' and ''%s'') ',
          [FormatDateTime('yyyy-mm-dd', dsFilter.FieldByName('dStart').AsDateTime), FormatDateTime('yyyy-mm-dd',
          dsFilter.FieldByName('dEnd').AsDateTime)])
        // d.doc_date between :sd and :ed
    end;

    if (not dsFilter.FieldByName('MD_STATE').IsNull) then
    begin
      if (dsFilter['MD_STATE'] <> -1) then
        tmpSQL := tmpSQL + format(' and D.Doc_Closed = %d ', [dsFilter.FieldByName('MD_STATE').AsInteger]);
    end;

    if (not dsFilter.FieldByName('M_ID').IsNull) then
    begin
      tmpSQL := tmpSQL +
        format(' and exists(select mi.Id from Materials_in_Doc mi where mi.M_Id = %d and mi.Doc_Id = d.Doc_Id) ',
        [dsFilter.FieldByName('M_ID').AsInteger]);
    end;

    if (not dsFilter.FieldByName('WH_IN').IsNull) then
    begin
      tmpSQL := tmpSQL + format(' and d.WH_ID = %d ', [dsFilter.FieldByName('WH_IN').AsInteger]);
    end;

    if (not dsFilter.FieldByName('WH_OUT').IsNull) then
    begin
      tmpSQL := tmpSQL + format(' and d.From_Wh = %d ', [dsFilter.FieldByName('WH_OUT').AsInteger]);
    end;

    if (not dsFilter.FieldByName('MD_STATE').IsNull) and (dsFilter['MD_STATE'] = -1) then
    begin
        tmpSQL := '(' + TrimAnd(tmpSQL) + ') or (D.Doc_Closed = 0) ';
    end;

//    if (not dsFilter.FieldByName('CLOSED').IsNull) and dsFilter['CLOSED'] then
//    begin
//      tmpSQL := tmpSQL + ' and D.Doc_Closed = 1 ';
//    end;

    if (tmpSQL <> '') then
      Result := TrimAnd(tmpSQL)
    else
      Result := const_default_filter;

    if dsFilter['inversion'] then
      Result := format(' NOT (%s)', [Result]);
  end;

var
  whereStr: string;
  default: string;
begin
  default := const_default_filter;
  Result := default;
  whereStr := '';

  if (dsFilter.RecordCount = 0) or (not actEnableFilter.Checked) then
    exit;
  srcDataSource.DataSet.Disablecontrols;

  try
    dsFilter.First;

    whereStr := '';
    while not dsFilter.Eof do
    begin
      whereStr := whereStr + ' ( ' + RecordToFilter + ' ) ';
      // проверим, если ограничение одной записи и фильтр по квартире. то скинем ограничение
      dsFilter.next;
      if not dsFilter.Eof then
        if dsFilter['next_condition'] = 0 then
          whereStr := whereStr + ' OR '
        else
          whereStr := whereStr + ' AND '
    end;
  except
    whereStr := default;
    ShowMessage(rsErrorSetFilter);
  end;

  Result := whereStr;
  srcDataSource.DataSet.EnableControls;
end;

// procedure TMatDocsForm.SetDefaultFilter;
// var
// f: string;
// begin
// dsFilter.Close;
// dsFilter.Open;
// dsFilter.EmptyTable;
// f := A4MainForm.GetUserFilterFolder + 'matdoc_default.ftr';
// if FileExists(f) then
// begin
// if dsFilter.State in [dsEdit, dsInsert] then
// dsFilter.Post;
// DatasetFromJson(dsFilter, f);
// end;
//
// if dsFilter.RecordCount > 0 then
// actEnableFilter.Checked := True;
// end;

procedure TMatDocsForm.actEnableFilterExecute(Sender: TObject);
begin
  inherited;
  if actEnableFilter.Checked then
    dsDocs.ParamByName('Filter').value := const_default_filter
  else
    dsDocs.ParamByName('Filter').value := GenerateFilter;
  dsDocs.CloseOpen(True);
  dsMaterials.CloseOpen(True);
  actEnableFilter.Checked := not actEnableFilter.Checked;
end;

procedure TMatDocsForm.actSetFilterNewExecute(Sender: TObject);
var
  filter: string;
begin
  inherited;
  if not(srcDataSource.DataSet is TpFIBDataSet) then
    exit;

  filter := '';
  with dsFilter do
  begin
    Disablecontrols;
    if Active then
      Close;
    Open;
    EmptyTable;
    Insert;
    EnableControls;
  end;

  with TMatDocFilterForm.Create(Application) do
  begin
    try
      if ShowModal = mrOk then
      begin
        actEnableFilter.Checked := True;
        filter := GenerateFilter;
      end;
    finally
      Free;
    end;
  end;

  if (dsDocs.Filtered) then
  begin
    dsDocs.filter := '';
    dsDocs.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsDocs.Close;
    dsDocs.ParamByName('Filter').value := filter;
    dsDocs.Open;
    dsMaterials.CloseOpen(True);
  end;
end;

end.
