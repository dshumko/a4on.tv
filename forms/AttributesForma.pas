unit AttributesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TAttributesForm = class(TGridForm)
    dsAttributes: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    edtO_DIMENSION: TDBEditEh;
    lbl1: TLabel;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    lbl4: TLabel;
    cbRegular: TDBComboBoxEh;
    cbAtrType: TDBComboBoxEh;
    lbl5: TLabel;
    mmoList: TDBMemoEh;
    lbl6: TLabel;
    chkUniq: TDBCheckBoxEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure cbRegularNotInList(Sender: TObject; NewText: string; var RecheckInList: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AttributesForm: TAttributesForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TAttributesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsAttributes.Close;
  AttributesForm := nil;
end;

procedure TAttributesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    cbAtrType.Enabled := True;
    StartEdit(True);
  end;
end;

procedure TAttributesForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;
  dsAttributes['OT_NAME'] := cbAtrType.Text;

  if (cbAtrType.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(cbAtrType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbAtrType);

  if (edtName.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  if not errors then
    inherited;
end;

procedure TAttributesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TAttributesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    cbAtrType.Enabled := False;
    StartEdit();
  end;
end;

procedure TAttributesForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := False;

  cbAtrType.KeyItems.Clear;
  cbAtrType.Items.Clear;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrAbonents)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_cust));
    cbAtrType.Items.Add(rsAttrName_cust);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrEquipments)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_elan));
    cbAtrType.Items.Add(rsAttrName_elan);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrEquipments)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_etv));
    cbAtrType.Items.Add(rsAttrName_etv);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrServices)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_srv));
    cbAtrType.Items.Add(rsAttrName_srv);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrIPTV)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_eiptv));
    cbAtrType.Items.Add(rsAttrName_eiptv);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrHOUSE)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_home));
    cbAtrType.Items.Add(rsAttrName_home);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_Nodes)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_node));
    cbAtrType.Items.Add(rsAttrName_node);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_Vlans)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_vlan));
    cbAtrType.Items.Add(rsAttrName_vlan);
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_Vlans)) then
  begin
    cbAtrType.KeyItems.Add(IntToStr(rsAttrID_etype));
    cbAtrType.Items.Add(rsAttrName_etype);
    fCanEdit := True;
  end;

  fCanCreate := fCanEdit;

  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsAttributes.Open;
  dbGrid.DefaultApplySorting;
  dsAttributes.First;
end;

procedure TAttributesForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TAttributesForm.cbRegularNotInList(Sender: TObject; NewText: string; var RecheckInList: Boolean);
begin
  inherited;
  cbRegular.KeyItems.Add(NewText);
  cbRegular.Items.Add(NewText);
  cbRegular.Value := NewText;
  RecheckInList := False;
end;

end.
