unit fmuCustomerBonus;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TapgCustomerBonus = class(TA4onPage)
    dsBonus: TpFIBDataSet;
    srcBonus: TDataSource;
    dbgGrid: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actDel: TAction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dsBonusAfterOpen(DataSet: TDataSet);
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  DM, MAIN;

{$R *.dfm}

class function TapgCustomerBonus.GetPageName: string;
begin
  Result := rsBonuses;
end;

procedure TapgCustomerBonus.InitForm;
var
  FullAccess: Boolean;
  canEdit: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Customer_full)); // ПОЛНЫЙ ДОСТУП
  canEdit := (dmMain.AllowedAction(rght_Customer_Bonus)); // ИЗМЕНЕНИЕ

  actAdd.Visible := canEdit or FullAccess;
  // actEdit.Visible    := canEdit or FullAccess;
  actDel.Visible := canEdit or FullAccess;

  pnlButtons.Visible := canEdit or FullAccess;

  dsBonus.DataSource := FDataSource;
end;

procedure TapgCustomerBonus.OpenData;
begin
  if dsBonus.Active then
    dsBonus.Close;
  dsBonus.OrderClause := GetOrderClause(dbgGrid);
  dsBonus.Open;
end;

procedure TapgCustomerBonus.actDelExecute(Sender: TObject);
begin
  if dsBonus.RecordCount = 0 then
    Exit;
  if not dsBonus.FieldByName('BONUS').IsNull then
  begin
    if (MessageDlg(Format(rsDeleteBonus, [dsBonus.FieldByName('BONUS').AsFloat]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      dsBonus.Delete;
  end;
  actDel.Enabled := (dsBonus.RecordCount > 0) and actDel.Visible;
end;

procedure TapgCustomerBonus.actEditExecute(Sender: TObject);
begin
  // AddEditDiscount(dsDiscount['DISCOUNT_ID'], FDataSource.Dataset['CUSTOMER_ID']);
  // dsDiscount.CloseOpen(true);
  // RecalcCustomer;
end;

procedure TapgCustomerBonus.CloseData;
begin
  dsBonus.Close;
end;

procedure TapgCustomerBonus.dsBonusAfterOpen(DataSet: TDataSet);
begin
  actDel.Enabled := (dsBonus.RecordCount > 0) and actDel.Visible;
end;

end.
