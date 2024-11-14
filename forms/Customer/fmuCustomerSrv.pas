unit fmuCustomerSrv;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls,
  Vcl.ActnList, Vcl.Menus,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, amSplitter;

type
  TapgCustomerSrv = class(TA4onPage)
    Panel7: TPanel;
    pnlSubscrServ: TPanel;
    Splitter3: TSplitter;
    dbgCustSubscrServ: TDBGridEh;
    pnlPersonelTarif: TPanel;
    Label14: TLabel;
    dbgPersTarif: TDBGridEh;
    tbPersTar: TToolBar;
    btnPersAdd: TToolButton;
    btnPersEdit: TToolButton;
    btnPersDel: TToolButton;
    dsServices: TpFIBDataSet;
    srcServices: TDataSource;
    dsPersonelTarif: TpFIBDataSet;
    srcPersonelTarif: TDataSource;
    ActListCustomers: TActionList;
    actSubscrHistory: TAction;
    actSrvAdd: TAction;
    ActSrvOn: TAction;
    ActSrvOff: TAction;
    actSrvSwitch: TAction;
    actSrvPause: TAction;
    actPersAdd: TAction;
    actPersEdit: TAction;
    actPersDel: TAction;
    pmGrid: TPopupMenu;
    miAdSrv: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    pnlButtons: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    actChangeNotice: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    actServiceSummary: TAction;
    miServiceSummary: TMenuItem;
    procedure actSubscrHistoryExecute(Sender: TObject);
    procedure actSrvAddExecute(Sender: TObject);
    procedure ActSrvOnExecute(Sender: TObject);
    procedure ActSrvOffExecute(Sender: TObject);
    procedure actSrvSwitchExecute(Sender: TObject);
    procedure actSrvPauseExecute(Sender: TObject);
    procedure actPersAddExecute(Sender: TObject);
    procedure actPersEditExecute(Sender: TObject);
    procedure actPersDelExecute(Sender: TObject);
    procedure srcPersonelTarifDataChange(Sender: TObject; Field: TField);
    procedure dbgCustSubscrServGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure srcServicesDataChange(Sender: TObject; Field: TField);
    procedure dbgCustSubscrServSumListAfterRecalcAll(Sender: TObject);
    procedure actChangeNoticeExecute(Sender: TObject);
    procedure actServiceSummaryExecute(Sender: TObject);
    procedure dbgCustSubscrServDblClick(Sender: TObject);
  private
    FFullAccess: Boolean;
    FChangeHistory: Boolean;
    FfcSrvDisconted: TColor;
    FfcSrvDiscontedFuture: TColor;
    FfcSrvInAutoblock: TColor;
    procedure RecalcCustomer;
    procedure EnableControls;
    procedure ShowSummaryReport;
  public
    {
      pmGrid : TPopupMenu;
      procedure pmgCopyClick(Sender: TObject);
      procedure pmgSelectAllClick(Sender: TObject);
      procedure pmgSaveSelectionClick(Sender: TObject);
    }
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  System.DateUtils,
  DM, OnOffServicesForma, SubscrHistory, pFIBQuery, AtrCommon, MAIN, TextEditForma, PersonalTarifForma;

{$R *.dfm}

class function TapgCustomerSrv.GetPageName: string;
begin
  Result := rsPeriodicheskieUslugi;
end;

procedure TapgCustomerSrv.InitForm;
var
  cAdd: Boolean;
  cChg: Boolean;
  i: Integer;
begin

  try
    FfcSrvDisconted := StringToColor(dmMain.GetSettingsValue('COLOR_OFF'));
  except
    FfcSrvDisconted := clSilver;
  end;

  try
    FfcSrvInAutoblock := StringToColor(dmMain.GetSettingsValue('COLOR_DOLG'));
  except
    FfcSrvInAutoblock := clRed;
  end;

  try
    FfcSrvDiscontedFuture := StringToColor(dmMain.GetSettingsValue('COLOR_OFFMONEY'));
  except
    FfcSrvDiscontedFuture := clBlue;
  end;
  { TODO: Не давать править SRV в прошлом периоде }
  {
    34 ДОБАВЛЕНИЕ УСЛУГИ  Добавление услуг абоненту
    35 УДАЛЕНИЕ УСЛУГИ  Удаление услуг абоненту
    36 ИЗМЕНЕНИЕ УСЛУГИ  Изменение услуг абоненту
    37 ИЗМЕНЕНИЕ ИСТОРИИ  Изменение истории абонента (удаление изменение услуг в любом периоде )
  }

  FFullAccess := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ
  FChangeHistory := (dmMain.AllowedAction(rght_Customer_History)) or FFullAccess; // Изменение истории
  cAdd := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FFullAccess; // ДОБАВЛЕНИЕ УСЛУГИ
  cChg := (dmMain.AllowedAction(rght_Customer_EditSrv)); // ДОБАВЛЕНИЕ УСЛУГИ
  actSrvAdd.Visible := cAdd;
  actSrvPause.Visible := cChg;
  ActSrvOn.Visible := cChg;
  ActSrvOff.Visible := cChg;
  actSrvSwitch.Visible := (cChg and cAdd);
  actChangeNotice.Visible := (cChg or cAdd or FChangeHistory);

  pnlButtons.Visible := cAdd or cChg or FChangeHistory;

  // персональный тариф
  pnlPersonelTarif.Visible := ((dmMain.GetSettingsValue('PERSONEL_TARIF')) = '1');
  tbPersTar.Visible := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FFullAccess;
  actPersAdd.Visible := tbPersTar.Visible;
  actPersEdit.Visible := tbPersTar.Visible;
  actPersDel.Visible := tbPersTar.Visible;

  cChg := (dmMain.GetSettingsValue('CAN_NEW_CONTRACT') = '1');
  i := 0;
  while (i < dbgCustSubscrServ.Columns.Count) do
  begin
    if (dbgCustSubscrServ.Columns.Items[i].FieldName = 'CONTRACT') //
      or (dbgCustSubscrServ.Columns.Items[i].FieldName = 'CONTRACT_DATE') //
    then
      dbgCustSubscrServ.Columns[i].Visible := cChg;
    i := i + 1;
  end;

  dsServices.DataSource := FDataSource;
end;

procedure TapgCustomerSrv.EnableControls;
begin
  if dsServices.RecordCount = 0 then
  begin
    actSrvSwitch.Enabled := False;
    actPersAdd.Enabled := False;
    actSubscrHistory.Enabled := False;
  end
  else
  begin
    actSrvSwitch.Enabled := (actSrvSwitch.Visible);
    actPersAdd.Enabled := (actPersAdd.Visible);
    actSubscrHistory.Enabled := (actSubscrHistory.Visible);
  end;

  if (not dsServices.FieldByName('state_sgn').IsNull) then
  begin
    ActSrvOn.Enabled := (ActSrvOn.Visible) and (dsServices['state_sgn'] = 0);
    ActSrvOff.Enabled := (ActSrvOff.Visible) and ((dsServices['state_sgn'] = 1) or (dsServices['state_sgn'] = -999));
    actSrvSwitch.Enabled := (actSrvSwitch.Visible) and (dsServices['state_sgn'] = 1);
    actSrvPause.Enabled := (actSrvPause.Visible) and (dsServices['state_sgn'] = 1);
    actSubscrHistory.Enabled := (actSubscrHistory.Visible) and (not dsServices.FieldByName('SERV_ID').IsNull);
  end
  else
  begin
    ActSrvOff.Enabled := False;
    ActSrvOn.Enabled := False;
    actSrvPause.Enabled := False;
    actSrvSwitch.Enabled := False;
  end;
end;

procedure TapgCustomerSrv.OpenData;
begin
  if dsServices.Active then
    dsServices.Close;
  dsServices.OrderClause := GetOrderClause(dbgCustSubscrServ);
  dsServices.Open;
  dsPersonelTarif.Active := pnlPersonelTarif.Visible;
  EnableControls;
end;

procedure TapgCustomerSrv.CloseData;
begin
  dsPersonelTarif.Close;
  dsServices.Close;
end;

procedure TapgCustomerSrv.actChangeNoticeExecute(Sender: TObject);
var
  s: string;
begin
  if (not dsServices.Active) or (dsServices.RecordCount = 0) or (dsServices.FieldByName('Subscr_Serv_Id').IsNull) then
    exit;

  if (dsServices['state_sgn'] = -999) then
    exit;

  if dsServices.FieldByName('NOTICE').IsNull then
    s := ''
  else
    s := dsServices.FieldByName('NOTICE').AsString;

  if EditText(s, 'Примечание', 'Примечание для услуги') then
  begin
    with TpFIBQuery.Create(Self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.text := 'update SUBSCR_SERV set NOTICE = :NOTICE where (Subscr_Serv_Id = :Subscr_Serv_Id)';
        ParamByName('NOTICE').Value := s;
        ParamByName('Subscr_Serv_Id').Value := dsServices.FieldByName('Subscr_Serv_Id').AsInteger;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
        dsServices.Refresh;
      finally
        free;
      end;
  end;
end;

procedure TapgCustomerSrv.actPersAddExecute(Sender: TObject);
begin
  if not srcPersonelTarif.DataSet.Active then
    exit;
  if (dsServices['state_sgn'] = -999) then
    exit;

  if EditTarif(dsServices['NAME'], dsServices['Serv_Id'], dsServices['CUSTOMER_ID'], -1) then
  begin
    srcPersonelTarif.DataSet.Close;
    srcPersonelTarif.DataSet.Open;
  end;
end;

procedure TapgCustomerSrv.actPersDelExecute(Sender: TObject);
begin
  if (dsServices['state_sgn'] = -999) then
    exit;

  // не даем править персональный тариф прошлым периодом, если нет прав
  if not(FFullAccess or FChangeHistory) then
  begin
    if dsPersonelTarif['DATE_FROM'] < dmMain.CurrentMonth then
      exit;
  end;
  if (MessageDlg(PWideChar(rsUdalitTariph + rsEOL + rsVnimanieBalansAbonentaMozhet), mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
    srcPersonelTarif.DataSet.Delete
end;

procedure TapgCustomerSrv.actPersEditExecute(Sender: TObject);
begin
  if (dsServices['state_sgn'] = -999) then
    exit;

  // не даем править персональный тариф прошлым периодом, если нет прав
  if not(FFullAccess or FChangeHistory) then
  begin
    if dsPersonelTarif['DATE_FROM'] < dmMain.CurrentMonth then
      exit;
  end;

  if EditTarif(dsServices['NAME'], dsPersonelTarif['Service_Id'], dsPersonelTarif['CUSTOMER_ID'],
    dsPersonelTarif['tarif_id']) then
  begin
    srcPersonelTarif.DataSet.Refresh;
  end;
end;

procedure TapgCustomerSrv.actServiceSummaryExecute(Sender: TObject);
begin
  if (dsServices['state_sgn'] = -999) then
    exit;

  ShowSummaryReport;
end;

procedure TapgCustomerSrv.actSrvAddExecute(Sender: TObject);
var
  CanAdd: Boolean;
begin
  if FDataSource.DataSet.FieldByName('VALID_TO').IsNull then
    CanAdd := true
  else
    CanAdd := FDataSource.DataSet['VALID_TO'] > Now();

  if CanAdd then
  begin
    if NewService(FDataSource.DataSet['Customer_ID'], 0) then
    begin
      dsServices.CloseOpen(true);
      EnableControls;
      UpdatePage;
    end;
  end
  else
    ShowMessage(rsContractNotValid);
end;

procedure TapgCustomerSrv.ActSrvOffExecute(Sender: TObject);
var
  s: string;
  id: Integer;
begin
  if dsServices.RecordCount = 0 then
    exit;

  if (dsServices['state_sgn'] = 1) then
  begin
    if dsServices.FieldByName('Notice').IsNull then
      s := ''
    else
      s := dsServices['Notice'];
    id := dsServices.FieldValues['SERV_ID'];
    if OnOffService(FDataSource.DataSet.FieldValues['Customer_ID'], dsServices.FieldValues['SERV_ID'],
      dsServices.FieldValues['SUBSCR_SERV_ID'], true, s) then
    begin
      dsServices.CloseOpen(true);
      dsServices.Locate('SERV_ID', id, []);
      EnableControls;
      UpdatePage;
    end;
  end
  else if (dsServices['state_sgn'] = -999) then
  begin
    // отмена очереди
    if MessageBoxW(Handle, PWideChar(WideFormat('Удалить из очереди %s', [dsServices['NAME']])),
      'Очередь переключения услуг', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      with TpFIBQuery.Create(Self) do
      begin
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          sql.text := 'execute procedure Queue_Switch_Cancel(:c, :f, :t)';
          ParamByName('c').Value := dsServices.FieldByName('customer_id').AsInteger;
          ParamByName('f').Value := dsServices.FieldByName('SUBSCR_SERV_ID').AsInteger;
          ParamByName('t').Value := dsServices.FieldByName('SERV_ID').AsInteger;
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
          Close;
          dsServices.Refresh;
        finally
          free;
        end;
      end;
      dsServices.CloseOpen(true);
      EnableControls;
      UpdatePage;
    end;
  end
end;

procedure TapgCustomerSrv.ActSrvOnExecute(Sender: TObject);
var
  s: string;
  id: Integer;
  CanAdd: Boolean;
begin
  if dsServices.RecordCount = 0 then
    exit;

  // включаем только если услуга отключена
  if ((dsServices['state_sgn'] = 1) or (dsServices['state_sgn'] = -999)) then
    exit;

  // включаем только если услуга неактивна (нет галки услуга Активна )
  if (dsServices['SRV_ACTIVE'] = 0) and ((dmMain.GetSettingsValue('ON_DISACT')) = '0') then
  begin
    ShowMessage(rsSrvNotActive);
    exit;
  end;

  if FDataSource.DataSet.FieldByName('VALID_TO').IsNull then
    CanAdd := true
  else
    CanAdd := FDataSource.DataSet['VALID_TO'] > Now();

  if CanAdd then
  begin
    if dsServices.FieldByName('Notice').IsNull then
      s := ''
    else
      s := dsServices.FieldByName('Notice').AsString;
    id := dsServices.FieldValues['SERV_ID'];
    if OnOffService(FDataSource.DataSet.FieldValues['Customer_ID'], dsServices.FieldValues['SERV_ID'],
      dsServices.FieldValues['SUBSCR_SERV_ID'], False, s) then
    begin
      dsServices.CloseOpen(true);
      dsServices.Locate('SERV_ID', id, []);
      EnableControls;
      UpdatePage;
    end;
  end
  else
    ShowMessage(rsContractNotValid);
end;

procedure TapgCustomerSrv.actSrvPauseExecute(Sender: TObject);
var
  s: string;
begin
  if dsServices.RecordCount = 0 then
    exit;
  if dsServices.FieldByName('SUBSCR_SERV_ID').IsNull then
    exit;

  if dsServices.FieldByName('Notice').IsNull then
    s := ''
  else
    s := dsServices['Notice'];

  if PauseService(FDataSource.DataSet.FieldValues['Customer_ID'], dsServices.FieldValues['SERV_ID'],
    dsServices.FieldValues['SUBSCR_SERV_ID'], s) then
  begin
    dsServices.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end;
end;

procedure TapgCustomerSrv.actSrvSwitchExecute(Sender: TObject);
var
  s: string;
begin
  if dsServices.RecordCount = 0 then
    exit;

  if (dsServices['state_sgn'] = -999) then
    exit;

  if dsServices.FieldByName('Notice').IsNull then
    s := ''
  else
    s := dsServices.FieldByName('Notice').AsString;
  if SwitchServics(FDataSource.DataSet.FieldValues['Customer_ID'], dsServices.FieldValues['SERV_ID'],
    dsServices.FieldValues['SUBSCR_SERV_ID'], s) then
  begin
    dsServices.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end;
end;

procedure TapgCustomerSrv.actSubscrHistoryExecute(Sender: TObject);
var
  bm: TBookMark;
begin
  if (not FDataSource.DataSet.Active) or (FDataSource.DataSet.RecordCount = 0) or
    (FDataSource.DataSet.FieldByName('Customer_ID').IsNull) or (not dsServices.Active) or (dsServices.RecordCount = 0)
    or (dsServices.FieldByName('Serv_ID').IsNull) then
    exit;

  bm := dsServices.GetBookmark;
  if ShowCustSubscrHistory(FDataSource.DataSet.FieldValues['Customer_ID'], dsServices.FieldValues['Serv_ID'])
  // and ((dmMain.AllowedAction(rght_Customer_full)) or (dmMain.AllowedAction(rght_Customer_History)))
  then
  begin
    dsServices.CloseOpen(true);
    dsServices.GotoBookmark(bm);
    RecalcCustomer;
    UpdatePage;
  end;
end;

procedure TapgCustomerSrv.dbgCustSubscrServDblClick(Sender: TObject);
begin
  actSubscrHistory.Execute;
end;

procedure TapgCustomerSrv.dbgCustSubscrServGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  ds: TDataSet;
begin
  ds := (Sender as TDBGridEh).DataSource.DataSet;
  if not ds.Active then
    exit;

  if ds.FieldValues['state_sgn'] = 0 then
  begin
    if (ds.FieldValues['STATE_DATE'] > Now()) then
      AFont.Color := FfcSrvDiscontedFuture
    else
      AFont.Color := FfcSrvDisconted;
  end;
  if ds.FieldValues['state_sgn'] = -999 then
    Background := clBtnFace;

  if ((not ds.FieldByName('state_srv').IsNull) and (ds.FieldValues['state_srv'] = -3)) then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := FfcSrvInAutoblock;
  end;
  // else AFont.Style := AFont.Style - [fsBold];

  if ((not ds.FieldByName('STATE_DATE').IsNull) and (ds.FieldValues['STATE_DATE'] > Now())) then
    AFont.Style := AFont.Style + [fsItalic];
  // else AFont.Style := AFont.Style - [fsItalic];
end;

procedure TapgCustomerSrv.RecalcCustomer;
var
  Save_Cursor: TCursor;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  with TpFIBQuery.Create(Self) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      Transaction.StartTransaction;
      sql.text := format('EXECUTE PROCEDURE FULL_RECALC_CUSTOMER(%d)',
        [FDataSource.DataSet.FieldByName('customer_id').AsInteger]);
      ExecQuery;
      Transaction.Commit;
      EnableControls;
      UpdatePage;
    finally
      free;
      Screen.Cursor := Save_Cursor;
    end
end;

procedure TapgCustomerSrv.srcPersonelTarifDataChange(Sender: TObject; Field: TField);
begin
  actPersEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actPersAdd.Enabled;
  actPersDel.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actPersAdd.Enabled;
end;

procedure TapgCustomerSrv.srcServicesDataChange(Sender: TObject; Field: TField);
begin
  EnableControls;
end;

procedure TapgCustomerSrv.dbgCustSubscrServSumListAfterRecalcAll(Sender: TObject);

  function FindByField(const FldName: String): Integer;
  var
    i: Integer;
  begin
    Result := -1;
    for i := 0 to dbgCustSubscrServ.Columns.Count - 1 do
    begin
      if dbgCustSubscrServ.Columns.Items[i].FieldName = FldName then
        Result := i;
    end;
  end;

var
  di: Integer;
  dt: Double;
  Debt: Double;
  s: string;
begin
  if (not FDataSource.DataSet.Active) or (FDataSource.DataSet.RecordCount = 0) or
    (FDataSource.DataSet.FieldByName('DEBT_SUM').IsNull) or
    (dbgCustSubscrServ.DataSource.DataSet.FieldByName('STATE_DATE').IsNull) or
    (dbgCustSubscrServ.DataSource.DataSet.FieldByName('STATE_SRV_NAME').IsNull) then
    exit;

  s := '';
  Debt := FDataSource.DataSet['DEBT_SUM'];
  if Debt <= 0 then
  begin
    di := FindByField('STATE_DATE');
    if di > -1 then
      if TryStrToFloat(dbgCustSubscrServ.Columns.Items[di].Footer.SumValue, dt) and (dt > 0) then
      begin
        s := format(rsDebtForDays, [Round(-1 * Debt / dt)]);
      end;
  end
  else
    s := format(rsDebtSum, [Debt]);

  di := FindByField('STATE_SRV_NAME');
  if di > -1 then
    dbgCustSubscrServ.Columns.Items[di].Footer.Value := s;
end;

procedure TapgCustomerSrv.ShowSummaryReport;
var
  ReportID, ci: Integer;
  FILENAME: String;
  Stream: TStream;
begin
  FILENAME := 'ServiceSummary';
  // Загрузим отчет из БД
  ReportID := dmMain.GET_ID_REPORT_BY_PATH(FILENAME);
  if ReportID < 0 then
    exit;
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value := ReportID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        dmMain.frxModalReport.LoadFromStream(Stream);
        dmMain.frxModalReport.FILENAME := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        dmMain.frxModalReport.ReportOptions.Name := dmMain.frxModalReport.FILENAME;
      finally
        Stream.free;
      end;
    end;
  finally
    dmMain.fdsLoadReport.Close;
  end;

  ci := dmMain.frxModalReport.Variables.IndexOf('CUSTOMER_ID');
  if ci > 0 then
    dmMain.frxModalReport.Variables['CUSTOMER_ID'] := dsServices['CUSTOMER_ID'];

  ci := dmMain.frxModalReport.Variables.IndexOf('SERVICE_ID');
  if ci > 0 then
    dmMain.frxModalReport.Variables['SERVICE_ID'] := dsServices['SERV_ID'];

  dmMain.frxModalReport.ShowReport(true);
end;

end.
