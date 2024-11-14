unit SendMessagesForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes, System.StrUtils,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ActnList, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Mask,
  Vcl.Buttons,
  SynEditHighlighter, FIBQuery, pFIBQuery, DBCtrlsEh, DBGridEh, DBLookupEh, FIBDataSet, pFIBDataSet, PrjConst,
  ToolCtrlsEh,
  DBGridEhToolCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, FIBDatabase, pFIBDatabase, frxClass, SendEmail, DBGridEhGrouping,
  DynVarsEh, frxExportBaseDialog, frxExportPDF, PropFilerEh, PropStorageEh, amSplitter;

type
  TSendMessagesForm = class(TForm)
    pmMemo: TPopupMenu;
    actlst1: TActionList;
    actSend: TAction;
    qrySaveMessages: TpFIBQuery;
    srcMessType: TDataSource;
    dsMessType: TpFIBDataSet;
    pnl2: TPanel;
    pnlHead: TPanel;
    lbl2: TLabel;
    progress: TProgressBar;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    cbMessType: TDBLookupComboboxEh;
    pnlTmplts: TPanel;
    dbgTemplate: TDBGridEh;
    Panel10: TPanel;
    btnSaveTemplate: TSpeedButton;
    Splitter: TSplitter;
    btnSave: TSpeedButton;
    actInsertTmplate: TAction;
    actSaveTemplate: TAction;
    mmoLog: TDBMemoEh;
    dsTemplate: TpFIBDataSet;
    srcTemplate: TDataSource;
    actDeleteTemplate: TAction;
    btnDeleteTemplate: TSpeedButton;
    mmoMessage: TDBMemoEh;
    trWriteQ: TpFIBTransaction;
    pnlReport: TPanel;
    edtHEAD: TDBEditEh;
    dsLetterTypes: TpFIBDataSet;
    srcLetterTypes: TDataSource;
    lcbReportAsPDF: TDBLookupComboboxEh;
    lbl4: TLabel;
    pnlOkCancel: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    qryRead: TpFIBQuery;
    trReadQ: TpFIBTransaction;
    lvFiles: TListView;
    btnDeleteFile: TSpeedButton;
    btnAddFile: TSpeedButton;
    lbl5: TLabel;
    DlgFileOpen: TOpenDialog;
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    pnlContact: TPanel;
    Label1: TLabel;
    edtReciver: TDBEditEh;
    PropStorageEh: TPropStorageEh;
    procedure FormShow(Sender: TObject);
    procedure miClick(Sender: TObject);
    procedure actSendExecute(Sender: TObject);
    procedure mmoMessageChange(Sender: TObject);
    procedure cbMessTypeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actInsertTmplateExecute(Sender: TObject);
    procedure actSaveTemplateExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteTemplateExecute(Sender: TObject);
    procedure dbgTemplateDblClick(Sender: TObject);
    procedure dsMessTypeAfterOpen(DataSet: TDataSet);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnAddFileClick(Sender: TObject);
    procedure lvFilesDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure FormCreate(Sender: TObject);

  private
    FReportLoaded: Boolean;
    FToContact: string;
    FToCustomer: Integer;
    FParentMessage: Integer;
    FTmpltName: string;
    function GetMessage(const Msg: String): string;
    procedure SendEmailMessage;
    procedure SendMessage(const mes_type: string);
    procedure SaveMessageDB(const mes_type, head, Text: String; const Res: Integer; const Contact: string = '');
    procedure LoadReportBody(FR: TfrxReport);
    procedure InitEmailClient(emailClient: TEmailClient);
    procedure SetToCustomer(const value: Integer);
    procedure SetToContact(const value: String);
  public
    property ToCustomer: Integer write SetToCustomer;
    property ToContact: string write SetToContact;
    property ParentMessage: Integer write FParentMessage;
  end;

function SendMessages(const aCustomer_ID: Integer = -1; const aTo_Contact: string = '';
  const parent_id: Integer = -1): Boolean;

implementation

uses
  DM, AtrStrUtils, AtrCommon, MAIN, CF, StrUtil;

{$R *.dfm}

function SendMessages(const aCustomer_ID: Integer = -1; const aTo_Contact: string = '';
  const parent_id: Integer = -1): Boolean;
begin
  Result := False;
  with TSendMessagesForm.Create(Application) do
  begin
    ToContact := aTo_Contact;
    ParentMessage := parent_id;
    ToCustomer := aCustomer_ID;
    try
      if ShowModal = mrOk then
      begin
        Result := True;
      end;
    finally
      Free;
    end;
  end;
end;

function TSendMessagesForm.GetMessage(const Msg: String): string;
var
  s: string;
begin
  s := CustomersForm.FieldsToStr(Msg, '.');
  Result := Trim(s);
end;

procedure TSendMessagesForm.SendMessage(const mes_type: string);
var
  s: string;
begin
  progress.StepIt;
  if mes_type.ToUpper.Contains('EMAIL') then
    SendEmailMessage()
  else
  begin
    s := GetMessage(mmoMessage.Lines.Text);
    if (s = '') then
      exit;
    SaveMessageDB(mes_type, GetMessage(edtHEAD.Text), s, 0, FToContact);
  end;
end;

procedure TSendMessagesForm.SaveMessageDB(const mes_type, head, Text: String; const Res: Integer;
  const Contact: string = '');
begin
  with qrySaveMessages do
  begin
    sql.Text :=
      'select mes_id from Message_For_Customer(:Customer_Id, :Mes_Type, :Mes_Head, :Mes_Text, 0, null, :MES_RESULT, :CONTACT, :PARENT_ID)';
    if FToCustomer > -1 then
      ParamByName('CUSTOMER_ID').AsInteger := FToCustomer
    else
      ParamByName('CUSTOMER_ID').AsInteger := CustomersForm.dsCustomers['CUSTOMER_ID'];
    ParamByName('MES_TEXT').AsString := Text;
    ParamByName('MES_HEAD').AsString := head;
    ParamByName('MES_TYPE').AsString := mes_type;
    ParamByName('MES_RESULT').AsInteger := Res;
    if FParentMessage > -1 then
      ParamByName('PARENT_ID').AsInteger := FParentMessage
    else
      ParamByName('PARENT_ID').Clear;
    if not Contact.IsEmpty then
      ParamByName('CONTACT').AsString := Contact
    else
      ParamByName('CONTACT').Clear;

    Transaction.StartTransaction;
    ExecQuery;
    Transaction.Commit;
    Close;
    FToCustomer := -1;
  end;
end;

procedure TSendMessagesForm.SendEmailMessage;
var
  ToEmail: string;
  emailClient: TEmailClient;
  Res: string;
  ci: Integer;
  I: Integer;
begin
  ToEmail := '';
  if FToContact.IsEmpty then
  begin
    qryRead.sql.Text := ' select cast(list(Cc_Value) as varchar(1000)) Cc_Value from customer_contacts ' +
      ' where Cc_Type=2 and CC_NOTIFY = 1 and Customer_Id=:c_id ';
    qryRead.ParamByName('C_ID').AsInteger := CustomersForm.dsCustomers['CUSTOMER_ID'];
    qryRead.Transaction.StartTransaction;
    qryRead.ExecQuery;

    if not qryRead.FN('Cc_Value').IsNull then
      ToEmail := qryRead.FN('Cc_Value').AsString;
    qryRead.Transaction.Commit;
    qryRead.Close;
  end
  else
    ToEmail := FToContact;

  if ToEmail = '' then
    exit;

  emailClient := TEmailClient.Create(Self);
  InitEmailClient(emailClient);
  try
    FReportLoaded := False;
    // frxReport.OnUserFunction := frxReportUserFunction;
    if VarIsNumeric(lcbReportAsPDF.KeyValue) then
      LoadReportBody(frxReport);

    if FReportLoaded then
    begin
      ci := frxReport.Variables.IndexOf('CUSTOMER_ID');
      if ci > 0 then
        frxReport.Variables['CUSTOMER_ID'] := CustomersForm.dsCustomers['CUSTOMER_ID'];

      // dmMain.frxPDFExport.Transparency := True;
      frxPDFExport.FileName := frxReport.FileName;
      frxPDFExport.Subject := GetMessage(edtHEAD.Text);
      if frxReport.PrepareReport(True) then
      begin
        try
          frxReport.Export(frxPDFExport);
          emailClient.AddAttachment(frxReport.FileName);
        finally
          //
        end;
      end;
    end;

    for I := 0 to lvFiles.Items.Count - 1 do
    begin
      emailClient.AddAttachment(lvFiles.Items[I].Caption);
    end;

    emailClient.Subject := GetMessage(edtHEAD.Text);
    emailClient.Body := GetMessage(mmoMessage.Lines.Text);
    emailClient.ToEmail := ToEmail;
    Res := emailClient.SendEmail;
    if Res <> 'OK' then
    begin
      mmoLog.Lines.Add('email: ' + ToEmail + ' Абонент: ' + CustomersForm.dsCustomers['ACCOUNT_NO']);
      mmoLog.Lines.Add(Res);
      ci := -1;
    end
    else
      ci := 2;
    // сохраним в базе
    SaveMessageDB('EMAIL', emailClient.Subject, emailClient.Body, ci, ToEmail);
    Application.ProcessMessages;
  finally
    FreeAndNil(emailClient);
    if FReportLoaded and FileExists(frxReport.FileName) then
      DeleteFile(frxReport.FileName);
  end;
end;

procedure TSendMessagesForm.actSendExecute(Sender: TObject);
var
  j: Integer;
  mes_t: String;
  crsr: TCursor;
begin
  crsr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  actSend.Enabled := False;
  if not(dmMain.AllowedAction(rght_Messages_add) or dmMain.AllowedAction(rght_Customer_full)) then
    exit;

  mmoLog.Visible := True;
  mmoLog.Clear;
  if cbMessType.Text = '' then
    cbMessType.value := 'SMS';
  mes_t := cbMessType.value;

  try
    with CustomersForm do
    begin
      if (dbgCustomers.SelectedRows.Count > 0) and (FToContact.IsEmpty) then
      begin
        progress.Max := dbgCustomers.SelectedRows.Count;
        for j := 0 to dbgCustomers.SelectedRows.Count - 1 do
        begin
          dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[j];
          SendMessage(mes_t)
        end
      end
      else
      begin
        progress.Max := 1;
        SendMessage(mes_t);
      end;
    end;

  finally
    Screen.Cursor := crsr;
  end;
  actSend.Enabled := True;

  if mmoLog.Lines.Count = 0 then
    ModalResult := mrOk;
end;

procedure TSendMessagesForm.btnAddFileClick(Sender: TObject);
begin
  if DlgFileOpen.Execute then
    lvFiles.Items.Add.Caption := DlgFileOpen.FileName;
end;

procedure TSendMessagesForm.btnDeleteFileClick(Sender: TObject);
begin
  if lvFiles.SelCount > 0 then
    lvFiles.Selected.Delete;
end;

procedure TSendMessagesForm.cbMessTypeChange(Sender: TObject);
var
  show: Boolean;
begin
  show := False;
  if not dsMessType.FieldByName('O_NUMERICFIELD').IsNull then
    show := (dsMessType['O_NUMERICFIELD'] = 1);
  pnlHead.Visible := show or cbMessType.Text.ToUpper.Contains('EMAIL');

  pnlReport.Visible := cbMessType.Text.Contains('EMAIL');
end;

procedure TSendMessagesForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    actSendExecute(Sender);
end;

procedure TSendMessagesForm.FormResize(Sender: TObject);
begin
  lvFiles.Columns[0].Width := lvFiles.Width - 15;
end;

procedure TSendMessagesForm.FormShow(Sender: TObject);
var
  val: TStringArray;
  I: Integer;
  Font_size: Integer;
  Font_name, s: string;
  Row_height: Integer;
begin
  Font_size := 0;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), I) then
    I := 0;
  Row_height := I;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), I) then
  begin
    Font_size := I;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBGridEh then
    begin
      (Components[I] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[I].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if ((Components[I] as TDBGridEh).DataSource <> nil) and ((Components[I] as TDBGridEh).DataSource.DataSet.Active)
      then
        (Components[I] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[I] as TDBGridEh).Font.Name := Font_name;
        (Components[I] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[I] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[I] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[I] is TMemo) then
      begin
        (Components[I] as TMemo).Font.Name := Font_name;
        (Components[I] as TMemo).Font.Size := Font_size;
      end
      else if (Components[I] is TDBMemoEh) then
      begin
        (Components[I] as TDBMemoEh).Font.Name := Font_name;
        (Components[I] as TDBMemoEh).Font.Size := Font_size;
      end;
    end;
  end;

  dsMessType.Open;
  dsLetterTypes.Open;
  dsTemplate.Open;

  // val := Explode(';', export_fields + ';[ОПЛАТА_СЛ_МЕСЯЦ];[ДОПЛАТА_СЛ_МЕСЯЦ]');
  s := rsFldACCOUNT + ';' + rsFldBalance + ';' + rsFldContract + ';' + rsFldCurrentDay + ';' + rsFldCurrentYear + ';' +
    rsFldDaysOfMonth + ';' + rsFldEmail + ';' + rsFldFIRSTNAME + ';' + rsFldFlat + ';' + rsFldHouse + ';' +
    rsFldINITIALS + ';' + rsFldMiddleName + ';' + rsFldMobile + ';' + rsFldMonth + ';' + rsFldMonthFee + ';' +
    rsFldMonthNeed + ';' + rsFldNextFee + ';' + rsFldNextNeed + ';' + rsFldPASSPORTDATE + ';' + rsFldPHONE + ';' +
    rsFldPassportN + ';' + rsFldSTREET + ';' + rsFldSURNAME + ';' + rsFldSaldo + ';' + rsFldSecret + ';' +
    rsFldStreetShort;
  val := Explode(';', s);
  for I := 0 to Length(val) - 1 do
  begin
    pmMemo.Items.Add(NewItem(val[I], 0, False, True, miClick, 0, 'mi' + IntToStr(I)));
  end;

  if (dmMain.GetSettingsValue('SHOW_FINE') = '1') then
  begin
    I := Length(val) + 1;
    pmMemo.Items.Add(NewItem(rsFldDEBT_FINE, 0, False, True, miClick, 0, 'mi' + IntToStr(I)));
    pmMemo.Items.Add(NewItem(rsFldFINE, 0, False, True, miClick, 0, 'mi' + IntToStr(I + 1)))
  end;

  if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) and FToContact.IsEmpty then
    s := IntToStr(CustomersForm.dbgCustomers.SelectedRows.Count)
  else
    s := '1';

  btnOk.Caption := btnOk.Caption + ' ( ' + s + ' ' + rsPiece + ')';
end;

function TSendMessagesForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

procedure TSendMessagesForm.miClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then
    (ActiveControl as TDBMemoEh).SelText := ReplaceStr((Sender as TMenuItem).Caption, '&', '');
end;

procedure TSendMessagesForm.mmoMessageChange(Sender: TObject);
begin
  lbl1.Caption := Format(rsMSG_CharCount, [Length(mmoMessage.Text)]);
end;

procedure TSendMessagesForm.actInsertTmplateExecute(Sender: TObject);
begin
  if not dsTemplate.Active then
  begin
    dsTemplate.Open;
    exit;
  end;
  if (not dsTemplate.FieldByName('O_DESCRIPTION').IsNull) then
    FTmpltName := dsTemplate['O_DESCRIPTION']
  else
    FTmpltName := '';

  if not dsTemplate.FieldByName('O_CHARFIELD').IsNull then
    mmoMessage.Lines.Text := dsTemplate['O_CHARFIELD']
  else
    mmoMessage.Lines.Clear;

  if not dsTemplate.FieldByName('O_NAME').IsNull then
    edtHEAD.Text := dsTemplate['O_NAME']
  else
    edtHEAD.Text := '';
end;

procedure TSendMessagesForm.actSaveTemplateExecute(Sender: TObject);
var
  TempName: string;
begin
  if Length(mmoMessage.Lines.Text) < 10 then
    exit;

  TempName := FTmpltName;

  if not Vcl.Dialogs.InputQuery('Ведите название шаблона', 'Название', TempName) then
    exit;

  if not dsTemplate.Active then
    dsTemplate.Open;

  if (not TempName.IsEmpty) and (FTmpltName = TempName) then
  begin
    if (not dsTemplate.FieldByName('O_DESCRIPTION').IsNull) and (FTmpltName = dsTemplate['O_DESCRIPTION']) then
      dsTemplate.Edit
    else
    begin
      if dsTemplate.Locate('O_DESCRIPTION', TempName, []) then
        dsTemplate.Edit
      else
        dsTemplate.Insert;
    end;
  end
  else
    dsTemplate.Insert;

  dsTemplate['O_CHARFIELD'] := Trim(mmoMessage.Lines.Text);
  dsTemplate['O_DESCRIPTION'] := TempName.Trim;
  dsTemplate['O_NAME'] := IfThen(not edtHEAD.Text.IsEmpty, Trim(edtHEAD.Text), TempName);
  dsTemplate.Post;
  dsTemplate.CloseOpen(True);

  if not TempName.IsEmpty then
    dsTemplate.Locate('O_DESCRIPTION', TempName.Trim, []);

  FTmpltName := '';
end;

procedure TSendMessagesForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin

  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBGridEh then
      (Components[I] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[I].Name, False);

  if dsLetterTypes.Active then
    dsLetterTypes.Close;
  if dsTemplate.Active then
    dsTemplate.Close;
  if dsMessType.Active then
    dsMessType.Close;
end;

procedure TSendMessagesForm.FormCreate(Sender: TObject);
begin
  frxPDFExport.ShowDialog := False;
  frxPDFExport.Creator := 'A4on.TV';
  frxPDFExport.Author := dmMain.mdsCompany['NAME'];
  frxPDFExport.EmbeddedFonts := True;
  frxPDFExport.PrintOptimized := True;
  FParentMessage := -1;
  FToCustomer := -1;
  SetToContact('');
end;

procedure TSendMessagesForm.actDeleteTemplateExecute(Sender: TObject);
begin
  if not dsTemplate.Active then
  begin
    dsTemplate.Open;
    exit;
  end;

  if dsTemplate.RecordCount = 0 then
    exit;

  if MessageDlg('Удалить шаблон сообщения?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsTemplate.Delete;
  end;

end;

procedure TSendMessagesForm.dbgTemplateDblClick(Sender: TObject);
begin
  actInsertTmplate.Execute;
end;

procedure TSendMessagesForm.dsMessTypeAfterOpen(DataSet: TDataSet);
begin
  if not dsMessType.FieldByName('O_NAME').IsNull then
    cbMessType.value := dsMessType['O_NAME']
end;

procedure TSendMessagesForm.LoadReportBody(FR: TfrxReport);
var
  Stream: TStream;
  FN: string;
begin
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').value := lcbReportAsPDF.KeyValue;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        FR.LoadFromStream(Stream);
        FN := CustomersForm.dsCustomers['ACCOUNT_NO'] + '.' + dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        FN := Translit(FN).Replace(' ', '_', [rfReplaceAll]).Replace('\', '_', [rfReplaceAll])
          .Replace('/', '_', [rfReplaceAll]);
        FR.FileName := GetTempDir() + FN + '.PDF';
        FR.ReportOptions.Name := FR.FileName;
        FReportLoaded := True;
      finally
        Stream.Free;
      end;
    end;
  finally
    if dmMain.fdsLoadReport.Active then
      dmMain.fdsLoadReport.Close;
  end;
end;

procedure TSendMessagesForm.lvFilesDblClick(Sender: TObject);
begin
  btnAddFile.Click;
end;

procedure TSendMessagesForm.InitEmailClient(emailClient: TEmailClient);
begin
  emailClient.SmtpHost := dmMain.GetSettingsValue('SMTP');
  emailClient.SmtpPort := dmMain.GetSettingsValue('SMTP_PORT');
  emailClient.SmtpLogin := dmMain.GetSettingsValue('SMTP_LOGIN');
  emailClient.SmtpPassword := dmMain.GetSettingsValue('SMTP_PASS');
  emailClient.FromEmail := dmMain.GetSettingsValue('EMAIL');
  emailClient.AuthType := dmMain.GetSettingsValue('SMTP_AUTH');
  emailClient.SslType := dmMain.GetSettingsValue('SMTP_SSL');

  if dmMain.GetSettingsValue('SMTP_2ME') <> '1' then
    emailClient.CcEmail := ''
  else
    emailClient.CcEmail := dmMain.GetSettingsValue('EMAIL');

  emailClient.Confirm := dmMain.GetSettingsValue('SMTP_CONF');
end;

procedure TSendMessagesForm.SetToContact(const value: String);
begin
  FToContact := value;
  pnlContact.Visible := (not FToContact.IsEmpty);
  if (not FToContact.IsEmpty) then
  begin
    ActiveControl := edtReciver;
    edtReciver.Text := FToContact;
  end
  else
    ActiveControl := cbMessType;
end;

procedure TSendMessagesForm.SetToCustomer(const value: Integer);
begin
  FToCustomer := value;
end;

end.
