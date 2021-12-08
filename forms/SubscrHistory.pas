unit SubscrHistory;

interface

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Classes,
  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.StdCtrls,
  VCL.Grids, VCL.ActnList, System.UITypes, VCL.ExtCtrls, VCL.ToolWin,
  VCL.ComCtrls, VCL.Menus, System.Actions, VCL.Buttons,
  Db, pFIBDataSet, GridsEh, FIBDataSet,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEh,
  PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TCustSubscrHistoryForma = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    dbgCustSubscrServHist: TDBGridEh;
    Panel3: TPanel;
    dbgCustSubscrServ: TDBGridEh;
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
    pnlBtns: TPanel;
    btnOk: TSpeedButton;
    actOk: TAction;
    actCancel: TAction;
    actBack: TAction;
    btnCancel: TSpeedButton;
    btnBack: TSpeedButton;
    btnDisconnect: TSpeedButton;
    actDisconnect: TAction;
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
  private
    fNeedRecalc: Boolean;
    fChangeHistory: Boolean;
    fFullAccess: Boolean;
  public
    { Public declarations }
    property NeedRecalc: Boolean read fNeedRecalc;

  end;

function ShowCustSubscrHistory(const aCustomer_ID: Integer; const aService_ID: Integer = -1): Boolean;

implementation

uses
  MAIN, DM, AtrCommon, CF, pFIBQuery, ChangeOffForma;

{$R *.DFM}

function ShowCustSubscrHistory(const aCustomer_ID: Integer; const aService_ID: Integer = -1): Boolean;
begin
  with TCustSubscrHistoryForma.Create(Application) do
    try
      // dsServices.ParamByName('CUST_ID').AsInteger := ID;
      dbgCustSubscrServ.ReadOnly := not((dmMain.AllowedAction(rght_Customer_full)) or
        (dmMain.AllowedAction(rght_Customer_History)));
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
  actOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  actCancel.Enabled := actOk.Enabled;
  fNeedRecalc := True;
end;

procedure TCustSubscrHistoryForma.actDeleteSubscrHistExecute(Sender: TObject);
begin
  if (dmMain.InStrictMode and ((dsServicesHistory['DATE_FROM'] < dmMain.CurrentMonth) or
    (dsServicesHistory['DATE_TO'] < dmMain.CurrentMonth))) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  if (MessageDlg(rsDeleteSrvHistory, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsServicesHistory.Delete;
    fNeedRecalc := True;
  end;
end;

procedure TCustSubscrHistoryForma.actDeleteServiceExecute(Sender: TObject);
begin
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
    fNeedRecalc := True;
  end;
end;

procedure TCustSubscrHistoryForma.FormShow(Sender: TObject);
var
  i: Integer;
  ini: string;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
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
  fFullAccess := (dmMain.AllowedAction(rght_Customer_full));
  fChangeHistory := (dmMain.AllowedAction(rght_Customer_History));
  actDeleteService.Visible := fChangeHistory or fFullAccess;
  actDeleteSubscrHist.Visible := actDeleteService.Visible;
  actDisconnect.Visible := actDeleteService.Visible;
  fNeedRecalc := False;
end;

procedure TCustSubscrHistoryForma.srcServicesHistoryStateChange(Sender: TObject);
begin
  fNeedRecalc := True;
end;

procedure TCustSubscrHistoryForma.actOkExecute(Sender: TObject);
begin
  if fFullAccess or fChangeHistory then
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

  if fFullAccess or fChangeHistory or (dsServicesHistory[srv_date] >= dmMain.CurrentMonth) then
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
      fNeedRecalc := True;
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
        Self.Name + '.' + Components[i].Name, True);

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
  if not(dmMain.AllowedAction(rght_Customer_full) or dmMain.AllowedAction(rght_Customer_EditSrv)) then
    Exit;

  if dsServices.FieldByName('SERV_ID').IsNull then
    Exit; // Есть услгуа

  if ((dsServices.FieldByName('STATE_SGN').IsNull) and (dsServices['STATE_SGN'] = 1)) then
    Exit; // Услуга не отключена выйдем

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
  fNeedRecalc := True;
end;

end.
