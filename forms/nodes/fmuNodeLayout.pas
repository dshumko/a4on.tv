unit fmuNodeLayout;

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
  TapgNodeLayout = class(TA4onPage)
    dsLayout: TpFIBDataSet;
    srcLayout: TDataSource;
    dbgCustAttr: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlBottLeft: TPanel;
    btnAddL: TSpeedButton;
    btnEditL: TSpeedButton;
    btnDelL: TSpeedButton;
    btnRepair: TSpeedButton;
    actRepair: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgCustAttrDblClick(Sender: TObject);
    procedure dbgCustAttrGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure srcLayoutDataChange(Sender: TObject; Field: TField);
    procedure dbgCustAttrColumns5GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure actRepairExecute(Sender: TObject);
    procedure dbgCustAttrColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
  private
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, A4onTypeUnit, AtrCommon, DM, NodesForma, NodeLayoutForma, NodeLayoutFactForma, FIBQuery, pFIBQuery;

class function TapgNodeLayout.GetPageName: string;
begin
  Result := rsClmnLayout;
end;

procedure TapgNodeLayout.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Comm_Nodes));
  pnlBottLeft.Visible := (dmMain.AllowedAction(rght_Comm_Nodes)) or FullAccess;
  actAdd.Visible := pnlBottLeft.Visible;
  actDel.Visible := pnlBottLeft.Visible;
  actEdit.Visible := pnlBottLeft.Visible;
  actRepair.Visible := FullAccess and dmMain.CompanyName.Contains('ЛТВ');
  dsLayout.DataSource := FDataSource;
end;

procedure TapgNodeLayout.EnableControls;
begin
  actEdit.Enabled := (dsLayout.RecordCount > 0) and (dsLayout['itsOwn'] = 1);
  actDel.Enabled := actEdit.Enabled;
end;

procedure TapgNodeLayout.OpenData;
begin
  dsLayout.Open;
end;

procedure TapgNodeLayout.srcLayoutDataChange(Sender: TObject; Field: TField);
begin
  EnableControls;
end;

procedure TapgNodeLayout.actAddExecute(Sender: TObject);
var
  NL_ID: Integer;
  NeedInsert: Boolean;
begin
  if (FDataSource.DataSet.RecordCount = 0) then
    Exit;
  if FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
    Exit;

  NeedInsert := True;

  if (dsLayout.RecordCount = 0) or (dsLayout['itsOwn'] = 0) then
  begin
    if FDataSource.DataSet.FieldByName('Type_Id').IsNull then
      Exit;

    if (MessageDlg(rsNodeLayotEmpty, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      with TpFIBQuery.Create(self) do
      begin
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.Text := 'insert into Node_Layout (Node_Id, Notice, Srv_Type, Mat_Qnt, Cust_Qnt, Mat_Id_List, Mat_Req)';
          SQL.Add('select :new_Id, Notice, Srv_Type, Mat_Qnt, Cust_Qnt, Mat_Id_List, Mat_Req from Node_Layout where Node_Id = :OLD_ID');
          ParamByName('new_Id').AsInteger := FDataSource.DataSet['NODE_ID'];
          ParamByName('OLD_ID').AsInteger := -1 * FDataSource.DataSet['Type_Id'];
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        finally
          free;
        end;
      end;
      dsLayout.CloseOpen(True);
      NeedInsert := (dsLayout.RecordCount = 0);
      EnableControls;
      UpdatePage;
    end;
  end;

  if NeedInsert then
  begin
    NL_ID := -1;
    if EditLayoute(FDataSource.DataSet['NODE_ID'], NL_ID) then
    begin
      dsLayout.CloseOpen(True);
      dsLayout.Locate('LT_ID', NL_ID, []);
      EnableControls;
      UpdatePage;
    end
  end;
end;

procedure TapgNodeLayout.actDelExecute(Sender: TObject);
var
  s: string;
begin
  if ((not dsLayout.Active) or (dsLayout.RecordCount = 0)) then
    Exit;

  if (dsLayout['itsOwn'] = 0) then
  begin
    ShowMessage(rsLayoutNotDefined);
    Exit;
  end;

  if (not srcLayout.DataSet.FieldByName('MAT_LIST').IsNull) then
    s := srcLayout.DataSet['MAT_LIST']
  else
    s := '';

  begin
    if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      srcLayout.DataSet.Delete;
      EnableControls;
      UpdatePage;
    end;
  end;
end;

procedure TapgNodeLayout.actEditExecute(Sender: TObject);
var
  NL_ID: Integer;
begin
  if ((not dsLayout.Active) or (dsLayout.RecordCount = 0)) then
    Exit;
  if (dsLayout['itsOwn'] = 0) then
  begin
    ShowMessage(rsLayoutNotDefined);
    Exit;
  end;

  if (not dsLayout.FieldByName('LT_ID').IsNull) then
    NL_ID := dsLayout['LT_ID']
  else
    NL_ID := -1;

  if EditLayoute(dsLayout['NODE_ID'], NL_ID) then
  begin
    dsLayout.CloseOpen(True);
    dsLayout.Locate('LT_ID', NL_ID, []);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeLayout.actRepairExecute(Sender: TObject);
begin
  if (FDataSource.DataSet.RecordCount = 0) or (dsLayout.RecordCount = 0) then
    Exit;
  if FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
    Exit;

  EditLayouteFact(FDataSource.DataSet['NODE_ID']);
end;

procedure TapgNodeLayout.CloseData;
begin
  dsLayout.Close;
end;

procedure TapgNodeLayout.dbgCustAttrColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  cp, cf: Integer;
begin
  if EditMode or (dsLayout.RecordCount = 0) then
    Exit;

  cp := 0;
  cf := 0;

  if (not dsLayout.FieldByName('CUST_QNT').IsNull) then
    cp := dsLayout['CUST_QNT'];
  if (not dsLayout.FieldByName('CUST_QNT_FACT').IsNull) then
    cf := dsLayout['CUST_QNT_FACT'];

  if (cf = cp) then
    Params.Background := $00B4FEB4;
end;

procedure TapgNodeLayout.dbgCustAttrColumns5GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  cp, cf: Integer;
  mp, mf: Double;
begin
  if EditMode then
    Exit;

  cp := 0;
  cf := 0;
  mp := 0;
  mf := 0;

  if (not dsLayout.FieldByName('CUST_QNT').IsNull) then
    cp := dsLayout['CUST_QNT'];
  if (not dsLayout.FieldByName('MAT_QNT').IsNull) then
    mp := dsLayout['MAT_QNT'];
  if (not dsLayout.FieldByName('CUST_QNT_FACT').IsNull) then
    cf := dsLayout['CUST_QNT_FACT'];
  if (not dsLayout.FieldByName('MAT_QNT_FACT').IsNull) then
    mf := dsLayout['MAT_QNT_FACT'];

  if ((cf = cp) and (mf <> mp)) or ((cf <> cp) and (mf <> 0)) then
    Params.Background := clYellow;
end;

procedure TapgNodeLayout.dbgCustAttrDblClick(Sender: TObject);
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

procedure TapgNodeLayout.dbgCustAttrGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin

  if (dsLayout['itsOwn'] = 0) then
    AFont.Color := clGrayText
  else
    AFont.Color := clWindowText;
end;

end.
