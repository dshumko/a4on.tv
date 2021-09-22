unit AttributesForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, PrjConst, CnErrorProvider, Vcl.DBCtrls,
  Vcl.Mask, DBCtrlsEh, EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

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
    procedure cbRegularNotInList(Sender: TObject; NewText: string;
      var RecheckInList: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AttributesForm: TAttributesForm;

implementation

uses DM;

{$R *.dfm}

procedure TAttributesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsAttributes.Close;
  AttributesForm := nil;
end;

procedure TAttributesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then begin
    cbAtrType.Enabled := True;
    StartEdit(True);
  end;
end;

procedure TAttributesForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  dsAttributes['OT_NAME'] := cbAtrType.Text;

  if (cbAtrType.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(cbAtrType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(cbAtrType);

  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtName);

  if not errors
  then inherited;
end;

procedure TAttributesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then Exit;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo],
      0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TAttributesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then begin
    cbAtrType.Enabled := False;
    StartEdit();
  end;
end;

procedure TAttributesForm.FormShow(Sender: TObject);
var
  vFull : Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit   := False;

  cbAtrType.KeyItems.Clear;
  cbAtrType.Items.Clear;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrAbonents))
  then begin
    cbAtrType.KeyItems.Add('4');
    cbAtrType.Items.Add('Атрибуты абонента');
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrEquipments))
  then begin
    cbAtrType.KeyItems.Add('5');
    cbAtrType.Items.Add('Атрибуты сетевого оборудования');
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrEquipments))
  then begin
    cbAtrType.KeyItems.Add('6');
    cbAtrType.Items.Add('Атрибуты ТВ оборудования');
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrServices))
  then begin
    cbAtrType.KeyItems.Add('25');
    cbAtrType.Items.Add('Атрибуты услуг');
    fCanEdit := True;
  end;

  if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrIPTV))
  then begin
    cbAtrType.KeyItems.Add('32');
    cbAtrType.Items.Add('Атрибуты IPTV групп');
    fCanEdit := True;
  end;

 if (vFull or dmMain.AllowedAction(rght_Dictionary_AtrHOUSE))
 then begin
   cbAtrType.KeyItems.Add('37');
   cbAtrType.Items.Add('Атрибуты домов');
   fCanEdit := True;
 end;

if (vFull or dmMain.AllowedAction(rght_Dictionary_Nodes))
then begin
  cbAtrType.KeyItems.Add('39');
  cbAtrType.Items.Add('Атрибуты узлов');
  fCanEdit := True;
end;

  fCanCreate := fCanEdit;

  actNew.Visible    := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;

  dsAttributes.Open;
  dbGrid.DefaultApplySorting;
  dsAttributes.First;
end;

procedure TAttributesForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
end;

procedure TAttributesForm.cbRegularNotInList(Sender: TObject;
  NewText: string; var RecheckInList: Boolean);
begin
  inherited;
  cbRegular.KeyItems.Add(NewText);
  cbRegular.Items.Add(NewText);
  cbRegular.Value := NewText;
  RecheckInList := False;
end;

end.
