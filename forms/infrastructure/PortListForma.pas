unit PortListForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GridForma, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, CnErrorProvider, Vcl.Menus,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, FIBDataSet, pFIBDataSet, EhLibFIB;

type
  TPortListForm = class(TGridForm)
    dsPort: TpFIBDataSet;
    btnLinkPort: TToolButton;
    actLinkPort: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEditExecute(Sender: TObject);
    procedure dbGridSortMarkingChanged(Sender: TObject);
    procedure actLinkPortExecute(Sender: TObject);
  private
    function GetOrderClause(grid: TCustomDBGridEh): string;
  public
    { Public declarations }
  end;

var
  PortListForm: TPortListForm;

implementation

uses DM, EQPort, A4onTypeUnit, PortLinkForma;

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

  if LinkPort(dsPort['Eid'], dsPort['PORT'])
  then dsPort.Refresh;
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

end.
