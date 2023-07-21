unit OnOffServicesForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  OkCancel_frame, DBGridEh, DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, CnErrorProvider,
  PrjConst;

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
    pnlContract: TPanel;
    edtDogDate: TDBDateTimeEditEh;
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
    pnlWorker: TPanel;
    lblWorker: TLabel;
    lcbWorker: TDBLookupComboboxEh;
    dsWorker: TpFIBDataSet;
    srcWorker: TDataSource;
    chkFOwner: TDBCheckBoxEh;
    edtDogovor: TDBEditEh;
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
    procedure FormShow(Sender: TObject);
    procedure SetContract;
    procedure chkFOwnerClick(Sender: TObject);
    procedure luServiceClick(Sender: TObject);
    procedure luServiceEnter(Sender: TObject);
  private
    { Private declarations }
    fFullAccess: Boolean;
    fChangeHistory: Boolean;
    fCanEdit: Boolean;
    fCanAdd: Boolean;
    fService_TYPE: Integer;
    fService_ID: Integer;
    fCustomer_ID: Integer;
    FShowFlatOwner: Boolean;
    FNewContract: Boolean;
    FOwnerS: string;
    FRentS: string;
    FContract: string;
    procedure setSRVType(value: Integer);
    function CheckDataAndOk: Boolean;
    procedure CheckAndGenContract;
  public
    { Public declarations }
    property Service_TYPE: Integer write setSRVType;
    property Customer_ID: Integer read fCustomer_ID write fCustomer_ID;
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

uses
  DM, AtrCommon, CF;

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
      Customer_ID := aCustomer_ID;
      Height := Height - servPanel.Height;
      dsOnOffService.ParamByName('ACUSTOMER_ID').value := aCustomer_ID;
      dsOnOffService.ParamByName('ASERVICE_ID').value := aService_ID;
      dsOnOffService.ParamByName('asubscr_serv_id').value := aSubscr_Serv_ID;
      dsOnOffService.ParamByName('AOFF').value := 0;
      memNotice.Lines.Text := Notice;
      dsOnOffService.Open;
      eDateTo.Visible := True;
      pnlQUANT.Visible := (dsOnOffService['SERVICE_TYPE'] = 2);

      pnlWorker.Visible := (dmMain.GetSettingsValue('SAVE_SRV_WORKER') = '1');
      dsWorker.Active := pnlWorker.Visible;

      // OkCancelFrame.bbOk.Enabled := dsOnOffService.RecordCount>0;
      if ShowModal = mrOk then
      begin
        // если нельзя редактировать выходим
        if not(fFullAccess or fCanAdd or fCanEdit or fChangeHistory) then
          exit;

        Query.SQL.Text :=
          'EXECUTE PROCEDURE ONOFF_SERVICE_FOR_GROUP(:CUSTOMER_ID,:SERV_ID,:ACTSERVICE,:DATE,:OFF,:NOTICE,:AUNITS,1,:WORKER);';
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
        if (pnlWorker.Visible) and (not lcbWorker.Text.IsEmpty) then
          Query.ParamByName('WORKER').AsString := lcbWorker.Text
        else
          Query.ParamByName('WORKER').Clear;
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
      Customer_ID := aCustomer_ID;
      dsSwitchTo.ParamByName('SERVICE_ID').value := fService_ID;
      if dsOnOffService.Active then
        dsOnOffService.Close;
      dsOnOffService.SelectSQL.Text := 'select * from Selectswitchservice(:From_Srv, :To_Srv)';
      dsSwitchTo.Open;
      if dsSwitchTo.RecordCount = 0 then
        exit;

      pnlWorker.Visible := (dmMain.GetSettingsValue('SAVE_SRV_WORKER') = '1');
      dsWorker.Active := pnlWorker.Visible;

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
          'select RESULT from Switch_Service(:Customer_Id, :From_Srv, :To_Srv, :Switch_Srv, :Units, :Switch_Date, :Notice, :WORKER);';
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
        if (pnlWorker.Visible) and (not lcbWorker.Text.IsEmpty) then
          Query.ParamByName('WORKER').AsString := lcbWorker.Text
        else
          Query.ParamByName('WORKER').Clear;
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
      Customer_ID := aCustomer_ID;
      dsOnOffService.ParamByName('ACUSTOMER_ID').value := aCustomer_ID;
      dsOnOffService.ParamByName('ASERVICE_ID').value := aService_ID;
      dsOnOffService.ParamByName('asubscr_serv_id').value := aSubscr_Serv_ID;
      if Off then
        dsOnOffService.ParamByName('AOFF').value := 1
      else
      begin
        dsOnOffService.ParamByName('AOFF').value := 0;
        pnlContract.Visible := (dmMain.GetSettingsValue('CAN_NEW_CONTRACT') = '1');
      end;
      memNotice.Lines.Text := Notice;
      dsOnOffService.Open;
      pnlQUANT.Visible := (dsOnOffService['SERVICE_TYPE'] = 2);
      pnlWorker.Visible := (dmMain.GetSettingsValue('SAVE_SRV_WORKER') = '1');
      dsWorker.Active := pnlWorker.Visible;

      OkCancelFrame.bbOk.Enabled := dsOnOffService.RecordCount > 0;
      if ShowModal = mrOk then
      begin
        // если нельзя редактировать выходим
        if not(fFullAccess or fCanAdd or fCanEdit or fChangeHistory) then
          exit;

        Query.SQL.Text := 'EXECUTE PROCEDURE ONOFF_SERVICE_FOR_GROUP(:CUSTOMER_ID,:SERV_ID,' +
          ':ACTSERVICE,:DATE,:OFF,:NOTICE,:AUNITS,1,:WORKER,:CONTR_N,:CONTR_DATE);';
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
        if (pnlWorker.Visible) and (not lcbWorker.Text.IsEmpty) then
          Query.ParamByName('WORKER').AsString := lcbWorker.Text
        else
          Query.ParamByName('WORKER').Clear;

        if (pnlContract.Visible) and (chkContract.Checked) then
        begin
          Query.ParamByName('CONTR_N').AsString := edtDogovor.value;
          if not VarIsNull(edtDogDate.value) then
            Query.ParamByName('CONTR_DATE').AsDate := edtDogDate.value;
        end
        else
        begin
          Query.ParamByName('CONTR_N').Clear;
          Query.ParamByName('CONTR_DATE').Clear;
        end;

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
      Customer_ID := aCustomer_ID;
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
      begin
        pnlWorker.Visible := (dmMain.GetSettingsValue('SAVE_SRV_WORKER') = '1');
        dsWorker.Active := pnlWorker.Visible;
        luOnOffServiceChange(nil);
      end;

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
          Query.SQL.Text := 'EXECUTE PROCEDURE ADD_SUBSCR_SERVICE_VAT(:ACUSTOMER_ID,:ASERVICE_ID,:AACTSERVICE,:ADATE,' +
            ':NOTICE,:AUNITS,:DOG,:DOG_DATE,:VATG_ID,1,:WORKER);';
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
          if (pnlWorker.Visible) and (not lcbWorker.Text.IsEmpty) then
            Query.ParamByName('WORKER').AsString := lcbWorker.Text
          else
            Query.ParamByName('WORKER').Clear;

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
  pnlContract.Visible := (fService_TYPE = 0) and (dmMain.GetSettingsValue('CAN_NEW_CONTRACT') = '1');
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

procedure TOnOffServiceForm.FormShow(Sender: TObject);
begin
  FShowFlatOwner := (dmMain.GetSettingsValue('FLAT_OWNER') = '1');
  FNewContract := (dmMain.GetSettingsValue('CAN_NEW_CONTRACT') = '1');
  FContract := '';

  if FNewContract then
  begin
    if FShowFlatOwner then
    begin
      FOwnerS := dmMain.GetSettingsValue('FLAT_OWNER_C_STR');
      FRentS := dmMain.GetSettingsValue('FLAT_RENT_C_STR');
      if FOwnerS.IsEmpty then
        FOwnerS := '%s' // Для функции формат
      else begin
        if not FOwnerS.Contains('%s') then
          FOwnerS := FOwnerS+'%s';
      end;

      if FRentS.IsEmpty then
        FRentS := '%s' // Для функции формат
      else begin
        if not FRentS.Contains('%s') then
          FRentS := FRentS+'%s';
      end;
      edtDogovor.Left := chkFOwner.Left + chkFOwner.Width + 12;
      edtDogovor.Width := lblContr.Left - edtDogovor.Left - 10;
    end
    else
    begin
      edtDogovor.Left := chkContract.Left + chkContract.Width + 12;
      edtDogovor.Width := lblContr.Left - edtDogovor.Left - 10;
    end;
  end;
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

procedure TOnOffServiceForm.luServiceClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
end;

procedure TOnOffServiceForm.luServiceEnter(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown;
end;

procedure TOnOffServiceForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  if CheckDataAndOk then
    ModalResult := mrOk;
end;

procedure TOnOffServiceForm.chkContractClick(Sender: TObject);
begin
  chkFOwner.Visible := FShowFlatOwner and chkContract.Checked;
  edtDogovor.Visible := chkContract.Checked;
  edtDogDate.Visible := chkContract.Checked;
  lblContr.Visible := chkContract.Checked;

  CheckAndGenContract;
end;

procedure TOnOffServiceForm.chkFOwnerClick(Sender: TObject);
begin
  SetContract;
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
var
  i: Integer;
begin
  if (dsOnOffService.FieldExist('ID', i)) and (not dsOnOffService.FieldByName('ID').IsNull) then
    luOnOffService.KeyValue := dsOnOffService['ID'];
end;

procedure TOnOffServiceForm.dsServiceAfterOpen(DataSet: TDataSet);
var
  i: Integer;
begin
  if (dsService.FieldExist('SERVICE_ID', i)) and (not dsService.FieldByName('SERVICE_ID').IsNull) then
    luService.KeyValue := dsService['SERVICE_ID'];
end;

procedure TOnOffServiceForm.dsSwitchToAfterOpen(DataSet: TDataSet);
var
  i: Integer;
begin
  if (dsSwitchTo.FieldExist('SERVICE_ID', i)) and (not dsSwitchTo.FieldByName('SERVICE_ID').IsNull) then
    dblSwitchTo.KeyValue := dsSwitchTo['SERVICE_ID'];
end;

procedure TOnOffServiceForm.SetContract;
var
  s: string;
begin
  s := FContract;
  if FShowFlatOwner then
  begin
    if chkFOwner.Checked then
    begin
      s := Format(FOwnerS, [s]);
    end
    else
    begin
      s := Format(FRentS, [s]);
    end;
  end;
  edtDogovor.Text := s;
end;

procedure TOnOffServiceForm.eDateExit(Sender: TObject);
begin
  CheckAndGenContract;
end;

procedure TOnOffServiceForm.CheckAndGenContract;
begin
  if chkContract.Checked then
  begin
    if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') and (VarIsNull(edtDogDate.value))  then
      edtDogDate.value := NOW();

    if (servPanel.Visible) and (not VarIsNull(luService.KeyValue)) then begin
      if FContract.IsEmpty then
        FContract := dmMain.GenerateDogNumberForCustomer(fCustomer_ID, luService.KeyValue);
      SetContract;
    end
    else begin
      if FContract.IsEmpty then
        FContract := dmMain.GenerateDogNumberForCustomer(fCustomer_ID, dsOnOffService['ID']);
      SetContract;
    end;
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
      //luService.SetFocus;
    end
    else
      CnErrors.Dispose(luService);
  end;

  if pnlONOFF.Visible and (not VarIsNumeric(luOnOffService.value)) then
  begin
    allOk := False;
    CnErrors.SetError(luOnOffService, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    //luOnOffService.SetFocus;
  end
  else
    CnErrors.Dispose(luOnOffService);

  if edtDogDate.Visible and (not TryStrToDate(edtDogDate.Text, VD)) then
  begin
    allOk := False;
    CnErrors.SetError(edtDogDate, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    //edtDogDate.SetFocus;
  end
  else
    CnErrors.Dispose(edtDogDate);

  if pnlQUANT.Visible and (not VarIsNumeric(eUNITS.value)) then
  begin
    allOk := False;
    CnErrors.SetError(eUNITS, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    //eUNITS.SetFocus;
  end
  else
    CnErrors.Dispose(eUNITS);

  if pnlDate.Visible then
  begin
    if (not TryStrToDate(eDate.Text, VD)) then
    begin
      allOk := False;
      CnErrors.SetError(eDate, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
      //eDate.SetFocus;
    end
    else
    begin
      if (((dmMain.InStrictMode) or (not(fFullAccess or fChangeHistory))) and
        (VarToDateTime(eDate.value) < dmMain.CurrentMonth)) then
      begin
        allOk := False;
        CnErrors.SetError(eDate, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
        //eDate.SetFocus;
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
        //eDateTo.SetFocus;
      end
      else
      begin
        if (((dmMain.InStrictMode) or (not(fFullAccess or fChangeHistory))) and
          (VarToDateTime(eDateTo.value) < dmMain.CurrentMonth)) then
        begin
          allOk := False;
          CnErrors.SetError(eDateTo, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
          //eDateTo.SetFocus;
        end
        else
          CnErrors.Dispose(eDateTo);
      end;
    end;
  end;

  Result := allOk;
end;

end.
