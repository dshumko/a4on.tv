unit PortListForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GridForma, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, CnErrorProvider, Vcl.Menus,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, FIBDataSet, pFIBDataSet, EhLibFIB,
  MemTableDataEh, MemTableEh;

type
  TPortListForm = class(TGridForm)
    dsPort: TpFIBDataSet;
    btnLinkPort: TToolButton;
    actLinkPort: TAction;
    dsFilter: TMemTableEh;
    btn1: TToolButton;
    btnFilterSet: TToolButton;
    actFilterSet: TAction;
    actEnableFilter: TAction;
    actSetFilterNew: TAction;
    pmFilter: TPopupMenu;
    N31: TMenuItem;
    N53: TMenuItem;
    N42: TMenuItem;
    N36: TMenuItem;
    actOpenCustomer: TAction;
    btn2: TToolButton;
    btnOpenCustomer: TToolButton;
    btn3: TToolButton;
    chkShowOFF: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEditExecute(Sender: TObject);
    procedure dbGridSortMarkingChanged(Sender: TObject);
    procedure actLinkPortExecute(Sender: TObject);
    procedure actFilterSetExecute(Sender: TObject);
    procedure actEnableFilterExecute(Sender: TObject);
    procedure actOpenCustomerExecute(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure chkShowOFFClick(Sender: TObject);
  private
    FShowColorOFF: Boolean;
    procedure SetShowColorOff(const aShow: Boolean);
    function GetOrderClause(grid: TCustomDBGridEh): string;
    procedure SetDefaultFilter;
    function GenerateFilter: string;
  public
    { Public declarations }
  end;

var
  PortListForm: TPortListForm;

implementation

uses MAIN, DM, EQPort, A4onTypeUnit, PortLinkForma, PrjConst,
  PortFilter, FIBQuery, pFIBQuery, AtrCommon, AtrStrUtils;

{$R *.dfm}

procedure TPortListForm.actEditExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;

  function GetEquipmentRecord: TEquipmentRecord;
  begin
    if (srcDataSource.DataSet.RecordCount = 0) then
    begin
      Result.id := -1;
      exit;
    end;

    Result.id := srcDataSource.DataSet.FieldByName('Eid').AsInteger;
    if not srcDataSource.DataSet.FieldByName('Eq_Type').IsNull then
      Result.TypeID := srcDataSource.DataSet.FieldByName('Eq_Type').AsInteger;
    if not srcDataSource.DataSet.FieldByName('eqgroup').IsNull then
      Result.TypeName := srcDataSource.DataSet.FieldByName('eqgroup').asString;
    if not srcDataSource.DataSet.FieldByName('EQ_Name').IsNull then
      Result.Name := srcDataSource.DataSet.FieldByName('EQ_Name').asString;
    if not srcDataSource.DataSet.FieldByName('Ip').IsNull then
      Result.IP := srcDataSource.DataSet.FieldByName('Ip').asString;
    if not srcDataSource.DataSet.FieldByName('Mac').IsNull then
      Result.MAC := srcDataSource.DataSet.FieldByName('Mac').asString;
    // if not srcDataSource.DataSet.FieldByName('Notice').IsNull then
    // Result.notice := srcDataSource.DataSet.FieldByName('Notice').asString;
  end;

begin
  inherited;

  if not dsPort.FieldByName('PORT').IsNull then
    Port := dsPort.FieldByName('PORT').asString
  else
    exit;

  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    exit;

  if EditPort(EQ, Port) then
    dsPort.Refresh;
end;

procedure TPortListForm.actLinkPortExecute(Sender: TObject);
begin
  inherited;
  if ((dsPort.RecordCount = 0) or (dsPort.FieldByName('PORT').IsNull)) then
    exit;

  if LinkPort(dsPort['Eid'], dsPort['PORT']) then
    dsPort.Refresh;
end;

procedure TPortListForm.actOpenCustomerExecute(Sender: TObject);
var
  grid: TDBGridEh;
  i: Integer;
  b: TBookmark;
  customers: TStringList;
  s: string;
begin
  inherited;
  grid := dbGrid;

  customers := TStringList.Create;
  customers.Sorted := true;
  customers.Duplicates := dupIgnore;

  if (grid.SelectedRows.Count = 0) then
  begin
    if (grid.DataSource.DataSet.FieldByName('CON').IsNull) or (grid.DataSource.DataSet.FieldByName('CON').AsInteger = 1)
    then
    begin

      if not grid.DataSource.DataSet.FieldByName('CON_ID').IsNull then
        customers.Add(IntToStr(grid.DataSource.DataSet['CON_ID']));
    end
  end
  else
  begin
    b := grid.DataSource.DataSet.GetBookmark;
    grid.DataSource.DataSet.Disablecontrols;
    grid.DataSource.DataSet.First;
    for i := 0 to grid.SelectedRows.Count - 1 do
    begin
      grid.DataSource.DataSet.Bookmark := grid.SelectedRows[i];
      if (grid.DataSource.DataSet.FieldByName('CON').IsNull) or
        (grid.DataSource.DataSet.FieldByName('CON').AsInteger = 1) then
      begin

        if not grid.DataSource.DataSet.FieldByName('CON_ID').IsNull then
          customers.Add(IntToStr(grid.DataSource.DataSet['CON_ID']));
      end
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
    A4MainForm.ShowCustomers(7, s);
end;

procedure TPortListForm.chkShowOFFClick(Sender: TObject);
begin
  inherited;

  SetShowColorOff(chkShowOFF.Checked);
end;

procedure TPortListForm.SetShowColorOff(const aShow: Boolean);
begin
  FShowColorOFF := aShow;
  dsPort.Close;
  if not FShowColorOFF then
    dsPort.ParamByName('ShowColor').Clear
  else
    dsPort.ParamByName('ShowColor').Value := 'iif(coalesce(p.con,1) = 1, (iif(exists(select sh.Customer_Id' + #13#10 +
      ' from Subscr_hist sh  inner join services s on (sh.Serv_Id = s.Service_Id)' + #13#10 +
      ' inner join TV_LAN l on (l.Customer_Id = sh.Customer_Id) where s.Business_Type in (1, 3)' + #13#10 +
      ' and sh.Customer_Id = p.Con_Id and current_date between sh.Date_From and sh.Date_To), 1,0)), 2)';
  dsPort.CloseOpen(true);
end;

procedure TPortListForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not FShowColorOFF then
    exit;

  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('CUST_CONNECTED').IsNull then
  begin
    if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('CUST_CONNECTED').AsInteger = 0) then
      Background := clYellow
    else
      Background := clWindow;
  end;
end;

procedure TPortListForm.dbGridSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  grid: TCustomDBGridEh;
  id: Integer;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
begin
  inherited;
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  grid := TCustomDBGridEh(Sender);
  FIBDS := grid.DataSource.DataSet as TpFIBDataSet;
  id := -1;
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FIBDS.Active;
    if beOpened then
    begin
      if not FIBDS.FieldByName('EID').IsNull then
        id := FIBDS.FieldByName('EID').AsInteger;
      FIBDS.Close;
    end;

    s := GetOrderClause(grid);

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> -1 then
        FIBDS.Locate('EID', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

procedure TPortListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsPort.Close;
end;

procedure TPortListForm.FormShow(Sender: TObject);
begin
  inherited;
  dsPort.Open;
end;

function TPortListForm.GetOrderClause(grid: TCustomDBGridEh): string;
var
  s: string;
  i, J: Integer;
begin
  J := grid.SortMarkedColumns.Count;
  s := ' ';
  for i := 0 to pred(J) do
  begin
    {
      if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'ACCOUNT_NO') then
      s := s + 'C.account_no'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'STREET_NAME') then
      s := s + 'S.Street_Name||s.street_short'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'FLAT_NO') then
      s := s + 'C.Flat_No'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'HOUSE_NO') then
      s := s + 'H.HOUSE_NO '
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'ATR_LINE') then
      s := s + 'cast(cal.ATR_LINE as varchar(50))'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'NOTICE') then
      s := s + 'C.NOTICE'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'CUST_CODE')
      // then s := s + 'FOR_ADRES_SORT'
      then
      s := s + 'C.CUST_CODE'
      else
    }
    s := s + grid.SortMarkedColumns[i].FieldName;
    // s := s + ' COLLATE UNICODE_CI_AI ';
    if grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      s := s + ' desc';
    if i <> pred(J) then
      s := s + ', ';
  end;
  Result := s;
end;

procedure TPortListForm.actEnableFilterExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet is TpFIBDataSet then
  begin
    actEnableFilter.Checked := not actEnableFilter.Checked;
    dsPort.ParamByName('Filter').Value := GenerateFilter;
    dsPort.CloseOpen(true);
  end;
end;

procedure TPortListForm.actFilterSetExecute(Sender: TObject);
var
  filter: string;
begin
  inherited;
  if not(srcDataSource.DataSet is TpFIBDataSet) then
    exit;

  filter := '';

  with TPortFilterForm.Create(Application) do
    try
      if not dsFilter.Active then
        SetDefaultFilter;

      actEnableFilter.Checked := (ShowModal = mrOk);
      filter := GenerateFilter;
    finally
      Free;
    end;

  if (srcDataSource.DataSet.Filtered) then
  begin
    srcDataSource.DataSet.filter := '';
    srcDataSource.DataSet.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsPort.Close;
    dsPort.ParamByName('Filter').Value := filter;
    try
      dsPort.Open;
    except
      ShowMessage(rsErrorFilter);
      dsPort.Close;
      dsPort.ParamByName('Filter').Clear;
      dsPort.Open;
    end;
  end;
end;

function TPortListForm.GenerateFilter: string;

  function RecordToFilter: string;
  var
    tmpSQL, s: string;
  begin
    tmpSQL := '';

    // Условие отбора по адресу
    if (dsFilter['CHECK_ADRESS'] = 1) then
    begin
      if (not dsFilter.FieldByName('HOUSE_ID').IsNull) then
      begin
        s := ' and (h.House_Id = %d) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('HOUSE_ID').AsInteger])
      end
      else if (not dsFilter.FieldByName('Street_Id').IsNull) then
      begin
        s := ' and (s.Street_Id = %d) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('Street_Id').AsInteger])
      end;
      {
        if (not dsFilter.FieldByName('PORCH').IsNull) then
        begin
        s := ' and ((s.Porch_N = ''%s'') or (e.Porch_N = ''%s'')) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('PORCH').asString, dsFilter.FieldByName('PORCH').asString])
        end;

        if (not dsFilter.FieldByName('FLOOR').IsNull) then
        begin
        s := ' and ((s.Floor_N = ''%s'') or (e.Floor_N = ''%s'')) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('FLOOR').asString, dsFilter.FieldByName('FLOOR').asString])
        end;

        if (not dsFilter.FieldByName('PLACE').IsNull) then
        begin
        s := ' and ((s.Place = ''%s'') or (e.Place = ''%s'')) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('PLACE').asString, dsFilter.FieldByName('PLACE').asString])
        end;
      }
      if (not dsFilter.FieldByName('SUBAREA_ID').IsNull) then
      begin
        s := ' and (h.Subarea_Id = %d) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('SUBAREA_ID').AsInteger])
      end;

      if (not dsFilter.FieldByName('AREA_ID').IsNull) then
      begin
        s := ' and (s.AREA_ID = %d) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('AREA_ID').AsInteger])
      end;

    end;

    if (not dsFilter.FieldByName('PROBLEM').IsNull) then
    begin
      // 1 Линии свободны
      // 2 Подключена одна точка
      // 3 Линия подключена к откл. абоненту

      case dsFilter['PROBLEM'] of
        1: // 3 Линия подключена к откл. абоненту
          tmpSQL := tmpSQL + '  and (exists(select l.Lan_Id from TV_LAN l' + #13#10 +
            'where l.Port = p.Port and l.Eq_Id = p.Eid' + #13#10 + 'and not exists(select sh.Customer_Id' + #13#10 +
            'from Subscr_hist sh inner join services s on (sh.Serv_Id = s.Service_Id)' + #13#10 +
            'where s.Business_Type in (1, 3)' + #13#10 + 'and sh.Customer_Id = l.Customer_Id' + #13#10 +
            'and current_date between sh.Date_From and sh.Date_To)))';
        {
          3: // 1 Линии свободны
          tmpSQL := tmpSQL + ' and (not (c.Capacity is null or c.Capacity = 1)) ' +
          'and (mod((select count(*) from port ip where ip.Wid = c.Wid), 2) <> 0)';

          2: // 2 Подключена одна точка
          tmpSQL := tmpSQL + ' and (not (c.Capacity is null or c.Capacity = 1)) ' +
          'and (mod((select count(*) from port ip where ip.Wid = c.Wid), 2) <> 0)';
        }
      end;
    end;

    if (tmpSQL <> '') then
      Result := TrimAnd(tmpSQL)
    else
      Result := filter_1_1;

    if dsFilter['inversion'] then
      Result := Format(' NOT (%s)', [Result]);
  end;

var
  whereStr: string;
  default: string;
begin
  default := filter_1_1;
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

procedure TPortListForm.SetDefaultFilter;
var
  f: string;
begin
  dsFilter.Close;
  dsFilter.Open;
  dsFilter.EmptyTable;
  f := A4MainForm.GetUserFilterFolder + 'port_default.jpf';
  if FileExists(f) then
  begin
    if dsFilter.State in [dsEdit, dsInsert] then
      dsFilter.Post;
    DatasetFromJson(dsFilter, f);
  end;

  if dsFilter.RecordCount > 0 then
    actEnableFilter.Checked := true;
end;

end.
