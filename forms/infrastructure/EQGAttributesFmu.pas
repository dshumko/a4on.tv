unit EQGAttributesFmu;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.ActnList, Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin,
  AtrPages, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, pFIBDatabase, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, ToolCtrlsEh;

type
  TapgEQGAttributes = class(TA4onPage)
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    dbgCustAttr: TDBGridEh;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    btnEdit: TSpeedButton;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgCustAttrDblClick(Sender: TObject);
    procedure srcAttributesDataChange(Sender: TObject; Field: TField);
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
  MAIN, AtrCommon, DM, AttrGeneralForma;

const
  CAttributeType : Integer = 69;

class function TapgEQGAttributes.GetPageName: string;
begin
  Result := rsClmnAttributes;
end;

procedure TapgEQGAttributes.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Dictionary_full));
  actAdd.Visible := (dmMain.AllowedAction(rght_Comm_Equipment)) or FullAccess;
  actDel.Visible := actAdd.Visible;
  actEdit.Visible := actAdd.Visible;

  dsAttributes.DataSource := FDataSource;
end;

procedure TapgEQGAttributes.EnableControls;
begin
  actEdit.Enabled := dsAttributes.RecordCount > 0;
  actDel.Enabled := dsAttributes.RecordCount > 0;
end;

procedure TapgEQGAttributes.OpenData;
begin
  dsAttributes.Open;
  EnableControls;
end;

procedure TapgEQGAttributes.srcAttributesDataChange(Sender: TObject;
  Field: TField);
begin
  actEdit.Enabled := actEdit.Visible and (srcAttributes.DataSet.RecordCount > 0);
  actDel.Enabled := actDel.Visible and (srcAttributes.DataSet.RecordCount > 0);
end;

procedure TapgEQGAttributes.actAddExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    exit;

  if (FDataSource.DataSet.FieldByName('O_ID').IsNull) then
    exit;

  if AddOrEditAttribute(CAttributeType, dsAttributes.DataSource.DataSet['O_ID'], -1) then
  begin
    dsAttributes.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgEQGAttributes.actDelExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsAttributes.RecordCount = 0) then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    exit;

  if not(dsAttributes.FieldByName('O_NAME').IsNull) then
    s := dsAttributes['O_NAME']
  else
    s := '';

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    srcAttributes.DataSet.Delete;
    EnableControls;
    UpdatePage;
  end;
end;

procedure TapgEQGAttributes.actEditExecute(Sender: TObject);
begin
  if ((not dsAttributes.Active) or (dsAttributes.RecordCount = 0)) then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    exit;

  if (dsAttributes.FieldByName('AID').IsNull) or
    (FDataSource.DataSet.FieldByName('O_ID').IsNull) then
    exit;

  if AddOrEditAttribute(CAttributeType, FDataSource.DataSet['O_ID'], dsAttributes['AID']) then
  begin
    dsAttributes.Refresh;
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgEQGAttributes.CloseData;
begin
  dsAttributes.Close;
end;

procedure TapgEQGAttributes.dbgCustAttrDblClick(Sender: TObject);
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

end.
