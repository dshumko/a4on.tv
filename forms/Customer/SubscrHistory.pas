unit SubscrHistory;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ActnList, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.Menus, Vcl.Buttons,
  pFIBDataSet, GridsEh, FIBDataSet, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEh, PrjConst, EhLibVCL,
  DBGridEhGrouping,
  DynVarsEh;

type
  TCustSubscrHistoryForma = class(TForm)
    ActionList1: TActionList;
    actDeleteService: TAction;
    srcServices: TDataSource;
    srcServicesHistory: TDataSource;
    actDeleteSubscrHist: TAction;
    dsServicesHistory: TpFIBDataSet;
    dsServices: TpFIBDataSet;
    actSubscribe: TAction;
    pmHistory: TPopupMenu;
    miDeleteHistory: TMenuItem;
    pmServices: TPopupMenu;
    miDeleteServices: TMenuItem;
    actOk: TAction;
    actCancel: TAction;
    actBack: TAction;
    actDisconnect: TAction;
    actDel: TAction;
    Panel3: TPanel;
    dbgCustSubscrServ: TDBGridEh;
    pnlBtns: TPanel;
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    btnBack: TSpeedButton;
    btnDisconnect: TSpeedButton;
    Panel1: TPanel;
    dbgCustSubscrServHist: TDBGridEh;
    spl1: TSplitter;
    miN1: TMenuItem;
    miDisconnect: TMenuItem;
    miBack: TMenuItem;
    miN2: TMenuItem;
    procedure dbgCustSubscrServGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgCustSubscrServExit(Sender: TObject);
    procedure OkBtnFrame1bbtnOkClick(Sender: TObject);
    procedure srcServicesStateChange(Sender: TObject);
    procedure actDeleteSubscrHistExecute(Sender: TObject);
    procedure actDeleteServiceExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure srcServicesHistoryStateChange(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actBackExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure srcServicesDataChange(Sender: TObject; Field: TField);
    procedure actDisconnectExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
  private
    FNeedRecalc: Boolean;
    FChangeHistory: Boolean;
    FFullAccess: Boolean;
  public
    { Public declarations }
    property NeedRecalc: Boolean read FNeedRecalc;

  end;

function ShowCustSubscrHistory(const aCustomer_ID: Integer; const aService_ID: Integer = -1): Boolean;

implementation

uses
  MAIN, DM, AtrCommon, pFIBQuery, ChangeOffForma;

{$R *.DFM}

function ShowCustSubscrHistory(const aCustomer_ID: Integer; const aService_ID: Integer = -1): Boolean;
begin
  with TCustSubscrHistoryForma.Create(Application) do
    try
      // dsServices.ParamByName('CUST_ID').AsInteger := ID;
      dbgCustSubscrServ.ReadOnly := not((dmMain.AllowedAction(rght_Customer_full)) or
        (dmMain.AllowedAction(rght_Customer_History)));
      dsServices.ParamByName('CUSTOMER_ID').AsInteger := aCUSTOMER_ID;
      dsServices.Open;
      if aService_ID > -1 then
        dsServices.Locate('SERV_ID', aService_ID, []);
      dsServicesHistory.Open;
      ShowModal;
      Result := NeedRecalc;
    finally
      Free;
    end;
end;

procedure TCustSubscrHistoryForma.OkBtnFrame1bbtnOkClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TCustSubscrHistoryForma.dbgCustSubscrServExit(Sender: TObject);
begin
  if (Sender as TDBGridEh).DataSource.DataSet.State in [dsEdit, dsInsert] then
    (Sender as TDBGridEh).DataSource.DataSet.Post;
end;

procedure TCustSubscrHistoryForma.dbgCustSubscrServGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  ds: TDataSet;
begin
  ds := (Sender as TDBGridEh).DataSource.DataSet;
  if ds.FieldValues['state_sgn'] = 1 then
    AFont.Color := gCustActive
  else
    AFont.Color := gCustInactiveDebt;
end;

procedure TCustSubscrHistoryForma.srcServicesStateChange(Sender: TObject);
begin
  if not(FFullAccess or FChangeHistory) then
    Exit;

  actOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  actCancel.Enabled := actOk.Enabled;
  FNeedRecalc := True;
end;

procedure TCustSubscrHistoryForma.actDeleteSubscrHistExecute(Sender: TObject);
begin
  if not(FFullAccess or FChangeHistory) then
    Exit;

  if (dmMain.InStrictMode and ((dsServicesHistory['DATE_FROM'] < dmMain.CurrentMonth) or
    (dsServicesHistory['DATE_TO'] < dmMain.CurrentMonth))) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  if (MessageDlg(rsDeleteSrvHistory, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsServicesHistory.Delete;
    FNeedRecalc := True;
  end;
end;

procedure TCustSubscrHistoryForma.actDelExecute(Sender: TObject);
begin
  if dbgCustSubscrServ.Focused then
    actDeleteService.Execute;

  if dbgCustSubscrServHist.Focused then
    actDeleteSubscrHist.Execute;
end;

procedure TCustSubscrHistoryForma.actDeleteServiceExecute(Sender: TObject);
begin
  if not(FFullAccess or FChangeHistory) then
    Exit;

  if dsServices.RecordCount = 0 then
    Exit;

  if (dmMain.InStrictMode and (dsServicesHistory.RecordCount > 0)) then
  begin
    ShowMessage(rsErrorNeedDeleteHistory);
    Exit;
  end;

  if (MessageDlg(rsDeleteSrvHistory, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsServices.Delete;
    FNeedRecalc := True;
  end;
end;

procedure TCustSubscrHistoryForma.FormShow(Sender: TObject);
var
  i: Integer;
  ini: string;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
  chW: Boolean;
begin
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  ini := A4MainForm.GetIniFileName;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(ini, Self.Name + '.' + Components[i].Name,
        [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
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
    end;
  FFullAccess := (dmMain.AllowedAction(rght_Customer_full));
  FChangeHistory := (dmMain.AllowedAction(rght_Customer_History));
  actDeleteService.Visible := FChangeHistory or FFullAccess;
  actDeleteSubscrHist.Visible := actDeleteService.Visible;
  // Спрячем кнопку смены автоблока
  actDisconnect.Visible := not(dmMain.GetSettingsValue('HIDE_HIST_ABLOCK_BTN') = '1');
  FNeedRecalc := False;

  chW := (dmMain.GetSettingsValue('SAVE_SRV_WORKER') = '1');
  for i := 0 to dbgCustSubscrServHist.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgCustSubscrServHist.Columns[i].FieldName) = 'WORKER_ON') then
      dbgCustSubscrServHist.Columns[i].Visible := chW
    else if (AnsiUpperCase(dbgCustSubscrServHist.Columns[i].FieldName) = 'WORKER_OFF') then
      dbgCustSubscrServHist.Columns[i].Visible := chW;
  end;
end;

procedure TCustSubscrHistoryForma.srcServicesHistoryStateChange(Sender: TObject);
begin
  FNeedRecalc := True;
end;

procedure TCustSubscrHistoryForma.actOkExecute(Sender: TObject);
begin
  if FFullAccess or FChangeHistory then
    dsServices.Post
  else
    dsServices.cancel;
end;

procedure TCustSubscrHistoryForma.actCancelExecute(Sender: TObject);
begin
  dsServices.cancel
end;

procedure TCustSubscrHistoryForma.actBackExecute(Sender: TObject);
var
  srv_name: string;
  srv_date: string;
begin
  if dsServicesHistory.RecordCount = 0 then
    Exit;

  dsServicesHistory.First;
  if dsServicesHistory['DISACT_SERV_ID'] <> srv_Null then
  begin
    srv_date := 'DATE_TO';
    srv_name := 'OFF_NAME';
  end
  else
  begin
    srv_date := 'DATE_FROM';
    srv_name := 'ON_NAME';
  end;

  if FFullAccess or FChangeHistory or (dsServicesHistory[srv_date] >= dmMain.CurrentMonth) then
  begin
    if MessageDlg(PChar(Format(rsHistoryQuestion, [dsServicesHistory[srv_name], dsServices['NAME']])), mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin
      with TpFIBQuery.Create(Nil) do
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.Text := 'select Result from Cancel_Last_Subscribe_Action(:Subscr_Serv_Id)';
          ParamByName('Subscr_Serv_Id').Value := dsServices['Subscr_Serv_Id'];
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        finally
          Free;
        end;
      dsServices.Refresh;
      dsServicesHistory.CloseOpen(True);
      FNeedRecalc := True;
    end;
  end;
end;

procedure TCustSubscrHistoryForma.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  ini: string;
begin
  ini := A4MainForm.GetIniFileName;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, False);

  Action := caFree;
end;

procedure TCustSubscrHistoryForma.srcServicesDataChange(Sender: TObject; Field: TField);
begin
  if dsServices.FieldByName('State_Srv').IsNull then
    Exit;
  actDisconnect.Enabled := (dsServices.FieldByName('State_Srv').AsInteger = srv_AutoBlock); // автоблокировка
end;

procedure TCustSubscrHistoryForma.actDisconnectExecute(Sender: TObject);
var
  offSrv: Integer;
  Units: Double;
begin
  // Есть услгуа
  if dsServices.FieldByName('SERV_ID').IsNull then
    Exit;

  // Услуга не отключена выйдем
  if ((dsServices.FieldByName('STATE_SGN').IsNull) and (dsServices['STATE_SGN'] = 1)) then
    Exit;

  // Это точно автоблокировка
  if (dsServices.FieldByName('State_Srv').AsInteger <> srv_AutoBlock) then
    Exit;

  // проверим дату статуса и права
  if not(FFullAccess or FChangeHistory or (dsServices['STATE_DATE'] >= dmMain.CurrentMonth)) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  Units := 0;
  offSrv := 0;

  if not SelectOffService(dsServices['SERV_ID'], offSrv, Units) then
    Exit;

  with dmMain.Query do
  begin
    SQL.Clear;
    SQL.Add('execute procedure Change_Autoblock_Off(:Customer_Id, :Service_Id, :Off_Service, :P_Units)  ');
    ParamByName('Customer_Id').AsInteger := dsServices['CUSTOMER_ID'];
    ParamByName('Service_Id').AsInteger := dsServices['SERV_ID'];
    ParamByName('OFF_SERVICE').AsInteger := offSrv;
    ParamByName('P_UNITS').AsFloat := Units;
    Transaction.StartTransaction;
    ExecQuery;
    Transaction.Commit;
    SQL.Clear;
  end;
  dsServicesHistory.CloseOpen(True);
  FNeedRecalc := True;
end;

end.
