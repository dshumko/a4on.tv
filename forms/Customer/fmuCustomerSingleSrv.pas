unit fmuCustomerSingleSrv;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ActnList, Vcl.Menus,
  AtrPages, ToolCtrlsEh, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
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
  private
    FullAccess: Boolean;
    ChangeHistory: Boolean;
    FSavedID: Integer;
    procedure EnableControls;
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
  DM, pFIBQuery, OnOffServicesForma, MAIN, TextEditForma, OrdersTPForma;

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
begin
  { TODO: Не давать править SINGLE SRV в прошлом периоде }
  FullAccess := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ
  ChangeHistory := (dmMain.AllowedAction(rght_Customer_History)); // Изменение истории
  vB := (dmMain.AllowedAction(rght_Customer_AddSrv)); // ДОБАВЛЕНИЕ УСЛУГИ
  actAdd.Visible := vB or FullAccess;
  actDel.Visible := vB or FullAccess;

  pnlButtons.Visible := actAdd.Visible or actDel.Visible;

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

end.
