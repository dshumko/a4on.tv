unit CustomerAddonsFrame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ActnList, Vcl.Menus,
  DBGridEhGrouping, DBCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, pFIBProps, pFIBQuery, FIBQuery, DBGridEhImpExp;

type
  TCustomerAddons = class(TFrame)
    dsChannels: TpFIBDataSet;
    srcChannels: TDataSource;
    dsBilling: TpFIBDataSet;
    dsBillingCUSTOMER_ID: TFIBIntegerField;
    dsBillingLOGIN: TFIBStringField;
    dsBillingSECRET: TFIBStringField;
    dsBillingIP_INET: TFIBStringField;
    dsBillingIP_INET_BIN: TFIBBCDField;
    dsBillingACCOUNT_ID: TFIBIntegerField;
    dsBillingACCOUNT_NAME: TFIBStringField;
    dsBillingUNIT_ID: TFIBIntegerField;
    dsBillingPLAN_ID: TFIBIntegerField;
    dsBillingPLAN_NAME: TFIBStringField;
    dsBillingNOTICE: TFIBStringField;
    dsBillingACCOUNT_HEX: TStringField;
    dsBillingUNIT_HEX: TStringField;
    dsBillingUNIT_NAME: TFIBStringField;
    dsBillingBLOCKED: TFIBSmallIntField;
    srcPrepay: TDataSource;
    srcBilling: TDataSource;
    dsPrepay: TpFIBDataSet;
    dsPayment: TpFIBDataSet;
    srcPayment: TDataSource;
    dsDecoders: TpFIBDataSet;
    srcDecoders: TDataSource;
    dsSingleService: TpFIBDataSet;
    srcSingleSerivce: TDataSource;
    dsDiscount: TpFIBDataSet;
    srcDiscount: TDataSource;
    dsLetters: TpFIBDataSet;
    srcLetters: TDataSource;
    dsLAN: TpFIBDataSet;
    srcLan: TDataSource;
    dsServicesHistory: TpFIBDataSet;
    dsServices: TpFIBDataSet;
    srcServices: TDataSource;
    dsPersonelTarif: TpFIBDataSet;
    srcPersonelTarif: TDataSource;
    srcCustAttributes: TDataSource;
    dsCustAttributes: TpFIBDataSet;
    pcAddInfo: TPageControl;
    tsAddInfo: TTabSheet;
    Panel6: TPanel;
    GroupBox2: TGroupBox;
    memCustNotice: TMemo;
    Panel4: TPanel;
    Label11: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    sbRecalc: TSpeedButton;
    gbSaldo: TGroupBox;
    DBTextDebt: TDBText;
    pnlPrepay: TPanel;
    dbtxtPrepay: TDBText;
    DBEdit6: TDBEdit;
    dbeACCOUNT_NO: TDBEdit;
    DBEdit7: TDBEdit;
    DBDateTimeEditCONTRACT_DATE: TDBDateTimeEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit2: TDBEdit;
    EdMobile: TDBEdit;
    DBEdit9: TDBEdit;
    edFIO: TEdit;
    edAdres: TEdit;
    memState: TDBMemo;
    tsSubscrServ: TTabSheet;
    Panel7: TPanel;
    pnlSubscrServ: TPanel;
    Splitter3: TSplitter;
    dbgCustSubscrServ: TDBGridEh;
    pnlPersonelTarif: TPanel;
    Label14: TLabel;
    dbgPersTarif: TDBGridEh;
    ToolBar5: TToolBar;
    bbAddTarif: TToolButton;
    bbEditTarif: TToolButton;
    bbDelTarif: TToolButton;
    ToolBar7: TToolBar;
    tbOkPT: TToolButton;
    tbCancelPT: TToolButton;
    Panel8: TPanel;
    bbHistory: TBitBtn;
    bbOnService: TBitBtn;
    bbOfService: TBitBtn;
    bbAddService: TBitBtn;
    bbSwitchServices: TBitBtn;
    bbPauseService: TBitBtn;
    tsSingleServ: TTabSheet;
    dbgSingleServ: TDBGridEh;
    Panel3: TPanel;
    bbSingleServiceAdd: TBitBtn;
    bbDelSingleService: TBitBtn;
    tsDiscFactor: TTabSheet;
    dbgCustDiscFactor: TDBGridEh;
    tbKoeff: TToolBar;
    tbtarAdd: TToolButton;
    tbtarEdit: TToolButton;
    tbtarDel: TToolButton;
    tsPayments: TTabSheet;
    dbgCustPayment: TDBGridEh;
    ToolBar6: TToolBar;
    ToolButton22: TToolButton;
    tsCustLetter: TTabSheet;
    dbgLetters: TDBGridEh;
    ToolBar4: TToolBar;
    tbDelLetter: TToolButton;
    tsRequests: TTabSheet;
    Panel5: TPanel;
    dbGridCustReq: TDBGridEh;
    ToolBar8: TToolBar;
    ToolButton23: TToolButton;
    tsAttributes: TTabSheet;
    tbAttributes: TToolBar;
    bbAddAtr: TToolButton;
    bbEditAtr: TToolButton;
    bbDelAtr: TToolButton;
    dbgCustAttr: TDBGridEh;
    tsLANInfo: TTabSheet;
    tbLAN: TToolBar;
    btnLanAdd: TToolButton;
    ciEdit: TToolButton;
    ciDel: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    dbgCustLAN: TDBGridEh;
    tsDigitTV: TTabSheet;
    Splitter4: TSplitter;
    Panel1: TPanel;
    Label18: TLabel;
    ToolBar3: TToolBar;
    btnDigitDecoderAdd: TToolButton;
    btnDigitDecoderEdit: TToolButton;
    btnDigitDecoderDel: TToolButton;
    tbDecOk: TToolButton;
    tbDecCancel: TToolButton;
    dbgCustDec: TDBGridEh;
    Panel9: TPanel;
    Label17: TLabel;
    ToolBar2: TToolBar;
    tbAddChan: TToolButton;
    tbEditChan: TToolButton;
    btnDigitChanelDel: TToolButton;
    dbgCustChan: TDBGridEh;
    tsBilling: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton24: TToolButton;
    pnlLogin: TPanel;
    DBMemo1: TDBMemo;
    pnl: TPanel;
    lblInet: TLabel;
    Label13: TLabel;
    edInet: TDBEditEh;
    DBEditEh1: TDBEditEh;
    pnlUTM: TPanel;
    Label4: TLabel;
    Label21: TLabel;
    DBEditEh8: TDBEditEh;
    DBEditEh9: TDBEditEh;
    btnUTMInfo: TButton;
    pnlNetams: TPanel;
    Label8: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    lblbill: TLabel;
    DBEditEh2: TDBEditEh;
    cbBillBlock: TDBComboBoxEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBEditEh6: TDBEditEh;
    ActListCustomers: TActionList;
    actSubscrHistory: TAction;
    actReCalc: TAction;
    actRequest: TAction;
    ActAddPayment: TAction;
    actSrvAdd: TAction;
    ActSrvOn: TAction;
    ActSrvOff: TAction;
    actSrvSwitch: TAction;
    actSrvPause: TAction;
    actBilling: TAction;
    actLetterDel: TAction;
    ActLanPing: TAction;
    actDigitChanelAdd: TAction;
    actDigitChanelEdit: TAction;
    actDigitChanelDel: TAction;
    actDigitDecoderAdd: TAction;
    actDigitDecoderEdit: TAction;
    actDigitDecoderDel: TAction;
    actSingleSrvAdd: TAction;
    actDiscountAdd: TAction;
    actDiscountDel: TAction;
    actDiscountEdit: TAction;
    pmRecalc: TPopupMenu;
    N2: TMenuItem;
    actAtributeAdd: TAction;
    actAtributeEdit: TAction;
    actAtributeDel: TAction;
    pmServices: TPopupMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    N43: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    actLanAdd: TAction;
    actLanEdit: TAction;
    actLanDelete: TAction;
    dsRequests: TpFIBDataSet;
    srcRequests: TDataSource;
    procedure actReCalcExecute(Sender: TObject);
    procedure actRequestExecute(Sender: TObject);
    procedure ActAddPaymentExecute(Sender: TObject);
    procedure actDigitChanelAddExecute(Sender: TObject);
    procedure actDigitChanelEditExecute(Sender: TObject);
    procedure actDigitChanelDelExecute(Sender: TObject);
    procedure actDigitDecoderAddExecute(Sender: TObject);
    procedure actDigitDecoderEditExecute(Sender: TObject);
    procedure actDigitDecoderDelExecute(Sender: TObject);
    procedure actBillingExecute(Sender: TObject);
    procedure ActLanPingExecute(Sender: TObject);
    procedure actLetterDelExecute(Sender: TObject);
    procedure actSubscrHistoryExecute(Sender: TObject);
    procedure actSrvAddExecute(Sender: TObject);
    procedure ActSrvOnExecute(Sender: TObject);
    procedure ActSrvOffExecute(Sender: TObject);
    procedure actSrvSwitchExecute(Sender: TObject);
    procedure actSrvPauseExecute(Sender: TObject);
    procedure pcAddInfoChange(Sender: TObject);
    procedure srcServicesDataChange(Sender: TObject; Field: TField);
    procedure actSingleSrvAddExecute(Sender: TObject);
    procedure btnUTMInfoClick(Sender: TObject);
    procedure actDiscountAddExecute(Sender: TObject);
    procedure actDiscountDelExecute(Sender: TObject);
    procedure actDiscountEditExecute(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure bbDelSingleServiceClick(Sender: TObject);
    procedure actAtributeAddExecute(Sender: TObject);
    procedure actAtributeEditExecute(Sender: TObject);
    procedure actAtributeDelExecute(Sender: TObject);
    procedure dsBillingAfterOpen(DataSet: TDataSet);
    procedure dsBillingCalcFields(DataSet: TDataSet);
    procedure srcSingleSerivceDataChange(Sender: TObject; Field: TField);
    procedure bbAddTarifClick(Sender: TObject);
    procedure bbDelTarifClick(Sender: TObject);
    procedure dsServicesBeforeClose(DataSet: TDataSet);
    procedure dsPersonelTarifNewRecord(DataSet: TDataSet);
    procedure bbEditTarifClick(Sender: TObject);
    procedure dsServicesAfterOpen(DataSet: TDataSet);
    procedure tbOkPTClick(Sender: TObject);
    procedure ToolBar7Click(Sender: TObject);
    procedure srcPersonelTarifStateChange(Sender: TObject);
    procedure srcDecodersStateChange(Sender: TObject);
    procedure srcDiscountDataChange(Sender: TObject; Field: TField);
    procedure srcPersonelTarifDataChange(Sender: TObject; Field: TField);
    procedure srcCustAttributesDataChange(Sender: TObject; Field: TField);
    procedure dbGridCustReqDblClick(Sender: TObject);
    procedure dbgCustPaymentDblClick(Sender: TObject);
    procedure actLanAddExecute(Sender: TObject);
    procedure actLanEditExecute(Sender: TObject);
    procedure actLanDeleteExecute(Sender: TObject);
    procedure tbDecOkClick(Sender: TObject);
    procedure memCustNoticeExit(Sender: TObject);
    procedure memCustNoticeChange(Sender: TObject);
    procedure tbDecCancelClick(Sender: TObject);
  private
    { Private declarations }
    fMasterGrid : TDBGridEh;
    fMasterDS   : TDataSource;
    UpdatetNotice : Boolean;
    FullAccess : Boolean;
    ChangeHistoty : boolean;
    procedure SetMasterDataSource(Value : TDataSource);
    procedure SetMasterGrid(Value : TDBGridEh);
    procedure InitSecurity;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
  published
    property MasterDataSource : TDataSource write SetMasterDataSource;
    property MasterGrid : TDBGridEh write SetMasterGrid;
  end;

implementation

uses
  DM, MAIN, SubscrHistory, OnOffServicesForma, ChoiseForma, SelectLetterTypeForma, PeriodForma, CancelContractForma, RequestForma,
  DiscountForma, EditAttributeForma, RequestsForma, PaymentForma, PaymentDocForma, CustomerLanForma, CustChannelForma,
  AtrStrUtils, CustBillingForma, RxStrUtils, atrCmdUtils, CustBillUTMForma, ScriptModule, SelectColumnsForma, ExportSettingsForma,
  TextEditForma, HouseMapForma, SendMessagesForma, fs_iinterpreter;

{$R *.dfm}

constructor TCustomerAddons.Create(AOwner: TComponent) ;
var
  vVisibleSum : Boolean;
  vAsBalance  : Boolean;
begin
   //"OnCreate" code
   inherited Create(AOwner) ;
   fMasterGrid := nil;
   InitSecurity;
   UpdatetNotice := False;

  dbgCustSubscrServ.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgCustSubscrServ', [crpColIndexEh,crpColWidthsEh,crpColVisibleEh]);
  dbgSingleServ.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,     'dbgSingleServ',     [crpColIndexEh,crpColWidthsEh,crpColVisibleEh]);
  dbgCustPayment.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,    'dbgCustPayment',    [crpColIndexEh,crpColWidthsEh,crpColVisibleEh]);
  dbGridCustReq.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,     'dbGridCustReq',     [crpColIndexEh,crpColWidthsEh,crpColVisibleEh]);
  dbgCustAttr.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,       'dbgCustAttr',       [crpColIndexEh,crpColWidthsEh,crpColVisibleEh]);

  {$IFNDEF DEMOVERSION}
  sbRecalc.PopupMenu := pmRecalc;
  {$ENDIF}

  //проверим есть ли обещанные платежи у абонентов
  // будем проверять обещанные платежи или нет
  pnlPrepay.Visible := FALSE;
  with TpFIBQuery.Create(Nil) do
  try
    DataBase := dmMain.dbTV;
    Transaction := dmMain.trReadQ;
    SQL.Text:='SELECT count(Customer_Id) as PCOUNT FROM Prepay';
    Transaction.StartTransaction;
    ExecQuery;
    pnlPrepay.Visible := (FieldByName('PCOUNT').Value > 0);
    Close;
    Transaction.Commit;
  finally
    Free;
  end;

  {$IFDEF DIGIT}
  tsDigitTV.TabVisible := True;
  {$ELSE}
  tsDigitTV.TabVisible := False;
  {$ENDIF}

  {$IFDEF LAN}
  tsLANInfo.TabVisible := True;
  {$ELSE}
  tsLANInfo.TabVisible := False;
  {$ENDIF}

  vVisibleSum := dmMain.AllowedAction(rght_Customer_Debt);                            // просмотр сумм
  gbSaldo.Visible := vVisibleSum;
  vAsBalance  := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1'); // знак долга
  if vAsBalance
  then begin
    gbSaldo.Caption := ' БАЛАНС ';
    DBTextDebt.DataField := 'BALANCE';
  end
  else begin
    gbSaldo.Caption := ' Сальдо расчетов ';
    DBTextDebt.DataField := 'DEBT_SUM';
  end;
end;

procedure TCustomerAddons.dbgCustPaymentDblClick(Sender: TObject);
begin
  if dsPayment.FieldByName('pay_doc_id').IsNull then exit;
  CreatePayDoc(dsPayment.FieldByName('pay_doc_id').AsInteger);
end;

procedure TCustomerAddons.dbGridCustReqDblClick(Sender: TObject);
var
  aRequest  : Integer;
  aCustomer : Integer;
  aMode     : Byte;
  CE, FullAccess, CC, CG, CA : Boolean;
begin
  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_Request_Full);
  CE := dmMain.AllowedAction(rght_Request_Edit); 
  CC := dmMain.AllowedAction(rght_Request_Close);
  CG := dmMain.AllowedAction(rght_Request_Give);
  CA := dmMain.AllowedAction(rght_Request_Add); 

  if not(FullAccess or CE or CC or CG or CA) then Exit;


  if not dsRequests.FieldByName('RQ_ID').IsNull
  then begin
    if not(FullAccess or CE or CC or CG)then Exit;
    aMode := 1;
    aRequest := dsRequests.FieldByName('RQ_ID').AsInteger;
  end
  else begin
    if not(FullAccess or CA) then Exit;
    aMode := 0;
    aRequest := -1;
  end;

  aCustomer := fMasterDS.DataSet.FieldByName('CUSTOMER_ID').AsInteger;

  ReguestExecute (aRequest, aCustomer, aMode);
  dsRequests.closeopen(true);
end;

destructor TCustomerAddons.Destroy;
begin
  dbgCustSubscrServ.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgCustSubscrServ', false);
  dbgSingleServ.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgSingleServ', false);
  dbgCustPayment.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgCustPayment', false);
  dbGridCustReq.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGridCustReq', false);
  dbgCustAttr.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgCustAttr', false);
end;

procedure TCustomerAddons.dsBillingAfterOpen(DataSet: TDataSet);
begin
  if dsBilling.RecordCount>0
  then begin

    // пока не доделал редактирование UTM
    if dmMain.GetSettingsValue('USED_BILLING') = 2
    then actBilling.Enabled := false;
  end
  else actBilling.Enabled := True;
end;

procedure TCustomerAddons.dsBillingCalcFields(DataSet: TDataSet);
begin
  // переведем в HEX формат для NetAMS
  if dsBilling.FieldByName('ACCOUNT_ID').IsNull
  then dsBilling.FieldByName('ACCOUNT_HEX').Clear
  else dsBilling['ACCOUNT_HEX'] :=  Dec2Hex(dsBilling['ACCOUNT_ID'],6);

  if dsBilling.FieldByName('UNIT_ID').IsNull
  then dsBilling.FieldByName('UNIT_HEX').Clear
  else dsBilling['UNIT_HEX'] := Dec2Hex(dsBilling['UNIT_ID'],6);
end;

procedure TCustomerAddons.dsPersonelTarifNewRecord(DataSet: TDataSet);
begin
  DataSet['CUSTOMER_ID'] := dsServices['CUSTOMER_ID'];
  DataSet['SERVICE_ID'] := dsServices['SERV_ID'];
  if (dmMain.GetSettingsValue('SET_AS_CURRENT_DATE')<> '0') then begin
    DataSet['DATE_FROM'] := NOW;
    DataSet['DATE_TO'] := NOW;
  end;
  DataSet['TARIF_SUM'] := 0;
end;

procedure TCustomerAddons.dsServicesAfterOpen(DataSet: TDataSet);
begin
  dsPersonelTarif.Active := True and pnlPersonelTarif.Visible;
end;

procedure TCustomerAddons.dsServicesBeforeClose(DataSet: TDataSet);
begin
  dsPersonelTarif.Active := False;
end;

procedure TCustomerAddons.SetMasterGrid(Value : TDBGridEh);
begin
  fMasterGrid := Value;
end;

procedure TCustomerAddons.srcCustAttributesDataChange(Sender: TObject;
  Field: TField);
begin
 bbEditAtr.Enabled := ((sender as TDataSource).DataSet.RecordCount>0) and bbAddAtr.Enabled;
  bbDelAtr.Enabled := ((sender as TDataSource).DataSet.RecordCount>0) and bbAddAtr.Enabled;
end;

procedure TCustomerAddons.srcDecodersStateChange(Sender: TObject);
begin
  actDigitChanelAdd.Enabled := (srcDecoders.DataSet.RecordCount > 0);
end;

procedure TCustomerAddons.srcDiscountDataChange(Sender: TObject;
  Field: TField);
begin
  tbtarDel.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and tbtarAdd.Enabled;
  tbtarEdit.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and tbtarAdd.Enabled;
end;

procedure TCustomerAddons.srcPersonelTarifDataChange(Sender: TObject;
  Field: TField);
begin
  bbEditTarif.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and bbAddTarif.Enabled;
  bbDelTarif.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and bbAddTarif.Enabled;
end;

procedure TCustomerAddons.srcPersonelTarifStateChange(Sender: TObject);
begin
  tbOkPT.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancelPT.Enabled := tbOkPT.Enabled;
  bbAddTarif.Enabled := not tbOkPT.Enabled;
  bbEditTarif.Enabled := not tbOkPT.Enabled;
  bbDelTarif.Enabled := not tbOkPT.Enabled;
end;

procedure TCustomerAddons.srcServicesDataChange(Sender: TObject;
  Field: TField);
begin
  ActSrvOff.Enabled := (sender as TDataSource).DataSet.FieldValues['state_sgn'] = 1;
  ActSrvOn.Enabled := (not (bbOfService.Enabled)) and (not (sender as TDataSource).DataSet.FieldByNAme('state_sgn').IsNull);
  actSubscrHistory.Enabled := (not (sender as TDataSource).DataSet.FieldByNAme('NAME').IsNull);
end;

procedure TCustomerAddons.srcSingleSerivceDataChange(Sender: TObject;
  Field: TField);
begin
  bbDelSingleService.Enabled := (not (sender as TDataSource).DataSet.FieldByNAme('NAME').IsNull);
end;

procedure TCustomerAddons.tbDecCancelClick(Sender: TObject);
begin
  if srcDecoders.State in [dsEdit,dsInsert] then   dsDecoders.Cancel;
end;

procedure TCustomerAddons.tbDecOkClick(Sender: TObject);
begin
  if srcDecoders.State in [dsEdit,dsInsert] then   dsDecoders.Post;
end;

procedure TCustomerAddons.tbOkPTClick(Sender: TObject);
begin
  dsPersonelTarif.Post;
end;

procedure TCustomerAddons.ToolBar7Click(Sender: TObject);
begin
  dsPersonelTarif.Cancel;
end;

procedure TCustomerAddons.SetMasterDataSource(Value : TDataSource);
begin
  fMasterDS                   := Value;
  dsDiscount.DataSource       := Value;
  dsSingleService.DataSource  := Value;
  dsDecoders.DataSource       := Value;
  dsPayment.DataSource        := Value;
  dsLetters.DataSource        := Value;
  dsPrepay.DataSource         := Value;
  dsLAN.DataSource            := Value;
  dsCustAttributes.DataSource := Value;
  dsBilling.DataSource        := Value;
  dsServices.DataSource       := Value;
  dsChannels.DataSource       := Value;
  dsServicesHistory.DataSource:= Value;
end;

procedure TCustomerAddons.ActAddPaymentExecute(Sender: TObject);
var
  dt : TDate;
  sm : Currency;
begin
  dt := NOW;
  sm := 0;
  if ReceivePayment(fMasterDS.DataSet['CUSTOMER_ID'], -1, -1, dt, sm)<>-1
  then begin
    if dsPayment.Active
    then dsPayment.CloseOpen(true);
    fMasterDS.Dataset.Refresh;
  end;
end;

procedure TCustomerAddons.actAtributeAddExecute(Sender: TObject);
begin
  dsCustAttributes.append;
  if EditAttribute(fMasterDS.Dataset['CUSTOMER_ID'],'')
  then begin
    dsCustAttributes.post;
    dsCustAttributes.Close;
    dsCustAttributes.OPen;
    fMasterDS.Dataset.Refresh;
  end
  else dsCustAttributes.Cancel;
end;

procedure TCustomerAddons.actAtributeDelExecute(Sender: TObject);
begin
  if (MessageDlg('Удалить информацию ('+srcCustAttributes.DataSet['O_NAME']+') ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then begin
    srcCustAttributes.DataSet.Delete;
    fMasterDS.Dataset.Refresh;
  end;
end;

procedure TCustomerAddons.actAtributeEditExecute(Sender: TObject);
begin
//  srcCustAttributes.DataSet.Edit;
  dsCustAttributes.Edit;
  if EditAttribute(fMasterDS.Dataset['CUSTOMER_ID'],dsCustAttributes['O_NAME'])
  then begin
    dsCustAttributes.post;
    dsCustAttributes.Close;
    dsCustAttributes.OPen;
  end
  else dsCustAttributes.Cancel;
end;

procedure TCustomerAddons.actBillingExecute(Sender: TObject);
var
  i :Integer;
begin
  if not dsBilling.Active then Exit;
  if dsBilling.FieldByName('CUSTOMER_ID').IsNull
  then i := 0 // если есть записи. то изменим
  else i:=1;  // если нет - добавим
  if dmMain.GetSettingsValue('USED_BILLING') = 2 // это UTM
  then begin
    if UTMBillingAction(fMasterDS.Dataset.FieldByName('CUSTOMER_ID').AsInteger, i)
    then dsBilling.CloseOpen(true);
  end
  else begin
    if BillingAction(fMasterDS.Dataset.FieldByName('CUSTOMER_ID').AsInteger, i)
    then dsBilling.CloseOpen(true);
  end;
end;

procedure TCustomerAddons.actDigitChanelAddExecute(Sender: TObject);
begin
  if CustomerChannels(dsDecoders['DEC_ID'],-1)
  then dsChannels.CloseOpen(true);
end;

procedure TCustomerAddons.actDigitChanelDelExecute(Sender: TObject);
begin
  if (MessageDlg('Удалить данные о канале '+dsChannels['CH_NAME']+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then begin
    dsChannels.Delete;
  end;
end;

procedure TCustomerAddons.actDigitChanelEditExecute(Sender: TObject);
begin
  if CustomerChannels(dsDecoders['DEC_ID'],dsChannels['CH_ID'])
  then dsChannels.CloseOpen(true);
end;

procedure TCustomerAddons.actDigitDecoderAddExecute(Sender: TObject);
begin
  dsDecoders.Insert;
  dsDecoders['CUSTOMER_ID'] := fMasterDS.Dataset['CUSTOMER_ID'];
end;

procedure TCustomerAddons.actDigitDecoderDelExecute(Sender: TObject);
begin
  if (MessageDlg('Вы желаете удалить декодер?', mtWarning, [mbYes, mbNo], 0) = mrYes) then  dsDecoders.Delete;
end;

procedure TCustomerAddons.actDigitDecoderEditExecute(Sender: TObject);
begin
  dsDecoders.Edit;
  dsDecoders['CUSTOMER_ID'] := fMasterDS.Dataset['CUSTOMER_ID'];
end;

procedure TCustomerAddons.actDiscountAddExecute(Sender: TObject);
begin
  AddEditDiscount(-1, fMasterDS.Dataset['CUSTOMER_ID']);
  dsDiscount.CloseOpen(true);
  actReCalcExecute(Sender);
end;

procedure TCustomerAddons.actDiscountDelExecute(Sender: TObject);
begin
  if (MessageDlg('Удалить скидку?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then dsDiscount.Delete;
end;

procedure TCustomerAddons.actDiscountEditExecute(Sender: TObject);
begin
  AddEditDiscount(dsDiscount['DISCOUNT_ID'], fMasterDS.Dataset['CUSTOMER_ID']);
  dsDiscount.CloseOpen(true);
  actReCalcExecute(Sender);
end;

procedure TCustomerAddons.actLanAddExecute(Sender: TObject);
begin
  if EditCustomerLAN(fMasterDS.Dataset['CUSTOMER_ID'],-1)
  then dsLAN.CloseOpen(true);
end;

procedure TCustomerAddons.actLanDeleteExecute(Sender: TObject);
begin
  if (MessageDlg('Удалить данные?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then begin
    dsLAN.Delete;
  end;
end;

procedure TCustomerAddons.actLanEditExecute(Sender: TObject);
begin
  if EditCustomerLAN(fMasterDS.Dataset['CUSTOMER_ID'],dsLAN['LAN_ID'])
  then dsLAN.CloseOpen(true);
end;

procedure TCustomerAddons.ActLanPingExecute(Sender: TObject);
var
  s : string;
begin
  Screen.Cursor := crHourGlass;
  s := Ping(dsLAN['IP']);
  Screen.Cursor := crDefault;
  ShowMessage( s );
end;

procedure TCustomerAddons.actLetterDelExecute(Sender: TObject);
var
  all: Boolean;
  Save_Cursor : TCursor;
  i : Integer;
begin
  if (MessageDlg('Удалить информацию о письме?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
  then Exit;

  all := false;

  if Assigned(fMasterGrid)
  then
    if (fMasterGrid.SelectedRows.Count>0)
    then  all := (MessageDlg('Применить ко всем выделенным абонентам', mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if all
  then begin
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;    { Show hourglass cursor }
    for i:=0 to fMasterGrid.SelectedRows.Count-1 do begin
      fMasterGrid.DataSource.DataSet.Bookmark :=fMasterGrid.SelectedRows[i];
      dsLetters.CloseOpen(True);
      try
        if not dsLetters.EOF then dsLetters.Delete;
      except
      end;
    end;
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end
  else dsLetters.Delete;

end;

procedure TCustomerAddons.actReCalcExecute(Sender: TObject);
begin
  with TpFIBQuery.Create(Self) do
  try
    Database := dmMain.dbTV;
    Transaction := dmMain.trWriteQ;
    Transaction.StartTransaction;   
    sql.text := 'EXECUTE PROCEDURE FULL_RECALC_CUSTOMER('+fMasterDS.Dataset.FieldByName('customer_id').AsString+')';
    ExecQuery;
    Transaction.Commit;
    fMasterDS.Dataset.Refresh;
  finally
    free;
  end
end;

procedure TCustomerAddons.actRequestExecute(Sender: TObject);
var
  aRequest  : Integer;
  aCustomer : Integer;
  aMode     : Byte;
  bm        : TBookMark;
begin
  aRequest := -1;
  aMode := 0;
  aCustomer := fMasterDS.Dataset['CUSTOMER_ID'];

  aRequest := ReguestExecute (aRequest, aCustomer, aMode);
  if ((aRequest>0) and  (pcAddInfo.ActivePage = tsRequests))
  then begin
    bm :=  dsRequests.GetBookmark;
    dsRequests.CloseOpen(true);
    dsRequests.GotoBookmark(bm);
  end;
end;

procedure TCustomerAddons.actSingleSrvAddExecute(Sender: TObject);
begin
  if NewService(fMasterDS.Dataset['Customer_ID'],1)
  then begin
    dsSingleService.CloseOpen(true);
    fMasterDS.Dataset.Refresh;
  end;
  if Assigned(fMasterGrid) then fMasterGrid.SetFocus;
end;

procedure TCustomerAddons.actSrvAddExecute(Sender: TObject);
begin
  if NewService(fMasterDS.Dataset['Customer_ID'],0)
  then begin
    dsServices.CloseOpen(true);
    fMasterDS.Dataset.Refresh;
  end;
  if Assigned(fMasterGrid) then fMasterGrid.SetFocus;
end;

procedure TCustomerAddons.ActSrvOffExecute(Sender: TObject);
var
 s: string;
begin
  if dsServices.FieldByName('Notice').IsNull
  then s:=''
  else s:=dsServices['Notice'];

  if OnOffService(fMasterDS.Dataset.FieldValues['Customer_ID'],dsServices.FieldValues['SERV_ID'],dsServices.FieldValues['SUBSCR_SERV_ID'], True,s)
  then begin
    dsServices.CloseOpen(true);
    fMasterDS.Dataset.Refresh;
  end;
  if Assigned(fMasterGrid) then fMasterGrid.SetFocus;
end;

procedure TCustomerAddons.ActSrvOnExecute(Sender: TObject);
var
  s: string;
begin
  if dsServices.FieldByName('Notice').IsNull
  then s:=''
  else s:=dsServices.FieldByName('Notice').AsString;
  if OnOffService(fMasterDS.Dataset.FieldValues['Customer_ID'],dsServices.FieldValues['SERV_ID'],dsServices.FieldValues['SUBSCR_SERV_ID'], False, s )
  then begin
    dsServices.CloseOpen(true);
    fMasterDS.Dataset.Refresh;
  end;
  if Assigned(fMasterGrid) then fMasterGrid.SetFocus;
end;

procedure TCustomerAddons.actSrvPauseExecute(Sender: TObject);
var
 s: string;
begin
  if dsServices.FieldByName('Notice').IsNull
  then s:=''
  else s:=dsServices['Notice'];

  if PauseService(fMasterDS.Dataset.FieldValues['Customer_ID'],dsServices.FieldValues['SERV_ID'],dsServices.FieldValues['SUBSCR_SERV_ID'], s)
  then begin
    dsServices.CloseOpen(true);
    fMasterDS.Dataset.Refresh;
  end;
  if Assigned(fMasterGrid) then fMasterGrid.SetFocus;
end;

procedure TCustomerAddons.actSrvSwitchExecute(Sender: TObject);
var
  s: string;
begin
  if dsServices.FieldByName('Notice').IsNull
  then s:=''
  else s:=dsServices.FieldByName('Notice').AsString;
  if SwitchServics(fMasterDS.Dataset.FieldValues['Customer_ID'],dsServices.FieldValues['SERV_ID'],dsServices.FieldValues['SUBSCR_SERV_ID'], s )
  then begin
    dsServices.CloseOpen(true);
    fMasterDS.Dataset.Refresh;
  end;
  if Assigned(fMasterGrid) then fMasterGrid.SetFocus;
end;

procedure TCustomerAddons.actSubscrHistoryExecute(Sender: TObject);
var
  bm : TBookMark;
begin
  bm := dsServices.GetBookmark;
  if ShowCustSubscrHistory(fMasterDS.Dataset.FieldValues['Customer_ID'],dsServices.FieldValues['Serv_ID']) and ((FullAccess) or (dmMain.AllowedAction(rght_Customer_History)))
  then begin
    actReCalc.Execute;
    dsServices.CloseOpen(True);
    dsServices.GotoBookmark(bm);
  end;
  if Assigned(fMasterGrid) then fMasterGrid.SetFocus;
end;

procedure TCustomerAddons.bbAddTarifClick(Sender: TObject);
begin
  srcPersonelTarif.DataSet.Insert;
end;

procedure TCustomerAddons.bbDelSingleServiceClick(Sender: TObject);
var
  CanDelete : boolean;
  AllowDelete : boolean;
begin
    //права
  AllowDelete := (dmMain.AllowedAction(rght_Customer_DelSrv));
  if not (AllowDelete  or FullAccess) then exit;
  if AllowDelete
     and (not ChangeHistoty)
     and (dsSingleService.FieldByName('SERV_DATE').AsDateTime < dmMain.CurrentMonth) then Exit;


  with TpFIBQuery.Create(Self) do
  try
    Database := dmMain.dbTV;
    Transaction := dmMain.trReadQ;
    dmMain.trReadQ.Active := true;
    sql.text := 'SELECT count(sl.LINK_ID) FROM SERVICES_LINKS sl' + #13#10 +
                'where sl.CHILD = '+dsSingleService.FieldByName('SERVICE_ID').AsString + #13#10 +
                'and sl.LINK_TYPE = 1 and sl.PARENT is null';
    ExecQuery;
    candelete:= Fields[0].AsInteger > 0;
    close;
  finally
    free;
  end;
  if CanDelete then
    if (MessageDlg('Удалить услугу "'+dsSingleService['name']+'"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then begin
      dsSingleService.Delete;
      fMasterDS.Dataset.Refresh;
    end;

end;

procedure TCustomerAddons.bbDelTarifClick(Sender: TObject);
begin
  if (MessageDlg('Удалить тариф ?'+#13#10 + 'Внимание! Баланс абонента может измениться!', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcPersonelTarif.DataSet.Delete
end;

procedure TCustomerAddons.bbEditTarifClick(Sender: TObject);
begin
  srcPersonelTarif.DataSet.Edit;
end;

procedure TCustomerAddons.btnUTMInfoClick(Sender: TObject);
var
  s : string;
begin
  s := SM.GetUTM_User_info(dsBilling.FieldByName('UNIT_ID').AsString );
  if Length(s)<10 then s := 'Ошибка получения информации';
  ShowMessage(s);
end;



procedure TCustomerAddons.FrameResize(Sender: TObject);
begin
  memState.Height := tsAddInfo.Height - memState.Top -10;
end;

procedure TCustomerAddons.InitSecurity;
var
  vBool : Boolean;
  vFINE : Boolean;
  vShowPaySRV :Boolean;
  i : Integer;
begin
  FullAccess := (dmMain.AllowedAction(rght_Customer_full));
  ChangeHistoty := (dmMain.AllowedAction(rght_Customer_History));

  actRequest.Enabled        := dmMain.AllowedAction(rght_Request_Add) or dmMain.AllowedAction(rght_Request_Full);
  ActAddPayment.Enabled     := dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_full);
//  actSubscrHistory.Visible  := (dmMain.AllowedAction(rght_Customer_History)) or FullAccess;

  actReCalc.Visible         := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FullAccess;

  bbAddService.Visible      := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FullAccess;
  bbOnService.Visible       := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FullAccess;
  bbOfService.Visible       := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FullAccess;
  bbSingleServiceAdd.Visible:= (dmMain.AllowedAction(rght_Customer_DelSrv)) or FullAccess;
  bbDelSingleService.Visible:= (dmMain.AllowedAction(rght_Customer_DelSrv)) or FullAccess;

  //коэффициенты
  tbKoeff.Visible           := (dmMain.AllowedAction(rght_Customer_edit)) or FullAccess;
  tbtarAdd.Enabled          := tbKoeff.Visible;

  //персональный тариф
  bbAddTarif.Enabled        := (dmMain.AllowedAction(rght_Customer_AddSrv)) or FullAccess;

  //атрибуты
  tbAttributes.Visible      := (dmMain.AllowedAction(rght_Customer_edit)) or FullAccess;
  bbAddAtr.Enabled          := tbAttributes.Visible;

  // скроем не нужные столбцы
  vFINE       := (dmMain.GetSettingsValue('SHOW_FINE') = '1');    // пеня
  vShowPaySRV := (dmMain.GetSettingsValue('PAYMENT_SRV') = '1');  // услуга
  for i := 0 to dbgCustPayment.Columns.Count-1 do begin
    if (UPPERCASE(dbgCustPayment.Columns[i].FieldName) = 'O_NAME')
      then dbgCustPayment.Columns[i].Visible := vSF;
    if (UPPERCASE(dbgCustPayment.Columns[i].FieldName) = 'FINE_SUM')
      then dbgCustPayment.Columns[i].Visible := vFINE;
    if (UPPERCASE(dbgCustPayment.Columns[i].FieldName) = 'NAME')
      then dbgCustPayment.Columns[i].Visible := vShowPaySRV;
  end;

  // настроим биллинга
  {$IFDEF LAN}
  if not VarIsNull(dmMain.GetSettingsValue('USED_BILLING'))
  then i := dmMain.GetSettingsValue('USED_BILLING')
  else i := 0;
    case i of
      1: begin
           tsBilling.Caption := ' NetAMS 3.4 ';
           pnlNetams.Visible := true;
         end;
      2: begin
        tsBilling.Caption := ' UTM 5 ';
        pnlUTM.Visible := True;
      end;
      3: begin
        tsBilling.Caption := ' Логин/Пароль ';
        lblInet.Visible := False;
        edInet.Visible := False;
      end;
      else tsBilling.Caption := ' Биллинг ';
    end;
  tsBilling.TabVisible := (i>0) and dmMain.AllowedAction(rght_Billing_view);  // просмотр биллинга
  actBilling.Enabled   := (i>0) and dmMain.AllowedAction(rght_Billing_edit);  // правка биллинга
  {$ELSE}
   tsBilling.TabVisible := False;
  {$ENDIF}
  // Цифра
  vBool := dmMain.AllowedAction(rght_Customer_EditDigit);

  actDigitChanelAdd.Enabled   := vBool;
  actDigitChanelEdit.Enabled  := vBool;
  actDigitChanelDel.Enabled   := vBool;
  actDigitDecoderAdd.Enabled  := vBool;
  actDigitDecoderEdit.Enabled := vBool;
  actDigitDecoderDel.Enabled  := vBool;


end;

procedure TCustomerAddons.memCustNoticeChange(Sender: TObject);
begin
  UpdatetNotice := True;
end;

procedure TCustomerAddons.memCustNoticeExit(Sender: TObject);
begin
  if UpdatetNotice
  then begin
    with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text:='UPDATE Customer SET Notice = :Notice WHERE (Customer_Id = :Customer_Id)';
      ParamByName('Notice').AsString := memCustNotice.Lines.Text;
      ParamByName('Customer_Id').AsInt64 := fMasterDS.Dataset['Customer_id'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
    fMasterDS.Dataset.Refresh;
  end;
  UpdatetNotice := False;
end;

procedure TCustomerAddons.pcAddInfoChange(Sender: TObject);
begin
  dsPayment.Active       := (pcAddInfo.ActivePage = tsPayments);

  pnlPersonelTarif.Visible := (pcAddInfo.ActivePage = tsSubscrServ) and (VarToStr(dmMain.GetSettingsValue('PERSONEL_TARIF'))='1');
  dsServices.Active      := (pcAddInfo.ActivePage = tsSubscrServ);

  dsLetters.Active       := (pcAddInfo.ActivePage = tsCustLetter);

  dsSingleService.Active := (pcAddInfo.ActivePage = tsSingleServ);

  dsDiscount.Active      := (pcAddInfo.ActivePage = tsDiscFactor);

  dsRequests.Active      := (pcAddInfo.ActivePage = tsRequests);

  //tsAttributes
  dsCustAttributes.Active:= (pcAddInfo.ActivePage = tsAttributes);

  dsLan.Active     := (pcAddInfo.ActivePage = tsLANInfo);
  dsBilling.Active := (pcAddInfo.ActivePage = tsBilling);

  dsChannels.Active:= (pcAddInfo.ActivePage = tsDigitTV);
  dsDecoders.Active:= (pcAddInfo.ActivePage = tsDigitTV);

  // выведем обещанный платеж абонента
  dsPrepay.Active:= (pcAddInfo.ActivePage = tsAddInfo) and pnlPrepay.Visible;
end;



end.
