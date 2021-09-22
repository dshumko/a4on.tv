unit EQGroupsForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, PrjConst, Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh,
  CnErrorProvider, VCLTee.TeCanvas, EhLibVCL, System.UITypes, DBGridEhGrouping,
  DynVarsEh;

type
  TEQGroupsForm = class(TGridForm)
    dsEQGroups: TpFIBDataSet;
    lbl1: TLabel;
    edtName: TDBEditEh;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    lbl3: TLabel;
    btnColorClear: TButton;
    btnColorSet: TButtonColor;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure btnColorSetClick(Sender: TObject);
    procedure btnColorClearClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EQGroupsForm: TEQGroupsForm;

implementation

uses DM;

{$R *.dfm}

procedure TEQGroupsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsEQGroups.Close;
  EQGroupsForm := nil;
end;

procedure TEQGroupsForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit(true);
end;

procedure TEQGroupsForm.btnCancelLinkClick(Sender: TObject);
begin
  pnlEdit.Color := clBtnFace;
  inherited;
end;

procedure TEQGroupsForm.btnColorClearClick(Sender: TObject);
begin
  inherited;
  btnColorSet.SymbolColor := clBtnFace;
  if not ( srcDataSource.DataSet.State in [dsInsert,dsEdit] )
  then srcDataSource.DataSet.Edit;
  srcDataSource.DataSet.FieldByName('COLOR').Clear;
end;

procedure TEQGroupsForm.btnColorSetClick(Sender: TObject);
begin
  inherited;
  if not ( srcDataSource.State in [dsInsert,dsEdit] )
  then srcDataSource.DataSet.Edit;
  srcDataSource.DataSet['COLOR'] := ColorToString(btnColorSet.SymbolColor);
end;

procedure TEQGroupsForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError,iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtName);

  if not errors
  then begin
    inherited;
    pnlEdit.Color := clBtnFace;
  end;
end;

procedure TEQGroupsForm.dbGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not dsEQGroups.FieldByName('COLOR').IsNull then
    try
      Background := StringToColor(dsEQGroups.FieldByName('COLOR').Value);
    except
    end;
end;

procedure TEQGroupsForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteRecord,[srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TEQGroupsForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then begin
    StartEdit();
    if not dsEQGroups.FieldByName('COLOR').IsNull
    then
      try
        btnColorSet.SymbolColor := StringToColor(dsEQGroups.FieldByName('COLOR').Value);
      except
      end;
  end;
end;

procedure TEQGroupsForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TEQGroupsForm.FormShow(Sender: TObject);
begin
  inherited;

  fCanEdit   := (((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment)) or dmMain.AllowedAction(rght_Dictionary_HeadEndEQP)));
  fCanCreate := (((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment)) or dmMain.AllowedAction(rght_Dictionary_HeadEndEQP)));
  // права пользователей
  actNew.Visible    := fCanCreate;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;

  dsEQGroups.Open;
end;

end.
