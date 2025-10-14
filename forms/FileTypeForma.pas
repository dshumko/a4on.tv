unit FileTypeForma;

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
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, DBLookupEh,
  VCLTee.TeCanvas, PrnDbgeh;

type
  TFileTypeForm = class(TGridForm)
    dsFileType: TpFIBDataSet;
    pmMemo: TPopupMenu;
    dsSrvType: TpFIBDataSet;
    srcSrvType: TDataSource;
    dsReqType: TpFIBDataSet;
    srcReqType: TDataSource;
    dsOnOffSrv: TpFIBDataSet;
    srcOnOffSrv: TDataSource;
    dsReqTempl: TpFIBDataSet;
    srcReqTempl: TDataSource;
    gbJSON: TGroupBox;
    lcbRequest: TDBLookupComboboxEh;
    lcbTempl: TDBLookupComboboxEh;
    chkOpenInet: TDBCheckBoxEh;
    lcbOnOffSrv: TDBLookupComboboxEh;
    lcbSrvType: TDBLookupComboboxEh;
    cbOnOff: TDBComboBoxEh;
    pnlTop: TPanel;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl1: TLabel;
    lcbSingleSrv: TDBLookupComboboxEh;
    srcSingleSrv: TDataSource;
    dsSingleSrv: TpFIBDataSet;
    edtNameFmt: TDBEditEh;
    mmoNOTICE: TDBMemoEh;
    chkMemoRO: TDBCheckBoxEh;
    chkText: TDBCheckBoxEh;
    chkMobilePhone: TDBCheckBoxEh;
    chkCustomerCard: TDBCheckBoxEh;
    chkPassport: TDBCheckBoxEh;
    chkAddress: TDBCheckBoxEh;
    chkPaySum: TDBCheckBoxEh;
    chkBid: TDBCheckBoxEh;
    edtHint: TDBEditEh;
    chkTask: TDBCheckBoxEh;
    btnColorSet: TButtonColor;
    btnColorClear: TButton;
    chkNameRO: TDBCheckBoxEh;
    chkOwner: TDBCheckBoxEh;
    cbPeriod: TDBComboBoxEh;
    lbl3: TLabel;
    edtText1: TDBEditEh;
    Заявка: TLabel;
    lbl4: TLabel;
    dsService: TpFIBDataSet;
    srcService: TDataSource;
    lcbService: TDBLookupComboboxEh;
    lcbServiceFrom: TDBLookupComboboxEh;
    lbl5: TLabel;
    lblText1: TLabel;
    lblText2: TLabel;
    edtText2: TDBEditEh;
    lblText3: TLabel;
    edtText3: TDBEditEh;
    lbl11: TLabel;
    lcbAllowFT: TDBLookupComboboxEh;
    srcAllowFT: TDataSource;
    dsAllowFT: TpFIBDataSet;
    edtPROC: TDBEditEh;
    chkMat: TDBCheckBoxEh;
    chkMatCustOnly: TDBCheckBoxEh;
    actCopyID: TAction;
    chkFileReq: TDBCheckBoxEh;
    lblText4: TLabel;
    edtText4: TDBEditEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure chkCustomerCardClick(Sender: TObject);
    procedure chkPassportClick(Sender: TObject);
    procedure btnColorSetClick(Sender: TObject);
    procedure btnColorClearClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure cbOnOffChange(Sender: TObject);
    procedure edtHintEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edtText1EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edtText2EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edtText3EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure actCopyIDExecute(Sender: TObject);
    procedure edtText4EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FOwner: Boolean;
    procedure memoMiClick(Sender: TObject);
    procedure StartEdt(const New: Boolean = False);
    procedure StopEdt(const Cancel: Boolean);
    procedure ParseJson(const json: String);
    function GetJson: String;
    procedure InitControls;
    procedure SetCheckOwner;
    procedure ShowHideControls;
    procedure ResizeButtons;
  public
    { Public declarations }
  end;

var
  FileTypeForm: TFileTypeForm;

implementation

uses
  System.StrUtils, DM, JsonDataObjects, TextVarSettingsForma, MAIN;

{$R *.dfm}

procedure TFileTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsFileType.Close;
  FileTypeForm := nil;
end;

procedure TFileTypeForm.FormCreate(Sender: TObject);
var
  NewItem: TMenuItem;
begin
  inherited;

  pmMemo.Items.Clear;

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldACCOUNT;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFULLNAME;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldSTREET;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldHouse;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFlat;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldCodeAbonent;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldOperator;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldCurrentDate;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFileSrv;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFileDate;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFileOnOffSrv;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPassportN;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPassportName;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  // rsFldPassportName = '[ПАСПОРТ_ФИО]';
  // rsFldPassportReg = '[ПАСПОРТ_РЕГИСТР]';
  // rsFldPassportPerm = '[ПАСПОРТ_ПРОПИСКА]';
  // rsFldPassportIssue = '[ПАСПОРТ_ВЫДАН]';
  // rsFldPassportDIssue = '[ПАСПОРТ_ДАТА_ВЫДАН]';

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPassportResidence;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPassportIssue;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPassportDate;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPassportBirthPlace;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPassportBirthDate;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldContract;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldContractDate;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFile;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFileName;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldMobile;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldText;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldText1;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsBidN;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldPAYMENT;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsAddress;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldSaldo;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldBalance;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsOldAccount;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsOldCode;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsOldAddress;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldNOTICE;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  if (dmMain.GetSettingsValue('FLAT_OWNER') = '1') then
  begin
    NewItem := TMenuItem.Create(pmMemo);
    NewItem.Caption := rsFldOwner;
    NewItem.OnClick := memoMiClick;
    pmMemo.Items.Add(NewItem);

    NewItem := TMenuItem.Create(pmMemo);
    NewItem.Caption := rsFldOwnerText;
    NewItem.OnClick := memoMiClick;
    pmMemo.Items.Add(NewItem);
  end;
end;

procedure TFileTypeForm.FormResize(Sender: TObject);
begin
  inherited;
  ResizeButtons;
end;

procedure TFileTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdt(True);
end;

procedure TFileTypeForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdt(True);
end;

procedure TFileTypeForm.btnColorClearClick(Sender: TObject);
begin
  inherited;
  btnColorSet.SymbolColor := clBtnFace;
  if not(srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Edit;
  srcDataSource.DataSet.FieldByName('O_DIMENSION').Clear;
end;

procedure TFileTypeForm.btnColorSetClick(Sender: TObject);
begin
  inherited;
  if not(srcDataSource.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Edit;
  srcDataSource.DataSet['O_DIMENSION'] := ColorToString(btnColorSet.SymbolColor);
end;

procedure TFileTypeForm.btnSaveLinkClick(Sender: TObject);
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
    StopEdt(False);
end;

procedure TFileTypeForm.ShowHideControls;
var
  WindowLocked: Boolean;
  t: Integer;
begin
  inherited;

  inherited;

  WindowLocked := LockWindowUpdate(Self.Handle);
  try
    if VarIsNull(cbOnOff.Value) or (cbOnOff.Value = '') then
      t := 0
    else
      t := cbOnOff.Value;

    if (t = 2) then
    begin
      t := Round((gbJSON.Width - lcbSrvType.Left - lcbSrvType.Width - 7) / 3);

      lcbService.Left := lcbServiceFrom.Left + t;
      lcbOnOffSrv.Left := gbJSON.Width - t;
      lcbOnOffSrv.Width := t - 7;
      lcbServiceFrom.Width := t - 7; // lcbOnOffSrv.Left - lcbService.Left - 7;
      lcbService.Width := t - 7;
      lcbServiceFrom.Visible := True;
    end
    else
    begin
      t := Round((gbJSON.Width - lcbSrvType.Left - lcbSrvType.Width - 7) / 2);

      lcbServiceFrom.Visible := False;
      lcbService.Left := lcbServiceFrom.Left;
      lcbService.Width := t - 7;
      lcbOnOffSrv.Left := gbJSON.Width - t;
      lcbOnOffSrv.Width := t - 7;
    end;

    ResizeButtons;
  finally
    if WindowLocked then
      LockWindowUpdate(0);
  end;
end;

procedure TFileTypeForm.ResizeButtons;
var
  fw: Integer;
begin
  fw := pnlEdit.Width;
  fw := Trunc((fw - 5 * (lblText1.Width + 12)) / 5);

  edtHint.Width := fw;

  lblText1.Left := edtHint.Left + edtHint.Width + 5;
  edtText1.Left := lblText1.Left + lblText1.Width + 5;
  edtText1.Width := fw;

  lblText2.Left := edtText1.Left + edtText1.Width + 5;
  edtText2.Left := lblText2.Left + lblText2.Width + 5;
  edtText2.Width := fw;

  lblText3.Left := edtText2.Left + edtText2.Width + 5;
  edtText3.Left := lblText3.Left + lblText3.Width + 5;
  edtText3.Width := fw;

  lblText4.Left := edtText3.Left + edtText3.Width + 5;
  edtText4.Left := lblText4.Left + lblText4.Width + 5;
  edtText4.Width := pnlEdit.Width - edtText4.Left - 6;

  edtNameFmt.Width := lblText3.Left + lblText3.Width;
  edtPROC.Left := lblText3.Left;
  edtPROC.Width := pnlEdit.Width - edtPROC.Left - 6;
end;

procedure TFileTypeForm.cbOnOffChange(Sender: TObject);
begin
  inherited;
  ShowHideControls;
end;

procedure TFileTypeForm.chkCustomerCardClick(Sender: TObject);
begin
  inherited;
  if chkCustomerCard.Checked then
    chkPassport.Checked := True;

  SetCheckOwner;
end;

procedure TFileTypeForm.chkPassportClick(Sender: TObject);
begin
  inherited;
  if not chkPassport.Checked then
    chkCustomerCard.Checked := False;

  SetCheckOwner;
end;

procedure TFileTypeForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not dsFileType.FieldByName('O_DIMENSION').IsNull then
    try
      Background := StringToColor(dsFileType.FieldByName('O_DIMENSION').Value);
    except
    end;
end;

procedure TFileTypeForm.edtHintEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s: string;
begin
  inherited;
  s := edtHint.Text;
  if EditTextVarSettings(s) then
    edtHint.Text := s;

  Handled := True;
end;

procedure TFileTypeForm.edtText1EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s: string;
begin
  inherited;
  s := edtText1.Text;
  if EditTextVarSettings(s) then
    edtText1.Text := s;

  Handled := True;
end;

procedure TFileTypeForm.edtText2EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s: string;
begin
  inherited;
  s := edtText2.Text;
  if EditTextVarSettings(s) then
    edtText2.Text := s;

  Handled := True;
end;

procedure TFileTypeForm.edtText3EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s: string;
begin
  inherited;
  s := edtText3.Text;
  if EditTextVarSettings(s) then
    edtText3.Text := s;

  Handled := True;
end;

procedure TFileTypeForm.edtText4EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s: string;
begin
  inherited;
  s := edtText4.Text;
  if EditTextVarSettings(s) then
    edtText4.Text := s;

  Handled := True;
end;

procedure TFileTypeForm.actCopyIDExecute(Sender: TObject);
begin
  inherited;
  A4MainForm.CopyDataSetFldToClipboard(dsFileType, 'O_ID');
end;

procedure TFileTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TFileTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdt();
end;

procedure TFileTypeForm.FormShow(Sender: TObject);
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

  dsFileType.Open;
  dbGrid.DefaultApplySorting;
  dsFileType.First;

  FOwner := (dmMain.GetSettingsValue('FLAT_OWNER') = '1');
  chkOwner.Visible := FOwner;
  ShowHideControls;
end;

procedure TFileTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TFileTypeForm.memoMiClick(Sender: TObject);
begin
  if (Sender is TMenuItem) and (ActiveControl is TDBMemoEh) then
    (ActiveControl as TDBMemoEh).SelText := ReplaceStr((Sender as TMenuItem).Caption, '_&', '_');
end;

procedure TFileTypeForm.StartEdt(const New: Boolean = False);
var
  Background: TColor;
begin
  InitControls;

  btnColorSet.SymbolColor := clBtnFace;
  if not(New or dsFileType.FieldByName('O_DIMENSION').IsNull) then
    try
      Background := StringToColor(dsFileType.FieldByName('O_DIMENSION').Value);
      btnColorSet.SymbolColor := Background;
    except
    end;

  dsSrvType.Open;
  dsService.Open;
  dsOnOffSrv.Open;
  dsReqType.Open;
  dsReqTempl.Open;
  dsSingleSrv.Open;
  if (not dsFileType.FieldByName('O_ID').IsNull) then
    dsAllowFT.ParamByName('O_ID').AsInteger := dsFileType['O_ID']
  else
    dsAllowFT.ParamByName('O_ID').AsInteger := -1;
  dsAllowFT.Open;

  chkFileReq.Checked := True;
  if (not New) and (not dsFileType.FieldByName('O_CHARFIELD').IsNull) then
    ParseJson(dsFileType['O_CHARFIELD']);

  StartEdit(New);
  ShowHideControls;
end;

procedure TFileTypeForm.StopEdt(const Cancel: Boolean);
var
  s: string;
begin
  if (not Cancel) then
  begin
    s := GetJson;
    if not(dsFileType.State in [dsInsert, dsEdit]) then
    begin
      dsFileType.Edit;
    end;
    dsFileType['O_CHARFIELD'] := s;
  end;

  StopEdit(Cancel);

  dsAllowFT.Open;
  dsReqTempl.Close;
  dsReqType.Close;
  dsOnOffSrv.Close;
  dsSingleSrv.Close;
  dsService.Close;
  dsSrvType.Close;
end;

procedure TFileTypeForm.ParseJson(const json: String);
var
  JO: TJsonObject;

  procedure SetChk(const fld: string; chk: TDBCheckBoxEh);
  begin
    chk.Checked := False;
    if JO.Contains(fld) then
    begin
      if not JO[fld].IsNull then
        chk.Checked := JO.B[fld];
    end;
  end;

begin
  InitControls;
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('OnOff') then
    begin
      if not JO['OnOff'].IsNull then
        cbOnOff.Value := JO['OnOff'];
    end;
    if JO.Contains('SrvType') then
    begin
      if not JO['SrvType'].IsNull then
        lcbSrvType.Value := JO['SrvType'];
    end;
    if JO.Contains('Srv') then
    begin
      if not JO['Srv'].IsNull then
        lcbService.Value := JO['Srv'];
    end;
    if JO.Contains('SrvFrm') then
    begin
      if not JO['SrvFrm'].IsNull then
        lcbServiceFrom.Value := JO['SrvFrm'];
    end;
    if JO.Contains('SrvOnOff') then
    begin
      if not JO['SrvOnOff'].IsNull then
        lcbOnOffSrv.Value := JO['SrvOnOff'];
    end;
    if JO.Contains('SSrv') then
    begin
      if not JO['SSrv'].IsNull then
        lcbSingleSrv.Value := JO['SSrv'];
    end;
    if JO.Contains('ReqType') then
    begin
      if not JO['ReqType'].IsNull then
        lcbRequest.Value := JO['ReqType'];
    end;
    if JO.Contains('ReqTempl') then
    begin
      if not JO['ReqTempl'].IsNull then
        lcbTempl.Value := JO['ReqTempl'];
    end;

    chkFileReq.Checked := True;
    if JO.Contains('EF') and (not JO['EF'].IsNull) then
      chkFileReq.Checked := (JO.I['EF'] <> 1);

    SetChk('OpenInet', chkOpenInet);
    SetChk('Psprt', chkPassport);
    SetChk('Card', chkCustomerCard);
    SetChk('Mobile', chkMobilePhone);
    SetChk('mRO', chkMemoRO);
    SetChk('nRO', chkNameRO);
    SetChk('Txt', chkText);
    SetChk('Bid', chkBid);
    SetChk('Pay', chkPaySum);
    SetChk('Adr', chkAddress);
    SetChk('Tsk', chkTask);
    cbPeriod.Value := 0;
    if JO.Contains('Prd') then
    begin
      if not JO['Prd'].IsNull then
      begin
        if JO['Prd'].Typ = jdtBool then
        begin
          if JO.B['Prd'] then
            cbPeriod.Value := 1;
        end
        else
          cbPeriod.Value := JO.I['Prd'];
      end;
    end;

    if FOwner then
      SetChk('Own', chkOwner);

    if JO.Contains('AFT') then
    begin
      if not JO['AFT'].IsNull then
        lcbAllowFT.Value := JO.I['AFT'];
    end;

    if JO.Contains('Nfmt') then
    begin
      if not JO['Nfmt'].IsNull then
        edtNameFmt.Text := JO.s['Nfmt'];
    end;

    if JO.Contains('Hint') then
    begin
      if not JO['Hint'].IsNull then
        edtHint.Text := JO.s['Hint'];
    end;

    if JO.Contains('Txt1') then
    begin
      if not JO['Txt1'].IsNull then
        edtText1.Text := JO.s['Txt1'];
    end;

    if JO.Contains('Txt2') then
    begin
      if not JO['Txt2'].IsNull then
        edtText2.Text := JO.s['Txt2'];
    end;

    if JO.Contains('Txt3') then
    begin
      if not JO['Txt3'].IsNull then
        edtText3.Text := JO.s['Txt3'];
    end;

    if JO.Contains('Txt4') then
    begin
      if not JO['Txt4'].IsNull then
        edtText4.Text := JO.s['Txt4'];
    end;

    SetChk('Mat', chkMat);
    if chkMat.Checked then
      SetChk('MatCO', chkMatCustOnly);

  finally
    JO.Free;
  end;
end;

function TFileTypeForm.GetJson: String;
var
  JO: TJsonObject;
begin
  JO := TJsonObject.Create;
  try
    if not chkFileReq.Checked then
      JO.I['EF'] := 1;
    if not cbOnOff.Text.IsEmpty then
      JO['OnOff'] := cbOnOff.Value;
    if not lcbSrvType.Text.IsEmpty then
      JO['SrvType'] := lcbSrvType.Value;
    if not lcbService.Text.IsEmpty then
      JO['Srv'] := lcbService.Value;
    if not lcbServiceFrom.Text.IsEmpty then
      JO['SrvFrm'] := lcbServiceFrom.Value;
    if not lcbOnOffSrv.Text.IsEmpty then
      JO['SrvOnOff'] := lcbOnOffSrv.Value;
    if not lcbSingleSrv.Text.IsEmpty then
      JO['SSrv'] := lcbSingleSrv.Value;
    if not lcbRequest.Text.IsEmpty then
      JO['ReqType'] := lcbRequest.Value;
    if not lcbTempl.Text.IsEmpty then
      JO['ReqTempl'] := lcbTempl.Value;
    if chkOpenInet.Checked then
      JO.B['OpenInet'] := chkOpenInet.Checked;
    if chkPassport.Checked then
      JO.B['Psprt'] := chkPassport.Checked;
    if chkCustomerCard.Checked then
      JO.B['Card'] := chkCustomerCard.Checked;
    if chkMobilePhone.Checked then
      JO.B['Mobile'] := chkMobilePhone.Checked;
    if chkMemoRO.Checked then
      JO.B['mRO'] := chkMemoRO.Checked;
    if chkNameRO.Checked then
      JO.B['nRO'] := chkNameRO.Checked;
    if chkText.Checked then
      JO.B['Txt'] := chkText.Checked;
    if chkBid.Checked then
      JO.B['Bid'] := chkBid.Checked;
    if chkPaySum.Checked then
      JO.B['Pay'] := chkPaySum.Checked;
    if chkAddress.Checked then
      JO.B['Adr'] := chkAddress.Checked;
    if not edtNameFmt.Text.IsEmpty then
      JO.s['Nfmt'] := trim(edtNameFmt.Text);
    if not edtHint.Text.IsEmpty then
      JO.s['Hint'] := trim(edtHint.Text);
    if not edtText1.Text.IsEmpty then
      JO.s['Txt1'] := trim(edtText1.Text);
    if not edtText2.Text.IsEmpty then
      JO.s['Txt2'] := trim(edtText2.Text);
    if not edtText3.Text.IsEmpty then
      JO.s['Txt3'] := trim(edtText3.Text);
    if not edtText4.Text.IsEmpty then
      JO.s['Txt4'] := trim(edtText4.Text);
    if chkTask.Checked then
      JO.B['Tsk'] := chkTask.Checked;
    if not cbPeriod.Text.IsEmpty then
    begin
      if cbPeriod.Value <> 0 then
        JO.I['Prd'] := cbPeriod.Value;
    end;
    if FOwner and chkOwner.Checked then
      JO.B['Own'] := chkOwner.Checked;
    if not lcbAllowFT.IsEmpty then
      JO.I['AFT'] := lcbAllowFT.Value;
    if chkMat.Checked then
    begin
      JO.B['Mat'] := chkMat.Checked;
      if chkMatCustOnly.Checked then
        JO.B['MatCO'] := chkMatCustOnly.Checked;
    end;

    // if chkSSum.Checked then JO.B['SSum'] := chkSSum.Checked;

    Result := JO.ToString
  finally
    JO.Free;
  end;
end;

procedure TFileTypeForm.InitControls;
var
  I: Integer;
begin
  cbOnOff.Value := null;
  lcbSrvType.Value := null;
  lcbOnOffSrv.Value := null;
  lcbRequest.Value := null;
  lcbTempl.Value := null;
  lcbSingleSrv.Value := null;
  lcbAllowFT.Value := null;
  edtNameFmt.Text := '';
  edtHint.Text := '';
  edtText1.Text := '';
  edtText2.Text := '';
  edtText3.Text := '';
  edtText4.Text := '';
  for I := 0 to pnlEdit.ComponentCount - 1 do
  begin
    if pnlEdit.Components[I] is TDBCheckBoxEh then
      (pnlEdit.Components[I] as TDBCheckBoxEh).Checked := False;
  end;
end;

procedure TFileTypeForm.SetCheckOwner;
begin
  {
    if FOwner then begin
    if (not chkOwner.Checked) and (not chkPassport.Checked) then
    chkOwner.Checked := true;
    chkOwner.Enabled := chkPassport.Checked;
    end;
  }
end;

end.
