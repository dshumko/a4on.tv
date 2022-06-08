unit SatCardsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBLookupEh, DBGridEhGrouping, DynVarsEh;

type
  TSatCardsForm = class(TGridForm)
    dsSatCards: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    lbl1: TLabel;
    pnlBottom: TPanel;
    dbgSubArea: TDBGridEh;
    Splitter: TSplitter;
    dsChan: TpFIBDataSet;
    srcChan: TDataSource;
    srcCrypt: TDataSource;
    dsCrypt: TpFIBDataSet;
    lbl4: TLabel;
    cbbS_Crypt: TDBLookupComboboxEh;
    edtURL: TDBEditEh;
    lbl5: TLabel;
    edtPlace: TDBEditEh;
    lblPlace: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure dbgSubAreaDblClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
  private
    { Private declarations }
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit(const Cancel: Boolean);
  public
    { Public declarations }
  end;

var
  SatCardsForm: TSatCardsForm;

procedure ShowSatCard(const CARD: String; const CH_ID : Integer = -1);

implementation

uses
  DM, ChanForSrcForma;

{$R *.dfm}

procedure ShowSatCard(const CARD: String; const CH_ID : Integer = -1);
begin
  if Not Assigned(SatCardsForm) then
    SatCardsForm := TSatCardsForm.Create(Application);

  if SatCardsForm.dsSatCards.Active then
    SatCardsForm.dsSatCards.Locate('O_NAME', CARD, []);

  if (CH_ID >= 0) and (SatCardsForm.dsChan.Active) then
    SatCardsForm.dsChan.Locate('CH_ID', CH_ID, []);

  SatCardsForm.Show;
end;

procedure TSatCardsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsChan.Close;
  dsSatCards.Close;
  SatCardsForm := nil;
end;

procedure TSatCardsForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TSatCardsForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdit(true);
  inherited;
end;

procedure TSatCardsForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

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

procedure TSatCardsForm.dbgSubAreaDblClick(Sender: TObject);
begin
  inherited;
  if (not dsChan.Active) or (dsChan.RecordCount = 0) then
    Exit;
  if dsChan.FieldByName('CS_ID').IsNull then
    Exit;
  if dsChan.FieldByName('CH_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  EditChanForSource(dsChan['CH_ID'], dsChan['CS_ID']);
  dsChan.Refresh;
end;

procedure TSatCardsForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TSatCardsForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TSatCardsForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := vFull;
  fCanCreate := fCanEdit;
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsSatCards.Open;
  dbGrid.DefaultApplySorting;
  dsSatCards.First;
  dsChan.Open;
end;

procedure TSatCardsForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TSatCardsForm.StartEdit(const New: Boolean = False);
begin
  dsCrypt.Open;
  inherited;
end;

procedure TSatCardsForm.StopEdit(const Cancel: Boolean);
begin
  inherited;
  dsCrypt.Close;
end;

end.
