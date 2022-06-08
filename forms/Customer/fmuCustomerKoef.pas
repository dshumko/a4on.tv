unit fmuCustomerKoef;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons,
  Vcl.ExtCtrls,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TapgCustomerKoef = class(TA4onPage)
    dsDiscount: TpFIBDataSet;
    srcDiscount: TDataSource;
    dbgCustDiscFactor: TDBGridEh;
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
    procedure dsDiscountAfterOpen(DataSet: TDataSet);
  private
    procedure RecalcCustomer;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  DM, DiscountForma, pFIBQuery, MAIN;

{$R *.dfm}

class function TapgCustomerKoef.GetPageName: string;
begin
  Result := rsKoef;
end;

procedure TapgCustomerKoef.InitForm;
var
  FullAccess: Boolean;
  canEdit: Boolean;
begin
  { TODO: Не давать править коэффициенты в прошлом периоде }
  FullAccess := (dmMain.AllowedAction(rght_Customer_full)); // ПОЛНЫЙ ДОСТУП
  canEdit := (dmMain.AllowedAction(rght_Customer_Discount)); // ИЗМЕНЕНИЕ

  actAdd.Visible := canEdit or FullAccess;
  actEdit.Visible := canEdit or FullAccess;
  actDel.Visible := canEdit or FullAccess;

  pnlButtons.Visible := canEdit or FullAccess;

  dsDiscount.DataSource := FDataSource;
end;

procedure TapgCustomerKoef.OpenData;
begin
  if dsDiscount.Active then
    dsDiscount.Close;
  dsDiscount.OrderClause := GetOrderClause(dbgCustDiscFactor);
  dsDiscount.Open;
end;

procedure TapgCustomerKoef.actAddExecute(Sender: TObject);
begin
  AddEditDiscount(-1, FDataSource.DataSet['CUSTOMER_ID']);
  dsDiscount.CloseOpen(true);
  RecalcCustomer;
end;

procedure TapgCustomerKoef.actDelExecute(Sender: TObject);
begin
  if dsDiscount.RecordCount = 0 then
    Exit;

  if (dmMain.InStrictMode) and ((dsDiscount['DATE_FROM'] < dmMain.CurrentMonth) or
    (dsDiscount['DATE_TO'] < dmMain.CurrentMonth)) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  if (MessageDlg(rsDeleteDiscount, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsDiscount.Delete;
  actEdit.Enabled := (dsDiscount.RecordCount > 0) and actEdit.Visible;
  actDel.Enabled := (dsDiscount.RecordCount > 0) and actDel.Visible;
end;

procedure TapgCustomerKoef.actEditExecute(Sender: TObject);
begin
  AddEditDiscount(dsDiscount['DISCOUNT_ID'], FDataSource.DataSet['CUSTOMER_ID']);
  dsDiscount.CloseOpen(true);
  RecalcCustomer;
end;

procedure TapgCustomerKoef.CloseData;
begin
  dsDiscount.Close;
end;

procedure TapgCustomerKoef.dsDiscountAfterOpen(DataSet: TDataSet);
begin
  actEdit.Enabled := (dsDiscount.RecordCount > 0) and actEdit.Visible;
  actDel.Enabled := (dsDiscount.RecordCount > 0) and actDel.Visible;
end;

procedure TapgCustomerKoef.RecalcCustomer;
begin
  with TpFIBQuery.Create(Self) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      Transaction.StartTransaction;
      SQL.Text := 'EXECUTE PROCEDURE FULL_RECALC_CUSTOMER(:CUST)';
      ParamByName('CUST').AsInt64 := FDataSource.DataSet.FieldByName('customer_id').AsInteger;
      ExecQuery;
      Transaction.Commit;
      UpdatePage;
    finally
      free;
    end;
  end;
end;

end.
