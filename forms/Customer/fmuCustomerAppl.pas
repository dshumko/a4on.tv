unit fmuCustomerAppl;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList, Vcl.Menus, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DM, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, A4onTypeUnit;

type
  TapgCustomerAppl = class(TA4onPage)
    dsAppliance: TpFIBDataSet;
    srcAppliance: TDataSource;
    dbgAppliance: TDBGridEh;
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
    procedure dbgApplianceDblClick(Sender: TObject);
    procedure srcApplianceDataChange(Sender: TObject; Field: TField);
    procedure srcApplianceStateChange(Sender: TObject);
  private
    FRightEdit: Boolean;
    FRightFull: Boolean;
    procedure EnableControls;
    function GetCustomerInfo: TCustomerInfo;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, AtrStrUtils, EditApplianceForma;

class function TapgCustomerAppl.GetPageName: string;
begin
  Result := rsApplianceCustomer;
end;

procedure TapgCustomerAppl.InitForm;
begin
  FRightFull := dmMain.AllowedAction(rght_Customer_full); // Полный доступ
  FRightEdit := dmMain.AllowedAction(rght_Customer_Appliance); // Оборудование

  actAdd.Visible := FRightEdit or FRightFull;
  actEdit.Visible := FRightEdit or FRightFull;
  actDel.Visible := FRightEdit or FRightFull;
  pnlButtons.Visible := FRightEdit or FRightFull;

  dsAppliance.DataSource := FDataSource;
end;

procedure TapgCustomerAppl.EnableControls;
begin
  actEdit.Enabled := dsAppliance.RecordCount > 0;
  actDel.Enabled := dsAppliance.RecordCount > 0;
end;

procedure TapgCustomerAppl.OpenData;
begin
  if dsAppliance.Active then
    dsAppliance.Close;
  dsAppliance.OrderClause := GetOrderClause(dbgAppliance);
  dsAppliance.Open;

  EnableControls;
end;

procedure TapgCustomerAppl.srcApplianceDataChange(Sender: TObject; Field: TField);
begin
  EnableControls
end;

procedure TapgCustomerAppl.srcApplianceStateChange(Sender: TObject);
begin
  EnableControls;
end;

procedure TapgCustomerAppl.actAddExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  aid : Integer;
begin
  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID = -1 then
    Exit;
  aid := EditAppliance(ci, -1);
  if aid > -1 then begin
    dsAppliance.CloseOpen(true);
    dsAppliance.Locate('ID', aid, []);
  end;
end;

procedure TapgCustomerAppl.actDelExecute(Sender: TObject);
begin
  if dsAppliance.RecordCount = 0 then
    Exit;

  if not dsAppliance.FieldByName('RQ_ID').IsNull then begin
    ShowMessage(rsDeleteViaRequest);
    exit;
  end;

  if (MessageDlg(Format(rsDeleteWithName, [dsAppliance['Name']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
      dsAppliance.Delete;
  end;
end;

procedure TapgCustomerAppl.actEditExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  aid : Integer;
begin
  if (dsAppliance.RecordCount = 0) or (dsAppliance.FieldByName('ID').IsNull) then
    Exit;

  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID <> -1 then
  begin
    aid := EditAppliance(ci, dsAppliance['ID']);
    if aid > -1 then begin
      dsAppliance.CloseOpen(true);
      dsAppliance.Locate('ID', aid, []);
    end;
  end;
end;

procedure TapgCustomerAppl.CloseData;
begin
  dsAppliance.Close;
end;

procedure TapgCustomerAppl.dbgApplianceDblClick(Sender: TObject);
begin
  if (Sender as TDBGridEh).DataSource.DataSet.RecordCount > 0 then
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

function TapgCustomerAppl.GetCustomerInfo: TCustomerInfo;
begin
  with Result do
  begin
    if not FDataSource.DataSet.Eof then
    begin
      FLAT_NO := '';
      phone_no := '';
      notice := '';
      color := '';
      porch_n := '';
      floor_n := '';
      STREET_ID := -1;
      STREET := '';
      HOUSE_ID := -1;
      HOUSE_NO := '';
      isType := 0; // Абонент
      if FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        CUSTOMER_ID := -1
      else
        CUSTOMER_ID := FDataSource.DataSet['CUSTOMER_ID'];
      if FDataSource.DataSet.FieldByName('cust_code').IsNull then
        Cust_Code := ''
      else
        Cust_Code := FDataSource.DataSet['cust_code'];
      if FDataSource.DataSet.FieldByName('Account_No').IsNull then
        Account_No := ''
      else
        Account_No := FDataSource.DataSet['Account_No'];
      if FDataSource.DataSet.FieldByName('CUST_STATE_DESCR').IsNull then
        CUST_STATE_DESCR := ''
      else
        CUST_STATE_DESCR := FDataSource.DataSet['CUST_STATE_DESCR'];

      if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
        Debt_sum := FDataSource.DataSet['BALANCE']
      else
        Debt_sum := FDataSource.DataSet['Debt_sum'];

      if not FDataSource.DataSet.FieldByName('SURNAME').IsNull then
        FIO := FDataSource.DataSet['SURNAME']
      else
        FIO := '';
      if not FDataSource.DataSet.FieldByName('street_ID').IsNull then
      begin
        STREET_ID := FDataSource.DataSet['street_ID'];
        STREET := FDataSource.DataSet['STREET_NAME'];
      end;
      if not FDataSource.DataSet.FieldByName('HOUSE_ID').IsNull then
      begin
        HOUSE_ID := FDataSource.DataSet['HOUSE_ID'];
        HOUSE_NO := FDataSource.DataSet['House_No'];
      end;
      if not FDataSource.DataSet.FieldByName('FLAT_No').IsNull then
        FLAT_NO := FDataSource.DataSet['FLAT_No'];
      if not FDataSource.DataSet.FieldByName('phone_no').IsNull then
        phone_no := FDataSource.DataSet['phone_no'];
      if not FDataSource.DataSet.FieldByName('notice').IsNull then
        notice := FDataSource.DataSet['notice'];
      if not FDataSource.DataSet.FieldByName('HIS_COLOR').IsNull then
        color := FDataSource.DataSet['HIS_COLOR'];
      if not FDataSource.DataSet.FieldByName('PORCH_N').IsNull then
        porch_n := FDataSource.DataSet['PORCH_N'];
      if not FDataSource.DataSet.FieldByName('FLOOR_N').IsNull then
        floor_n := FDataSource.DataSet['FLOOR_N'];
    end
    else
      CUSTOMER_ID := -1;
  end;
end;

end.
