unit DistribForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider, DBCtrlsEh,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, PropFilerEh, PropStorageEh, frxClass, frxDBSet, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, GridForma, SendEmail, distrValuePeriodForma;

type
  TDistribForm = class(TGridForm)
    dsDistrib: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    dbmO_DESCRIPTION: TDBMemoEh;
    edtEMAIL: TDBEditEh;
    dbmPHONE: TDBMemoEh;
    pnlBottom: TPanel;
    Splitter: TSplitter;
    pgcAddons: TPageControl;
    splRight: TSplitter;
    tsChan: TTabSheet;
    tsReports: TTabSheet;
    srcChan: TDataSource;
    dsChan: TpFIBDataSet;
    dbgReports: TDBGridEh;
    srcContract: TDataSource;
    dsContract: TpFIBDataSet;
    pnlButtom: TPanel;
    dbgContract: TDBGridEh;
    tlb1: TToolBar;
    btn7: TToolButton;
    btnSu: TToolButton;
    btn1: TToolButton;
    btnChEdit: TToolButton;
    btn3: TToolButton;
    btnChDel: TToolButton;
    actCNew: TAction;
    actCEdit: TAction;
    actCDel: TAction;
    srcReport: TDataSource;
    dsReport: TpFIBDataSet;
    dbgReport: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    btnRepAdd: TToolButton;
    ToolButton11: TToolButton;
    btnRepEdit: TToolButton;
    ToolButton13: TToolButton;
    btnRepDel: TToolButton;
    actRepAdd: TAction;
    actRepEdit: TAction;
    actRepDel: TAction;
    PropStorage: TPropStorageEh;
    btn2: TToolButton;
    actPrintContract: TAction;
    frxContract: TfrxDBDataset;
    btnPrintContract: TToolButton;
    dbmADDRESS: TDBMemoEh;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    btnChNew: TToolButton;
    ToolButton14: TToolButton;
    btnChDel1: TToolButton;
    actChAdd: TAction;
    actChDel: TAction;
    actChEdit: TAction;
    btnChEdit1: TToolButton;
    btn5: TToolButton;
    btn4: TToolButton;
    btnSendPDF: TToolButton;
    actSendPDF: TAction;
    frxReport: TfrxReport;
    qryRead: TpFIBQuery;
    trReadQ: TpFIBTransaction;
    dbgPC: TDBGridEh;
    Splitter1: TSplitter;
    dsRC: TpFIBDataSet;
    srcRC: TDataSource;
    btn6: TToolButton;
    btnSetPeriodAll: TToolButton;
    actSetPeriodAll: TAction;
    trWriteQ: TpFIBTransaction;
    pgcDistr: TPageControl;
    tsContract: TTabSheet;
    tsCards: TTabSheet;
    pnl1: TPanel;
    tlb2: TToolBar;
    btn8: TToolButton;
    btnactCnPrefixWizard: TToolButton;
    btn9: TToolButton;
    btnactCnPrefixWizard1: TToolButton;
    btn10: TToolButton;
    btnactCnPrefixWizard2: TToolButton;
    dsCards: TpFIBDataSet;
    srcCards: TDataSource;
    dbgCards: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure pgcAddonsChange(Sender: TObject);
    procedure actCNewExecute(Sender: TObject);
    procedure actCEditExecute(Sender: TObject);
    procedure srcContractDataChange(Sender: TObject; Field: TField);
    procedure actCDelExecute(Sender: TObject);
    procedure actRepAddExecute(Sender: TObject);
    procedure actRepEditExecute(Sender: TObject);
    procedure actRepDelExecute(Sender: TObject);
    procedure dbgContractDblClick(Sender: TObject);
    procedure actPrintContractExecute(Sender: TObject);
    procedure actChDelExecute(Sender: TObject);
    procedure actChAddExecute(Sender: TObject);
    procedure actChEditExecute(Sender: TObject);
    procedure actSendPDFExecute(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actSetPeriodAllExecute(Sender: TObject);
    procedure dbgReportsDblClick(Sender: TObject);
    procedure dbgReportDblClick(Sender: TObject);
    procedure pgcDistrChange(Sender: TObject);
  private
    procedure SendEmailMessage(const period: TDate; const body, Subject: String; const aSendEmail: Boolean = True);
    function InitEmailClient: TEmailClient;
    function LoadReportBody(const REPORT_ID: Integer; const fileName: string = 'AKT.PDF';
      const DirName: string = ''): Boolean;
    procedure SaveContractPeriod(PF: TdistrValuePeriodForm);
    procedure SaveAsPrevPeriod(const period: TDate; const Contract_ID: Integer = -1; const Distrib_ID: Integer = -1);
  public
    { Public declarations }
  end;

var
  DistribForm: TDistribForm;

procedure ShowDistribChan(const Distrib_ID: Integer; const Contract_ID: Integer = -1);

implementation

uses
  Vcl.FileCtrl,
  DM, MAIN, DistrContractForma, ReportPreview, ContractChForma, AtrCommon, distrPeriodForma;

{$R *.dfm}

procedure ShowDistribChan(const Distrib_ID: Integer; const Contract_ID: Integer = -1);
var
  b: Boolean;
begin
  b := dmMain.AllowedAction(rght_Dictionary_full) or (dmMain.AllowedAction(rght_Dictionary_Distributor));

  if not b then
    Exit;

  if Not Assigned(DistribForm) then
    DistribForm := TDistribForm.Create(Application);

  if DistribForm.dsDistrib.Active then
    DistribForm.dsDistrib.Locate('ID', Distrib_ID, []);

  if (Contract_ID >= 0) and (DistribForm.dsContract.Active) then
    DistribForm.dsContract.Locate('ID', Contract_ID, []);

  DistribForm.Show;
end;

procedure TDistribForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dsRC.Active then
    dsRC.Close;
  if dsReport.Active then
    dsReport.Close;
  if dsChan.Active then
    dsChan.Close;

  dsContract.Close;
  dsDistrib.Close;
  DistribForm := nil;
end;

procedure TDistribForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TDistribForm.actPrintContractExecute(Sender: TObject);
var
  REP_ID, ci: Integer;
  Stream: TStream;
begin
  if dsContract.FieldByName('report_id').IsNull then
    Exit;

  REP_ID := dsContract['report_id'];

  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').value := REP_ID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        dmMain.frxModalReport.LoadFromStream(Stream);
        dmMain.frxModalReport.fileName := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        Caption := dmMain.frxModalReport.fileName;
      finally
        Stream.Free;
      end;
    end;
  finally
    dmMain.fdsLoadReport.Close;
  end;

  ci := dmMain.frxModalReport.Variables.IndexOf('CONTRACT_ID');
  if ci > 0 then
    dmMain.frxModalReport.Variables['CONTRACT_ID'] := dsContract['ID'];

  dmMain.frxModalReport.ShowReport(True);
end;

procedure TDistribForm.actRepAddExecute(Sender: TObject);
var
  PF: TdistrValuePeriodForm;
  cursor: TCursor;
begin
  inherited;

  if dsContract.RecordCount = 0 then
    Exit;

  cursor := Screen.cursor;
  PF := TdistrValuePeriodForm.Create(self);
  try
    PF.Caption := PF.Caption + ' ' + dsContract['C_NUMBER'] + ' ' + dsDistrib['NAME'];
    if PF.ShowModal = mrOk then
    begin
      Screen.cursor := crHourGlass;
      if not PF.chkPrevios.Checked then
      begin
        qryRead.sql.Clear;
        qryRead.sql.Add
          ('UPDATE OR insert into Distrib_Contract_Reports (Contract_Id, Period, Start_Cnt, End_Cnt, Start_Sum, End_Sum, V_Num, V_Date, V_Text, Notice)');
        qryRead.sql.Add
          ('values (:Contract_Id, :Period, :Start_Cnt, :End_Cnt, :Start_Sum, :End_Sum, :V_Num, :V_Date, :V_Text, :Notice)');
        qryRead.sql.Add('MATCHING (CONTRACT_ID, PERIOD);');
        SaveContractPeriod(PF);
      end
      else
      begin
        SaveAsPrevPeriod(PF.period, dsContract['id']);
      end;
    end;
  finally
    Screen.cursor := cursor;
    PF.Free;
  end;
end;

procedure TDistribForm.actRepDelExecute(Sender: TObject);
begin
  inherited;
  if dsReport.RecordCount = 0 then
    Exit;

  if (MessageDlg(Format(rsDeleteRecord, [dsReport.FieldByName('PERIOD').AsString]), mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
    dsReport.Delete;
end;

procedure TDistribForm.actRepEditExecute(Sender: TObject);
var
  PF: TdistrValuePeriodForm;
  period: TDate;
  cursor: TCursor;
begin
  inherited;
  if dsReport.RecordCount = 0 then
    Exit;

  cursor := Screen.cursor;
  PF := TdistrValuePeriodForm.Create(self);
  try
    PF.pnlAll.Visible := False;
    PF.Caption := PF.Caption + ' ' + dsContract['C_NUMBER'] + ' ' + dsDistrib['NAME'];
    PF.pnlPeriod.Enabled := False;
    period := dsReport['period'];
    PF.period := period;
    if (not dsReport.FieldByName('notice').IsNull) then
      PF.mmoBody.Lines.Text := dsReport['notice'];
    if (not dsReport.FieldByName('Start_Cnt').IsNull) then
      PF.edCNTB.value := dsReport['Start_Cnt'];
    if (not dsReport.FieldByName('End_Cnt').IsNull) then
      PF.edCNTE.value := dsReport['End_Cnt'];
    if (not dsReport.FieldByName('Start_Sum').IsNull) then
      PF.edSUMB.value := dsReport['Start_Sum'];
    if (not dsReport.FieldByName('End_Sum').IsNull) then
      PF.edSUME.value := dsReport['End_Sum'];
    if (not dsReport.FieldByName('V_Num').IsNull) then
      PF.edVN.value := dsReport['V_Num'];
    if (not dsReport.FieldByName('V_Date').IsNull) then
      PF.edVD.value := dsReport['V_Date'];
    if (not dsReport.FieldByName('V_Text').IsNull) then
      PF.edVT.value := dsReport['V_Text'];

    if PF.ShowModal = mrOk then
    begin
      Screen.cursor := crHourGlass;
      qryRead.sql.Clear;
      qryRead.sql.Add
        ('UPDATE OR insert into Distrib_Contract_Reports (Contract_Id, Period, Start_Cnt, End_Cnt, Start_Sum, End_Sum, V_Num, V_Date, V_Text, Notice)');
      qryRead.sql.Add
        ('values (:Contract_Id, :Period, :Start_Cnt, :End_Cnt, :Start_Sum, :End_Sum, :V_Num, :V_Date, :V_Text, :Notice)');
      qryRead.sql.Add('MATCHING (CONTRACT_ID, PERIOD);');
      SaveContractPeriod(PF);
      dsReport.Locate('PERIOD', period, []);
    end;
  finally
    Screen.cursor := cursor;
    PF.Free;
  end;
end;

procedure TDistribForm.actSendPDFExecute(Sender: TObject);
var
  body, Subject: String;
  period: TDate;
  periodForm: TdistrPeriodForm;
  cursor: TCursor;
  vSendEmail: Boolean;
begin
  inherited;
  cursor := Screen.cursor;
  periodForm := TdistrPeriodForm.Create(self);
  try
    if periodForm.ShowModal = mrOk then
    begin
      period := periodForm.ShowedPeriod;
      body := periodForm.mmoBody.Lines.Text;
      Subject := periodForm.edtSubject.Text;
      vSendEmail := not periodForm.chkInFile.Checked;
      Screen.cursor := crHourGlass;
      SendEmailMessage(period, body, Subject, vSendEmail);
    end;
  finally
    Screen.cursor := cursor;
    periodForm.Free;
  end;
end;

procedure TDistribForm.actSetPeriodAllExecute(Sender: TObject);
var
  PF: TdistrValuePeriodForm;
  cursor: TCursor;
  i : Integer;
begin
  inherited;
  cursor := Screen.cursor;
  PF := TdistrValuePeriodForm.Create(self);
  try
    if PF.ShowModal = mrOk then
    begin
      Screen.cursor := crHourGlass;

      if not PF.chkPrevios.Checked then
      begin
        qryRead.sql.Text := 'execute procedure Set_Distrib_Report(:Distrib_Id, :Period, :Start_Cnt, ' +
          ':End_Cnt, :Start_Sum, :End_Sum, :V_Num, :V_Date, :V_Text, :Notice, :Contract_Id)';
        if dbGrid.SelectedRows.Count > 0 then begin
          for i := 0 to dbGrid.SelectedRows.Count - 1 do
          begin
            dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[i];
            qryRead.ParamByName('Distrib_Id').AsInteger := dsDistrib['id'];
            SaveContractPeriod(PF);
          end;
        end
        else begin
          qryRead.ParamByName('Distrib_Id').Clear;
          SaveContractPeriod(PF);
        end;
      end
      else
      begin
        if dbGrid.SelectedRows.Count > 0 then begin
          for i := 0 to dbGrid.SelectedRows.Count - 1 do
          begin
            dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[i];
            SaveAsPrevPeriod(PF.period, -1, dsDistrib['id']);
          end;
        end
        else begin
          SaveAsPrevPeriod(PF.period);
        end;
      end;
    end;
  finally
    Screen.cursor := cursor;
    PF.Free;
  end;
end;

procedure TDistribForm.btnSaveLinkClick(Sender: TObject);
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

procedure TDistribForm.dbgContractDblClick(Sender: TObject);
begin
  inherited;
  actCEdit.Execute;
end;

procedure TDistribForm.dbgReportDblClick(Sender: TObject);
begin
  inherited;
  if (dsReport.RecordCount = 0) then
    Exit;

  actRepEdit.Execute;
end;

procedure TDistribForm.dbgReportsDblClick(Sender: TObject);
begin
  inherited;
  if (dsChan.RecordCount = 0) then
    Exit;

  actChEdit.Execute;
end;

procedure TDistribForm.actCDelExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if not fCanEdit then
    Exit;
  if dsContract.FieldByName('ID').IsNull then
    Exit;

  s := '';
  if not dsContract.FieldByName('C_NUMBER').IsNull then
    s := dsContract['C_NUMBER'];

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsContract.Delete;
end;

procedure TDistribForm.actCEditExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if not fCanEdit then
    Exit;
  if dsDistrib.FieldByName('id').IsNull then
    Exit;

  if dsContract.FieldByName('id').IsNull then
  begin
    EditContract(dsDistrib['id']);
    dsContract.CloseOpen(True);
  end
  else
  begin
    i := dsContract['id'];
    EditContract(dsDistrib['id'], i);
    dsContract.Refresh;
    dsContract.Locate('id', i, []);
  end;
end;

procedure TDistribForm.actChAddExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if dsContract.RecordCount = 0 then
    Exit;

  if not fCanEdit then
    Exit;

  i := ContractChannel(dsContract['ID']);
  if i > 0 then
  begin
    dsChan.CloseOpen(True);
    dsChan.Locate('CH_ID', i, []);
    dsContract.Refresh;
    dsDistrib.Refresh;
  end;
end;

procedure TDistribForm.actChDelExecute(Sender: TObject);
begin
  inherited;
  if dsChan.RecordCount = 0 then
    Exit;

  if fCanEdit then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [dsChan['CH_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      dsChan.Delete;
      dsContract.Refresh;
      dsDistrib.Refresh;
    end;
  end;
end;

procedure TDistribForm.actChEditExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (dsContract.RecordCount = 0) or (dsChan.RecordCount = 0) then
    Exit;

  if not fCanEdit then
    Exit;

  i := ContractChannel(dsContract['ID'], dsChan['Ch_Id']);
  if i > 0 then
  begin
    dsChan.CloseOpen(True);
    dsChan.Locate('CH_ID', i, []);
    dsContract.Refresh;
    dsDistrib.Refresh;
  end;
end;

procedure TDistribForm.actCNewExecute(Sender: TObject);
begin
  inherited;
  if not fCanEdit then
    Exit;
  if dsDistrib.FieldByName('id').IsNull then
    Exit;

  EditContract(dsDistrib['id']);
  dsContract.CloseOpen(True);
end;

procedure TDistribForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
      srcDataSource.DataSet.Delete;
end;

procedure TDistribForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TDistribForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Distributor);
  fCanEdit := vFull;
  fCanCreate := fCanEdit;
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  actCNew.Visible := fCanEdit;
  actCDel.Visible := fCanEdit;
  actCEdit.Visible := fCanEdit;

  actRepAdd.Visible := fCanEdit;
  actRepEdit.Visible := fCanEdit;
  actRepDel.Visible := fCanEdit;

  if fCanEdit then
    dbgReports.AllowedOperations := [alopInsertEh, alopUpdateEh, alopDeleteEh, alopAppendEh]
  else
    dbgReports.AllowedOperations := [];

  dsDistrib.Open;
  dbGrid.DefaultApplySorting;
  dsDistrib.First;

  dsContract.Open;
  pgcAddonsChange(Sender);
end;

function TDistribForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  inherited;
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

procedure TDistribForm.srcContractDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  srcReport.AutoEdit := fCanEdit and (not dsContract.FieldByName('id').IsNull);
end;

procedure TDistribForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TDistribForm.pgcAddonsChange(Sender: TObject);
begin
  inherited;
  dsReport.Active := (pgcAddons.ActivePage = tsReports) and (dsContract.Active);
  dsRC.Active := (pgcAddons.ActivePage = tsReports) and (dsContract.Active);
  dsChan.Active := (pgcAddons.ActivePage = tsChan) and (dsContract.Active);
end;

procedure TDistribForm.pgcDistrChange(Sender: TObject);
begin
  inherited;
  dsContract.Active := (pgcDistr.ActivePage = tsContract);
  dsCards.Active := (pgcDistr.ActivePage = tsCards);
  pgcAddonsChange(Sender);
end;

function TDistribForm.LoadReportBody(const REPORT_ID: Integer; const fileName: string = 'AKT.PDF';
  const DirName: string = ''): Boolean;
var
  Stream: TStream;
begin
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').value := REPORT_ID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        frxReport.LoadFromStream(Stream);
        if DirName.IsEmpty then
          frxReport.fileName := GetTempDir() + fileName
        else
          frxReport.fileName := DirName + fileName;
        Result := True;
      finally
        Stream.Free;
      end;
    end
    else
      Result := False;
  finally
    if dmMain.fdsLoadReport.Active then
      dmMain.fdsLoadReport.Close;
  end;
end;

function TDistribForm.InitEmailClient: TEmailClient;
begin
  Result := TEmailClient.Create(self);
  Result.SmtpHost := dmMain.GetSettingsValue('SMTP');
  Result.SmtpPort := dmMain.GetSettingsValue('SMTP_PORT');
  Result.SmtpLogin := dmMain.GetSettingsValue('SMTP_LOGIN');
  Result.SmtpPassword := dmMain.GetSettingsValue('SMTP_PASS');
  Result.FromEmail := dmMain.GetSettingsValue('EMAIL');
  Result.AuthType := dmMain.GetSettingsValue('SMTP_AUTH');
  Result.SslType := dmMain.GetSettingsValue('SMTP_SSL');
  if dmMain.GetSettingsValue('SMTP_2ME') <> '1' then
    Result.CcEmail := ''
  else
    Result.CcEmail := dmMain.GetSettingsValue('EMAIL');
  Result.Confirm := dmMain.GetSettingsValue('SMTP_CONF');
end;

procedure TDistribForm.SendEmailMessage(const period: TDate; const body, Subject: String;
  const aSendEmail: Boolean = True);
var
  ToEmail: string;
  emailClient: TEmailClient;
  Res, rfn: string;
  ci: Integer;
  i: Integer;
  FReportLoaded: Boolean;
  vDirName: string;
begin
  Res := '';
  if dbGrid.SelectedRows.Count > 0 then
  begin
    for i := 0 to dbGrid.SelectedRows.Count - 1 do
    begin
      dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[i];
      Res := Res + IntToStr(dsDistrib['id']) + ',';
    end;
    Res := Res.Trim([',']);
  end;

  qryRead.Transaction := trReadQ;
  qryRead.sql.Clear;
  qryRead.sql.Add('select');
  qryRead.sql.Add('    d.Id Distributor_Id');
  qryRead.sql.Add('  , dc.Id CONTRACT_ID');
  qryRead.sql.Add('  , d.Email');
  qryRead.sql.Add('  , dc.Report_Id');
  qryRead.sql.Add('  , coalesce(dc.Report_Frmt, ''PDF'') Report_Frmt');
  qryRead.sql.Add('  , dc.C_Number');
  qryRead.sql.Add('  , dc.C_Date');
  qryRead.sql.Add('  from Distributor d');
  qryRead.sql.Add('       inner join Distrib_Contracts dc on (d.Id = dc.Distributor_Id)');
  qryRead.sql.Add('  where (not dc.Report_Id is null) ');
  if aSendEmail then
    qryRead.sql.Add('    and (not d.Email is null)');
  qryRead.sql.Add('    and ((:period >= dc.C_Date and (dc.C_Date_Before is null or :period <= dc.C_Date_Before))');
  qryRead.sql.Add(' or (extract(YEAR from cast(:period as date))||extract(month from cast(:period as date)) ');
  qryRead.sql.Add('     = extract(YEAR from dc.C_Date)||extract(month from dc.C_Date)))');
  if not Res.IsEmpty then
    qryRead.sql.Add('  and d.Id in (' + Res + ')');
  qryRead.sql.Add('order by 1, 2 ');
  qryRead.ParamByName('period').AsDate := period;
  qryRead.Transaction.StartTransaction;
  qryRead.ExecQuery;

  vDirName := '';
  if not aSendEmail then
  begin
    // не рассылаем, а только сохраняем акты
    SelectDirectory('Куда сохранить акты?', '', vDirName);
    vDirName := vDirName.Trim(['\']) + '\';
  end;

  while not qryRead.EOF do
  begin
    ToEmail := qryRead.FN('EMAIL').AsString;
    rfn := qryRead.FN('C_Number').AsString + '_' + FormatDateTime('Y-mm', period) + '.' +
      qryRead.FN('Report_Frmt').AsString;
    rfn := rfn.Replace('"', '').Replace('\', '_').Replace('/', '_');
    FReportLoaded := LoadReportBody(qryRead.FN('Report_Id').AsInteger, rfn, vDirName);

    if FReportLoaded then
    begin
      if aSendEmail then
        emailClient := InitEmailClient();
      try
        ci := frxReport.Variables.IndexOf('PERIOD');
        if ci > 0 then
          frxReport.Variables['PERIOD'] := period; // FormatDateTime('yyyy-m-d', period);

        ci := frxReport.Variables.IndexOf('CONTRACT_ID');
        if ci > 0 then
          frxReport.Variables['CONTRACT_ID'] := qryRead.FN('CONTRACT_ID').AsInteger;

        if frxReport.PrepareReport(True) then
        begin
          if qryRead.FN('Report_Frmt').AsString = 'PDF' then
          begin
            dmMain.frxPDFExport.ShowDialog := False;
            dmMain.frxPDFExport.fileName := frxReport.fileName;
            frxReport.Export(dmMain.frxPDFExport);
          end
          else if qryRead.FN('Report_Frmt').AsString = 'DOCX' then
          begin
            dmMain.frxDOCXExport.ShowDialog := False;
            dmMain.frxDOCXExport.fileName := frxReport.fileName;
            frxReport.Export(dmMain.frxDOCXExport);
          end
          else if qryRead.FN('Report_Frmt').AsString = 'ODT' then
          begin
            dmMain.frxODTExport.ShowDialog := False;
            dmMain.frxODTExport.fileName := frxReport.fileName;
            frxReport.Export(dmMain.frxODTExport);
          end;
          if aSendEmail then
            emailClient.AddAttachment(frxReport.fileName);
        end;

        if aSendEmail then
        begin
          emailClient.Subject := Subject;
          emailClient.body := body;
          emailClient.ToEmail := ToEmail;
          Res := emailClient.SendEmail;
        end
        else
          Res := 'Ok';
      finally
        if aSendEmail then
        begin
          if FReportLoaded and FileExists(frxReport.fileName) then
            DeleteFile(frxReport.fileName);
          FreeAndNil(emailClient);
        end;
      end;
    end;
    qryRead.Next;
  end;
  qryRead.Transaction.Commit;
  qryRead.Close;
end;

procedure TDistribForm.SaveContractPeriod(PF: TdistrValuePeriodForm);
begin
  qryRead.ParamByName('Contract_Id').AsInteger := dsContract['id'];
  qryRead.ParamByName('Period').AsDate := PF.period;
  if (not PF.mmoBody.Lines.Text.IsEmpty) then
    qryRead.ParamByName('notice').AsString := PF.mmoBody.Lines.Text;
  if (not PF.edCNTB.Text.IsEmpty) then
    qryRead.ParamByName('Start_Cnt').AsInteger := PF.edCNTB.value;
  if (not PF.edCNTE.Text.IsEmpty) then
    qryRead.ParamByName('End_Cnt').AsInteger := PF.edCNTE.value;
  if (not PF.edSUMB.Text.IsEmpty) then
    qryRead.ParamByName('Start_Sum').AsCurrency := PF.edSUMB.value;
  if (not PF.edSUME.Text.IsEmpty) then
    qryRead.ParamByName('End_Sum').AsCurrency := PF.edSUME.value;
  if (not PF.edVN.Text.IsEmpty) then
    qryRead.ParamByName('V_Num').AsCurrency := PF.edVN.value;
  if (not PF.edVD.IsEmpty) then
    qryRead.ParamByName('V_Date').AsDate := PF.edVD.value;
  if (not PF.edVT.Text.IsEmpty) then
    qryRead.ParamByName('V_Text').AsString := PF.edVT.value;

  qryRead.Transaction := trWriteQ;
  qryRead.Transaction.StartTransaction;
  qryRead.ExecQuery;
  qryRead.Transaction.Commit;
  qryRead.Close;

  if dsReport.Active then
  begin
    dsReport.CloseOpen(True);
    dsRC.CloseOpen(True);
  end;
end;

procedure TDistribForm.SaveAsPrevPeriod(const period: TDate; const Contract_ID: Integer = -1; const Distrib_ID: Integer = -1);
begin

  qryRead.sql.Text := 'execute procedure Set_Distrib_Report_As_Period(:Period, :Distrib_Id, :Contract_Id)';

  qryRead.ParamByName('Period').AsDate := period;

  if Distrib_ID > -1 then
    qryRead.ParamByName('Distrib_Id').AsInteger := Distrib_ID
  else
    qryRead.ParamByName('Distrib_Id').Clear;

  if Contract_ID > -1 then
    qryRead.ParamByName('Contract_Id').AsInteger := Contract_ID
  else
    qryRead.ParamByName('Contract_Id').Clear;

  qryRead.Transaction := trWriteQ;
  qryRead.Transaction.StartTransaction;
  qryRead.ExecQuery;
  qryRead.Transaction.Commit;
  qryRead.Close;

  if dsReport.Active then
  begin
    dsReport.CloseOpen(True);
    dsRC.CloseOpen(True);
  end;

end;

end.
