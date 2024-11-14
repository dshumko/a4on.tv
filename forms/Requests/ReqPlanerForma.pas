unit ReqPlanerForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, PlannersEh, SpreadGridsEh, PlannerCalendarPickerEh,
  EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, DBCtrlsEh, PlannerDataEh, MemTableDataEh, MemTableEh, FIBDataSet, pFIBDataSet,
  DataDriverEh,
  pFIBDataDriverEh, FIBDatabase, pFIBDatabase, amSplitter;

type
  TReqPlanerForm = class(TForm)
    pnlCalPickerPanel: TPanel;
    gridResouce: TDBGridEh;
    plnrclndrpckrhCalendarPickerEh1: TPlannerCalendarPickerEh;
    PlannerControl: TPlannerControlEh;
    PlannerDayViewEh1: TPlannerDayViewEh;
    PlannerWeekViewEh1: TPlannerWeekViewEh;
    PlannerMonthViewEh1: TPlannerMonthViewEh;
    PlannerVertHourslineViewEh1: TPlannerVertHourslineViewEh;
    PlannerHorzHourslineViewEh1: TPlannerHorzHourslineViewEh;
    PlannerVertDayslineViewEh1: TPlannerVertDayslineViewEh;
    PlannerHorzDayslineViewEh1: TPlannerHorzDayslineViewEh;
    pnl1: TPanel;
    cbbPlanerViewMode: TDBComboBoxEh;
    pldsPlanner: TPlannerDataSourceEh;
    mtPlannerData: TMemTableEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    drvPlan: TpFIBDataDriverEh;
    srcPlan: TDataSource;
    dsRequest: TpFIBDataSet;
    edtEndWorkTime: TDBDateTimeEditEh;
    edtStartWorkTime: TDBDateTimeEditEh;
    chkWorkOnly: TCheckBox;
    bFillPlanner: TButton;
    NewPlanItem: TButton;
    cbbGroupBy: TDBComboBoxEh;
    dsFilter: TpFIBDataSet;
    srcFilter: TDataSource;
    mmoItem: TDBMemoEh;
    spl1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbPlanerViewModeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bFillPlannerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbbGroupByChange(Sender: TObject);
    procedure pldsPlannerPrepareItemsReader(PlannerDataSource: TPlannerDataSourceEh;
      RequriedStartDate, RequriedFinishDate, LoadedBorderDate: TDateTime;
      var PreparedReadyStartDate, PreparedFinishDate: TDateTime);
    procedure FormShow(Sender: TObject);
    procedure PlannerControlPlannerItemInteractiveChanged(PlannerControl: TPlannerControlEh;
      PlannerView: TCustomPlannerViewEh; Item, OldValuesItem: TPlannerDataItemEh);
    procedure PlannerControlShowPlanItemDialog(PlannerControl: TPlannerControlEh; PlannerView: TCustomPlannerViewEh;
      Item: TPlannerDataItemEh; ChangeMode: TPlanItemChangeModeEh);
    procedure PlannerViewEhSelectionChanged(Sender: TObject);
  private
    FRFull: Boolean;
    FREdit: Boolean;
    FRGive: Boolean;
    FRAdd: Boolean;
    procedure FillPlanner(const StartDate: TDate; const EndDate: TDate);
    procedure PrepareFilter(const TypeID: Integer = -1);
    function GetItemText: String;
    function GetTitleText: String;
    procedure SetItemColor(PlanItem: TPlannerDataItemEh);
  public
    { Public declarations }
  end;

var
  ReqPlanerForm: TReqPlanerForm;

implementation

{$R *.dfm}

uses
  System.DateUtils, System.Generics.Collections,
  DM, RequestForma, RequestNewForma, pFIBQuery, PrjConst;

function TReqPlanerForm.GetItemText: String;
var
  s: string;
begin
  s := dsRequest['CONTETNT'];
  s := s + sLineBreak;

  if not dsRequest.FieldByName('ACCOUNT_NO').IsNull then
  begin
    if not dsRequest.FieldByName('FIO').IsNull then
      s := s + 'ФИО ' + dsRequest['FIO'] + ' ';
    s := s + 'лицевой ' + dsRequest['ACCOUNT_NO'];
  end;

  if (not dsRequest.FieldByName('WORKERS').IsNull) and (dsRequest['WORKERS'] <> '') then
    s := s + sLineBreak + 'Исп.: ' + dsRequest['WORKERS'];

  result := s;
end;

function TReqPlanerForm.GetTitleText: String;
var
  s: string;
begin
  s := '[' + IntToStr(dsRequest['RQ_ID']) + '] ' + dsRequest['RT_NAME'] + sLineBreak;
  if (not dsRequest.FieldByName('Subarea_Name').IsNull) and (dsRequest['Subarea_Name'] <> '') then
    s := s + '[' + dsRequest['Subarea_Name'] + ']';
  s := s + dsRequest['STREET_NAME'] + ' д.' + dsRequest['HOUSE_NO'] + ' ' + dsRequest['FLAT_NO'];

  result := s;
end;

procedure TReqPlanerForm.PlannerControlPlannerItemInteractiveChanged(PlannerControl: TPlannerControlEh;
  PlannerView: TCustomPlannerViewEh; Item, OldValuesItem: TPlannerDataItemEh);
var
  Query: TpFIBQuery;
begin
  if not FREdit then
    Exit;
  if (Item.StartTime <> OldValuesItem.StartTime) or (Item.EndTime <> OldValuesItem.EndTime) then
  begin
    if Application.MessageBox(PChar(Format('Новое время заявки %s - %s',
      [FormatDateTime('dd.mm.yy hh:nn', Item.StartTime), FormatDateTime('dd.mm.yy hh:nn', Item.EndTime)])),
      PChar('Перенос времени'), MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      Query := TpFIBQuery.Create(self);
      try
        Query.Database := dmMain.dbTV;
        Query.Transaction := trWrite;
        Query.SQL.Text :=
          'update Request set Rq_Plan_Date = :Rq_Plan_Date, Rq_Time_From = :Rq_Time_From, Rq_Time_To = :Rq_Time_To';
        Query.SQL.Add(' where (Rq_Id = :Rq_Id)');
        Query.ParamByName('Rq_Plan_Date').AsDate := Item.StartTime;
        Query.ParamByName('Rq_Time_From').AsTime := Item.StartTime;
        Query.ParamByName('Rq_Time_To').AsTime := Item.EndTime;
        Query.ParamByName('Rq_Id').AsInteger := Item.ItemID;
        Query.Transaction.StartTransaction;
        Query.ExecQuery;
        Query.Transaction.Commit;
      finally
        FreeAndNil(Query);
      end;
      FillPlanner(Item.StartTime, Item.StartTime);
      // PlannerControl.CurrentTime := Item.StartTime;
    end;
  end;
end;

procedure TReqPlanerForm.PlannerControlShowPlanItemDialog(PlannerControl: TPlannerControlEh;
  PlannerView: TCustomPlannerViewEh; Item: TPlannerDataItemEh; ChangeMode: TPlanItemChangeModeEh);
var
  StartTime, EndTime: TDateTime;
  AResource: TPlannerResourceEh;
  i: Integer;
begin
  if not(FREdit or FRAdd or FRGive) then
    Exit;
  i := -1;
  PlannerControl.NewItemParams(StartTime, EndTime, AResource);
  if ChangeMode = picmModifyEh then
  begin
    if not(FREdit or FRGive) then
      Exit;
    i := ReguestExecute(Item.ItemID, -2);
  end
  else
  begin
    if not(FRAdd) then
      Exit;
    if Assigned(AResource) then
      i := AResource.ResourceID;

    i := NewRequestFromPlaner(StartTime, i);
  end;
  if i > 0 then
  begin
    FillPlanner(Today, Today);
    PlannerControl.CurrentTime := StartTime;
  end;

end;

procedure TReqPlanerForm.PlannerViewEhSelectionChanged(Sender: TObject);
begin
  if PlannerControl.ActivePlannerView.SelectedPlanItem <> nil then
  begin
    mmoItem.Lines.Text := PlannerControl.ActivePlannerView.SelectedPlanItem.Title;
    mmoItem.Lines.Add(PlannerControl.ActivePlannerView.SelectedPlanItem.Body);
  end
  else
    mmoItem.Lines.Text := '';
end;

procedure TReqPlanerForm.SetItemColor(PlanItem: TPlannerDataItemEh);
var
  c: TColor;
begin
  // c := clDefault;
  if (dsRequest['REQ_RESULT'] < 1) and (PlanItem.EndTime < now()) then
  begin
    c := clRed;
  end
  else
  begin
    if not dsRequest.FieldByName('RT_COLOR').IsNull then
      c := StringToColor(dsRequest['RT_COLOR'])
    else
      c := clWhite;
    // если выполнена. отметим его
    if (dsRequest['REQ_RESULT'] > 1) then
      c := clMoneyGreen;
  end;
  PlanItem.FillColor := c;
end;

procedure TReqPlanerForm.FillPlanner(const StartDate: TDate; const EndDate: TDate);
var
  i: Integer;
  PlanItem: TPlannerDataItemEh;
  ResList: TList<Integer>;
  TypeID: Integer;
  STime, ETime: TDateTime;
begin
  ResList := TList<Integer>.Create;
  pldsPlanner.BeginUpdate;
  pldsPlanner.Resources.Clear;
  pldsPlanner.ClearItems;

  if dsRequest.Active then
    dsRequest.Close;
  TypeID := 0;
  if not VarIsNull(cbbGroupBy.Value) then
    TypeID := cbbGroupBy.Value;

  if TypeID > 0 then
  begin
    for i := 0 to gridResouce.SelectedRows.Count - 1 do
    begin
      with pldsPlanner.Resources.Add do
      begin
        dsFilter.Bookmark := gridResouce.SelectedRows[i];
        Name := dsFilter.FieldByName('NAME').AsString;
        ResourceID := dsFilter.FieldByName('ID').AsString;
        if not dsFilter.FieldByName('COLOR').IsNull then
          Color := StringToColor(dsFilter['COLOR']);
        ResList.Add(dsFilter['ID']);
      end;
    end;
  end;

  dsRequest.ParamByName('BDATE').AsDate := Today - 7; // StartDate;
  dsRequest.ParamByName('EDATE').AsDate := Today + 30; // EndDate;
  dsRequest.DisableControls;
  dsRequest.Open;
  dsRequest.First;
  while not dsRequest.Eof do
  begin
    if (TypeID = 0) or ((TypeID = 1) and (ResList.IndexOf(dsRequest['RQ_TYPE']) > -1)) then
    begin
      if not dsRequest.FieldByName('RQ_TIME_FROM').IsNull then
        STime := dsRequest['RQ_PLAN_DATE'] + dsRequest['RQ_TIME_FROM']
      else
        STime := dsRequest['RQ_PLAN_DATE'];

      if not dsRequest.FieldByName('RQ_TIME_TO').IsNull then
        ETime := dsRequest['RQ_PLAN_DATE'] + dsRequest['RQ_TIME_TO']
      else
        ETime := dsRequest['RQ_PLAN_DATE'] + 0.9999;

      PlanItem := pldsPlanner.NewItem();
      PlanItem.ItemID := dsRequest['RQ_ID'];
      if STime < ETime then
      begin
        PlanItem.StartTime := STime;
        PlanItem.EndTime := ETime;
      end
      else
      begin
        PlanItem.StartTime := ETime;
        PlanItem.EndTime := STime;
      end;
      PlanItem.Title := GetTitleText;
      PlanItem.Body := GetItemText;
      PlanItem.AllDay := False;
      SetItemColor(PlanItem);
      case TypeID of
        1:
          PlanItem.ResourceID := dsRequest['RQ_TYPE'];
      end;

      pldsPlanner.FetchTimePlanItem(PlanItem);
    end;
    dsRequest.Next;
  end;
  dsRequest.EnableControls;
  // dsRequest.Close;
  pldsPlanner.EndUpdate;
  PlannerControl.CurrentTime := Today;

  FreeAndNil(ResList);
end;

procedure TReqPlanerForm.bFillPlannerClick(Sender: TObject);
begin
  FillPlanner(PlannerControl.CurrentTime - 30, PlannerControl.CurrentTime + 30);
end;

procedure TReqPlanerForm.cbbGroupByChange(Sender: TObject);
var
  t: Integer;
begin
  // FillPlanner(Today - 7, Today + 7);
  t := -1;
  if not VarIsNull(cbbGroupBy.Value) then
    t := cbbGroupBy.Value;

  PrepareFilter(t);
end;

procedure TReqPlanerForm.cbbPlanerViewModeChange(Sender: TObject);
begin
  case StrToInt(cbbPlanerViewMode.Value) of
    1:
      PlannerControl.ActivePlannerView := PlannerWeekViewEh1;
    2:
      PlannerControl.ActivePlannerView := PlannerMonthViewEh1;

    3:
      begin
        PlannerControl.ActivePlannerView := PlannerVertHourslineViewEh1;
        PlannerVertHourslineViewEh1.TimeRange := hlrDayEh;
      end;
    4:
      begin
        PlannerControl.ActivePlannerView := PlannerVertHourslineViewEh1;
        PlannerVertHourslineViewEh1.TimeRange := hlrWeekEh;
      end;
    5:
      begin
        PlannerControl.ActivePlannerView := PlannerVertDayslineViewEh1;
        PlannerVertDayslineViewEh1.TimeRange := dlrWeekEh;
      end;
    6:
      begin
        PlannerControl.ActivePlannerView := PlannerVertDayslineViewEh1;
        PlannerVertDayslineViewEh1.TimeRange := dlrMonthEh;
      end;
    7:
      begin
        PlannerControl.ActivePlannerView := PlannerHorzHourslineViewEh1;
        PlannerHorzHourslineViewEh1.TimeRange := hlrDayEh;
      end;
    8:
      begin
        PlannerControl.ActivePlannerView := PlannerHorzHourslineViewEh1;
        PlannerHorzHourslineViewEh1.TimeRange := hlrWeekEh;
      end;
    9:
      begin
        PlannerControl.ActivePlannerView := PlannerHorzDayslineViewEh1;
        PlannerHorzDayslineViewEh1.TimeRange := dlrWeekEh;
      end;
    10:
      begin
        PlannerControl.ActivePlannerView := PlannerHorzDayslineViewEh1;
        PlannerHorzDayslineViewEh1.TimeRange := dlrMonthEh;
      end;
  else
    PlannerControl.ActivePlannerView := PlannerDayViewEh1;
  end;

  PlannerControl.ActivePlannerView.OnSelectionChanged := PlannerViewEhSelectionChanged;

  PlannerControl.WorkingTimeStart := edtStartWorkTime.Value;
  PlannerControl.WorkingTimeEnd := edtEndWorkTime.Value;

  PlannerDayViewEh1.ShowWorkingTimeOnly := chkWorkOnly.Checked;
  PlannerWeekViewEh1.ShowWorkingTimeOnly := chkWorkOnly.Checked;
end;

procedure TReqPlanerForm.FormActivate(Sender: TObject);
begin
  bFillPlannerClick(Sender);
end;

procedure TReqPlanerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsRequest.Active then
    dsRequest.Close;
  Action := caFree;
  ReqPlanerForm := nil;
end;

procedure TReqPlanerForm.FormCreate(Sender: TObject);
begin
  FRFull := dmMain.AllowedAction(rght_Request_full);
  FREdit := dmMain.AllowedAction(rght_Request_edit);
  FRGive := dmMain.AllowedAction(rght_Request_Give);
  FRAdd := dmMain.AllowedAction(rght_Request_add);

  FREdit := FREdit or FRFull;
  FRAdd := FRAdd or FRFull;
  FRGive := FRGive or FRFull;
  chkWorkOnly.Checked := True;
  edtStartWorkTime.Value := TTime(EncodeTime(8, 0, 0, 0));
  edtEndWorkTime.Value := TTime(EncodeTime(17, 0, 0, 0));
  cbbPlanerViewMode.Value := 0;
end;

procedure TReqPlanerForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;

  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
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
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemoEh) then
      begin
        (Components[i] as TDBMemoEh).Font.Name := Font_name;
        (Components[i] as TDBMemoEh).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemo) then
      begin
        (Components[i] as TDBMemo).Font.Name := Font_name;
        (Components[i] as TDBMemo).Font.Size := Font_size;
      end;
    end;
  end;

  if Font_size <> 0 then
  begin
    PlannerControl.Font.Name := Font_name;
    PlannerControl.Font.Size := Font_size;
  end;
end;

procedure TReqPlanerForm.pldsPlannerPrepareItemsReader(PlannerDataSource: TPlannerDataSourceEh;
  RequriedStartDate, RequriedFinishDate, LoadedBorderDate: TDateTime;
  var PreparedReadyStartDate, PreparedFinishDate: TDateTime);
begin
  // if (LoadedBorderDate < StartDate) or (LoadedBorderDate > FinishDate)
  if ((RequriedStartDate <> 0) and (RequriedFinishDate <> 0)) then
  begin
    FillPlanner(RequriedStartDate, RequriedFinishDate);
    PreparedReadyStartDate := RequriedStartDate;
    PreparedFinishDate := RequriedFinishDate;
  end;
end;

procedure TReqPlanerForm.PrepareFilter(const TypeID: Integer = -1);
begin
  dsFilter.Close;
  case TypeID of
    1:
      begin
        dsFilter.SQLs.SelectSQL.Clear;
        dsFilter.SQLs.SelectSQL.Add
          ('select RT.RT_ID as ID, RT.RT_NAME as NAME, rt.Rt_Color as COLOR from REQUEST_TYPES RT ORDER BY 2');
      end;
  end;
  dsFilter.Active := (TypeID > 0);
  if dsFilter.Active then
  begin
    dsFilter.First;
    while not dsFilter.Eof do
    begin
      gridResouce.SelectedRows.CurrentRowSelected := True;
      dsFilter.Next;
    end;
    dsFilter.First;
  end;
  gridResouce.Visible := (dsFilter.Active);
end;

end.
