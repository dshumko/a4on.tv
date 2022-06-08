unit HeadEndsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, GridsEh, DBGridEh, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, MemTableDataEh, DataDriverEh,
  pFIBDataDriverEh, MemTableEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider, EhLibVCL,
  DBGridEhGrouping, DynVarsEh;

type
  THeadEndsForm = class(TGridForm)
    dsHE: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    chkTREE: TCheckBox;
    btn1: TToolButton;
    mtHE: TMemTableEh;
    drvHE: TpFIBDataDriverEh;
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkTREEClick(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadEndsForm: THeadEndsForm;

implementation

uses
  DM, HeadEndForma, MAIN;

{$R *.dfm}

procedure THeadEndsForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if dsHE.RecordCount = 0
  then Exit;
  if dsHE.FieldByName('HE_ID').IsNull
  then Exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd)))
  then Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsHE['HE_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure THeadEndsForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if dsHE.RecordCount = 0
  then Exit;
  if dsHE.FieldByName('HE_ID').IsNull
  then Exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd)))
  then Exit;

  HeadEndModify(dsHE['HE_ID']);
  srcDataSource.DataSet.Refresh;
end;

procedure THeadEndsForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd)))
  then Exit;

  if HeadEndModify(-1) > -1
  then begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.Open;
  end;
end;

procedure THeadEndsForm.chkTREEClick(Sender: TObject);
begin
  inherited;
  if chkTREE.Checked
  then begin
    srcDataSource.DataSet := mtHE;
    mtHE.TreeList.Active := True;
    mtHE.Open;
  end
  else begin
    srcDataSource.DataSet := dsHE;
    mtHE.Close;
    dsHE.Open;
  end;

end;

procedure THeadEndsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'HeadEnds', false);
  dsHE.Close;
  Action := caFree;
  HeadEndsForm := nil;
end;

procedure THeadEndsForm.FormShow(Sender: TObject);
var
  b: Boolean;
begin
  inherited;
  dsHE.Open;
  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'HeadEnds', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);
  b := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd));
  actEdit.Visible := b;
  actNew.Visible := b;
  actDelete.Visible := b;
end;

procedure THeadEndsForm.srcDataSourceStateChange(Sender: TObject);
var
  b: Boolean;
begin
  inherited;
  b := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd));
  actEdit.Enabled := actEdit.Visible and b and (dsHE.RecordCount>0);
  actDelete.Enabled := actDelete.Visible and b and (dsHE.RecordCount>0);
end;

end.
