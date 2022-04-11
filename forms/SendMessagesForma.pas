unit SendMessagesForma;

interface

{$I defines.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditHighlighter,
  StdCtrls, Menus, ActnList, ExtCtrls, ComCtrls, FIBQuery,
  pFIBQuery, Mask, DBCtrlsEh, System.Actions, DBGridEh, DBLookupEh, Data.DB,
  FIBDataSet, pFIBDataSet, PrjConst, ToolCtrlsEh,
  DBGridEhToolCtrls, Vcl.Buttons, EhLibVCL, GridsEh, DBAxisGridsEh,
  System.UITypes, FIBDatabase, pFIBDatabase,
  frxClass, SendEmail, DBGridEhGrouping, DynVarsEh;

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
    pnl3: TPanel;
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
  private
    FReportLoaded: Boolean;
    function GetMessage(const msg: String): string;
    procedure SendEmailMessage;
    procedure SendMessage(const mes_type: string);
    procedure SendMessageWR(const mes_type, head, Text: String; const Res: Integer);
    procedure LoadReportBody(FR: TfrxReport);
    procedure InitEmailClient(emailClient: TEmailClient);
  public
    { Public declarations }
  end;

function SendMessages(): Boolean;

implementation

uses
  DM, AtrStrUtils, AtrCommon, MAIN, CF, StrUtil;

{$R *.dfm}

function SendMessages(): Boolean;
begin
  Result := False;
  with TSendMessagesForm.Create(Application) do
    try
      if showmodal = mrOk then
      begin
        Result := True;
      end;
    finally
      Free;
    end;
end;

function TSendMessagesForm.GetMessage(const msg: String): string;
var
  s: string;
begin
  s := CustomersForm.FieldsToStr(msg, '.');
  Result := Trim(s);
end;

procedure TSendMessagesForm.SendMessage(const mes_type: string);
var
  s: string;
begin
  progress.StepIt;
  s := GetMessage(mmoMessage.Lines.Text);
  if (s = '') then
    exit;
  with qrySaveMessages do
  begin
    sql.Text := 'select mes_id from Message_For_Customer(:Customer_Id, :Mes_Type, :Mes_Head, :Mes_Text, 0, null)';
    ParamByName('CUSTOMER_ID').AsInteger := CustomersForm.dsCustomers['CUSTOMER_ID'];
    ParamByName('MES_TEXT').AsString := s;
    ParamByName('MES_HEAD').AsString := edtHEAD.Text;
    ParamByName('MES_TYPE').AsString := mes_type;
    Transaction.StartTransaction;
    ExecQuery;
    Transaction.Commit;
    Close;
  end;
end;

procedure TSendMessagesForm.SendMessageWR(const mes_type, head, Text: String; const Res: Integer);
begin
  with qrySaveMessages do
  begin
    sql.Text :=
      'select mes_id from Message_For_Customer(:Customer_Id, :Mes_Type, :Mes_Head, :Mes_Text, 0, null, :MES_RESULT)';
    ParamByName('CUSTOMER_ID').AsInteger := CustomersForm.dsCustomers['CUSTOMER_ID'];
    ParamByName('MES_TEXT').AsString := Text;
    ParamByName('MES_HEAD').AsString := head;
    ParamByName('MES_TYPE').AsString := mes_type;
    ParamByName('MES_RESULT').AsInteger := Res;
    Transaction.StartTransaction;
    ExecQuery;
    Transaction.Commit;
    Close;
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
  progress.StepIt;
  qryRead.sql.Text := ' select cast(list(Cc_Value) as varchar(1000)) Cc_Value from customer_contacts ' +
    ' where Cc_Type=2 and CC_NOTIFY = 1 and Customer_Id=:c_id ';
  qryRead.ParamByName('C_ID').AsInteger := CustomersForm.dsCustomers['CUSTOMER_ID'];
  qryRead.Transaction.StartTransaction;
  qryRead.ExecQuery;

  if not qryRead.FN('Cc_Value').IsNull then
    ToEmail := qryRead.FN('Cc_Value').AsString
  else
    ToEmail := '';

  qryRead.Transaction.Commit;
  qryRead.Close;

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

      if frxReport.PrepareReport(True) then
      begin
        dmMain.frxPDFExport.ShowDialog := False;
        // dmMain.frxPDFExport.Transparency := True;
        dmMain.frxPDFExport.FileName := frxReport.FileName;
        frxReport.Export(dmMain.frxPDFExport);
        emailClient.AddAttachment(frxReport.FileName);
      end;
    end;

    for I := 0 to lvFiles.Items.Count - 1 do
    begin
      emailClient.AddAttachment(lvFiles.Items[I].Caption);
    end;

    emailClient.Subject := edtHEAD.Text;
    emailClient.Body := GetMessage(mmoMessage.Lines.Text);
    emailClient.ToEmail := ToEmail;
    Res := emailClient.SendEmail;
    if Res <> 'OK' then
    begin
      mmoLog.Lines.Add(Res);
      ci := -1;
    end
    else
      ci := 2;
    // сохраним в базе
    SendMessageWR('EMAIL', emailClient.Subject, emailClient.Body, ci);
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
  itsEmail: Boolean;
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
    cbMessType.Value := 'SMS';
  mes_t := cbMessType.Value;

  itsEmail := mes_t.ToUpper.Contains('EMAIL');
  // FReportLoaded := False;
  // if itsEmail and VarIsNumeric(lcbReportAsPDF.KeyValue)
  // then LoadReportBody;

  try
    with CustomersForm do
    begin
      if dbgCustomers.SelectedRows.Count > 0 then
      begin
        progress.Max := dbgCustomers.SelectedRows.Count;
        for j := 0 to dbgCustomers.SelectedRows.Count - 1 do
        begin
          dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[j];
          if not itsEmail then
            SendMessage(mes_t)
          else
            SendEmailMessage;
        end
      end
      else
      begin
        progress.Max := 1;
        if not itsEmail then
          SendMessage(mes_t)
        else
          SendEmailMessage;
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
  pnlHead.Visible := show;

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
  I: Integer;
  val: TStringArray;
  s: string;
begin
  dsMessType.Open;
  dsLetterTypes.Open;
  dsTemplate.Open;

  val := Explode(';', export_fields + ';[ОПЛАТА_СЛ_МЕСЯЦ];[ДОПЛАТА_СЛ_МЕСЯЦ]');
  for I := 0 to Length(val) - 1 do
  begin
    pmMemo.Items.Add(NewItem(val[I], 0, False, True, miClick, 0, 'mi' + IntToStr(I)));
  end;

  if CustomersForm.dbgCustomers.SelectedRows.Count > 0 then
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

  if not dsTemplate.FieldByName('O_CHARFIELD').IsNull then
    mmoMessage.Lines.Add(dsTemplate['O_CHARFIELD']);

  if not dsTemplate.FieldByName('O_NAME').IsNull then
    edtHEAD.Text := dsTemplate['O_NAME'];
end;

procedure TSendMessagesForm.actSaveTemplateExecute(Sender: TObject);
begin
  if Length(mmoMessage.Lines.Text) > 10 then
  begin
    if not dsTemplate.Active then
      dsTemplate.Open;

    dsTemplate.Insert;
    dsTemplate['O_CHARFIELD'] := mmoMessage.Lines.Text;
    if edtHEAD.Text <> '' then
      dsTemplate['O_NAME'] := edtHEAD.Text
    else
      dsTemplate['O_NAME'] := Copy(mmoMessage.Lines.Text, 1, 10);
    dsTemplate.Post;
    dsTemplate.CloseOpen(True);
  end;
  //
end;

procedure TSendMessagesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsLetterTypes.Active then
    dsLetterTypes.Close;
  if dsTemplate.Active then
    dsTemplate.Close;
  if dsMessType.Active then
    dsMessType.Close;
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
    cbMessType.Value := dsMessType['O_NAME']
end;

procedure TSendMessagesForm.LoadReportBody(FR: TfrxReport);
var
  Stream: TStream;
begin
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value := lcbReportAsPDF.KeyValue;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        FR.LoadFromStream(Stream);
        FR.FileName := GetTempDir() + CustomersForm.dsCustomers['ACCOUNT_NO'] + '.' +
          dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString + '.PDF';
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

end.
