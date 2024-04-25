unit RequestTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider, PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, amSplitter, PrnDbgeh;

type
  TRequestTypeForm = class(TGridForm)
    dsRequestType: TpFIBDataSet;
    pgcAddons: TPageControl;
    tsWorks: TTabSheet;
    tsTemplates: TTabSheet;
    tlbTplt: TToolBar;
    btnTplt: TToolButton;
    btnTplt11: TToolButton;
    btnTplt12: TToolButton;
    btnTplt13: TToolButton;
    btnTplt14: TToolButton;
    btnTplt21: TToolButton;
    btnTplt22: TToolButton;
    dbgTplt: TDBGridEh;
    tsResult: TTabSheet;
    dsTemplates: TpFIBDataSet;
    srcReqTemplates: TDataSource;
    actlstTplts: TActionList;
    actTpltsAdd: TAction;
    actTpltsDel: TAction;
    actTpltsEdit: TAction;
    actTpltsQfltr: TAction;
    dbgWorks: TDBGridEh;
    tlbWorks: TToolBar;
    btnAddW: TToolButton;
    btn6W: TToolButton;
    btnEditW: TToolButton;
    btn7W: TToolButton;
    btnDeleteW: TToolButton;
    btn8W: TToolButton;
    btnQuickFltrW: TToolButton;
    dsWorks: TpFIBDataSet;
    srcWorks: TDataSource;
    actAddW: TAction;
    actEditW: TAction;
    actDelW: TAction;
    actQuickFltrW: TAction;
    tlb1: TToolBar;
    btnAddRes: TToolButton;
    btn5: TToolButton;
    btnEditRes: TToolButton;
    btn6: TToolButton;
    btnDelRes: TToolButton;
    btn7: TToolButton;
    btnQuikRes: TToolButton;
    dbgResult: TDBGridEh;
    actAddRes: TAction;
    actEditRes: TAction;
    actDelRes: TAction;
    actQuickRes: TAction;
    dsResult: TpFIBDataSet;
    srcResult: TDataSource;
    dnspltr1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure actTpltsAddExecute(Sender: TObject);
    procedure actTpltsDelExecute(Sender: TObject);
    procedure actTpltsEditExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure actTpltsQfltrExecute(Sender: TObject);
    procedure pgcAddonsChange(Sender: TObject);
    procedure InitSecurity;
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure srcReqTemplatesDataChange(Sender: TObject; Field: TField);
    procedure actQuickFltrWExecute(Sender: TObject);
    procedure actAddWExecute(Sender: TObject);
    procedure actDelWExecute(Sender: TObject);
    procedure actEditWExecute(Sender: TObject);
    procedure dbgWorksDblClick(Sender: TObject);
    procedure dbgTpltDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddResExecute(Sender: TObject);
    procedure actEditResExecute(Sender: TObject);
    procedure actDelResExecute(Sender: TObject);
    procedure actQuickResExecute(Sender: TObject);
    procedure srcWorksDataChange(Sender: TObject; Field: TField);
    procedure srcResultDataChange(Sender: TObject; Field: TField);
    procedure dbgResultDblClick(Sender: TObject);
    procedure dbgTpltGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RequestTypeForm: TRequestTypeForm;

implementation

uses
  DM, ReqTypeForma, ReqTemplateForma, ReqWorkForma, RequestResultsForma;

{$R *.dfm}

procedure TRequestTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  RequestTypeForm := nil;
end;

procedure TRequestTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;

  if dsRequestType.FieldByName('RT_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType))) then
    exit;

  ReguestTypeModify(dsRequestType['RT_ID']);
  srcDataSource.DataSet.Refresh;
end;

procedure TRequestTypeForm.actEditResExecute(Sender: TObject);
begin
  inherited;
  if dsResult.FieldByName('RR_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType))) then
    exit;

  if RequestResultModify(dsResult['RR_ID'], dsRequestType['RT_ID'], dsRequestType['RT_NAME']) then
    dsResult.Refresh;
end;

procedure TRequestTypeForm.actEditWExecute(Sender: TObject);
begin
  inherited;
  if dsWorks.FieldByName('W_ID').IsNull then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqWorks))) then
    exit;

  if ReguestWorkModify(dsWorks['W_ID'], dsRequestType['RT_ID']) > -1 then
    srcWorks.DataSet.Refresh;
end;

procedure TRequestTypeForm.actNewExecute(Sender: TObject);
var
  bm: TBookmark;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType))) then
    exit;

  if ReguestTypeModify(-1) > -1 then
  begin
    bm := dsRequestType.GetBookmark;
    dsRequestType.CloseOpen(True);
    dsRequestType.GotoBookmark(bm);
  end;
end;

procedure TRequestTypeForm.actQuickFilterExecute(Sender: TObject);
begin
  inherited;
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbGrid.STFilter.Visible := actQuickFilter.Checked;
  if not actQuickFilter.Checked then
    dbGrid.DataSource.DataSet.Filtered := False;
end;

procedure TRequestTypeForm.actQuickFltrWExecute(Sender: TObject);
begin
  inherited;
  actQuickFltrW.Checked := not actQuickFltrW.Checked;
  dbgWorks.STFilter.Visible := actQuickFltrW.Checked;
  if not actQuickFltrW.Checked then
    dbgWorks.DataSource.DataSet.Filtered := False;
end;

procedure TRequestTypeForm.actQuickResExecute(Sender: TObject);
begin
  inherited;
  actQuickRes.Checked := not actQuickRes.Checked;
  dbgResult.STFilter.Visible := actQuickRes.Checked;
  if not actQuickRes.Checked then
    dbgResult.DataSource.DataSet.Filtered := False;
end;

procedure TRequestTypeForm.actTpltsAddExecute(Sender: TObject);
begin
  inherited;
  if dsRequestType.FieldByName('RT_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqTemplate))) then
    exit;

  if ReguestTemplateModify(-1, dsRequestType['RT_ID']) > -1 then
  begin
    dsTemplates.CloseOpen(True);
  end;
end;

procedure TRequestTypeForm.actTpltsDelExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if dsTemplates.RecordCount = 0 then
    exit;
  if dsTemplates.FieldByName('RQTL_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqTemplate))) then
    exit;

  s := '';
  if not dsTemplates.FieldByName('RQ_CONTENT').IsNull then
    s := dsTemplates['RQ_CONTENT'];

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsTemplates.Delete;
    dsTemplates.Close;
    dsTemplates.Open;
  end;
end;

procedure TRequestTypeForm.actTpltsEditExecute(Sender: TObject);
begin
  inherited;
  if dsRequestType.RecordCount = 0 then
    exit;
  if dsTemplates.RecordCount = 0 then
    exit;
  if dsTemplates.FieldByName('RQTL_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqTemplate))) then
    exit;

  if ReguestTemplateModify(dsTemplates['RQTL_ID'], dsRequestType['RT_ID']) > -1 then
    dsTemplates.Refresh;
end;

procedure TRequestTypeForm.actTpltsQfltrExecute(Sender: TObject);
begin
  inherited;
  actTpltsQfltr.Checked := not actTpltsQfltr.Checked;
  dbgTplt.STFilter.Visible := actTpltsQfltr.Checked;
  if not actTpltsQfltr.Checked then
    dbgTplt.DataSource.DataSet.Filtered := False;
end;

procedure TRequestTypeForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not dsRequestType.FieldByName('RT_COLOR').IsNull then
  begin
    try
      Background := StringToColor(dsRequestType.FieldByName('RT_COLOR').Value);
    except
      Background := clWindow;
    end;
  end;
end;

procedure TRequestTypeForm.dbgTpltDblClick(Sender: TObject);
begin
  actTpltsEditExecute(Sender);
end;

procedure TRequestTypeForm.dbgTpltGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if not dsTemplates.FieldByName('RQ_COLOR').IsNull then
  begin
    try
      Background := StringToColor(dsTemplates.FieldByName('RQ_COLOR').Value);
    except
      Background := clWindow;
    end;
  end;
end;

procedure TRequestTypeForm.dbgWorksDblClick(Sender: TObject);
begin
  inherited;
  actEditW.Execute;
end;

procedure TRequestTypeForm.actAddResExecute(Sender: TObject);
begin
  inherited;
  if dsRequestType.FieldByName('RT_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType))) then
    exit;

  if RequestResultModify(-1, dsRequestType['RT_ID'], dsRequestType['RT_NAME']) then
    dsResult.CloseOpen(True);
end;

procedure TRequestTypeForm.actAddWExecute(Sender: TObject);
begin
  inherited;
  if dsRequestType.FieldByName('RT_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqWorks))) then
    exit;

  if ReguestWorkModify(-1, dsRequestType['RT_ID']) > -1 then
  begin
    srcWorks.DataSet.Close;
    srcWorks.DataSet.Open;
  end;
end;

procedure TRequestTypeForm.actDeleteExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if dsRequestType.FieldByName('RT_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType))) then
    exit;

  s := '';
  if not dsRequestType.FieldByName('RT_NAME').IsNull then
    s := dsRequestType['RT_NAME'];

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    srcDataSource.DataSet.Delete;
end;

procedure TRequestTypeForm.actDelResExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if dsResult.FieldByName('RR_ID').IsNull then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType))) then
    exit;

  s := '';
  if not dsResult.FieldByName('NAME').IsNull then
    s := dsResult['NAME'];

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsResult.Delete;
end;

procedure TRequestTypeForm.actDelWExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if dsWorks.FieldByName('W_ID').IsNull then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqWorks))) then
    exit;

  s := '';
  if not dsWorks.FieldByName('NAME').IsNull then
    s := dsWorks['NAME'];

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    srcWorks.DataSet.Delete;
end;

procedure TRequestTypeForm.FormShow(Sender: TObject);
begin
  inherited;
  InitSecurity;
  dsRequestType.Open;
  dsTemplates.Open;
  pgcAddons.ActivePage := tsTemplates;
end;

procedure TRequestTypeForm.pgcAddonsChange(Sender: TObject);
begin
  inherited;
  dsTemplates.Active := (pgcAddons.ActivePage = tsTemplates);
  dsWorks.Active := (pgcAddons.ActivePage = tsWorks);
  dsResult.Active := (pgcAddons.ActivePage = tsResult);
end;

procedure TRequestTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Visible;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Visible;

  actAddW.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actAddW.Visible;
  actAddRes.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actAddRes.Visible;
  actTpltsAdd.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actTpltsAdd.Visible;
end;

procedure TRequestTypeForm.srcReqTemplatesDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actTpltsDel.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actTpltsAdd.Visible;
  actTpltsEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actTpltsAdd.Visible;
end;

procedure TRequestTypeForm.srcResultDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEditRes.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actEditRes.Visible;
  actDelRes.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actDelRes.Visible;
end;

procedure TRequestTypeForm.srcWorksDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEditW.Enabled := (srcWorks.DataSet.RecordCount > 0) and actEditW.Visible;
  actDelW.Enabled := (srcWorks.DataSet.RecordCount > 0) and actDelW.Visible;
end;

procedure TRequestTypeForm.InitSecurity;
begin
  // Типы
  actNew.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType));
  actDelete.Visible := actNew.Enabled;
  actEdit.Visible := actNew.Enabled;

  // пшаблон
  actTpltsAdd.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or
    dmMain.AllowedAction(rght_Dictionary_ReqTemplate));
  actTpltsDel.Visible := actTpltsAdd.Enabled;
  actTpltsEdit.Visible := actTpltsAdd.Enabled;

  // Работы
  actAddW.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqWorks));
  actDelW.Visible := actAddW.Enabled;
  actEditW.Visible := actAddW.Enabled;

  // Результат
  actAddRes.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_ReqType));
  actDelRes.Visible := actAddRes.Enabled;
  actEditRes.Visible := actAddRes.Enabled;
end;

procedure TRequestTypeForm.dbgResultDblClick(Sender: TObject);
begin
  inherited;
  actEditResExecute(Sender);
end;

end.
