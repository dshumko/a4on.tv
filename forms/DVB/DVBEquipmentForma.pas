unit DVBEquipmentForma;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, StdCtrls, DBCtrlsEh, DBAxisGridsEh,
  System.Actions, Vcl.Buttons, Vcl.ExtCtrls, CnErrorProvider, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh;

type
  TDVBEquipmentForm = class(TGridForm)
    dsEQ: TpFIBDataSet;
    btn2: TToolButton;
    actHistory: TAction;
    dsHistory: TpFIBDataSet;
    srcHistory: TDataSource;
    pnlHistory: TPanel;
    dbgHistory: TDBGridEh;
    btnHistory: TToolButton;
    splitter: TSplitter;
    actFindCustomer: TAction;
    btnFindCustomer: TToolButton;
    btn1: TToolButton;
    pnl1: TPanel;
    btnCustHist: TSpeedButton;
    actCustHist: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure actHistoryExecute(Sender: TObject);
    procedure actFindCustomerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCustHistExecute(Sender: TObject);
  private
    procedure GetGridCustomer(Grid: TDBGridEh);
  public
    { Public declarations }
  end;

var
  DVBEquipmentForm: TDVBEquipmentForm;

implementation

uses DM, DVBEqGenForma, DVBEqEditForma, MAIN, CF;

{$R *.dfm}

procedure TDVBEquipmentForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsEQ.Close;
  DVBEquipmentForm := nil;
end;

procedure TDVBEquipmentForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_DigitEQP) or dmMain.AllowedAction(rght_Dictionary_full))) then
    exit;
  if GenerateDecoders() then
    dsEQ.CloseOpen(True);
end;

procedure TDVBEquipmentForm.actCustHistExecute(Sender: TObject);
begin
  inherited;
  GetGridCustomer(dbgHistory);
end;

procedure TDVBEquipmentForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Digit_DelEQP) or dmMain.AllowedAction(rght_Dictionary_full))) then
    exit;

  if ((not srcDataSource.DataSet.FieldByName('eq_state').IsNull) and (srcDataSource.DataSet['eq_state'] <> 1))
  // На складе
  then
    exit;

  if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['eq_n']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
    dsEQ.Delete;
end;

procedure TDVBEquipmentForm.actEditExecute(Sender: TObject);
var
  s: string;
  c: Boolean;
  i: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_DigitEQP) or dmMain.AllowedAction(rght_Dictionary_full))) then
    exit;
  if dsEQ.FieldByName('EQ_N').IsNull then
    exit;
  s := dsEQ['EQ_N'];
  if dsEQ.FieldByName('EQ_TYPE').IsNull then
    i := 0
  else
    i := dsEQ.FieldByName('EQ_TYPE').AsInteger;
  c := EditDigitEQ(s, i);
  if c then begin
    dsEQ.CloseOpen(True);
    dsEQ.Locate('EQ_N', s, []);
  end;
end;

procedure TDVBEquipmentForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsEQ.Open;
  // права пользователей
  actNew.Visible := dmMain.AllowedAction(rght_Dictionary_DigitEQP) or dmMain.AllowedAction(rght_Dictionary_full);
  actDelete.Visible := dmMain.AllowedAction(rght_Dictionary_DigitEQP) or dmMain.AllowedAction(rght_Dictionary_full);
  actEdit.Visible := dmMain.AllowedAction(rght_Dictionary_DigitEQP) or dmMain.AllowedAction(rght_Dictionary_full);
end;

procedure TDVBEquipmentForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
{$IFDEF DEMOVERSION}
  actNew.Enabled := ((Sender as TDataSource).DataSet.RecordCount < 10);
  if ((Sender as TDataSource).DataSet.RecordCount >= 10) then
    actNew.Hint := rsDemo_Restrict;
{$ELSE}
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
{$ENDIF}
end;

procedure TDVBEquipmentForm.actHistoryExecute(Sender: TObject);
begin
  inherited;
  actHistory.Checked := not actHistory.Checked;
  pnlHistory.Visible := actHistory.Checked;
  splitter.Visible := actHistory.Checked;
  dsHistory.Active := actHistory.Checked;
end;

procedure TDVBEquipmentForm.actFindCustomerExecute(Sender: TObject);
begin
  inherited;

  GetGridCustomer(dbGrid);
end;

procedure TDVBEquipmentForm.FormShow(Sender: TObject);
var
  a: Boolean;
begin
  inherited;
  if dmMain.SuperMode = 0 then begin
    a := dsEQ.Active;
    if a then
      dsEQ.Close;
    dsEQ.Params[0].AsString := ' and c.INVISIBLE = 0 ';
    if a then
      dsEQ.Open;
  end;
end;

procedure TDVBEquipmentForm.GetGridCustomer(Grid: TDBGridEh);
var
  i: Integer;
  b: TBookMark;
  customers: string;
begin
  inherited;

  customers := '';

  if (Grid.SelectedRows.Count = 0) then begin
    if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
  end
  else begin
    b := Grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.Disablecontrols;
    for i := 0 to Grid.SelectedRows.Count - 1 do begin
      Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
      if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
    end;
    Grid.DataSource.DataSet.GotoBookmark(b);
    Grid.DataSource.DataSet.EnableControls;
  end;

  customers := Copy(customers, 2, Length(customers) - 1);

  if (customers <> '') then
    ShowCustomers(7, customers);
end;

end.
