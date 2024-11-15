﻿unit SubscrHistory;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ActnList, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.Menus, Vcl.Buttons,
  pFIBDataSet, GridsEh, FIBDataSet, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEh, PrjConst, EhLibVCL,
  DBGridEhGrouping,
  DynVarsEh, amSplitter;

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
    pnlBtnsHst: TPanel;
    btnOkHst: TSpeedButton;
    btnCancelHst: TSpeedButton;
    actOkHst: TAction;
    actCancelHst: TAction;
    btnAutoblock: TSpeedButton;
    actChangeToAutoBlock: TAction;
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
    procedure dbgCustSubscrServHistExit(Sender: TObject);
    procedure dsServicesBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actOkHstExecute(Sender: TObject);
    procedure actCancelHstExecute(Sender: TObject);
    procedure actChangeToAutoBlockExecute(Sender: TObject);
  private
    FNeedRecalc: Boolean;
    FDelRecord: Boolean;
    FStateChanged: Boolean;
    FChangeHistory: Boolean;
    FFullAccess: Boolean;
    FCanAddEdit: Boolean;
    FfcSrvDisconted: TColor;
    FfcSrvDiscontedFuture: TColor;
    FfcSrvInAutoblock: TColor;
    FLastState: Integer;
    function GetRecalc: Boolean;
  public
    property NeedRecalc: Boolean read GetRecalc;
  end;

function ShowCustSubscrHistory(const aCustomer_ID: Integer; const aService_ID: Integer = -1): Boolean;

implementation

uses
  MAIN, DM, AtrCommon, pFIBQuery, ChangeOffForma, TextEditForma;

{$R *.DFM}

function ShowCustSubscrHistory(const aCustomer_ID: Integer; const aService_ID: Integer = -1): Boolean;
begin
  with TCustSubscrHistoryForma.Create(Application) do
  begin
    try
      // dsServices.ParamByName('CUST_ID').AsInteger := ID;
      dsServices.ParamByName('CUSTOMER_ID').AsInteger := aCustomer_ID;
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
  if not ds.Active then
    exit;

  if ds.FieldValues['State_Sgn'] = 0 then
  begin
    if (ds.FieldValues['STATE_DATE'] > Now()) then
      AFont.Color := FfcSrvDiscontedFuture
    else
      AFont.Color := FfcSrvDisconted;
  end;

  if ((not ds.FieldByName('state_srv').IsNull) and (ds.FieldValues['state_srv'] = -3)) then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := FfcSrvInAutoblock;
  end;

  if ((not ds.FieldByName('STATE_DATE').IsNull) and (ds.FieldValues['STATE_DATE'] > Now())) then
    AFont.Style := AFont.Style + [fsItalic];
end;

procedure TCustSubscrHistoryForma.dbgCustSubscrServHistExit(Sender: TObject);
begin
  if (Sender as TDBGridEh).DataSource.DataSet.State in [dsEdit] then
    (Sender as TDBGridEh).DataSource.DataSet.Post;
end;

procedure TCustSubscrHistoryForma.dsServicesBeforePost(DataSet: TDataSet);
begin
  if dsServices.FieldByName('State_Sgn').IsNull then
    exit;

  if not FStateChanged then
    FStateChanged := (dsServices.FieldByName('State_Sgn').NewValue <> dsServices.FieldByName('State_Sgn').OldValue);
end;

procedure TCustSubscrHistoryForma.srcServicesStateChange(Sender: TObject);
begin
  if not(FFullAccess or FChangeHistory) then
    exit;

  actOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  actCancel.Enabled := actOk.Enabled;
end;

procedure TCustSubscrHistoryForma.actDeleteSubscrHistExecute(Sender: TObject);
begin
  if not(FFullAccess or FChangeHistory) then
    exit;

  if (dmMain.InStrictMode and ((dsServicesHistory['DATE_FROM'] < dmMain.CurrentMonth) or
    (dsServicesHistory['DATE_TO'] < dmMain.CurrentMonth))) then
  begin
    ShowMessage(rsPastDateIncorrect);
    exit;
  end;

  if (MessageDlg(rsDeleteSrvHistory, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsServicesHistory.Delete;
    FDelRecord := True;
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
var
  s: String;
begin
  if not(FFullAccess or FChangeHistory) then
    exit;

  if dsServices.RecordCount = 0 then
    exit;

  if (dmMain.InStrictMode and (dsServicesHistory.RecordCount > 0)) then
  begin
    ShowMessage(rsErrorNeedDeleteHistory);
    exit;
  end;

  s := '';
  If (not dsServices.FieldByName('NAME').IsNull) then
    s := dsServices['NAME'];

  if (MessageDlg(Format(rsDeleteRequest, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
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
  cNC: Boolean;
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
  begin
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
    end
    else if ((Font_size <> 0) and (Components[i] is TMemo)) then
    begin
      (Components[i] as TDBGridEh).Font.Name := Font_name;
      (Components[i] as TDBGridEh).Font.Size := Font_size;
    end;
  end;

  FFullAccess := (dmMain.AllowedAction(rght_Customer_full));
  FChangeHistory := (dmMain.AllowedAction(rght_Customer_History));
  FCanAddEdit := FFullAccess or dmMain.AllowedAction(rght_Customer_AddSrv) or
    dmMain.AllowedAction(rght_Customer_EditSrv);
  actDeleteService.Visible := FChangeHistory or FFullAccess;
  actDeleteSubscrHist.Visible := actDeleteService.Visible;

  dbgCustSubscrServ.ReadOnly := not(FFullAccess or FChangeHistory);
  dbgCustSubscrServHist.ReadOnly := not(FFullAccess or FChangeHistory);

  // Спрячем кнопку смены автоблока
  actDisconnect.Visible := not(dmMain.GetSettingsValue('HIDE_HIST_ABLOCK_BTN') = '1');
  FNeedRecalc := False;

  chW := (dmMain.GetSettingsValue('SAVE_SRV_WORKER') = '1');
  cNC := (dmMain.GetSettingsValue('CAN_NEW_CONTRACT') = '1');
  for i := 0 to dbgCustSubscrServHist.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgCustSubscrServHist.Columns[i].FieldName) = 'WORKER_ON') then
      dbgCustSubscrServHist.Columns[i].Visible := chW
    else if (AnsiUpperCase(dbgCustSubscrServHist.Columns[i].FieldName) = 'WORKER_OFF') then
      dbgCustSubscrServHist.Columns[i].Visible := chW
    else if (AnsiUpperCase(dbgCustSubscrServHist.Columns[i].FieldName) = 'CONTRACT') then
      dbgCustSubscrServHist.Columns[i].Visible := cNC
    else if (AnsiUpperCase(dbgCustSubscrServHist.Columns[i].FieldName) = 'CONTRACT_DATE') then
      dbgCustSubscrServHist.Columns[i].Visible := cNC;
  end;

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
end;

procedure TCustSubscrHistoryForma.srcServicesHistoryStateChange(Sender: TObject);
begin
  pnlBtnsHst.Visible := not(srcServicesHistory.DataSet.State = dsBrowse);
  // FNeedRecalc := True;
end;

procedure TCustSubscrHistoryForma.actOkExecute(Sender: TObject);
begin
  if FFullAccess or FChangeHistory then
  begin
    dsServices.Post;
    dsServicesHistory.CloseOpen(True);
  end
  else
    dsServices.cancel;
end;

procedure TCustSubscrHistoryForma.actOkHstExecute(Sender: TObject);
begin
  if FFullAccess or FChangeHistory then
  begin
    dsServicesHistory.Post;
  end
  else
    dsServicesHistory.cancel;

  pnlBtnsHst.Visible := False;
end;

procedure TCustSubscrHistoryForma.actCancelExecute(Sender: TObject);
begin
  dsServices.cancel
end;

procedure TCustSubscrHistoryForma.actCancelHstExecute(Sender: TObject);
begin
  dsServicesHistory.cancel;
  pnlBtnsHst.Visible := False;
end;

procedure TCustSubscrHistoryForma.actChangeToAutoBlockExecute(Sender: TObject);
var
  notice: string;
begin
  // TODO: Доделать
  ShowMessage('В работе');
  exit;

  // Есть услгуа
  if dsServices.FieldByName('SERV_ID').IsNull then
    exit;

  // Услуга не отключена выйдем
  if ((dsServices.FieldByName('STATE_SGN').IsNull) and (dsServices['STATE_SGN'] = 1)) then
    exit;

  // Это точно автоблокировка
  if (dsServices.FieldByName('State_Srv').AsInteger = srv_AutoBlock) then
    exit;

  // проверим дату статуса и права
  if not(FFullAccess or FChangeHistory or (dsServices['STATE_DATE'] >= dmMain.CurrentMonth)) then
  begin
    ShowMessage(rsPastDateIncorrect);
    exit;
  end;

  if (not EditText(notice, 'Причина', 'Причина смены на автоблокировку')) then
    exit;

  with dmMain.Query do
  begin
    SQL.Clear;
    SQL.Add('execute procedure CHANGE_OFF_TO_AUTOBLOCK(:Customer_Id, :Service_Id, :Off_Service, :notice)');
    ParamByName('Customer_Id').AsInteger := dsServices['CUSTOMER_ID'];
    ParamByName('Service_Id').AsInteger := dsServices['SERV_ID'];
    ParamByName('OFF_SERVICE').AsInteger := dsServices.FieldByName('State_Srv').AsInteger;
    ParamByName('notice').AsString := notice;
    Transaction.StartTransaction;
    ExecQuery;
    Transaction.Commit;
    SQL.Clear;
  end;
  dsServicesHistory.CloseOpen(True);
  FDelRecord := True;
end;

procedure TCustSubscrHistoryForma.actBackExecute(Sender: TObject);
var
  srv_name: string;
  srv_date: string;
begin
  if dsServicesHistory.RecordCount = 0 then
    exit;

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

  if FFullAccess or FChangeHistory or ((dsServicesHistory[srv_date] >= dmMain.CurrentMonth) and FCanAddEdit) then
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
      FDelRecord := True;
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

procedure TCustSubscrHistoryForma.FormCreate(Sender: TObject);
begin
  FNeedRecalc := False;
  FDelRecord := False;
  FStateChanged := False;
  FLastState := -1;
end;

procedure TCustSubscrHistoryForma.srcServicesDataChange(Sender: TObject; Field: TField);
begin
  if dsServices.FieldByName('State_Srv').IsNull then
    exit;

  FLastState := dsServices.FieldByName('State_Sgn').AsInteger;
  actDisconnect.Enabled := (dsServices.FieldByName('State_Srv').AsInteger = srv_AutoBlock); // автоблокировка
  actChangeToAutoBlock.Enabled := (FLastState = 0) and (dsServices.FieldByName('State_Srv').AsInteger <> srv_AutoBlock);
  // Нет автоблокировка
end;

procedure TCustSubscrHistoryForma.actDisconnectExecute(Sender: TObject);
var
  offSrv: Integer;
  Units: Double;
  notice: string;
begin
  // Есть услгуа
  if dsServices.FieldByName('SERV_ID').IsNull then
    exit;

  // Услуга не отключена выйдем
  if ((dsServices.FieldByName('STATE_SGN').IsNull) and (dsServices['STATE_SGN'] = 1)) then
    exit;

  // Это точно автоблокировка
  if (dsServices.FieldByName('State_Srv').AsInteger <> srv_AutoBlock) then
    exit;

  // проверим дату статуса и права
  if not(FFullAccess or FChangeHistory or (dsServices['STATE_DATE'] >= dmMain.CurrentMonth)) then
  begin
    ShowMessage(rsPastDateIncorrect);
    exit;
  end;

  Units := 0;
  offSrv := 0;

  if not SelectOffService(dsServices['SERV_ID'], offSrv, Units, notice) then
    exit;

  with dmMain.Query do
  begin
    SQL.Clear;
    SQL.Add('execute procedure Change_Autoblock_Off(:Customer_Id, :Service_Id, :Off_Service, :P_Units, :notice)');
    ParamByName('Customer_Id').AsInteger := dsServices['CUSTOMER_ID'];
    ParamByName('Service_Id').AsInteger := dsServices['SERV_ID'];
    ParamByName('OFF_SERVICE').AsInteger := offSrv;
    ParamByName('P_UNITS').AsFloat := Units;
    ParamByName('notice').AsString := notice;
    Transaction.StartTransaction;
    ExecQuery;
    Transaction.Commit;
    SQL.Clear;
  end;
  dsServicesHistory.CloseOpen(True);
  FDelRecord := True;
end;

function TCustSubscrHistoryForma.GetRecalc: Boolean;
begin
  Result := FStateChanged or FNeedRecalc or FDelRecord;
end;

end.
