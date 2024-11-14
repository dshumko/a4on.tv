unit fmuCustomerSingleSrv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Actions, System.UITypes, Data.DB, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ActnList, Vcl.Menus, AtrPages, ToolCtrlsEh, FIBDataSet, pFIBDataSet,
  GridsEh, DBGridEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TapgCustomerSingleSrv = class(TA4onPage)
    pnlButtons: TPanel;
    dbgSingleServ: TDBGridEh;
    dsSingleService: TpFIBDataSet;
    srcSingleSerivce: TDataSource;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actDel: TAction;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    actEditNotice: TAction;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    procedure actAddExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure srcSingleSerivceDataChange(Sender: TObject; Field: TField);
    procedure actEditNoticeExecute(Sender: TObject);
    procedure dbgSingleServDblClick(Sender: TObject);
    procedure dbgSingleServGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgSingleServSortMarkingChanged(Sender: TObject);
  private
    FullAccess: Boolean;
    ChangeHistory: Boolean;
    FSavedID: Integer;
    FColorize: Boolean;
    FShowWorks: Boolean;
    procedure EnableControls;
    procedure OpenRequest;
  public
    procedure SavePosition; override;
    procedure GotoSavedPosition; override;
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  DM, pFIBQuery, OnOffServicesForma, MAIN, TextEditForma, OrdersTPForma, RequestForma;

{$R *.dfm}

class function TapgCustomerSingleSrv.GetPageName: string;
begin
  Result := rsSingleServices;
end;

procedure TapgCustomerSingleSrv.SavePosition;
begin
  FSavedID := -1;
  if (dsSingleService.RecordCount > 0) and (not dsSingleService.FieldByName('SINGLE_SERVICE_ID').IsNull) then
    FSavedID := dsSingleService['SINGLE_SERVICE_ID'];
end;

procedure TapgCustomerSingleSrv.GotoSavedPosition;
begin
  if FSavedID > -1 then
    dsSingleService.Locate('SINGLE_SERVICE_ID', FSavedID, []);
end;

procedure TapgCustomerSingleSrv.InitForm;
var
  vB: Boolean;
  s: string;
begin

  { TODO: Не давать править SINGLE SRV в прошлом периоде }
  FullAccess := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ
  ChangeHistory := (dmMain.AllowedAction(rght_Customer_History)); // Изменение истории
  vB := (dmMain.AllowedAction(rght_Customer_AddSrv)); // ДОБАВЛЕНИЕ УСЛУГИ
  actAdd.Visible := vB or FullAccess;
  actDel.Visible := vB or FullAccess;

  pnlButtons.Visible := actAdd.Visible or actDel.Visible;

  // ЛТВ подсветка желтым зявок без оплаты
  s := dmMain.GetCompanyValue('NAME');
  FColorize := s.Contains('ЛТВ');

  if (FColorize) then
  begin
    dsSingleService.ParamByName('Colorize').AsString :=
      ' substring(ss.Notice similar ''%СЗ%:#"[^[:DIGIT:]]*([0-9])+#"%'' escape ''#'') ';
  end;

  FShowWorks := (dmMain.GetIniValue('SHOW_WORKS_IN_SINGLE') = '1') or FColorize;
  if (FShowWorks) then
  begin
    dsSingleService.ParamByName('show_works').AsString := 'union all select' + #13#10 +
      ' null Single_Service_Id, M.Customer_Id Customer_Id, null Service_Id' + #13#10 +
      ' , M.Fee_Date Serv_Date, M.Units Units, M.In_Request Notice, null History_Id, null Paid' + #13#10 +
      ' , M.Added_By Added_By, M.Added_On Added_On, null Vatg_Id' + #13#10 +
      ' , M.In_Request Rq_Id, null Tag  , M.M_Id M_Id, null Srv_Type_Id' + #13#10 +
      ' , M.Fee_Name NAME, null BUSINESS_TYPE, '''' Dimension' + #13#10 +
      ' , M.Added_By as WHO_LAST, ''Работа из заявки'' as VAT_GROUP, 0 can_delete' + #13#10 +
      ' , null SUBSCR_SRV, 0 itsService, M.Fee Fee, null ORDER_N' + #13#10 +
      ' from other_fee m  where m.CUSTOMER_ID = :CUSTOMER_ID' + #13#10 + ' and M.M_Id is null';
  end;

  dsSingleService.DataSource := FDataSource;
end;

procedure TapgCustomerSingleSrv.OpenData;
begin
  if dsSingleService.Active then
    dsSingleService.Close;
  dsSingleService.OrderClause := GetOrderClause(dbgSingleServ);
  dsSingleService.Open;
  EnableControls;
end;

procedure TapgCustomerSingleSrv.srcSingleSerivceDataChange(Sender: TObject; Field: TField);
begin
  EnableControls;
end;

procedure TapgCustomerSingleSrv.EnableControls;
begin
  if not dsSingleService.FieldByName('can_delete').IsNull then
    actDel.Enabled := dsSingleService.FieldByName('can_delete').AsInteger > 0
  else
    actDel.Enabled := False;
end;

procedure TapgCustomerSingleSrv.actAddExecute(Sender: TObject);
var
  CanAdd: Boolean;
begin
  if FDataSource.DataSet.FieldByName('VALID_TO').IsNull then
    CanAdd := True
  else
    CanAdd := (FDataSource.DataSet['VALID_TO'] > Now()) or (dmMain.AllowedAction(rght_Customer_full));

  if CanAdd then
  begin
    if NewService(FDataSource.DataSet['Customer_ID'], 1) then
    begin
      dsSingleService.CloseOpen(True);
      EnableControls;
      UpdatePage;
    end;
  end
  else
    ShowMessage(rsContractNotValid);
end;

procedure TapgCustomerSingleSrv.actDelExecute(Sender: TObject);
var
  AllowDelete: Boolean;
begin
  if dsSingleService.RecordCount = 0 then
    Exit;

  AllowDelete := (dmMain.AllowedAction(rght_Customer_DelSrv));

  if not(AllowDelete or FullAccess) then
    Exit;

  if not(FullAccess or ChangeHistory or (dsSingleService.FieldByName('SERV_DATE').AsDateTime >= dmMain.CurrentMonth))
  then
    Exit;

  if (dmMain.InStrictMode) and (dsSingleService['SERV_DATE'] < dmMain.CurrentMonth) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  if (MessageDlg(Format(rsDeleteRequest, [dsSingleService['name']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsSingleService.Delete;
    EnableControls;
    UpdatePage;
  end;

end;

procedure TapgCustomerSingleSrv.actEditNoticeExecute(Sender: TObject);
var
  s: string;
begin
  if (not dsSingleService.Active) or (dsSingleService.RecordCount = 0) or
    (dsSingleService.FieldByName('SINGLE_SERVICE_ID').IsNull) then
    Exit;

  if dsSingleService.FieldByName('NOTICE').IsNull then
    s := ''
  else
    s := dsSingleService.FieldByName('NOTICE').AsString;

  if EditText(s, 'Примечание', 'Примечание для услуги') then
  begin
    with TpFIBQuery.Create(Self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.text := 'update SINGLE_SERV set NOTICE = :NOTICE where (SINGLE_SERVICE_ID = :SINGLE_SERVICE_ID)';
        ParamByName('NOTICE').Value := s;
        ParamByName('SINGLE_SERVICE_ID').Value := dsSingleService.FieldByName('SINGLE_SERVICE_ID').AsInteger;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
        dsSingleService.Refresh;
      finally
        free;
      end;
  end;
end;

procedure TapgCustomerSingleSrv.CloseData;
begin
  dsSingleService.Close;
end;

procedure TapgCustomerSingleSrv.dbgSingleServDblClick(Sender: TObject);
begin
  if (not dsSingleService.FieldByName('itsService').IsNull) and (dsSingleService['itsService'] = 0) then
    OpenRequest;

  if dsSingleService.FieldByName('HISTORY_ID').IsNull then
    Exit;
  if dsSingleService.FieldByName('NOTICE').IsNull then
    Exit;

  if dsSingleService.FieldByName('NOTICE').AsString.Contains(rsOrderN) then
  begin
    if (dmMain.AllowedAction(rght_OrdersTP_full) or dmMain.AllowedAction(rght_OrdersTP_add) or
      dmMain.AllowedAction(rght_OrdersTP_edit) or dmMain.AllowedAction(rght_OrdersTP_View)) then
      ShowOrders(dsSingleService['HISTORY_ID']);
  end;
end;

procedure TapgCustomerSingleSrv.OpenRequest;
var
  aRequest: Integer;
  aCustomer: Integer;
  aMode: Byte;
Begin
  if dsSingleService.FieldByName('RQ_ID').IsNull then
    Exit;
  aRequest := dsSingleService.FieldByName('RQ_ID').AsInteger;
  if aRequest > 0 then
  begin
    aCustomer := dsSingleService.FieldByName('CUSTOMER_ID').AsInteger;
    aMode := 1;
    ReguestExecute(aRequest, aCustomer, aMode);
  end;
end;

procedure TapgCustomerSingleSrv.dbgSingleServGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if FColorize then
  begin
    if not dsSingleService.FieldByName('ORDER_PAY').IsNull then
      if not dsSingleService.FieldByName('Units').IsNull then
        if dsSingleService['ORDER_PAY'] <> dsSingleService['Units'] then
          Background := clYellow;
  end;

  if FShowWorks then begin
    if (not dsSingleService.FieldByName('itsService').IsNull) and (dsSingleService['itsService'] = 0) then
      Background := $00D3D3D3;
  end;
end;

procedure TapgCustomerSingleSrv.dbgSingleServSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  grid: TCustomDBGridEh;
  id, i, j: Integer;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
begin
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
      if not FIBDS.FieldByName('SINGLE_SERVICE_ID').IsNull then
        id := FIBDS.FieldByName('SINGLE_SERVICE_ID').AsInteger;
      FIBDS.Close;
    end;

    j := grid.SortMarkedColumns.Count;
    for i := 0 to pred(j) do
    begin
      s := s + grid.SortMarkedColumns[i].FieldName;
      // s := s + ' COLLATE UNICODE_CI_AI ';
      if grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
        s := s + ' desc';
      if i <> pred(j) then
        s := s + ', ';
    end;
    if s = 'SERV_DATE' then
      s := s + ', ADDED_ON'
    else if s = 'SERV_DATE desc' then
      s := s + ', ADDED_ON desc';

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> -1 then
        FIBDS.Locate('SINGLE_SERVICE_ID', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

end.
