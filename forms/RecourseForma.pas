unit RecourseForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.Mask,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, FIBQuery, pFIBQuery, CnErrorProvider,
  PropFilerEh,
  PropStorageEh, DM, PrjConst, CustomerInfoFrame, A4onTypeUnit, DBGridEh, amSplitter;

type
  TRecourseForm = class(TForm)
    srcRecourse: TDataSource;
    dsRecourses: TpFIBDataSet;
    pnlNotice: TPanel;
    pnlRecourse: TPanel;
    lblAttribute: TLabel;
    cbRecourse: TDBLookupComboboxEh;
    dsTypes: TpFIBDataSet;
    srcTypes: TDataSource;
    pnlInfo: TPanel;
    CustomerInfoFrm: TCustomerInfoFrm;
    pnlAdres: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    btnFind: TButton;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    LupStreets: TDBLookupComboboxEh;
    LupHOUSE: TDBLookupComboboxEh;
    eFLAT_NO: TDBEditEh;
    mmoNotice: TDBMemoEh;
    actlst1: TActionList;
    actSave: TAction;
    ActFind: TAction;
    CnErrors: TCnErrorProvider;
    pnlContact: TPanel;
    lbl2: TLabel;
    edtContact: TDBComboBoxEh;
    btnClear: TButton;
    actClear: TAction;
    PropStorageEh: TPropStorageEh;
    pnlBtm: TPanel;
    btnOkandRequest: TBitBtn;
    btnCancel: TBitBtn;
    spl1: TSplitter;
    btnOk: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LupHOUSEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure eFLAT_NOExit(Sender: TObject);
    procedure ActFindExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnOkandRequestClick(Sender: TObject);
    procedure cbRecourseChange(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBLookupComboboxClick(Sender: TObject);
    procedure edtContactClick(Sender: TObject);
    procedure cbRecourseEnter(Sender: TObject);
    procedure edtContactEnter(Sender: TObject);
  private
    { Private declarations }
    vCustomerInfo: TCustomerInfo;
    fCallBack: TCallBack;
    FEnterSecondPress: Boolean;
    function FindCustomer(const lic, code: string; const id: integer): integer;
    procedure SaveRecourse(const CreateRequest: Boolean = False);
    procedure FillPhones(const phones: String);
  public
    { Public declarations }

  end;

function EditRecourse(const Customer_ID: integer; CallBack: TCallBack = nil): Boolean;
function EditRecourseByAdres(const Street_ID: integer; const House_ID: integer; const Flat: String): Boolean;

var
  RecourseForm: TRecourseForm;

implementation

uses
  RequestNewForma, MAIN, AtrStrUtils, ad3SpellBase;

{$R *.dfm}

function EditRecourse(const Customer_ID: integer; CallBack: TCallBack = nil): Boolean;
var
  s: string;
begin
  Result := True;
  with TRecourseForm.Create(Application) do
  begin
    dsTypes.Open;
    dsRecourses.Open;
    fCallBack := CallBack;
    if Customer_ID > -1 then
    begin
      FindCustomer('', '', Customer_ID);
      pnlAdres.Visible := False;
      ActiveControl := cbRecourse;
    end
    else
    begin
      dsStreets.Open;
      s := dmMain.GetSettingsValue('AREA_LOCK');
      if (s <> '') and (not dmMain.AllowedAction(rght_Programm_NotLockArea)) then
      begin
        dsHomes.ParamByName('AREA_LOCK').Value :=
          Format(' and ((h.Subarea_Id) is null or (h.Subarea_Id in (%s))) ', [s]);
      end;
      dsHomes.Open;
      pnlAdres.Visible := True;
      ActiveControl := LupStreets;
    end;

    Show;
  end;
end;

function EditRecourseByAdres(const Street_ID: integer; const House_ID: integer; const Flat: String): Boolean;
var
  s: string;
begin
  Result := True;
  with TRecourseForm.Create(Application) do
  begin
    dsTypes.Open;
    dsRecourses.Open;
    FindCustomer('', '', -1);
    dsStreets.Open;
    s := dmMain.GetSettingsValue('AREA_LOCK');
    if (s <> '') and (not dmMain.AllowedAction(rght_Programm_NotLockArea)) then
    begin
      dsHomes.ParamByName('AREA_LOCK').Value := Format(' and ((h.Subarea_Id) is null or (h.Subarea_Id in (%s))) ', [s]);
    end;
    dsHomes.Open;
    pnlAdres.Visible := True;
    fCallBack := nil;
    ActiveControl := LupStreets;
    if Street_ID >= 0 then
      LupStreets.Value := Street_ID;
    if House_ID >= 0 then
      LupHOUSE.Value := House_ID;
    if Flat <> '' then
      eFLAT_NO.Value := Flat;

    Show;
  end;
end;

procedure TRecourseForm.actClearExecute(Sender: TObject);
begin
  FillPhones('');
  vCustomerInfo.Customer_ID := -1;
  CustomerInfoFrm.Customer := vCustomerInfo;
end;

procedure TRecourseForm.ActFindExecute(Sender: TObject);
var
  Flat, p, f: String;
  s: string;
  fn: integer;
  FCustomerInfo: TCustomerInfo;
begin
  if VarIsEmpty(LupHOUSE.Value) then
  begin
    LupHOUSE.SetFocus;
    LupHOUSE.DropDown;
    exit;
  end;

  if VarIsNull(LupHOUSE.Value) then
  begin
    LupHOUSE.SetFocus;
    LupHOUSE.DropDown;
    exit;
  end;

  if VarIsNull(eFLAT_NO.Value) then
    Flat := ''
  else
    Flat := eFLAT_NO.Value;

  f := '';
  p := '';
  fn := 0;

  FCustomerInfo := dmMain.FindCustomerAtAdress(LupHOUSE.Value, Flat, fn, p, f);
  CustomerInfoFrm.Customer := FCustomerInfo;

  if FCustomerInfo.Customer_ID = -1 then
  begin
    // dsRequest.FieldByName('RQ_CUSTOMER').Clear;
    exit;
  end;
  vCustomerInfo := FCustomerInfo;
  s := FCustomerInfo.phone_no;
  if FCustomerInfo.mobile <> '' then
    s := s + ',' + FCustomerInfo.mobile;

  FillPhones(s);

  {

    with TpFIBQuery.Create(Nil) do
    try
    i := -1;
    DataBase := dmMain.dbTV;
    Transaction := dmMain.trReadQ;
    SQL.Text := 'select c.customer_id from customer c where c.house_id = ' + IntToStr(LupHOUSE.Value);
    if not VarIsEmpty(eFLAT_NO.Value) then
    SQL.Add(' and c.flat_no =''' + eFLAT_NO.Text + '''');
    Transaction.StartTransaction;
    ExecQuery;
    if not EOF then
    begin
    if not FieldByName('customer_id').IsNull then
    i := FieldByName('customer_id').Value;
    end;
    Close;
    Transaction.Commit;
    FindCustomer('', '', i);
    finally
    Free;
    end;
  }
end;

procedure TRecourseForm.FillPhones(const phones: String);
var
  i: integer;
  s: String;
  sa: TStringArray;
begin
  edtContact.Items.Clear;
  sa := Explode(',', phones);
  for i := 0 to Length(sa) - 1 do
  begin
    s := trim(sa[i]);
    if not s.IsEmpty then
    begin
      edtContact.Items.Add(s);
      // edtContact.KeyItems.Add(s);
    end;
  end;
end;

procedure TRecourseForm.actSaveExecute(Sender: TObject);
begin
  SaveRecourse();
end;

procedure TRecourseForm.edtContactClick(Sender: TObject);
begin
  if not(Sender is TDBComboBoxEh) then
    exit;

  if (Sender as TDBComboBoxEh).Items.Count = 0 then
    exit;

  if (Sender as TDBComboBoxEh).Tag = 0 then
  begin
    if not(Sender as TDBComboBoxEh).ListVisible then
      (Sender as TDBComboBoxEh).DropDown
    else
      (Sender as TDBComboBoxEh).CloseUp(False);
  end;

  (Sender as TDBComboBoxEh).Tag := 0;
end;

procedure TRecourseForm.edtContactEnter(Sender: TObject);
begin
  if not(Sender is TDBComboBoxEh) then
    exit;

  if not(Sender as TDBComboBoxEh).ListVisible then
  begin
    (Sender as TDBComboBoxEh).DropDown;
    (Sender as TDBComboBoxEh).Tag := 1;
  end;
end;

procedure TRecourseForm.eFLAT_NOExit(Sender: TObject);
begin
  ActFindExecute(Sender);
end;

function TRecourseForm.FindCustomer(const lic, code: string; const id: integer): integer;
var
  s: string;
begin

  vCustomerInfo := dmMain.FindCustomer(lic, code, id);
  Result := vCustomerInfo.Customer_ID;
  CustomerInfoFrm.Customer := vCustomerInfo;

  if vCustomerInfo.Customer_ID = -1 then
  begin
    // dsRequest.FieldByName('RQ_CUSTOMER').Clear;
    exit;
  end;
  s := vCustomerInfo.phone_no;
  if vCustomerInfo.mobile <> '' then
    s := s + ',' + vCustomerInfo.mobile;

  FillPhones(s);

  {
    dsRequest['RQ_CUSTOMER'] := vCustomerInfo.CUSTOMER_ID;
    dsRequest['STREET_ID']   := vCustomerInfo.STREET_ID;
    dsRequest['HOUSE_ID']    := vCustomerInfo.HOUSE_ID;
    dsRequest['FLAT_NO']     := vCustomerInfo.FLAT_NO;
    dsRequest['PHONE']       := vCustomerInfo.PHONE_NO;
    EdPorch.Text             := vCustomerInfo.porch_n;
    EdFloor.Text             := vCustomerInfo.floor_n;
  }
end;

procedure TRecourseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if A4MainForm.AddictSpell.Tag = 1 then
  begin
    A4MainForm.AddictSpell.RemoveControl(mmoNotice);
  end;
  // RecourseForm:=nil;
  Action := caFree;
end;

procedure TRecourseForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    SaveRecourse();
end;

procedure TRecourseForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := True;
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

procedure TRecourseForm.FormShow(Sender: TObject);
begin
  if A4MainForm.AddictSpell.Tag = 1 then
  begin
    A4MainForm.AddictSpell.AddControl(mmoNotice);
  end;

  if pnlAdres.Visible then
    LupStreets.SetFocus
  else
  begin
    cbRecourse.SetFocus;
  end;
end;

procedure TRecourseForm.LupHOUSEChange(Sender: TObject);
begin
  btnFind.Enabled := not VarIsNull(LupHOUSE.Value);
end;

procedure TRecourseForm.FormCreate(Sender: TObject);
begin
  vCustomerInfo.Customer_ID := -1;
end;

procedure TRecourseForm.SaveRecourse(const CreateRequest: Boolean = False);
var
  NeedRequest: Boolean;
  allFine: Boolean;
  s, h, cid: integer;
  f: String;
begin
  s := -1;
  h := -1;
  NeedRequest := False;
  cid := -1;
  if VarIsNull(cbRecourse.Value) or (cbRecourse.Text = '') then
  begin
    cbRecourse.SetFocus;
    CnErrors.SetError(cbRecourse, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    exit;
  end
  else
    CnErrors.Dispose(cbRecourse);

  if (not dsRecourses.fn('NEED_REQUEST').IsNull) then
    NeedRequest := (dsRecourses.fn('NEED_REQUEST').AsInteger = 1);
  NeedRequest := NeedRequest or CreateRequest;

  if vCustomerInfo.Customer_ID = -1 then
  begin
    if VarIsNull(LupHOUSE.Value) then
    begin
      LupHOUSE.SetFocus;
      exit;
    end;
  end;

  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'insert into RECOURSE (RC_TYPE, CUSTOMER_ID, HOUSE_ID, FLAT_NO, NOTICE, CONTACT) ' +
        ' values (:RC_TYPE, :CUSTOMER_ID, :HOUSE_ID, :FLAT_NO, :NOTICE, :CONTACT)';

      if vCustomerInfo.Customer_ID <> -1 then
      begin
        ParamByName('CUSTOMER_ID').AsInteger := vCustomerInfo.Customer_ID;
        ParamByName('HOUSE_ID').AsInteger := vCustomerInfo.House_ID;
        ParamByName('FLAT_NO').AsString := vCustomerInfo.FLAT_NO;
      end
      else
      begin
        ParamByName('CUSTOMER_ID').Clear;
        ParamByName('HOUSE_ID').AsInteger := LupHOUSE.Value;
        ParamByName('FLAT_NO').AsString := eFLAT_NO.Text;
      end;

      ParamByName('RC_TYPE').AsInteger := cbRecourse.Value;
      ParamByName('NOTICE').AsString := mmoNotice.Lines.Text;
      ParamByName('CONTACT').AsString := edtContact.Text;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;

      if NeedRequest then
      begin
        if vCustomerInfo.Customer_ID <> -1 then
          cid := vCustomerInfo.Customer_ID
        else
        begin
          if not VarIsEmpty(LupStreets.Value) then
            s := LupStreets.Value
          else
            s := -1;
          if not VarIsEmpty(LupHOUSE.Value) then
            h := LupHOUSE.Value
          else
            h := -1;
          if not VarIsEmpty(eFLAT_NO.Value) then
            f := eFLAT_NO.Value
          else
            f := '';
          // NewRequestByAdres(s, h, f);
        end;
      end;
      {
        if  vCustomerInfo.CUSTOMER_ID <> -1
        then ReguestExecute (aRequest, vCustomerInfo.CUSTOMER_ID, aMode)
        else ReguestExecute (aRequest, -1, aMode);
      }
      if (not NeedRequest) and Assigned(fCallBack) then
      begin
        try // ловим момент если вдруг вызывающая форма закрыта
          fCallBack;
        except
        end;
      end;

      Close;
      allFine := True;
    finally
      Free;
    end;

  if allFine then
    Close;

  if NeedRequest then
  begin
    if cid <> -1 then
      NewRequest(cid, fCallBack, False, trim(edtContact.Text), trim(mmoNotice.Lines.Text))
    else
    begin
      if ((s > -1) and (h > -1)) then
        NewRequestByAdres(s, h, f, trim(edtContact.Text), trim(mmoNotice.Lines.Text));
    end;
  end;
end;

procedure TRecourseForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRecourseForm.btnOkandRequestClick(Sender: TObject);
begin
  SaveRecourse(True);
end;

procedure TRecourseForm.btnOkClick(Sender: TObject);
begin
  SaveRecourse();
end;

procedure TRecourseForm.cbRecourseChange(Sender: TObject);
var
  showBtn: Boolean;
begin
  showBtn := True;
  if (not dsRecourses.fn('NEED_REQUEST').IsNull) then
    showBtn := (dsRecourses.fn('NEED_REQUEST').AsInteger <> 1);
  btnOkandRequest.Enabled := showBtn;
end;

procedure TRecourseForm.cbRecourseEnter(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
  begin
    (Sender as TDBLookupComboboxEh).DropDown;
    (Sender as TDBLookupComboboxEh).Tag := 1;
  end;
end;

procedure TRecourseForm.DBLookupComboboxClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    exit;

  if (Sender as TDBLookupComboboxEh).Tag = 0 then
  begin
    if not(Sender as TDBLookupComboboxEh).ListVisible then
      (Sender as TDBLookupComboboxEh).DropDown
    else
      (Sender as TDBLookupComboboxEh).CloseUp(False);
  end;

  (Sender as TDBLookupComboboxEh).Tag := 0;
end;

end.
