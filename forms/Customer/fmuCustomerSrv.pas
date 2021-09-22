unit fmuCustomerSrv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, StdCtrls, ToolCtrlsEh, Buttons,
  ComCtrls, ToolWin, GridsEh, DBGridEh, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet, ActnList, DBGridEhToolCtrls, DBAxisGridsEh,
  System.Actions, VCL.Menus, PrjConst, EhLibVCL, System.UITypes,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

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
  private
    FFullAccess: Boolean;
    FChangeHistory: Boolean;
    procedure RecalcCustomer;
    procedure EnableControls;
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
  DM, OnOffServicesForma, SubscrHistory, pFIBQuery, AtrCommon, MAIN, DateUtils,
  DBGridEhImpExp, TextEditForma, PersonalTarifForma;

{$R *.dfm}

class function TapgCustomerSrv.GetPageName: string;
begin
  Result := rsPeriodicheskieUslugi;
end;

procedure TapgCustomerSrv.InitForm;
var
  cAdd: Boolean;
  cChg: Boolean;
begin
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
  cChg := (dmMain.AllowedAction(rght_Customer_EditSrv)) or FFullAccess; // ДОБАВЛЕНИЕ УСЛУГИ
  actSrvAdd.Visible := cAdd;
  actSrvPause.Visible := cChg;
  ActSrvOn.Visible := cChg;
  ActSrvOff.Visible := cChg;
  actSrvSwitch.Visible := (cChg and cAdd);
  actChangeNotice.Visible := (cChg or cAdd or FChangeHistory);

  pnlPersonelTarif.Visible := ((dmMain.GetSettingsValue('PERSONEL_TARIF')) = '1');
  // персональный тариф
  tbPersTar.Visible := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FFullAccess;
  actPersAdd.Visible := tbPersTar.Visible;
  actPersEdit.Visible := tbPersTar.Visible;
  actPersDel.Visible := tbPersTar.Visible;

  // actSubscrHistory.Visible := ChangeHistory;
  pnlButtons.Visible := cAdd or FChangeHistory;

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
    ActSrvOn.Enabled := (ActSrvOn.Visible) and (dsServices.FieldValues['state_sgn'] = 0);
    ActSrvOff.Enabled := (ActSrvOff.Visible) and (dsServices.FieldValues['state_sgn'] = 1);
    actSrvSwitch.Enabled := (actSrvSwitch.Visible) and (dsServices.FieldValues['state_sgn'] = 1);
    actSrvPause.Enabled := (actSrvPause.Visible) and (dsServices.FieldValues['state_sgn'] = 1);
    actSubscrHistory.Enabled := (actSubscrHistory.Visible) and (not dsServices.FieldByName('NAME').IsNull);
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
  if EditTarif(dsServices['NAME'], dsServices['Serv_Id'], dsServices['CUSTOMER_ID'], -1) then
  begin
    srcPersonelTarif.DataSet.Close;
    srcPersonelTarif.DataSet.Open;
  end;
end;

procedure TapgCustomerSrv.actPersDelExecute(Sender: TObject);
begin
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
  id: integer;
begin
  if dsServices.RecordCount = 0 then
    exit;
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
end;

procedure TapgCustomerSrv.ActSrvOnExecute(Sender: TObject);
var
  s: string;
  id: integer;
  CanAdd: Boolean;
begin
  if dsServices.RecordCount = 0 then
    exit;

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
  if ShowCustSubscrHistory(FDataSource.DataSet.FieldValues['Customer_ID'], dsServices.FieldValues['Serv_ID']) and
    ((dmMain.AllowedAction(rght_Customer_full)) or (dmMain.AllowedAction(rght_Customer_History))) then
  begin
    dsServices.CloseOpen(true);
    dsServices.GotoBookmark(bm);
    RecalcCustomer;
    UpdatePage;
  end;
end;

procedure TapgCustomerSrv.dbgCustSubscrServGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  ds: TDataSet;
begin
  ds := (Sender as TDBGridEh).DataSource.DataSet;
  if not ds.Active then
    exit;
  if ds.FieldValues['state_sgn'] = 1 then
    AFont.Color := gCustActive
  else
  begin
    AFont.Color := gCustInactiveDebt;
  end;

  if ((not ds.FieldByName('state_srv').IsNull) and (ds.FieldValues['state_srv'] = -3)) then
    AFont.Style := AFont.Style + [fsBold]
  else
    AFont.Style := AFont.Style - [fsBold];
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
      sql.text := Format('EXECUTE PROCEDURE FULL_RECALC_CUSTOMER(%d)',
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

  function FindByField(const FldName: String): integer;
  var
    i: integer;
  begin
    Result := -1;
    for i := 0 to dbgCustSubscrServ.Columns.Count - 1 do
    begin
      if dbgCustSubscrServ.Columns.Items[i].FieldName = FldName then
        Result := i;
    end;
  end;

var
  di: integer;
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
        s := Format(rsDebtForDays, [Round(-1 * Debt / dt)]);
      end;
  end
  else
    s := Format(rsDebtSum, [Debt]);

  di := FindByField('STATE_SRV_NAME');
  if di > -1 then
    dbgCustSubscrServ.Columns.Items[di].Footer.Value := s;
end;

end.
