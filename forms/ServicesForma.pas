unit ServicesForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ActnList, Vcl.DBCtrls, Vcl.Mask,
  DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, FIBDatabase, pFIBDatabase,
  DBCtrlsEh,
  DBLookupEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh, CnErrorProvider, amSplitter;

type
  TServicesForm = class(TForm)
    pcServices: TPageControl;
    tsAbonent: TTabSheet;
    tsSingle: TTabSheet;
    tsFact: TTabSheet;
    ASGrid: TDBGridEh;
    srcTarif: TDataSource;
    srcLinks: TDataSource;
    srcServices: TDataSource;
    dsServices: TpFIBDataSet;
    dsTarif: TpFIBDataSet;
    dsLinks: TpFIBDataSet;
    srcONOFFServices: TDataSource;
    dsONOFFServices: TpFIBDataSet;
    ssGrid: TDBGridEh;
    fsGrid: TDBGridEh;
    ToolBar2: TToolBar;
    tbSrvAdd: TToolButton;
    tbSrvEdit: TToolButton;
    tbSrvDelete: TToolButton;
    tbSrvOk: TToolButton;
    tbSrvCancel: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    dsSC: TpFIBDataSet;
    srcSC: TDataSource;
    dsC: TpFIBDataSet;
    srcC: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    actAddSrv: TAction;
    actEditSrv: TAction;
    actDelSrv: TAction;
    srcSwitch: TDataSource;
    dsSwitch: TpFIBDataSet;
    srcSwitchToSrv: TDataSource;
    dsSwitchToSrv: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsSrvAttr: TpFIBDataSet;
    srcSrvAttr: TDataSource;
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    CnErrors: TCnErrorProvider;
    dsCMPLX: TpFIBDataSet;
    srcCMPLX: TDataSource;
    btnQF: TToolButton;
    btn1: TToolButton;
    actCmxAdd: TAction;
    actCmxDel: TAction;
    AddonPage: TPageControl;
    tsTarif: TTabSheet;
    trfGrid: TDBGridEh;
    pnlPST: TPanel;
    btnPSTDel: TSpeedButton;
    btnPSTAdd: TSpeedButton;
    tsLink: TTabSheet;
    Panel2: TPanel;
    dbgLink: TDBGridEh;
    pnlLink: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbbCHILD: TDBLookupComboboxEh;
    btnSaveLink: TBitBtn;
    btnCancelLink: TBitBtn;
    dbmmoDESCRIPTION: TDBMemoEh;
    cbLINK_TYPE: TDBComboBoxEh;
    tsChannels: TTabSheet;
    TabChannelState: TTabControl;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Label1: TLabel;
    GridSC: TDBGridEh;
    pnlProgrBtn: TPanel;
    sbChanAdd: TSpeedButton;
    sbChanRemove: TSpeedButton;
    Panel5: TPanel;
    Label2: TLabel;
    GridC: TDBGridEh;
    tsAllowSrv: TTabSheet;
    dbgAllow: TDBGridEh;
    ToolBar1: TToolBar;
    tbAllowOk: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    tsSwitch: TTabSheet;
    Panel1: TPanel;
    dbgSwitch: TDBGridEh;
    pnlSwitch: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl5: TLabel;
    dblSwitchTo: TDBLookupComboboxEh;
    dblSwitchSrv: TDBLookupComboboxEh;
    bbSwitchSave: TBitBtn;
    bbSwitchCancel: TBitBtn;
    memSwitch: TDBMemoEh;
    cbTime: TDBComboBoxEh;
    tsAtributes: TTabSheet;
    pnlAtr: TPanel;
    dbgAttr: TDBGridEh;
    pnlAttr: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dbluAttribute: TDBLookupComboboxEh;
    btnSaveAttr: TBitBtn;
    btnCancelAttr: TBitBtn;
    dbmmoNOTICE: TDBMemoEh;
    edtAtrValue: TDBEditEh;
    cbbList: TDBComboBoxEh;
    tsCOMPLEX: TTabSheet;
    dbgCMPLX: TDBGridEh;
    pnlCmxButtons: TPanel;
    btnCmxDel: TSpeedButton;
    btnCmxAdd: TSpeedButton;
    pnlCmxAdd: TPanel;
    edCmxFrom: TDBDateTimeEditEh;
    edCmxTo: TDBDateTimeEditEh;
    dbcCmxGroup: TDBComboBoxEh;
    enCmxValue: TDBNumberEditEh;
    btn2: TButton;
    btn3: TButton;
    dbmCmxNotice: TDBMemoEh;
    Splitter1: TSplitter;
    tbAttr: TPanel;
    sbAttrDel: TSpeedButton;
    sbAttrAdd: TSpeedButton;
    sbAttrEdit: TSpeedButton;
    tbLink: TPanel;
    btnLinkDel: TSpeedButton;
    btnLinkAdd: TSpeedButton;
    btnLinkEdit: TSpeedButton;
    tbSwitch: TPanel;
    btnSWDel: TSpeedButton;
    btnSWAdd: TSpeedButton;
    btnSWEdit: TSpeedButton;
    chkHideOld: TCheckBox;
    procedure tbSrvCancelClick(Sender: TObject);
    procedure tbSrvOkClick(Sender: TObject);
    procedure srcServicesStateChange(Sender: TObject);
    procedure dsLinksNewRecord(DataSet: TDataSet);
    procedure tbcancellinkClick(Sender: TObject);
    procedure tbpostlinkClick(Sender: TObject);
    procedure AddonPageChange(Sender: TObject);
    procedure pcServicesChange(Sender: TObject);
    procedure tbtarCancelClick(Sender: TObject);
    procedure tbtarOkClick(Sender: TObject);
    procedure dsTarifNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure srcServicesDataChange(Sender: TObject; Field: TField);
    procedure srcTarifDataChange(Sender: TObject; Field: TField);
    procedure sbChanAddClick(Sender: TObject);
    procedure sbChanRemoveClick(Sender: TObject);
    procedure TabChannelStateChange(Sender: TObject);
    procedure GridCDblClick(Sender: TObject);
    procedure GridSCDblClick(Sender: TObject);
    procedure ASGridDblClick(Sender: TObject);
    procedure actAddSrvExecute(Sender: TObject);
    procedure actEditSrvExecute(Sender: TObject);
    procedure actDelSrvExecute(Sender: TObject);
    procedure dsSwitchNewRecord(DataSet: TDataSet);
    procedure bbSwitchSaveClick(Sender: TObject);
    procedure bbSwitchCancelClick(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure srcCStateChange(Sender: TObject);
    procedure srcSCStateChange(Sender: TObject);
    procedure dsSrvAttrNewRecord(DataSet: TDataSet);
    procedure btnSaveAttrClick(Sender: TObject);
    procedure btnCancelAttrClick(Sender: TObject);
    procedure dbgAttrDblClick(Sender: TObject);
    procedure dbgSwitchDblClick(Sender: TObject);
    procedure dbgLinkDblClick(Sender: TObject);
    procedure dbluAttributeChange(Sender: TObject);
    procedure btnQFClick(Sender: TObject);
    procedure actCmxAddExecute(Sender: TObject);
    procedure actCmxDelExecute(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnPSTDelClick(Sender: TObject);
    procedure btnPSTAddClick(Sender: TObject);
    procedure sbAttrEditClick(Sender: TObject);
    procedure sbAttrAddClick(Sender: TObject);
    procedure sbAttrDelClick(Sender: TObject);
    procedure btnLinkDelClick(Sender: TObject);
    procedure btnLinkAddClick(Sender: TObject);
    procedure btnLinkEditClick(Sender: TObject);
    procedure btnSWDelClick(Sender: TObject);
    procedure btnSWEditClick(Sender: TObject);
    procedure btnSWAddClick(Sender: TObject);
    procedure srcLinksDataChange(Sender: TObject; Field: TField);
    procedure srcCMPLXDataChange(Sender: TObject; Field: TField);
    procedure srcSwitchDataChange(Sender: TObject; Field: TField);
    procedure srcSrvAttrDataChange(Sender: TObject; Field: TField);
    procedure chkHideOldClick(Sender: TObject);
    procedure pcServicesChanging(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
    FCanEdit: Boolean;
    FCanEditAll: Boolean;
    FHideNotActual: Boolean;
    procedure StartSwitch(const New: Boolean = True);
    procedure StopSwitch(const Cancel: Boolean);
    procedure StartLink(const New: Boolean = True);
    procedure StopLink(const Cancel: Boolean);
    procedure StartAttr(const New: Boolean = True);
    procedure StopAttr(const Cancel: Boolean);
    function checkCmplx: Boolean;
  public
    { Public declarations }
  end;

var
  ServicesForm: TServicesForm;

implementation

uses
  System.RegularExpressions, System.StrUtils,
  DM, TarifForma, pFIBQuery, ServiceForma, MAIN;

{$R *.dfm}

procedure TServicesForm.FormDestroy(Sender: TObject);
begin
  ServicesForm := nil;
end;

procedure TServicesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ASGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'ASGrid', false);
  ssGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'ssGrid', false);
  fsGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'fsGrid', false);
  trfGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'trfGrid', false);
  dmMain.SetIniValue('ServiceGrid', IntToStr(ASGrid.Height));
  dmMain.SetIniValue('HIDE_NOT_ACTUAL_SRV', ifThen(FHideNotActual, '1', '0'));
  Action := caFree;
end;

procedure TServicesForm.dsTarifNewRecord(DataSet: TDataSet);
begin
  dsTarif['SERVICE_ID'] := dsServices['SERVICE_ID'];
  if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    dsTarif['DATE_FROM'] := NOW;
  dsTarif['TARIF_SUM'] := 0;
end;

procedure TServicesForm.tbtarOkClick(Sender: TObject);
begin
  if not(dsTarif.State in [dsEdit, dsInsert]) then
    exit;

  if not FCanEdit then
  begin
    dsTarif.Cancel;
    exit;
  end;

  if FCanEditAll then
  begin
    dsTarif.Post;
    exit;
  end;

  if (VarToDateTime(dsTarif.FieldByName('DATE_FROM').NewValue) > dmMain.CurrentMonth) or
    (VarToDateTime(dsTarif.FieldByName('DATE_TO').NewValue) < dmMain.CurrentMonth) then
    dsTarif.Post
  else
    dsTarif.Cancel;
end;

procedure TServicesForm.tbtarCancelClick(Sender: TObject);
begin
  dsTarif.Cancel;
end;

procedure TServicesForm.pcServicesChange(Sender: TObject);
var
  ehGrid: TDBGridEh;
begin
  if (dsTarif.State in [dsEdit, dsInsert]) then
    dsTarif.Cancel;

  if (dsServices.State in [dsEdit, dsInsert]) then
    dsServices.Cancel;

  dsServices.Close;

  dsServices.ParamByName('SERV_TYPE').AsInteger := pcServices.ActivePage.Tag;
  if FHideNotActual then
    dsServices.ParamByName('WHERE_ACTUAL').AsString := 'SHOW_SERVICE = 1'
  else
    dsServices.ParamByName('WHERE_ACTUAL').AsString := '1=1';
  dsServices.Open;

  tsTarif.TabVisible := pcServices.ActivePage.Tag <> 2;
  tsLink.TabVisible := pcServices.ActivePage.Tag = 0;
  tsChannels.TabVisible := pcServices.ActivePage.Tag = 0;
  tsSwitch.TabVisible := pcServices.ActivePage.Tag = 0;
  tsCOMPLEX.TabVisible := pcServices.ActivePage.Tag = 0;

  if pcServices.ActivePage.Tag <> 2 then
  begin
    AddonPage.ActivePage := tsTarif;
    dsTarif.Open;
    if dsONOFFServices.Active then
      dsONOFFServices.Close;
    if dsLinks.Active then
      dsLinks.Close;
    if dsSrvAttr.Active then
      dsSrvAttr.Close;
  end
  else
  begin
    AddonPage.ActivePage := tsAtributes;
    if not dsSrvAttr.Active then
      dsSrvAttr.Active;
  end;

  case pcServices.ActivePageIndex of
    0:
      ehGrid := ASGrid;
    1:
      ehGrid := ssGrid;
  else
    ehGrid := fsGrid;
  end;
  if ehGrid.SearchPanel.SearchingText <> '' then
  begin
    // ehGrid.SearchPanel.CancelSearchFilter;
    // ehGrid.SearchPanel.SearchingText := '';
    ehGrid.SearchPanel.ApplySearchFilter;
  end;
end;

procedure TServicesForm.pcServicesChanging(Sender: TObject; var AllowChange: Boolean);
var
  ehGrid: TDBGridEh;
begin
  case pcServices.ActivePageIndex of
    0:
      ehGrid := ASGrid;
    1:
      ehGrid := ssGrid;
  else
    ehGrid := fsGrid;
  end;
  if ehGrid.SearchPanel.SearchingText <> '' then
  begin
    ehGrid.SearchPanel.CancelSearchFilter;
    // ehGrid.SearchPanel.SearchingText := '';
    // ehGrid.SearchPanel.ApplySearchFilter;
  end;
end;

procedure TServicesForm.actAddSrvExecute(Sender: TObject);
var
  i: int64;
begin
  if FCanEdit then
  begin
    i := ViewService(-9999, pcServices.ActivePage.Tag);
    if i > -1 then
    begin
      dsServices.CloseOpen(True);
      dsServices.Locate('SERVICE_ID', i, []);
    end;
  end;
end;

procedure TServicesForm.actCmxAddExecute(Sender: TObject);
var
  bm: TBookmark;
begin
  if dsCMPLX.RecordCount > 0 then
  begin
    bm := dsCMPLX.GetBookmark;
    dsCMPLX.DisableControls;
    dsCMPLX.First;
    while not dsCMPLX.Eof do
    begin
      if dbcCmxGroup.Items.IndexOf(dsCMPLX['NAME']) < 0 then
        dbcCmxGroup.Items.Add(dsCMPLX['NAME']);
      dsCMPLX.Next;
    end;
    dsCMPLX.GotoBookmark(bm);
    dsCMPLX.EnableControls;
  end;
  pnlCmxAdd.Visible := True;
  dbcCmxGroup.SetFocus;
end;

procedure TServicesForm.actCmxDelExecute(Sender: TObject);
begin
  if dsCMPLX.RecordCount = 0 then
    exit;

  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsCMPLX.Delete;
end;

procedure TServicesForm.actDelSrvExecute(Sender: TObject);
var
  i, j: Integer;
  s: string;
begin
  if not FCanEdit then
    exit;

  if (MessageDlg(rsDeleteService, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    try
      dsServices.Delete;
    except
      on E: Exception do
      begin
        s := '';
        i := Pos('#', E.Message);
        if (i > 0) then
        begin
          j := Pos(' ', E.Message, i + 1);
          s := Copy(E.Message, i + 1, j - i - 1);
        end;
        if s = '1' then
          ShowMessage(rsDelSrvError)
        else
          raise;
      end;
    end;
  end
end;

procedure TServicesForm.actEditSrvExecute(Sender: TObject);
begin
  if FCanEdit then
  begin
    ViewService(dsServices['SERVICE_ID'], dsServices['SRV_TYPE_ID']);
    dsServices.Refresh;
  end;
end;

procedure TServicesForm.AddonPageChange(Sender: TObject);
begin
  dsTarif.Active := (AddonPage.ActivePage = tsTarif);
  dsONOFFServices.Active := (AddonPage.ActivePage = tsLink) or (AddonPage.ActivePage = tsSwitch);
  dsLinks.Active := (AddonPage.ActivePage = tsLink);

  if (AddonPage.ActivePage = tsChannels) then
  begin
    TabChannelState.TabIndex := 0;
    TabChannelStateChange(Sender);
  end;

  dsSwitch.Active := (AddonPage.ActivePage = tsSwitch);
  dsSwitchToSrv.Active := (AddonPage.ActivePage = tsSwitch);
  dsSrvAttr.Active := (AddonPage.ActivePage = tsAtributes);
  dsCMPLX.Active := (AddonPage.ActivePage = tsCOMPLEX);
end;

procedure TServicesForm.tbpostlinkClick(Sender: TObject);
begin
  if FCanEdit then
    dsLinks.Post
  else
    dsLinks.Cancel;
end;

procedure TServicesForm.tbcancellinkClick(Sender: TObject);
begin
  dsLinks.Cancel;
end;

procedure TServicesForm.dbgAttrDblClick(Sender: TObject);
begin
  if FCanEdit then
    StartAttr(dsSrvAttr.FieldByName('O_ID').IsNull);
end;

procedure TServicesForm.dbgLinkDblClick(Sender: TObject);
begin
  if FCanEdit then
    StartLink(dsLinks.FieldByName('LINK_TYPE').IsNull);
end;

procedure TServicesForm.dbgSwitchDblClick(Sender: TObject);
begin
  if FCanEdit then
    StartSwitch(dsSwitch.FieldByName('SwitchTo').IsNull);
end;

procedure TServicesForm.dbluAttributeChange(Sender: TObject);
begin
  cbbList.Items.Clear;
  cbbList.KeyItems.Clear;
  cbbList.Items.Text := dsAttributes['VLIST'];
  cbbList.KeyItems.Text := dsAttributes['VLIST'];
  cbbList.Visible := (dsAttributes['VLIST'] <> '');
  edtAtrValue.Visible := not cbbList.Visible;
end;

procedure TServicesForm.dsLinksNewRecord(DataSet: TDataSet);
begin
  dsLinks['PARENT'] := dsServices['SERVICE_ID'];
end;

procedure TServicesForm.dsSrvAttrNewRecord(DataSet: TDataSet);
begin
  dsSrvAttr['Service_Id'] := dsServices['SERVICE_ID'];
end;

procedure TServicesForm.dsSwitchNewRecord(DataSet: TDataSet);
begin
  dsSwitch['PARENT'] := dsServices['SERVICE_ID'];
end;

procedure TServicesForm.srcServicesStateChange(Sender: TObject);
begin
  tbSrvOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  tbSrvCancel.Enabled := tbSrvOk.Enabled;
  tbSrvAdd.Enabled := not tbSrvOk.Enabled;
end;

procedure TServicesForm.srcSrvAttrDataChange(Sender: TObject; Field: TField);
begin
  sbAttrEdit.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
  sbAttrDel.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
end;

procedure TServicesForm.srcSwitchDataChange(Sender: TObject; Field: TField);
begin
  btnSWEdit.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
  btnSWDel.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
end;

procedure TServicesForm.tbSrvOkClick(Sender: TObject);
begin
  if FCanEdit then
    dsServices.Post
  else
    dsServices.Cancel;
end;

procedure TServicesForm.tbSrvCancelClick(Sender: TObject);
begin
  dsServices.Cancel;
end;

procedure TServicesForm.FormShow(Sender: TObject);
var
  vSF: string;
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  pcServices.ActivePage := tsAbonent;
  dsServices.ParamByName('SERV_TYPE').AsInteger := 0;
  dsServices.Open;
  AddonPage.ActivePage := tsTarif;
  dsTarif.Open;

  FCanEdit := (dmMain.AllowedAction(rght_Dictionary_full));
  FCanEditAll := (dmMain.AllowedAction(rght_Dictionary_Services));
  FCanEdit := FCanEdit or FCanEditAll; // может редактировать если разрешено редактировать все

  pnlPST.Visible := FCanEdit;
  tbLink.Visible := FCanEdit;
  tbSwitch.Visible := FCanEdit;
  // pnlSST.Visible := FCanEdit;
  pnlProgrBtn.Visible := FCanEdit;
  tbAttr.Visible := FCanEdit;

  ASGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'ASGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  ssGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'ssGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  fsGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'fsGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  trfGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'trfGrid',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  vSF := dmMain.GetIniValue('ServiceGrid');
  if TryStrToInt(vSF, i) then
  begin
    ASGrid.Height := i;
    ssGrid.Height := i;
  end;
  tsCOMPLEX.TabVisible := (dmMain.GetSettingsValue('COMPLEX') = '1');
  vSF := dmMain.GetSettingsValue('PAYMENT_TYPE');
  for i := 0 to ASGrid.Columns.Count - 1 do
  begin
    if ASGrid.Columns[i].FieldName.ToUpper = 'O_NAME' then
      ASGrid.Columns[i].Visible := (vSF = '1');
  end;
  for i := 0 to fsGrid.Columns.Count - 1 do
  begin
    if fsGrid.Columns[i].FieldName.ToUpper = 'O_NAME' then
      fsGrid.Columns[i].Visible := (vSF = '1');
  end;
  for i := 0 to ssGrid.Columns.Count - 1 do
  begin
    if ssGrid.Columns[i].FieldName.ToUpper = 'O_NAME' then
      ssGrid.Columns[i].Visible := (vSF = '1');
  end;
  dsServices.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE SERVICES_IU(:SERVICE_ID, ' +
    ' :SRV_TYPE_ID, :SHIFT_MONTHS, :NAME, :SHORTNAME, :DESCRIPTION, ' + ' :DIMENSION, :SHOW_SERVICE, :EXPENSE_TYPE)';

{$IFNDEF DIGIT}
  TabChannels.TabVisible := false;
{$ENDIF}
  vSF := dmMain.GetIniValue('HIDE_NOT_ACTUAL_SRV');
  if TryStrToInt(vSF, i) then
    FHideNotActual := i = 1
  else
    FHideNotActual := false;
  chkHideOld.Checked := FHideNotActual;
end;

procedure TServicesForm.srcCMPLXDataChange(Sender: TObject; Field: TField);
begin
  actCmxDel.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
end;

procedure TServicesForm.srcCStateChange(Sender: TObject);
begin
  sbChanAdd.Enabled := (dsC.RecordCount > 0) and FCanEdit;
  sbChanRemove.Enabled := (dsSC.RecordCount > 0) and FCanEdit;
end;

procedure TServicesForm.srcLinksDataChange(Sender: TObject; Field: TField);
begin
  btnLinkEdit.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
  btnLinkDel.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
end;

procedure TServicesForm.srcSCStateChange(Sender: TObject);
begin
  sbChanAdd.Enabled := (dsC.RecordCount > 0) and FCanEdit;
  sbChanRemove.Enabled := (dsSC.RecordCount > 0) and FCanEdit;
end;

procedure TServicesForm.srcServicesDataChange(Sender: TObject; Field: TField);
begin
  actEditSrv.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
  actDelSrv.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;

  if (pcServices.ActivePage.Tag = 0) and (AddonPage.ActivePage = tsChannels) then
  begin
    TabChannelStateChange(Sender);
  end;
end;

procedure TServicesForm.srcTarifDataChange(Sender: TObject; Field: TField);
begin
  btnPSTDel.Visible := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
end;

procedure TServicesForm.sbAttrAddClick(Sender: TObject);
begin
  if FCanEdit then
    StartAttr;
end;

procedure TServicesForm.sbAttrDelClick(Sender: TObject);
begin
  if FCanEdit and (not dsSrvAttr.FieldByName('O_NAME').IsNull) then
    if (MessageDlg(format(rsDeleteWithName, [dsSrvAttr['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsSrvAttr.Delete;
end;

procedure TServicesForm.sbChanAddClick(Sender: TObject);
var
  Channel_ON: Integer;
  bm: TBookmark;
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Services))) then
    exit;
  // если активна закладка подключенного пакета
  // то запомним установим переменную в
  if (TabChannelState.TabIndex = 0) then
    Channel_ON := 1
  else
    Channel_ON := 0;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'INSERT INTO Channels_In_Servce (Srv_Id, Ch_Id, On_Off) VALUES (:Srv_Id, :Ch_Id, :Channel_On)';
      ParamByName('srv_id').Value := dsServices['SERVICE_ID'];
      ParamByName('Ch_Id').Value := dsC['Ch_Id'];
      ParamByName('Channel_On').Value := Channel_ON;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsSC.CloseOpen(True);
      bm := dsC.GetBookmark;
      dsC.CloseOpen(True);
      dsC.GotoBookmark(bm);
    finally
      Free;
    end;
  end;
end;

procedure TServicesForm.sbChanRemoveClick(Sender: TObject);
var
  Channel_ON: Integer;
begin
  // если активна закладка подключенного пакета
  // то запомним установим переменную в
  if (TabChannelState.TabIndex = 0) then
    Channel_ON := 1
  else
    Channel_ON := 0;

  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'DELETE FROM Channels_In_Servce WHERE Srv_Id = :Srv_Id AND Ch_Id = :Ch_Id and On_Off = :Channel_On;';
      ParamByName('srv_id').Value := dsServices['SERVICE_ID'];
      ParamByName('Ch_Id').Value := dsSC['Ch_Id'];
      ParamByName('Channel_On').Value := Channel_ON;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsSC.CloseOpen(True);
      dsC.CloseOpen(True);
    finally
      Free;
    end;
end;

procedure TServicesForm.TabChannelStateChange(Sender: TObject);
var
  Channel_ON: Integer;
begin
  // если активна закладка подключенного пакета
  // то запомним установим переменную в
  if (TabChannelState.TabIndex = 0) then
    Channel_ON := 1
  else
    Channel_ON := 0;

  dsSC.Close;
  dsC.Close;
  dsSC.ParamByName('Channel_On').AsInteger := Channel_ON;
  dsC.ParamByName('Channel_On').AsInteger := Channel_ON;
  if not dsServices.FieldByName('SERVICE_ID').IsNull then
  begin
    dsSC.ParamByName('SERVICE').AsInteger := dsServices['SERVICE_ID'];
    dsC.ParamByName('SERVICE').AsInteger := dsServices['SERVICE_ID'];
  end
  else
  begin
    dsSC.ParamByName('SERVICE').Clear;
    dsC.ParamByName('SERVICE').Clear;
  end;
  dsSC.Open;
  dsC.Open;
end;

procedure TServicesForm.GridCDblClick(Sender: TObject);
begin
  if not dsC.FieldByName('Ch_Id').IsNull then
    sbChanAddClick(Sender);
end;

procedure TServicesForm.GridSCDblClick(Sender: TObject);
begin
  if not dsSC.FieldByName('Ch_Id').IsNull then
    sbChanRemoveClick(Sender);
end;

procedure TServicesForm.ASGridDblClick(Sender: TObject);
begin
  actEditSrv.Execute;
end;

procedure TServicesForm.bbSwitchSaveClick(Sender: TObject);
var
  No_Errors: Boolean;
begin
  No_Errors := True;
  if dblSwitchTo.Text = '' then
  begin
    CnErrors.SetError(dblSwitchTo, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    No_Errors := false;
  end
  else
    CnErrors.Dispose(dblSwitchTo);

  if dblSwitchSrv.Text = '' then
  begin
    CnErrors.SetError(dblSwitchSrv, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    No_Errors := false;
  end
  else
    CnErrors.Dispose(dblSwitchSrv);

  if cbTime.Text = '' then
  begin
    CnErrors.SetError(cbTime, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    No_Errors := false;
  end
  else
    CnErrors.Dispose(cbTime);

  if No_Errors then
    StopSwitch(false);
end;

procedure TServicesForm.btnCancelAttrClick(Sender: TObject);
begin
  StopAttr(True);
end;

procedure TServicesForm.btnCancelLinkClick(Sender: TObject);
begin
  StopLink(True);
end;

procedure TServicesForm.btnLinkDelClick(Sender: TObject);
begin
  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsLinks.Delete;
end;

procedure TServicesForm.btnLinkEditClick(Sender: TObject);
begin
  if FCanEdit then
    StartLink(false);
end;

procedure TServicesForm.btnLinkAddClick(Sender: TObject);
begin
  if FCanEdit then
    StartLink();
end;

procedure TServicesForm.btnPSTAddClick(Sender: TObject);
begin
  if dsServices.RecordCount = 0 then
    exit;

  if FCanEdit then
  begin
    if EditTarif(dsServices['NAME'], dsServices['SERVICE_ID'], -1) then
      dsTarif.CloseOpen(True);
  end;
end;

procedure TServicesForm.btnPSTDelClick(Sender: TObject);
begin
  if dsTarif.RecordCount = 0 then
    exit;

  if FCanEdit then
  begin
    if (MessageDlg(format(rsDeleteWithName, [dsTarif.FieldByName('DATE_FROM').AsString + ' - ' +
      dsTarif.FieldByName('DATE_TO').AsString]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsTarif.Delete;
  end;
end;

procedure TServicesForm.btnQFClick(Sender: TObject);
var
  o_n: Boolean;
var
  i: Integer;
begin
  o_n := not ASGrid.STFilter.Visible;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).STFilter.Visible := o_n;
      (Components[i] as TDBGridEh).STFilter.Local := o_n;
    end;
  end;
end;

procedure TServicesForm.btnSaveLinkClick(Sender: TObject);
begin
  StopLink(false);
end;

procedure TServicesForm.btnSWDelClick(Sender: TObject);
begin
  if FCanEdit and (not dsSwitch.FieldByName('SWITCHTO').IsNull) then
    if (MessageDlg(format(rsDelLinkWT, [dsSwitch['SWITCHTO']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsSwitch.Delete;
end;

procedure TServicesForm.btnSWEditClick(Sender: TObject);
begin
  if FCanEdit then
    StartSwitch(false);
end;

procedure TServicesForm.btnSWAddClick(Sender: TObject);
begin
  if FCanEdit then
    StartSwitch;
end;

procedure TServicesForm.bbSwitchCancelClick(Sender: TObject);
begin
  StopSwitch(True);
end;

procedure TServicesForm.StartSwitch(const New: Boolean = True);
begin
  if not FCanEdit then
    exit;

  pnlSwitch.Visible := True;
  dbgSwitch.Enabled := false;
  tbSwitch.Enabled := false;

  if New then
    dsSwitch.Append
  else
    dsSwitch.Edit;

  dblSwitchTo.SetFocus;
end;

procedure TServicesForm.StopSwitch(const Cancel: Boolean);
begin
  pnlSwitch.Visible := false;
  dbgSwitch.Enabled := True;
  tbSwitch.Enabled := True;

  if not(dsSwitch.State in [dsEdit, dsInsert]) then
    exit;

  if (Cancel) or (not FCanEdit) then
    dsSwitch.Cancel
  else if FCanEdit then
    dsSwitch.Post
  else
    dsSwitch.Cancel;

  dbgSwitch.SetFocus;
end;

procedure TServicesForm.StartLink(const New: Boolean = True);
begin
  if not FCanEdit then
    exit;

  pnlLink.Visible := True;
  dbgLink.Enabled := false;
  tbLink.Enabled := false;

  if New then
    dsLinks.Append
  else
    dsLinks.Edit;

  cbLINK_TYPE.SetFocus;
end;

procedure TServicesForm.StopLink(const Cancel: Boolean);
begin
  pnlLink.Visible := false;
  dbgLink.Enabled := True;
  tbLink.Enabled := True;

  if not(dsLinks.State in [dsEdit, dsInsert]) then
    exit;

  if (Cancel) or (not FCanEdit) then
    dsLinks.Cancel
  else if FCanEdit then
    dsLinks.Post
  else
    dsLinks.Cancel;

  dbgLink.SetFocus;
end;

procedure TServicesForm.StartAttr(const New: Boolean = True);
begin
  if not FCanEdit then
    exit;

  if not dsSrvAttr.Active then
    dsSrvAttr.Open;

  if New then
    dsAttributes.ParamByName('O_ID').Clear
  else
    dsAttributes.ParamByName('O_ID').Value := dsSrvAttr['O_ID'];

  dsAttributes.Open;

  pnlAttr.Visible := True;
  dbgAttr.Enabled := false;
  tbAttr.Enabled := false;

  if New then
  begin
    dsSrvAttr.Append;
    dbluAttribute.Enabled := True;
    dbluAttribute.SetFocus;
  end
  else
  begin
    dsSrvAttr.Edit;
    dbluAttribute.Enabled := false;
    if edtAtrValue.Visible then
      edtAtrValue.SetFocus
    else if cbbList.Visible then
      cbbList.SetFocus;
  end;
end;

procedure TServicesForm.StopAttr(const Cancel: Boolean);
var
  errors: Boolean;
  s, reg: string;
begin
  errors := false;

  if not Cancel then
  begin
    if dbluAttribute.Text = '' then
    begin
      CnErrors.SetError(dbluAttribute, rsSelectAttribute, iaTopCenter, bsNeverBlink);
      errors := True;
    end
    else
      CnErrors.Dispose(dbluAttribute);

    if ((dbluAttribute.Text <> '')) then
    begin
      if dsAttributes['REGEXP'] <> '' then
      begin
        s := edtAtrValue.Text;
        reg := '^' + dsAttributes['REGEXP'] + '$';
        errors := not TRegEx.IsMatch(s, reg);
        if errors then
          CnErrors.SetError(edtAtrValue, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
        else
          CnErrors.Dispose(edtAtrValue);
      end
    end;
  end;

  if not errors then
  begin
    pnlAttr.Visible := false;
    dbgAttr.Enabled := True;
    tbAttr.Enabled := True;

    if not(dsSrvAttr.State in [dsEdit, dsInsert]) then
      exit;

    if (Cancel) or (not FCanEdit) then
      dsSrvAttr.Cancel
    else if FCanEdit then
      dsSrvAttr.Post
    else
      dsSrvAttr.Cancel;

    dsAttributes.Close;
    dbgAttr.SetFocus;
  end;
end;

procedure TServicesForm.btnSaveAttrClick(Sender: TObject);
begin
  StopAttr(false);
end;

function TServicesForm.checkCmplx: Boolean;
var
  errors: Boolean;
  dt: TDateTime;
begin
  errors := false;
  if dbcCmxGroup.Text = '' then
  begin
    CnErrors.SetError(dbcCmxGroup, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    errors := True;
  end
  else
    CnErrors.Dispose(dbcCmxGroup);

  if enCmxValue.Text = '' then
  begin
    CnErrors.SetError(enCmxValue, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    errors := True;
  end
  else
    CnErrors.Dispose(enCmxValue);

  if not TryStrToDateTime(edCmxFrom.Text, dt) then
  begin
    CnErrors.SetError(edCmxFrom, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    errors := True;
  end
  else
    CnErrors.Dispose(edCmxFrom);

  if not TryStrToDateTime(edCmxTo.Text, dt) then
  begin
    CnErrors.SetError(edCmxTo, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    errors := True;
  end
  else
    CnErrors.Dispose(edCmxTo);

  Result := not errors;
end;

procedure TServicesForm.chkHideOldClick(Sender: TObject);
begin
  FHideNotActual := chkHideOld.Checked;
  pcServicesChange(Sender);
end;

procedure TServicesForm.btn2Click(Sender: TObject);
begin
  if checkCmplx then
  begin
    dsCMPLX.Insert;
    dsCMPLX['SERVICE_ID'] := dsServices['SERVICE_ID'];
    dsCMPLX['NAME'] := dbcCmxGroup.Text;
    dsCMPLX['PERCENT'] := enCmxValue.Value;
    dsCMPLX['DATE_FROM'] := edCmxFrom.Value;
    dsCMPLX['DATE_TO'] := edCmxTo.Value;
    dsCMPLX['NOTICE'] := dbmCmxNotice.Lines.Text;
    dsCMPLX.Post;
    pnlCmxAdd.Visible := false;
  end;
end;

procedure TServicesForm.btn3Click(Sender: TObject);
begin
  pnlCmxAdd.Visible := false;
end;

procedure TServicesForm.sbAttrEditClick(Sender: TObject);
begin
  if FCanEdit and (not dsSrvAttr.FieldByName('O_NAME').IsNull) then
    StartAttr(false);
end;

end.
