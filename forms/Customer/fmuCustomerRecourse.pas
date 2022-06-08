unit fmuCustomerRecourse;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.Actions, System.SysUtils, System.Variants, System.UITypes,
  Data.DB,
  Vcl.ActnList, Vcl.Controls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.ToolWin,
  FIBDataSet, pFIBDataSet, ToolCtrlsEh, GridsEh, DBGridEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, AtrPages, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, DBCtrlsEh;

type
  TapgCustomerRecourse = class(TA4onPage)
    dsRecourses: TpFIBDataSet;
    srcRecourses: TDataSource;
    dbgRecourses: TDBGridEh;
    ActListCustomers: TActionList;
    actAddRec: TAction;
    actEditRec: TAction;
    actDelRec: TAction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    pnl1: TPanel;
    dbmNOTICE: TDBMemoEh;
    procedure actAddRecExecute(Sender: TObject);
    procedure actDelRecExecute(Sender: TObject);
    procedure dbgRecoursesDblClick(Sender: TObject);
    procedure dbgRecoursesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    FSavedID: Integer;
    procedure EnableControls;
  public
    procedure SavePosition; override;
    procedure GotoSavedPosition; override;
    procedure RefreshDS;
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  DM, RecourseForma, MAIN, TextEditForma, TaskForma;

{$R *.dfm}

class function TapgCustomerRecourse.GetPageName: string;
begin
  Result := rsRecourses;
end;

procedure TapgCustomerRecourse.SavePosition;
begin
  FSavedID := -1;
  if (dsRecourses.RecordCount > 0) and (not dsRecourses.FieldByName('Rc_Id').IsNull) then
    FSavedID := dsRecourses['Rc_Id'];
end;

procedure TapgCustomerRecourse.GotoSavedPosition;
begin
  if FSavedID > -1 then
    dsRecourses.Locate('Rc_Id', FSavedID, []);
end;

procedure TapgCustomerRecourse.RefreshDS;
begin
  dsRecourses.CloseOpen(true);
end;

procedure TapgCustomerRecourse.InitForm;
var
  vDel: boolean;
  vAdd: boolean;
  vEdit: boolean;
  FullAccess: boolean;
  i: Integer;
begin
  FullAccess := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ

  vAdd := (dmMain.AllowedAction(rght_Recourses_add)); // Добавление
  vEdit := (dmMain.AllowedAction(rght_Recourses_edit)); // Изменение
  vDel := (dmMain.AllowedAction(rght_Recourses_del)); // Удаление

  actAddRec.Visible := vAdd or FullAccess;
  actEditRec.Visible := vEdit or FullAccess;
  actDelRec.Visible := vDel or FullAccess;

  pnlButtons.Visible := vDel or vEdit or vAdd or FullAccess;

  dbmNOTICE.Font.Name := dbgRecourses.Font.Name;
  dbmNOTICE.Font.Size := dbgRecourses.Font.Size + 2;

  // Привяжем заявки к адресу или абоненту, в зависимости от настроек системы
  if (not TryStrToInt(dmMain.GetIniValue('RECTOCUSTOMER'), i)) then
    i := 0;
  if i = 1 then
    dsRecourses.ParamByName('FILTER_BY').Asstring := 'R.Customer_Id = :CUSTOMER_ID';
  // else
  // dsRecourses.Params[0].SetDefaultMacroValue;
  dsRecourses.DataSource := FDataSource;
end;

procedure TapgCustomerRecourse.OpenData;
begin
  if dsRecourses.Active then
    dsRecourses.Close;
  dsRecourses.OrderClause := GetOrderClause(dbgRecourses);
  dsRecourses.Open;
  EnableControls;
end;

procedure TapgCustomerRecourse.actAddRecExecute(Sender: TObject);
begin
  if (not dmMain.AllowedAction(rght_Recourses_add)) then
    exit;
  if FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
    exit;

  EditRecourse(FDataSource.DataSet.FieldByName('CUSTOMER_ID').AsInteger, RefreshDS);
  EnableControls;
end;

procedure TapgCustomerRecourse.actDelRecExecute(Sender: TObject);
begin
  if (not dmMain.AllowedAction(rght_Recourses_del)) then
    exit;
  if (MessageDlg(rsDeleteCustomerRec, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsRecourses.Delete;
    dsRecourses.CloseOpen(true);
    EnableControls;
  end;
end;

procedure TapgCustomerRecourse.CloseData;
begin
  dsRecourses.Close;
end;

procedure TapgCustomerRecourse.dbgRecoursesDblClick(Sender: TObject);
var
  s: String;
begin
  if (not dsRecourses.Active) or (dsRecourses.RecordCount = 0) then
    exit;

  if (dsRecourses['REC_TYPE'] = 1) then
    FindTask(dsRecourses['RC_ID'])
  else if (not dsRecourses.FieldByName('Notice').IsNull) then
  begin
    s := dsRecourses['Notice'];
    ShowText(s, dsRecourses['O_NAME'] + '.' + dsRecourses['NAME']);
  end;
end;

procedure TapgCustomerRecourse.dbgRecoursesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    exit;

  if (not(gdSelected in State)) and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('REC_TYPE').AsInteger = 1)
  then
    Background := clMoneyGreen;
end;

procedure TapgCustomerRecourse.EnableControls;
begin
  actEditRec.Enabled := dsRecourses.RecordCount > 0;
  actDelRec.Enabled := dsRecourses.RecordCount > 0;
end;

end.
