unit WorkersForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, FIBDatabase,
  pFIBDatabase, DBCtrlsEh, DBLookupEh, CnErrorProvider, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBQuery, pFIBQuery;

type
  TWorkersForm = class(TGridForm)
    dsWorkers: TpFIBDataSet;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtSurname: TDBEditEh;
    edt2: TDBEditEh;
    edt3: TDBEditEh;
    edtPhone: TDBEditEh;
    edtEMAIL: TDBEditEh;
    dbchckbxh1: TDBCheckBoxEh;
    cbIN_DOGOVOR: TDBCheckBoxEh;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    cbIN_DOGOVOR1: TDBCheckBoxEh;
    edtPOST: TDBEditEh;
    lcbTEAM: TDBLookupComboboxEh;
    edDepart: TDBEditEh;
    lcbWorkArea: TDBLookupComboboxEh;
    deBIRTHDAY: TDBDateTimeEditEh;
    lbl6: TLabel;
    dbmmoNOTICE: TDBMemoEh;
    trSWrite: TpFIBTransaction;
    dsTEAM: TpFIBDataSet;
    srcTEAM: TDataSource;
    dsWA: TpFIBDataSet;
    srcWA: TDataSource;
    dsDEPART: TpFIBDataSet;
    srcDepart: TDataSource;
    trSRead: TpFIBTransaction;
    edtPRINT_FIO: TDBEditEh;
    Label1: TLabel;
    edtPRINT_TEXT: TDBEditEh;
    Label2: TLabel;
    ToolButton7: TToolButton;
    btnSendSMS: TToolButton;
    actSendSMS: TAction;
    qrySaveMessages: TpFIBQuery;
    ednHRATE: TDBNumberEditEh;
    lbl12: TLabel;
    Label3: TLabel;
    edtMESSENGER: TDBEditEh;
    procedure tbCancelClick(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure dsWorkersNewRecord(DataSet: TDataSet);
    procedure actSendSMSExecute(Sender: TObject);
  private
    FEnterSecondPress: Boolean;
    procedure PrepareEdit;
  public
    { Public declarations }
  end;

var
  WorkersForm: TWorkersForm;

implementation

uses
  DM, TextEditForma;

{$R *.dfm}

procedure TWorkersForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TWorkersForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanCreate
  then begin
    StartEdit(True);
    PrepareEdit();
  end;
end;

procedure TWorkersForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteWorkerInfo, [srcDataSource.DataSet['SURNAME']]), mtConfirmation, [mbYes, mbNo],
      0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TWorkersForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then begin
    StartEdit(False);
    PrepareEdit();
  end;
end;

procedure TWorkersForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TWorkersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  WorkersForm := nil;
end;

procedure TWorkersForm.FormShow(Sender: TObject);
begin
  inherited;
  fCanEdit := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Workers)));
  fCanCreate := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Workers)));
  // права пользователей
  actNew.Visible := fCanCreate;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  srcDataSource.DataSet.Open;
end;

procedure TWorkersForm.btnCancelLinkClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TWorkersForm.PrepareEdit;
begin
  dsDEPART.Open;
  edDepart.MRUList.Items.Clear;
  while not dsDEPART.Eof do begin
    if not dsDEPART.FieldByName('DEPARTMENT').IsNull
    then edDepart.MRUList.Items.Add(dsDEPART['DEPARTMENT']);
    dsDEPART.Next;
  end;
  dsDEPART.Close;
  dsTEAM.Open;
  dsWA.Open;
end;

procedure TWorkersForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    //else if (ActiveControl is TDBGridEh) then
    //  go := False	  
	//else if (ActiveControl is TDBSynEdit) and not(Trim((ActiveControl as TDBSynEdit).Lines.Text) = '') then
    //  go := False;
    //else if (ActiveControl is TDBAxisGridInplaceEdit) then
    //  go := False
    else
    begin
      if (ActiveControl is TDBMemoEh) and (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure TWorkersForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;
  if (edtSurname.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtSurname, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtSurname);

  if not errors
  then inherited;
end;

procedure TWorkersForm.dsWorkersNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsWorkers['IN_DOGOVOR'] := False;
  dsWorkers['IN_REQUEST'] := True;
  dsWorkers['WORKING'] := True;
end;

procedure TWorkersForm.actSendSMSExecute(Sender: TObject);
  procedure SendMessage(const mes_text: string);
  begin
    if (mes_text = '')
    then exit;
    if ((dsWorkers.FieldByName('PHONE_NO').IsNull) or (Length(Trim(dsWorkers['PHONE_NO'])) < 7))
    then exit;
    if ((dsWorkers.FieldByName('WORKING').IsNull) or (dsWorkers['WORKING']))
    then exit;

    with qrySaveMessages do begin
      ParamByName('MES_TEXT').AsString := mes_text;
      ParamByName('Reciver').AsString := dsWorkers['PHONE_NO'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    end;
  end;

var
  j: Integer;
  sms_text: String;
  sList : TStringList;
  b: Boolean;
begin
  if not(dmMain.AllowedAction(rght_Messages_add))
  then exit;
  sList := TStringList.Create;
  b := not EditText(sList, 'Текст SMS', '');
  sms_text := Trim(sList.Text);
  FreeAndNil(sList);

  if (b and (sms_text = ''))
  then exit;

  try
    if dbGrid.SelectedRows.Count > 0
    then begin
      for j := 0 to dbGrid.SelectedRows.Count - 1 do begin
        dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[j];
        SendMessage(sms_text);
      end
    end
    else begin
      SendMessage(sms_text);
    end;
  finally
    //
  end;

end;

end.
