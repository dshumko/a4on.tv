unit BillingForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, ToolWin,
  ComCtrls, ActnList, RxMemDS, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, System.Actions, DBAxisGridsEh;

type
  TBillingForm = class(TForm)
    tlb1: TToolBar;
    DBGridEh1: TDBGridEh;
    srcBilling: TDataSource;
    dsBilling: TpFIBDataSet;
    dsBillingHOUSE_NO: TFIBStringField;
    dsBillingLOGIN: TFIBStringField;
    dsBillingIP_INET: TFIBStringField;
    dsBillingACCOUNT_ID: TFIBIntegerField;
    dsBillingACCOUNT_NAME: TFIBStringField;
    dsBillingUNIT_ID: TFIBIntegerField;
    dsBillingUNIT_NAME: TFIBStringField;
    dsBillingPLAN_ID: TFIBIntegerField;
    dsBillingPLAN_NAME: TFIBStringField;
    dsBillingNOTICE: TFIBStringField;
    dsBillingBLOCKED: TFIBSmallIntField;
    dsBillingACCOUNT_NO: TFIBStringField;
    dsBillingCUST_STATE_DESCR: TFIBStringField;
    dsBillingFLAT_NO: TFIBStringField;
    dsBillingDEBT_SUM: TFIBBCDField;
    dsBillingACCOUNT_HEX: TStringField;
    dsBillingUNIT_HEX: TStringField;
    dsBillingSTREET: TFIBStringField;
    dsBillingFIO: TFIBStringField;
    btnBillingEdit: TToolButton;
    actlst1: TActionList;
    actBillingEdit: TAction;
    dsBillingCUSTOMER_ID: TFIBIntegerField;
    mdBilling: TRxMemoryData;
    procedure actBillingEditExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure dsBillingCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BillingForm: TBillingForm;

implementation

uses
  DM, RxStrUtils, MAIN, CustBillingForma;

{$R *.dfm}

procedure TBillingForm.actBillingEditExecute(Sender: TObject);
var
  i :Integer;
begin
  if not dsBilling.Active then Exit;
  if dsBilling.FieldByName('CUSTOMER_ID').IsNull
  then i := 0 // если есть записи. то изменим
  else i:=1;  // если нет - добавим
  if BillingAction(dsBilling.FieldByName('CUSTOMER_ID').AsInteger, i)
  then dsBilling.CloseOpen(true);
end;

procedure TBillingForm.DBGridEh1DblClick(Sender: TObject);
begin
  actBillingEdit.Execute;
end;

procedure TBillingForm.dsBillingCalcFields(DataSet: TDataSet);
begin
  // переведем в HEX формат для NetAMS
  if dsBilling.FieldByName('ACCOUNT_ID').IsNull
  then dsBilling.FieldByName('ACCOUNT_HEX').Clear
  else dsBilling['ACCOUNT_HEX'] :=  Dec2Hex(dsBilling['ACCOUNT_ID'],6);

  if dsBilling.FieldByName('UNIT_ID').IsNull
  then dsBilling.FieldByName('UNIT_HEX').Clear
  else dsBilling['UNIT_HEX'] := Dec2Hex(dsBilling['UNIT_ID'],6);
end;

procedure TBillingForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsBilling.Close;
  Action := caFree;
  BillingForm := nil;
end;

procedure TBillingForm.FormShow(Sender: TObject);
begin
  dsBilling.Open;
end;

end.
