unit OnOffServicesForma;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, DBGridEh, StdCtrls, DBCtrlsEh, Mask, DBLookupEh,
  DB, FIBDataSet, pFIBDataSet, ExtCtrls, DBCtrls, FIBQuery, pFIBQuery,
  CnErrorProvider, PrjConst, System.UITypes;

type
  TOnOffServiceForm = class(TForm)
    OkCancelFrame: TOkCancelFrame;
    srcOnOffService: TDataSource;
    servPanel: TPanel;
    pnlDate: TPanel;
    eDate: TDBDateTimeEditEh;
    Label2: TLabel;
    luService: TDBLookupComboboxEh;
    srcService: TDataSource;
    Label3: TLabel;
    Query: TpFIBQuery;
    pnlONOFF: TPanel;
    Label1: TLabel;
    luOnOffService: TDBLookupComboboxEh;
    pnlQUANT: TPanel;
    eUNITS: TDBNumberEditEh;
    Panel1: TPanel;
    Label4: TLabel;
    memNotice: TDBMemoEh;
    Label5: TLabel;
    lblDimension: TDBText;
    pnlSRV2: TPanel;
    Label6: TLabel;
    dblSwitchTo: TDBLookupComboboxEh;
    eDateTo: TDBDateTimeEditEh;
    pnlDogovor: TPanel;
    edtDogDate: TDBDateTimeEditEh;
    edtDogovor: TDBEditEh;
    lblContr: TLabel;
    chkContract: TCheckBox;
    pnlVAT: TPanel;
    cbbVATG: TDBLookupComboboxEh;
    lblVAT: TLabel;
    dsVATG: TpFIBDataSet;
    srcVATG: TDataSource;
    dsCustomer: TpFIBDataSet;
    srcSwitchTo: TDataSource;
    dsSwitchTo: TpFIBDataSet;
    dsService: TpFIBDataSet;
    dsOnOffService: TpFIBDataSet;
    CnErrors: TCnErrorProvider;
    procedure dsServiceAfterOpen(DataSet: TDataSet);
    procedure dsOnOffServiceAfterOpen(DataSet: TDataSet);
    procedure luServiceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure luOnOffServiceChange(Sender: TObject);
    procedure chkContractClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFramebbOkClick(Sender: TObject);
    procedure dsSwitchToAfterOpen(DataSet: TDataSet);
    procedure dblSwitchToChange(Sender: TObject);
    procedure eDateToEnter(Sender: TObject);
    procedure eDateExit(Sender: TObject);
  private
    { Private declarations }
    fFullAccess: Boolean;
    fChangeHistory: Boolean;
    fCanEdit: Boolean;
    fCanAdd: Boolean;
    fService_TYPE: Integer;
    fService_ID: Integer;
    procedure setSRVType(value: Integer);
    function CheckDataAndOk: Boolean;
    procedure CheckAndGenContract;
  public
    { Public declarations }
    property Service_TYPE: Integer write setSRVType;
  end;

  // Добавление новой услуги абоненту
  // aCustomer_ID -  код абонента
  // aService_TYPE - тип услуги
  // 0 - абонентская услуга
  // 1 - разовая услуга
function NewService(const aCustomer_ID, aService_TYPE: Integer): Boolean;

// Включение отключение услуги
// aCustomer_ID -  код абонента
// aService_ID - абонентская услуга
// aSubscr_Serv_ID - ID в таблице Subscr_Serv
// Off - включение / отключение (FALSE / TRUE)
// Notice - примечание
function OnOffService(const aCustomer_ID, aService_ID, aSubscr_Serv_ID: Integer; Off: Boolean;
  const Notice: String): Boolean;

// Переключение переодической услуги
// aCustomer_ID -  код абонента
// aService_ID - абонентская услуга
// aSubscr_Serv_ID - ID в таблице Subscr_Serv
// Notice - примечание
function SwitchServics(const aCustomer_ID, aService_ID, aSubscr_Serv_ID: Integer; const Notice: String): Boolean;

// Временное отключение услуги
// aCustomer_ID -  код абонента
// aService_ID - абонентская услуга
// aSubscr_Serv_ID - ID в таблице Subscr_Serv
// Notice - примечание
function PauseService(const aCustomer_ID, aService_ID, aSubscr_Serv_ID: Integer; const Notice: String): Boolean;

implementation

uses DM, AtrCommon, CF;

function PauseService(const aCustomer_ID, aService_ID, aSubscr_Serv_ID: Integer; const Notice: String): Boolean;
var
  i: Integer;
  all: Boolean;
  Save_Cursor: TCursor;
begin
  Result := False;
  with TOnOffServiceForm.Create(application) do
    try
      Caption := rsPauseSrv;
      servPanel.Visible := False;
      pnlSRV2.Visible := False;
      Height := Height - servPanel.Height;
      dsOnOffService.ParamByName('ACUSTOMER_ID').value := aCustomer_ID;
      dsOnOffService.ParamByName('ASERVICE_ID').value := aService_ID;
      dsOnOffService.ParamByName('asubscr_serv_id').value := aSubscr_Serv_ID;
      dsOnOffService.ParamByName('AOFF').value := 0;
      memNotice.Lines.Text := Notice;
      dsOnOffService.Open;
      eDateTo.Visible := True;
      pnlQUANT.Visible := (dsOnOffService['SERVICE_TYPE'] = 2);
      // OkCancelFrame.bbOk.Enabled := dsOnOffService.RecordCount>0;
      if ShowModal = mrOk then
      begin
        // если нельзя редактировать выходим
        if not(fFullAccess or fCanAdd or fCanEdit or fChangeHistory) then
          exit;

        Query.SQL.Text :=
          'EXECUTE PROCEDURE ONOFF_SERVICE_FOR_GROUP(:CUSTOMER_ID, :SERV_ID, :ACTSERVICE, :DATE,:OFF,:NOTICE,:AUNITS);';
        Query.ParamByName('ACTSERVICE').AsInteger := luOnOffService.value;
        Query.ParamByName('SERV_ID').AsInteger := aService_ID;
        Query.ParamByName('NOTICE').AsString := memNotice.Lines.Text;
        if (dsOnOffService['SERVICE_TYPE'] = 2) then
          try
            Query.ParamByName('AUNITS').AsFloat := eUNITS.value;
          except
            Query.ParamByName('AUNITS').AsFloat := 0;
          end
        else
          Query.ParamByName('AUNITS').AsFloat := 1;
        Query.Transaction := dmMain.trWriteQ;

        all := False;

        if Assigned(CustomersForm) then
          if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
            all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

        if all then
        begin
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass; { Show hourglass cursor }
          for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do
          begin
            CustomersForm.dbgCustomers.DataSource.DataSet.Bookmark := CustomersForm.dbgCustomers.SelectedRows[i];
            Query.ParamByName('CUSTOMER_ID').AsInteger := CustomersForm.dbgCustomers.DataSource.DataSet['CUSTOMER_ID'];
            try
              Query.ParamByName('OFF').AsInteger := 1;
              Query.ParamByName('DATE').AsDate := eDate.value;
              Query.Transaction.StartTransaction;
              Query.ExecQuery;
              Query.Transaction.Commit;
              Query.ParamByName('OFF').AsInteger := 0;
              if (eDateTo.value <> null) then
                Query.ParamByName('DATE').AsDate := eDateTo.value;
              Query.Transaction.StartTransaction;
              Query.ExecQuery;
              Query.Transaction.Commit;
              CustomersForm.dsCustomers.Refresh;
            except
            end;
          end;
          Screen.Cursor := Save_Cursor; { Always restore to normal }
        end
        else
        begin
          Query.ParamByName('CUSTOMER_ID').AsInteger := aCustomer_ID;
          Query.ParamByName('OFF').AsInteger := 1;
          Query.ParamByName('DATE').AsDate := eDate.value;
          Query.Transaction.StartTransaction;
          Query.ExecQuery;
          Query.Transaction.Commit;
          Query.ParamByName('OFF').AsInteger := 0;
          if (eDateTo.value <> null) then
            Query.ParamByName('DATE').AsDate := eDateTo.value;
          Query.Transaction.StartTransaction;
          Query.ExecQuery;
          Query.Transaction.Commit;
        end;
        Result := True;
      end;
    finally
      free;
    end;
end;

function SwitchServics(const aCustomer_ID, aService_ID, aSubscr_Serv_ID: Integer; const Notice: String): Boolean;
var
  i: Integer;
  all: Boolean;
  Save_Cursor: TCursor;
  ExecRESULT: Integer;
begin
  Result := False;
  with TOnOffServiceForm.Create(application) do
    try
      servPanel.Visible := False;
      pnlSRV2.Visible := True;
      Height := Height - servPanel.Height;
      fService_ID := aService_ID;

      dsSwitchTo.ParamByName('SERVICE_ID').value := fService_ID;
      if dsOnOffService.Active then
        dsOnOffService.Close;
      dsOnOffService.SelectSQL.Text := 'select * from Selectswitchservice(:From_Srv, :To_Srv)';
      dsSwitchTo.Open;
      if dsSwitchTo.RecordCount = 0 then
        exit;
      // dsOnOffService.ParamByName('From_Srv').Value := aSERVICE_ID;
      // dsOnOffService.ParamByName('To_Srv').Value   := dsSwitchTo['Service_id'];
      // dsOnOffService.Open;
      // if off
      // then dsOnOffService.ParamByName('AOFF').Value := 1
      // else dsOnOffService.ParamByName('AOFF').Value := 0;
      memNotice.Lines.Text := Notice;
      pnlQUANT.Visible := (dsOnOffService['SERVICE_TYPE'] = 2);
      OkCancelFrame.bbOk.Enabled := dsOnOffService.RecordCount > 0;
      if ShowModal = mrOk then
      begin
        if VarIsNull(dblSwitchTo.value) or VarIsNull(luOnOffService.value) then
          exit;
        // если нельзя редактировать выходим
        if not(fFullAccess or fCanAdd or fCanEdit or fChangeHistory) then
          exit;

        Query.SQL.Text :=
          'select RESULT from Switch_Service(:Customer_Id, :From_Srv, :To_Srv, :Switch_Srv, :Units, :Switch_Date, :Notice);';
        Query.ParamByName('Customer_Id').AsInteger := aCustomer_ID;
        Query.ParamByName('From_Srv').AsInteger := fService_ID;
        Query.ParamByName('TO_Srv').AsInteger := dblSwitchTo.value;
        Query.ParamByName('Switch_Srv').AsInteger := luOnOffService.value;
        if not VarIsNull(eDate.value) then
          Query.ParamByName('Switch_Date').AsDate := eDate.value
        else
          Query.ParamByName('Switch_Date').Clear;

        Query.ParamByName('NOTICE').AsString := memNotice.Lines.Text;
        if (dsOnOffService['SERVICE_TYPE'] = 2) then
          try
            Query.ParamByName('Units').AsFloat := eUNITS.value;
          except
            Query.ParamByName('Units').AsFloat := 0;
          end
        else
          Query.ParamByName('Units').AsFloat := 1;

        Query.Transaction := dmMain.trWriteQ;

        all := False;

        if Assigned(CustomersForm) then
          if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
            all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

        if all then
        begin
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass; { Show hourglass cursor }
          for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do
          begin
            CustomersForm.dbgCustomers.DataSource.DataSet.Bookmark := CustomersForm.dbgCustomers.SelectedRows[i];
            Query.ParamByName('CUSTOMER_ID').AsInteger := CustomersForm.dbgCustomers.DataSource.DataSet['CUSTOMER_ID'];
            try
              Query.Transaction.StartTransaction;
              Query.ExecQuery;
              Query.Transaction.Commit;
              CustomersForm.dsCustomers.Refresh;
            except
            end;
          end;
          Screen.Cursor := Save_Cursor; { Always restore to normal }
        end
        else
        begin
          Query.ParamByName('CUSTOMER_ID').AsInteger := aCustomer_ID;
          Query.Transaction.StartTransaction;
          Query.ExecQuery;
          ExecRESULT := Query.FN('RESULT').AsInteger;
          Query.Transaction.Commit;
          case ExecRESULT of
            - 1:
              ShowMessage(rsSrvSwitchNotCongigure); // Не настроена связка переключений услуг
            -2:
              ShowMessage(rsSrvAlreadyOff); // Услуга уже отключена
            -3:
              ShowMessage(rsNoMoney); // Нет денег на счете
          end;

        end;

        Result := True;
      end;
    finally
      free;
    end;
end;

function OnOffService(const aCustomer_ID, aService_ID, aSubscr_Serv_ID: Integer; Off: Boolean;
  const Notice: String): Boolean;
var
  i: Integer;
  all: Boolean;
  Save_Cursor: TCursor;
begin
  Result := False;
  with TOnOffServiceForm.Create(application) do
    try
      servPanel.Visible := False;
      pnlSRV2.Visible := False;
      Height := Height - servPanel.Height;
      dsOnOffService.ParamByName('ACUSTOMER_ID').value := aCustomer_ID;
      dsOnOffService.ParamByName('ASERVICE_ID').value := aService_ID;
      dsOnOffService.ParamByName('asubscr_serv_id').value := aSubscr_Serv_ID;
      if Off then
        dsOnOffService.ParamByName('AOFF').value := 1
      else
        dsOnOffService.ParamByName('AOFF').value := 0;
      memNotice.Lines.Text := Notice;
      dsOnOffService.Open;
      pnlQUANT.Visible := (dsOnOffService['SERVICE_TYPE'] = 2);
      OkCancelFrame.bbOk.Enabled := dsOnOffService.RecordCount > 0;
      if ShowModal = mrOk then
      begin
        // если нельзя редактировать выходим
        if not(fFullAccess or fCanAdd or fCanEdit or fChangeHistory) then
          exit;

        Query.SQL.Text :=
          'EXECUTE PROCEDURE ONOFF_SERVICE_FOR_GROUP(:CUSTOMER_ID, :SERV_ID, :ACTSERVICE, :DATE,:OFF,:NOTICE,:AUNITS);';
        Query.ParamByName('ACTSERVICE').AsInteger := luOnOffService.value;
        Query.ParamByName('SERV_ID').AsInteger := aService_ID;
        Query.ParamByName('DATE').AsDate := eDate.value;
        Query.ParamByName('NOTICE').AsString := memNotice.Lines.Text;
        if (dsOnOffService['SERVICE_TYPE'] = 2) then
          try
            Query.ParamByName('AUNITS').AsFloat := eUNITS.value;
          except
            Query.ParamByName('AUNITS').AsFloat := 0;
          end
        else
          Query.ParamByName('AUNITS').AsFloat := 1;

        if Off then
          Query.ParamByName('OFF').AsInteger := 1
        else
          Query.ParamByName('OFF').AsInteger := 0;
        Query.Transaction := dmMain.trWriteQ;

        all := False;

        if Assigned(CustomersForm) then
          if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
            all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

        if all then
        begin
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass;
          for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do
          begin
            CustomersForm.dbgCustomers.DataSource.DataSet.Bookmark := CustomersForm.dbgCustomers.SelectedRows[i];
            Query.ParamByName('CUSTOMER_ID').AsInteger := CustomersForm.dbgCustomers.DataSource.DataSet['CUSTOMER_ID'];
            try
              Query.Transaction.StartTransaction;
              Query.ExecQuery;
              Query.Transaction.Commit;
              CustomersForm.dsCustomers.Refresh;
            except
            end;
            application.ProcessMessages;
          end;
          Screen.Cursor := Save_Cursor;
        end
        else
        begin
          Query.ParamByName('CUSTOMER_ID').AsInteger := aCustomer_ID;
          Query.Transaction.StartTransaction;
          Query.ExecQuery;
          Query.Transaction.Commit;
        end;

        Result := True;
      end;
    finally
      free;
    end;
end;

function NewService(const aCustomer_ID, aService_TYPE: Integer): Boolean;
var
  i: Integer;
  all: Boolean;
  Save_Cursor: TCursor;
begin
  Result := False;
  with TOnOffServiceForm.Create(application) do
    try
      Service_TYPE := aService_TYPE;
      Caption := ms_ADD_NEW_SERVICE;
      dsCustomer.ParamByName('customer_id').value := aCustomer_ID;
      dsCustomer.Open;
      if dsCustomer.FieldByName('JURIDICAL').AsInteger = 1 then
      begin
        dsVATG.Open;
        pnlVAT.Visible := True;
        cbbVATG.value := dsCustomer['VATG_ID'];
      end;

      dsService.ParamByName('customer_id').value := aCustomer_ID;
      dsService.ParamByName('TYPE').value := aService_TYPE;
      dsService.Open;

      OkCancelFrame.bbOk.Enabled := dsService.RecordCount > 0;
      if aService_TYPE = 0 then
        luOnOffServiceChange(nil);
      if ShowModal = mrOk then
      begin
        // если нельзя редактировать выходим
        if not(fFullAccess or fCanAdd) then
          exit;

        if aService_TYPE = 0 then
        begin
          if (luOnOffService.Text = '') then
          begin
            ShowMessage(format(rsErrorSrvOnOff, [luService.Text]));
            exit;
          end;
          Query.SQL.Text :=
            'EXECUTE PROCEDURE ADD_SUBSCR_SERVICE_VAT(:ACUSTOMER_ID, :ASERVICE_ID, :AACTSERVICE, :ADATE, :NOTICE, :AUNITS, :DOG, :DOG_DATE,:VATG_ID);';
          Query.ParamByName('AACTSERVICE').AsInteger := luOnOffService.value;
          if (dsOnOffService['SERVICE_TYPE'] = 2) then
            try
              Query.ParamByName('AUNITS').AsFloat := eUNITS.value;
            except
              Query.ParamByName('AUNITS').AsFloat := 0;
            end
          else
            Query.ParamByName('AUNITS').AsFloat := 1;
          if chkContract.Checked then
          begin
            Query.ParamByName('DOG').AsString := edtDogovor.Text;
            if not VarIsNull(edtDogDate.value) then
              Query.ParamByName('DOG_DATE').AsDate := edtDogDate.value;
          end;

          Query.ParamByName('ASERVICE_ID').AsInteger := luService.value;
        end
        else
        begin
          Query.SQL.Text :=
            'EXECUTE PROCEDURE ADD_SINGLE_SERVICE_VAT(:ACUSTOMER_ID, :ASERVICE_ID, :AUNITS, :ADATE, :NOTICE, null, :VATG_ID);';
          try
            Query.ParamByName('AUNITS').AsFloat := eUNITS.value;
          except
            Query.ParamByName('AUNITS').AsFloat := 0;
          end;
          Query.ParamByName('ASERVICE_ID').AsInteger := luService.value;
        end;
        if dsCustomer.FieldByName('JURIDICAL').AsInteger = 1 then
        begin
          if not VarIsNull(cbbVATG.value) then
            Query.ParamByName('VATG_ID').AsInteger := cbbVATG.value;
        end;

        Query.ParamByName('ACUSTOMER_ID').AsInteger := aCustomer_ID;
        Query.ParamByName('NOTICE').AsString := memNotice.Lines.Text;
        Query.ParamByName('ADATE').AsDate := eDate.value;
        Query.Transaction := dmMain.trWriteQ;
        all := False;

        if Assigned(CustomersForm) then
          if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
            all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

        if all then
        begin
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass; { Show hourglass cursor }
          for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do
          begin
            CustomersForm.dbgCustomers.DataSource.DataSet.Bookmark := CustomersForm.dbgCustomers.SelectedRows[i];
            Query.ParamByName('ACUSTOMER_ID').AsInteger := CustomersForm.dbgCustomers.DataSource.DataSet['CUSTOMER_ID'];
            try
              Query.Transaction.StartTransaction;
              Query.ExecQuery;
              Query.Transaction.Commit;
              CustomersForm.dsCustomers.Refresh;
            except
              //
            end;
          end;
          Screen.Cursor := Save_Cursor; { Always restore to normal }
        end
        else
        begin
          Query.ParamByName('ACUSTOMER_ID').AsInteger := aCustomer_ID;
          Query.Transaction.StartTransaction;
          Query.ExecQuery;
          Query.Transaction.Commit;
        end;
        Result := True;
      end;
    finally
      free;
    end;
end;

{$R *.dfm}

procedure TOnOffServiceForm.setSRVType(value: Integer);
begin
  fService_TYPE := value;

  servPanel.Visible := True;
  pnlDogovor.Visible := (fService_TYPE = 0);
  pnlSRV2.Visible := False;
  pnlONOFF.Visible := (fService_TYPE = 0);
  pnlQUANT.Visible := (fService_TYPE = 1);

end;

procedure TOnOffServiceForm.FormCreate(Sender: TObject);
begin
  if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    eDate.value := NOW;
  fFullAccess := dmMain.AllowedAction(rght_Customer_full);
  fCanEdit := dmMain.AllowedAction(rght_Customer_EditSrv);
  fCanAdd := dmMain.AllowedAction(rght_Customer_AddSrv);
  fChangeHistory := dmMain.AllowedAction(rght_Customer_History);
  OkCancelFrame.bbOk.Visible := fFullAccess or fCanEdit or fCanAdd;
end;

procedure TOnOffServiceForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (OkCancelFrame.bbOk.Enabled) then
    if CheckDataAndOk then
      ModalResult := mrOk;
end;

procedure TOnOffServiceForm.luServiceChange(Sender: TObject);
begin
  if not VarIsNull(luService.KeyValue) and (luOnOffService.Visible) and (fService_TYPE = 0) and (dsService.Active) then
  begin
    dsOnOffService.Close;
    dsOnOffService.ParamByName('ACUSTOMER_ID').value := dsService.ParamByName('customer_id').value;
    dsOnOffService.ParamByName('ASERVICE_ID').value := luService.KeyValue;
    dsOnOffService.ParamByName('asubscr_serv_id').IsNull := True;
    dsOnOffService.ParamByName('AOFF').value := 0;
    dsOnOffService.Open;
  end

end;

procedure TOnOffServiceForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  if CheckDataAndOk then
    ModalResult := mrOk;
end;

procedure TOnOffServiceForm.chkContractClick(Sender: TObject);
begin
  CheckAndGenContract;
  edtDogDate.Visible := chkContract.Checked;
  edtDogovor.Visible := chkContract.Checked;
  lblContr.Visible := chkContract.Checked;
end;

procedure TOnOffServiceForm.dblSwitchToChange(Sender: TObject);
begin
  if not VarIsNull(dblSwitchTo.KeyValue) and (luOnOffService.Visible) and dsSwitchTo.Active then
  begin
    dsOnOffService.Close;
    dsOnOffService.ParamByName('To_Srv').value := dblSwitchTo.KeyValue;
    dsOnOffService.ParamByName('From_Srv').value := fService_ID;
    // dsOnOffService.ParamByName('To_Srv').Value   := dsSwitchTo['Service_id'];
    dsOnOffService.Open;
  end
end;

procedure TOnOffServiceForm.dsOnOffServiceAfterOpen(DataSet: TDataSet);
begin
  luOnOffService.KeyValue := dsOnOffService['id'];
end;

procedure TOnOffServiceForm.dsServiceAfterOpen(DataSet: TDataSet);
begin
  luService.KeyValue := dsService['SERVICE_ID'];
end;

procedure TOnOffServiceForm.dsSwitchToAfterOpen(DataSet: TDataSet);
begin
  dblSwitchTo.KeyValue := dsSwitchTo['SERVICE_ID'];

end;

procedure TOnOffServiceForm.eDateExit(Sender: TObject);
begin
  CheckAndGenContract;
end;

procedure TOnOffServiceForm.CheckAndGenContract;
begin
  if chkContract.Checked then
  begin
    if CheckDataAndOk then
      edtDogovor.Text := dmMain.GenerateDogNumberForCustomer(dsService.ParamByName('customer_id').value,
        luService.KeyValue);
    edtDogDate.value := NOW();
  end;
end;

procedure TOnOffServiceForm.eDateToEnter(Sender: TObject);
begin
  CnErrors.Dispose(Sender as TControl);
end;

procedure TOnOffServiceForm.luOnOffServiceChange(Sender: TObject);
begin
  try
    pnlQUANT.Visible := (dsOnOffService['SERVICE_TYPE'] = 2);
  except
  end;
end;

// проверка введенных данных перед сохранением
function TOnOffServiceForm.CheckDataAndOk: Boolean;
var
  allOk: Boolean;
  VD: TDateTime;
begin
  allOk := True;

  if servPanel.Visible then
  begin
    if not VarIsNumeric(luService.value) then
    begin
      allOk := False;
      CnErrors.SetError(luService, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
      luService.SetFocus;
    end
    else
      CnErrors.Dispose(luService);
  end;

  if pnlONOFF.Visible and (not VarIsNumeric(luOnOffService.value)) then
  begin
    allOk := False;
    CnErrors.SetError(luOnOffService, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    luOnOffService.SetFocus;
  end
  else
    CnErrors.Dispose(luOnOffService);

  if edtDogDate.Visible and (not TryStrToDate(edtDogDate.Text, VD)) then
  begin
    allOk := False;
    CnErrors.SetError(edtDogDate, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    edtDogDate.SetFocus;
  end
  else
    CnErrors.Dispose(edtDogDate);

  if pnlQUANT.Visible and (not VarIsNumeric(eUNITS.value)) then
  begin
    allOk := False;
    CnErrors.SetError(eUNITS, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    eUNITS.SetFocus;
  end
  else
    CnErrors.Dispose(eUNITS);

  if pnlDate.Visible then
  begin
    if (not TryStrToDate(eDate.Text, VD)) then
    begin
      allOk := False;
      CnErrors.SetError(eDate, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
      eDate.SetFocus;
    end
    else
    begin
      if (((dmMain.InStrictMode) or (not(fFullAccess or fChangeHistory))) and
        (VarToDateTime(eDate.value) < dmMain.CurrentMonth)) then
      begin
        allOk := False;
        CnErrors.SetError(eDate, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
        eDate.SetFocus;
      end
      else
        CnErrors.Dispose(eDate);
    end;

    if eDateTo.Visible then
    begin
      if (not TryStrToDate(eDateTo.Text, VD)) then
      begin
        allOk := False;
        CnErrors.SetError(eDateTo, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
        eDateTo.SetFocus;
      end
      else
      begin
        if (((dmMain.InStrictMode) or (not(fFullAccess or fChangeHistory))) and
          (VarToDateTime(eDateTo.value) < dmMain.CurrentMonth)) then
        begin
          allOk := False;
          CnErrors.SetError(eDateTo, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
          eDateTo.SetFocus;
        end
        else
          CnErrors.Dispose(eDateTo);
      end;
    end;
  end;

  Result := allOk;
end;

end.
