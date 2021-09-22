unit VATForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, StdCtrls, ExtCtrls, Menus,
  ActnList, DB, ComCtrls, ToolWin, GridsEh, DBGridEh, FIBDataSet,
  pFIBDataSet, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  System.Actions, Vcl.Buttons, CnErrorProvider, PrjConst, Vcl.DBCtrls,
  Vcl.Mask, DBCtrlsEh, System.UITypes, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TVATForm = class(TGridForm)
    pnlTarif: TPanel;
    lbl1: TLabel;
    dbgTarif: TDBGridEh;
    tlbTarif: TToolBar;
    btnTarifAdd: TToolButton;
    btnTarifDel: TToolButton;
    dsVATs: TpFIBDataSet;
    dsTarif: TpFIBDataSet;
    srcTarif: TDataSource;
    actTarifADD: TAction;
    actTarifDEL: TAction;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmo1: TDBMemoEh;
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actTarifADDExecute(Sender: TObject);
    procedure actTarifDELExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure srcTarifDataChange(Sender: TObject; Field: TField);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VATForm: TVATForm;

implementation

uses DM, TarifForma, MAIN;

{$R *.dfm}

procedure TVATForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit(True);
end;

procedure TVATForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit();
end;

procedure TVATForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then
    if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then dsVATs.Delete;
end;

procedure TVATForm.actTarifADDExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then begin
    if EditTarif(dsVATs['O_NAME'], dsVATs['O_ID'], -1, True)
    then dsTarif.CloseOpen(true);
  end;
end;

procedure TVATForm.actTarifDELExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then
    if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then dsTarif.Delete;
end;

procedure TVATForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtName);

  if not errors
  then inherited;
end;

procedure TVATForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsVATs.Close;
  VATForm := nil;
end;

procedure TVATForm.FormShow(Sender: TObject);
begin
  inherited;
  fCanEdit   := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Services);  // может редактировать если разрешено редактировать все
  fCanCreate := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Services);

  actNew.Visible      := fCanEdit;
  actEdit.Visible     := fCanEdit;
  actDelete.Visible   := fCanEdit;
  actTarifADD.Visible := fCanEdit;
  actTarifDEL.Visible := fCanEdit;
  dsVATs.Open;
  dsTarif.Open;
end;

procedure TVATForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actTarifADD.Enabled := actTarifADD.Visible and (srcDataSource.DataSet.RecordCount > 0);

end;

procedure TVATForm.srcTarifDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actTarifDEL.Enabled := actTarifDEL.Visible and (srcTarif.DataSet.RecordCount > 0);
end;

procedure TVATForm.ToolButton2Click(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then begin
    if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then dsVATs.Delete;
  end;

end;

end.
