unit fmuCustomerRequests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, GridsEh, DBGridEh,
  ComCtrls, ToolWin, DB, FIBDataSet, pFIBDataSet, ActnList,
  DBGridEhToolCtrls, Buttons, ExtCtrls, DBAxisGridsEh, System.Actions, PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TapgCustomerRequests = class(TA4onPage)
    dsRequests: TpFIBDataSet;
    srcRequests: TDataSource;
    dbGridCustReq: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbGridCustReqDblClick(Sender: TObject);
    procedure dbGridCustReqGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    CE: Boolean;
    CC: Boolean;
    CG: Boolean;
    CA: Boolean;
    FullAccess: Boolean;
    FSavedID: Integer;
    // FLastID: Integer;
    procedure EnableControls;
  public
    procedure RefreshDS;
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    procedure SavePosition; override;
    procedure GotoSavedPosition; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses MAIN, AtrCommon, RequestNewForma, RequestForma, DM;

class function TapgCustomerRequests.GetPageName: string;
begin
  Result := rsRequests;
end;

procedure TapgCustomerRequests.RefreshDS;
begin
  dsRequests.DisableControls;
  SavePosition;
  dsRequests.CloseOpen(true);
  GotoSavedPosition;
  dsRequests.EnableControls;
  EnableControls;
end;

procedure TapgCustomerRequests.SavePosition;
begin
  FSavedID := -1;
  if (dsRequests.RecordCount > 0) and (not dsRequests.FieldByName('RQ_ID').IsNull) then
    FSavedID := dsRequests['RQ_ID'];
end;

procedure TapgCustomerRequests.GotoSavedPosition;
begin
  if FSavedID > -1 then
    dsRequests.Locate('RQ_ID', FSavedID, []);
end;

procedure TapgCustomerRequests.InitForm;
var
  i: Integer;
begin
  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_Request_full); // (50, 'ПОЛНЫЙ ДОСТУП', 'ЗАЯВКИ', 'Полный доступ');
  CA := dmMain.AllowedAction(rght_Request_add); // (51, 'ДОБАВЛЕНИЕ', 'ЗАЯВКИ', 'Добавление заявок');
  CE := dmMain.AllowedAction(rght_Request_edit); // (52, 'РЕДАКТИРОВАНИЕ', 'ЗАЯВКИ', 'Редактирование заявки');
  CC := dmMain.AllowedAction(rght_Request_Close); // (54, 'ЗАКРЫТИЕ', 'ЗАЯВКИ', 'Закрытие заявки');
  CG := dmMain.AllowedAction(rght_Request_Give); // (53, 'ВЫДАЧА', 'ЗАЯВКИ', 'Выдача заявок в работу');

  actAdd.Visible := FullAccess or CA;
  actEdit.Visible := FullAccess or CE;
  actDel.Visible := FullAccess or CE;
  pnlButtons.Visible := FullAccess or CE or CA or CG;
  // Привяжем заявки к адресу или абоненту, в зависимости от настроек системы
  dsRequests.SQLs.SelectSQL.Add(' where ');
  if (not TryStrToInt(dmMain.GetIniValue('REQTOADRES'), i)) then
    i := 0;
  if i = 0 then
    dsRequests.SQLs.SelectSQL.Add('r.RQ_CUSTOMER = :CUSTOMER_ID')
  else
    dsRequests.SQLs.SelectSQL.Add('r.HOUSE_ID = :HOUSE_ID and coalesce(r.FLAT_NO, '''') = :FLAT_NO');
  dsRequests.SQLs.SelectSQL.Add('order by R.added_on desc ');
  dsRequests.DataSource := FDataSource;
end;

procedure TapgCustomerRequests.EnableControls;
begin
  actEdit.Enabled := dsRequests.RecordCount > 0;
  actDel.Enabled := dsRequests.RecordCount > 0;
end;

procedure TapgCustomerRequests.OpenData;
begin
  FSavedID := -1;
  if dsRequests.Active then
    SavePosition;
  dsRequests.OrderClause := GetOrderClause(dbGridCustReq);
  dsRequests.Open;
  GotoSavedPosition;
  EnableControls;
end;

procedure TapgCustomerRequests.actDelExecute(Sender: TObject);
begin
  if not dsRequests.FieldByName('RQ_ID').IsNull then
  begin
    if ((dsRequests.FieldByName('REQ_RESULT').IsNull) or (dsRequests.FieldByName('REQ_RESULT').AsInteger = 0)) then
    begin
      if Application.MessageBox(PWideChar(rsCancelRequest), PWideChar(rsRequestCancel),
        MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
      begin
        dsRequests.UpdateTransaction.StartTransaction;
        dsRequests.Edit;
        dsRequests['REQ_RESULT'] := 3;
        dsRequests.Post;
        dsRequests.UpdateTransaction.Commit;
        dsRequests.Refresh;
      end;
    end;
  end;
end;

procedure TapgCustomerRequests.actEditExecute(Sender: TObject);
var
  aRequest: Integer;
  aCustomer: Integer;
  aMode: Byte;
  aNodeId: Integer;
Begin
  if not(FullAccess or CE or CC or CG or CA) then
    Exit;

  if not dsRequests.FieldByName('RQ_ID').IsNull then
  begin
    if not(FullAccess or CE or CC or CG) then
      Exit;
    aMode := 1;
    aRequest := dsRequests.FieldByName('RQ_ID').AsInteger;
  end
  else
  begin
    if not(FullAccess or CA) then
      Exit;
    aMode := 0;
    aRequest := -1;
  end;

  aNodeId := -1;
  aCustomer := -1;
  if dsRequests.FieldByName('RQ_CUSTOMER').IsNull then
  begin
    if not dsRequests.FieldByName('NODE_ID').IsNull then
      aNodeId := dsRequests.FieldByName('NODE_ID').AsInteger
    else
    begin
      if not FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        aCustomer := FDataSource.DataSet.FieldByName('CUSTOMER_ID').AsInteger;
    end;
  end
  else
  begin
    aCustomer := dsRequests.FieldByName('RQ_CUSTOMER').AsInteger;
  end;

  if aNodeId = -1 then
    ReguestExecute(aRequest, aCustomer, aMode)
  else
    ReguestNodeExecute(aRequest, aNodeId, aMode);

  dsRequests.CloseOpen(true);
end;

procedure TapgCustomerRequests.actAddExecute(Sender: TObject);
var
  aCustomer: Integer;
begin
  if not FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
    aCustomer := FDataSource.DataSet['CUSTOMER_ID']
  else
    aCustomer := -1;
  NewRequest(aCustomer, RefreshDS);
end;

procedure TapgCustomerRequests.CloseData;
begin
  dsRequests.Close;
end;

procedure TapgCustomerRequests.dbGridCustReqDblClick(Sender: TObject);
begin

  if dsRequests.FieldDefs.IndexOf('RQ_ID') = -1 then
    Exit;

  SavePosition;

  if (not dsRequests.FieldByName('RQ_ID').IsNull) then
  begin
    if actEdit.Enabled then
      actEdit.Execute;
  end
  else
  begin
    if actAdd.Enabled then
      actAdd.Execute;
  end;

end;

procedure TapgCustomerRequests.dbGridCustReqGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').IsNull then
    try
      Background := StringToColor((Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').Value);
    except
    end;
end;

end.
