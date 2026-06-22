unit RecourseForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.Types,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.Mask,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, FIBQuery, pFIBQuery, CnErrorProvider,
  PropFilerEh,
  PropStorageEh, DM, PrjConst, CustomerInfoFrame, A4onTypeUnit, GridsEh, DBGridEh, amSplitter, CnClasses;

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
    pnlAddData: TPanel;
    pnlDirect: TPanel;
    lblDirect: TLabel;
    cbDirect: TDBComboBoxEh;
    pnlResult: TPanel;
    lblResult: TLabel;
    lcbResult: TDBLookupComboboxEh;
    dsResult: TpFIBDataSet;
    srcResult: TDataSource;
    btnOkandTask: TBitBtn;
    pnlTags: TPanel;
    splTags: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LupHOUSEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure eFLAT_NOExit(Sender: TObject);
    procedure ActFindExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cbRecourseChange(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBLookupComboboxClick(Sender: TObject);
    procedure edtContactClick(Sender: TObject);
    procedure cbRecourseEnter(Sender: TObject);
    procedure edtContactEnter(Sender: TObject);
    procedure cbDirectChange(Sender: TObject);
    procedure cbRecourseDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure btnOkandTaskClick(Sender: TObject);
    procedure btnOkandRequestClick(Sender: TObject);
  private
    { Private declarations }
    vCustomerInfo: TCustomerInfo;
    fCallBack: TCallBack;
    FEnterSecondPress: Boolean;
    FclOutcome: TColor;
    function FindCustomer(const lic, code: string; const id: integer): integer;
    procedure SaveRecourse(const CreateRequest: Boolean = False; const CreateTask: Boolean = False);
    procedure FillPhones(const phones: String);
    procedure InitControls;
    function GetAddData: string;
    function DataIsCorrect: Boolean;
    procedure SetDirectCall;
    procedure PanelsClear;
    procedure TagPanelGenerate;
    procedure DataPanelGenerate;
    function GetSelectedTags: string;
  public
    { Public declarations }

  end;

function EditRecourse(const Customer_ID: integer; CallBack: TCallBack = nil): Boolean;
function EditRecourseByAdres(const Street_ID: integer; const House_ID: integer; const Flat: String): Boolean;

var
  RecourseForm: TRecourseForm;

implementation

uses
  System.StrUtils, RequestNewForma, MAIN, AtrStrUtils, ad3SpellBase,
  Pixie.TagBar.Vcl, Pixie.TagBar.Base, Pixie.TagBar.Render;

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
end;

procedure TRecourseForm.FillPhones(const phones: String);
var
  i: integer;
  s: String;
  sa: TStringDynArray;
begin
  edtContact.Items.Clear;
  sa := Explode(',', phones);
  for i := 0 to Length(sa) - 1 do
  begin
    s := trim(sa[i]);
    if not s.IsEmpty then
    begin
      edtContact.Items.Add(s);
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
    exit;

  s := vCustomerInfo.phone_no;
  if vCustomerInfo.mobile <> '' then
    s := s + ',' + vCustomerInfo.mobile;

  FillPhones(s);
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
    actSave.Execute;
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
var
  s: string;
begin
  vCustomerInfo.Customer_ID := -1;
  s := dmMain.GetSettingsValue('RECOURSE_DIRECT');
  pnlDirect.Visible := (s = '1');
  try
    s := dmMain.GetSettingsValue('ROW_HL_WARNING');
    FclOutcome := StringToColor(s);
  except
    FclOutcome := $0066FFFF;
  end;
end;

procedure TRecourseForm.SaveRecourse(const CreateRequest: Boolean = False; const CreateTask: Boolean = False);
var
  NeedRequest: Boolean;
  NeedTask: Boolean;
  allFine: Boolean;
  s, h, cid: integer;
  f, a: String;
  rc_id: integer;
begin
  s := -1;
  h := -1;
  rc_id := -1;
  NeedRequest := CreateRequest;
  NeedTask := CreateTask;
  cid := -1;
  if not DataIsCorrect then
    exit;

  if (not dsRecourses.fn('NEED_REQUEST').IsNull) then
    NeedRequest := NeedRequest or (dsRecourses.fn('NEED_REQUEST').AsInteger = 1);

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
      SQL.Text :=
        'insert into RECOURSE (RC_TYPE, CUSTOMER_ID, HOUSE_ID, FLAT_NO, NOTICE, CONTACT, ADD_DATA, RESULT_ID, TAG) ' +
        ' values (:RC_TYPE, :CUSTOMER_ID, :HOUSE_ID, :FLAT_NO, :NOTICE, :CONTACT, :ADD_DATA, :RESULT_ID, :TAG) RETURNING rc_id';

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
      ParamByName('ADD_DATA').AsString := GetAddData;
      f := GetSelectedTags;
      if f.IsEmpty then
        ParamByName('TAG').Clear
      else
        ParamByName('TAG').AsString := ';' + f + ';';

      if pnlResult.Visible then
      begin
        dsResult.DisableControls;
        ParamByName('RESULT_ID').AsInteger := lcbResult.Value;
        if dsResult.Locate('O_ID', ParamByName('RESULT_ID').AsInteger, []) then
        begin
          NeedRequest := NeedRequest or (dsResult['SET_BID'] = 1);
          NeedTask := NeedTask or (dsResult['SET_TASK'] = 1);
        end;
        dsResult.EnableControls;
      end
      else
        ParamByName('RESULT_ID').Clear;

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      rc_id := fn('rc_id').AsInteger;

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
    Hide;

  try
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
      end;
      if cid <> -1 then
        NewRequest(cid, fCallBack, False, trim(edtContact.Text), trim(mmoNotice.Lines.Text), rc_id)
      else
      begin
        if ((s > -1) and (h > -1)) then
          NewRequestByAdres(s, h, f, trim(edtContact.Text), trim(mmoNotice.Lines.Text), rc_id);
      end;
    end;

    if NeedTask then
    begin
      f := cbRecourse.Text;
      f := f + #13#10 + edtContact.Text;
      f := f + #13#10 + mmoNotice.Lines.Text;
      if vCustomerInfo.Customer_ID <> -1 then
        A4MainForm.MakeTask('AС', '{"acc":"' + vCustomerInfo.Account_No + '","rcid":' + rc_id.ToString + '}', nil, f)
      else
      begin
        a := '';
        if not LupStreets.Text.IsEmpty then
          a := LupStreets.Text;
        if not LupHOUSE.Text.IsEmpty then
          a := a + ' д.' + LupHOUSE.Text;
        if not eFLAT_NO.Text.IsEmpty then
          a := a + ' кв.' + eFLAT_NO.Text;
        f := trim(a + #13#10 + f);
        A4MainForm.MakeTask('С', rc_id.ToString, nil, f);
      end;
    end
  finally
    if allFine then
    begin
      ModalResult := mrOk;
      Close;
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

procedure TRecourseForm.btnOkandTaskClick(Sender: TObject);
begin
  SaveRecourse(False, True);
end;

procedure TRecourseForm.btnOkClick(Sender: TObject);
begin
  actSave.Execute;
end;

procedure TRecourseForm.cbDirectChange(Sender: TObject);
begin
  SetDirectCall;
end;

procedure TRecourseForm.cbRecourseChange(Sender: TObject);
begin
  InitControls;
end;

procedure TRecourseForm.cbRecourseDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not dsRecourses.Active then
    exit;

  if not dsRecourses.FieldByName('DIRECT').IsNull then
  begin
    if (dsRecourses.FieldByName('DIRECT').AsInteger = 1) then
      Background := FclOutcome;
  end;
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

procedure TRecourseForm.InitControls;
var
  showBtn: Boolean;
  bm: TBookmark;
  WindowLocked: Boolean;
begin
  WindowLocked := LockWindowUpdate(Self.Handle);
  try
    btnOkandRequest.Enabled := True;
    pnlAddData.Visible := False;

    PanelsClear;

    if (cbRecourse.Text = '') or (VarIsNull(cbRecourse.KeyValue)) then
      exit;

    dsRecourses.DisableControls;
    bm := dsRecourses.GetBookmark;
    if dsRecourses.Locate('RT_ID', cbRecourse.KeyValue, []) then
    begin
      showBtn := True;
      if (not dsRecourses.fn('NEED_REQUEST').IsNull) then
        showBtn := (dsRecourses.fn('NEED_REQUEST').AsInteger <> 1);

      btnOkandRequest.Enabled := showBtn;

      DataPanelGenerate;
      pnlAddData.Top := 1000;
      TagPanelGenerate;
      splTags.Top := 1000;
      pnlTags.Top := 1000;

      dsResult.Close;
      dsResult.ParamByName('RT_ID').AsInteger := dsRecourses['TYPE_ID'];
      dsResult.Open;
      pnlResult.Visible := dsResult.RecordCount > 0;
      dsResult.Active := pnlResult.Visible;
      pnlResult.Top := 1000;

      dsRecourses.GotoBookmark(bm);
    end;

    btnOkandRequest.Visible := not pnlResult.Visible;
    btnOkandTask.Visible := not pnlResult.Visible;

    dsRecourses.EnableControls;
    pnlBtm.Top := 1000;
  finally
    if WindowLocked then
      LockWindowUpdate(0);
  end;
end;

function TRecourseForm.GetAddData: string;
var
  i: integer;
begin
  Result := '';
  if pnlAddData.Visible then
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TCustomDBEditEh) and ((Components[i] as TCustomDBEditEh).Parent = pnlAddData) then
      begin
        if (Components[i] as TCustomDBEditEh).Hint <> '' then
          Result := Result + (Components[i] as TCustomDBEditEh).Hint + '=';
        Result := Result + (Components[i] as TCustomDBEditEh).Text + ';';
      end;
    end;
    Result := Result.TrimRight([';']);
  end;
end;

function TRecourseForm.DataIsCorrect: Boolean;
var
  i: integer;
begin
  Result := True;
  try
    if VarIsNull(cbRecourse.Value) or (cbRecourse.Text = '') then
    begin
      cbRecourse.SetFocus;
      CnErrors.SetError(cbRecourse, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      Result := False;
    end
    else
      CnErrors.Dispose(cbRecourse);

    if pnlAddData.Visible then
    begin
      for i := 0 to ComponentCount - 1 do
        if (Components[i] is TCustomDBEditEh) and ((Components[i] as TControl).Parent = pnlAddData) then
        begin
          if (Components[i] as TCustomDBEditEh).Text = '' then
          begin
            (Components[i] as TCustomDBEditEh).SetFocus;
            CnErrors.SetError((Components[i] as TControl), rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
            Result := False;
          end
          else
            CnErrors.Dispose((Components[i] as TControl));
        end;
    end;

    if pnlTags.Visible then
    begin
      if GetSelectedTags = '' then
      begin
        ShowMessage('Необходимо выбрать хоть одну метку');
        Result := False;
      end;
    end;

    if pnlResult.Visible then
    begin
      if lcbResult.Text = '' then
      begin
        lcbResult.SetFocus;
        CnErrors.SetError(lcbResult, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        Result := False;
      end
      else
        CnErrors.Dispose(lcbResult);
    end;

  except
    Result := False;
  end;
end;

procedure TRecourseForm.SetDirectCall;
begin
  if (cbDirect.Text = '') and dsRecourses.ParamByName('direct').IsNull then
    exit;

  if (not dsRecourses.ParamByName('direct').IsNull) and VarIsNumeric(cbDirect.Value) and
    (dsRecourses.ParamByName('direct').AsInteger = cbDirect.Value) then
    exit;

  dsRecourses.Close;
  if cbDirect.Text = '' then
    dsRecourses.ParamByName('direct').Clear
  else
    dsRecourses.ParamByName('direct').AsInteger := cbDirect.Value;

  dsRecourses.Open;
end;

procedure TRecourseForm.PanelsClear;
var
  i: integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
    if (Components[i] is TControl) then
      if ((Components[i] as TControl).Parent = pnlAddData) or ((Components[i] as TControl).Parent = pnlTags) then
        (Components[i] as TControl).Free;
  end;

  pnlAddData.Visible := False;
  pnlTags.Visible := False;
end;

procedure TRecourseForm.DataPanelGenerate;
var
  t, r: TStringDynArray;
  i, j: integer;
  s, HintText: string;
  cb: TDBComboBoxEh;
  ed: TDBEditEh;
  Lb: TLabel;
begin
  if (dsRecourses.fn('AddData').IsNull) or (dsRecourses['AddData'] = '') then
    exit;

  s := trim(dsRecourses['AddData']);
  t := SplitString(s, #13);
  pnlAddData.Visible := (Length(t) > 0);
  pnlAddData.Top := 1000;
  for i := 0 to Length(t) - 1 do
  begin
    s := t[i].trim([#13, #10, ';']);
    r := SplitString(s, '=');
    HintText := '';
    if Length(r) > 1 then
    begin
      HintText := trim(r[0]);
      Lb := TLabel.Create(Self);
      Lb.Name := 'lblAd' + i.ToString;
      Lb.Parent := pnlAddData;
      Lb.Height := 13;
      Lb.Left := 5;
      Lb.Top := i * (21 + 3) + 8;
      Lb.Width := 64;
      Lb.Caption := HintText;
      s := r[1];
    end;

    r := SplitString(s, ';');
    if Length(r) > 0 then
    begin
      cb := TDBComboBoxEh.Create(Self);
      cb.Name := 'cbAd' + i.ToString;
      cb.Parent := pnlAddData;
      cb.Height := 21;
      cb.Left := 74;
      cb.Top := i * (cb.Height + 3) + 8;
      cb.Width := 388;
      cb.Hint := HintText;
      cb.ShowHint := (HintText <> '');
      cb.TabOrder := i;
      cb.Text := '';
      cb.EmptyDataInfo.Text := HintText;
      cb.Visible := True;
      for j := 0 to Length(r) - 1 do
      begin
        cb.Items.Add(r[j]);
        cb.KeyItems.Add(r[j]);
      end;
      pnlAddData.Height := cb.Top + cb.Height + 2;
    end
    else if HintText <> '' then
    begin
      ed := TDBEditEh.Create(Self);
      ed.Name := 'edAd' + i.ToString;
      ed.Parent := pnlAddData;
      ed.Height := 21;
      ed.Left := 74;
      ed.Top := i * (ed.Height + 3) + 8;
      ed.Width := 388;
      ed.Hint := HintText;
      ed.ShowHint := (HintText <> '');
      ed.TabOrder := i;
      ed.EmptyDataInfo.Text := HintText;
      ed.Visible := True;
      ed.Text := '';
      pnlAddData.Height := ed.Top + ed.Height + 2;
    end
  end;
end;

procedure TRecourseForm.TagPanelGenerate;
var
  Bar: TPixieTagBar;
  t: TStringDynArray;
  i: integer;
  s: string;
begin
  if (dsRecourses.fn('TagsList').IsNull) or (dsRecourses['TagsList'] = '') then
    exit;

  s := trim(dsRecourses['TagsList']).trim([';']);
  t := SplitString(s, ';');
  pnlTags.Visible := (Length(t) > 0);
  splTags.Visible := pnlTags.Visible;

  if not pnlTags.Visible then
    exit;

  Bar := TPixieTagBar.Create(Self);
  with Bar do
  begin
    Parent := pnlTags;
    Align := alClient;
    Top := 0;
    Left := 0;
    Width := pnlTags.Width;
    Color := clBtnFace;
    ShowBorder := False;
    TagShape := tsRoundedRect;
    Options := TagBarAssignOpts; // TagBarFilterOpts;
    AutoHeight := False;
    TabStop := True;
    AlignWithMargins := True;
    Margins.SetBounds(4, 0, 4, 0);
  end;

  for i := 0 to Length(t) - 1 do
  begin
    s := trim(t[i]);
    if s <> '' then
      Bar.AddTag(s);
  end;

  pnlTags.Height := Bar.Height + 8;
end;

function TRecourseForm.GetSelectedTags: string;
var
  Bar: TPixieTagBar;
  s: string;
  i: integer;
begin
  s := '';

  if not pnlTags.Visible then
    exit;

  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TControl) and ((Components[i] as TControl).Parent = pnlTags) and
      ((Components[i] as TControl) is TPixieTagBar) then
      Bar := (Components[i] as TControl) as TPixieTagBar;

  if Assigned(Bar) then
  begin
    i := Bar.TagCount;
    for i := 0 to Bar.TagCount - 1 do
    begin
      if Bar.IsChecked(i) then
        s := s + Bar.GetTag(i).Text + ';';
    end;
  end;

  Result := s.trim([';']);
end;

end.
