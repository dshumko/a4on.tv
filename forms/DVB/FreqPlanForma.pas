unit FreqPlanForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  CnErrorProvider,
  DBCtrlsEh, EhLibVCL, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, DBGridEhGrouping, DynVarsEh,
  PrnDbgeh;

type
  TFreqPlanForm = class(TGridForm)
    dsFreqPlan: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    edtURL: TDBEditEh;
    lbl5: TLabel;
    btn1: TToolButton;
    btnPrint: TToolButton;
    actPrint: TAction;
    ednLow: TDBNumberEditEh;
    ednHigh: TDBNumberEditEh;
    ednFQSOUND: TDBNumberEditEh;
    ednFQVIDEO: TDBNumberEditEh;
    ednFQWAVE: TDBNumberEditEh;
    lbl1: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    qryOIRT: TpFIBQuery;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    procedure CreateOIRT;
  public
    { Public declarations }
  end;

var
  FreqPlanForm: TFreqPlanForm;

implementation

uses
  DM, MAIN, DVBSettings, ChannelsForma, ChanSourcesForma, ReportPreview, SatCardsForma;

{$R *.dfm}

procedure TFreqPlanForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsFreqPlan.Close;
  FreqPlanForm := nil;
end;

procedure TFreqPlanForm.actNewExecute(Sender: TObject);
var
  wi: Boolean;
begin
  inherited;
  if (not fCanEdit) then
    Exit;
  wi := True;
  if ((dsFreqPlan.RecordCount = 0) and
    (MessageDlg('Создать частотный план на основе OIRT?'#13#10'В дальнейшем возможно изменить', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes)) then
  begin
    wi := False;
    CreateOIRT;
  end;

  if wi then
    StartEdit(True);
end;

procedure TFreqPlanForm.actPrintExecute(Sender: TObject);
begin
  inherited;
  ShowReport('OIRT');
end;

procedure TFreqPlanForm.btnSaveLinkClick(Sender: TObject);
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

  if (ednLow.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(ednLow, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(ednLow);

  if (ednHigh.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(ednHigh, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(ednHigh);

  if not errors then
    inherited;
end;

procedure TFreqPlanForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (srcDataSource.DataSet.RecordCount = 0) or (not fCanEdit) then
    Exit;
  if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
    srcDataSource.DataSet.Delete;
end;

procedure TFreqPlanForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if (not fCanEdit) then
    Exit;
  StartEdit();
end;

procedure TFreqPlanForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := vFull or dmMain.AllowedAction(rght_DVB_edit) or dmMain.AllowedAction(rght_Dictionary_Channels);
  fCanCreate := fCanEdit;
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsFreqPlan.Open;
  dbGrid.DefaultApplySorting;
  dsFreqPlan.First;
end;

procedure TFreqPlanForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TFreqPlanForm.CreateOIRT;
begin
  dsFreqPlan.Close;
  qryOIRT.Transaction.StartTransaction;
  qryOIRT.ExecQuery;
  qryOIRT.Transaction.Commit;
  dsFreqPlan.Open;
end;

procedure TFreqPlanForm.dbGridDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  S: String;
begin
  ScrPt := Mouse.CursorPos;
  GrdPt := dbGrid.ScreenToClient(ScrPt);
  Cell := dbGrid.MouseCoord(GrdPt.X, GrdPt.Y);
  S := UpperCase(dbGrid.Fields[Cell.X - 1].FieldName);
  if ((S = 'CH_NUMBER') or (S = 'CH_NAME')) then
  begin
    if not dsFreqPlan.FieldByName('I_TYPE').IsNull then
    begin
      case dsFreqPlan['I_TYPE'] of
        0:
          ShowTransponder(dsFreqPlan['Dvbs_Id']);
        1:
          ShowChannel(dsFreqPlan['CH_ID']);
      end;
    end;
  end
  else if (S = 'SRC_NAME') then
  begin
    if not dsFreqPlan.FieldByName('I_TYPE').IsNull then
    begin
      case dsFreqPlan['I_TYPE'] of
        0:
          ShowChanSource(dsFreqPlan['SRC_ID']);
        1:
          ShowChanSource(dsFreqPlan['SRC_ID']);
      end;
    end;
  end
  else if (S = 'CARD_NAME') then
  begin
    if not dsFreqPlan.FieldByName('CARD_NAME').IsNull then
    begin
      ShowSatCard(dsFreqPlan['CARD_NAME']);
    end;
  end;
end;

procedure TFreqPlanForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  S: string;
begin
  inherited;
  if (not dsFreqPlan.FieldByName('Notice').IsNull) then
  begin
    S := AnsiUpperCase(dsFreqPlan['Notice']);
    if S.Contains('ПОМЕХ') then
      Background := TColor($00BEAFFA);
  end;
end;

end.
