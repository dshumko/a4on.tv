unit EditApplianceForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ActnList,
  Vcl.ExtCtrls,
  OkCancel_frame, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBGridEh, DBLookupEh, GridsEH, DM, PrjConst, CnErrorProvider, FIBDatabase,
  pFIBDatabase, A4onTypeUnit, EhlibFIB;

type
  TEditApplianceForm = class(TForm)
    dsAppl: TpFIBDataSet;
    cnError: TCnErrorProvider;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlOkCancel: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    mmoNotice: TDBMemoEh;
    edtName: TDBEditEh;
    edtMAC: TDBEditEh;
    cbApplProperty: TDBComboBoxEh;
    lcbApplType: TDBLookupComboboxEh;
    edtSN: TDBEditEh;
    ednCost: TDBNumberEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dsDevType: TpFIBDataSet;
    srcDevType: TDataSource;
    dsMat: TpFIBDataSet;
    srcMat: TDataSource;
    lcbApplMID: TDBLookupComboboxEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
    procedure cbApplPropertyChange(Sender: TObject);
    procedure lcbApplMIDExit(Sender: TObject);
  private
    { Private declarations }
    fCI: TCustomerInfo;
    fApplID: Integer;
    procedure ReadData();
    procedure SaveData();
    function CheckData: Boolean;
    function CheckSN(const SN: String): string;
    function CheckMAC(const MAC: String): string;
    procedure OpenDS();
    procedure CloseDS();
  public
    { Public declarations }
    property CI: TCustomerInfo write fCI;
    property ApplID: Integer write fApplID;
  end;

function EditAppliance(const aCI: TCustomerInfo; aAppl_ID: Int64): Integer;

implementation

uses
  System.StrUtils,
  MAIN, AtrCommon, AtrStrUtils, EquipEditForma, pFIBQuery, TelnetForma, atrCmdUtils;

{$R *.dfm}

function EditAppliance(const aCI: TCustomerInfo; aAppl_ID: Int64): Integer;
begin
  Result := -1;
  if aCI.CUSTOMER_ID = -1 then
    Exit;

  with TEditApplianceForm.Create(application) do
  begin
    try
      CI := aCI;
      ApplID := aAppl_ID;
      OpenDS;
      ReadData;

      if ShowModal = mrOk then
      begin
        SaveData;
        Result := dsAppl['ID'];
      end;
      CloseDS;
    finally
      free;
    end;
  end;
end;

procedure TEditApplianceForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TEditApplianceForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible;
    if (ActiveControl is TDBMemoEh) then
      go := False;
    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TEditApplianceForm.lcbApplMIDExit(Sender: TObject);
begin
  if (not edtName.Enabled) and (fApplID = -1) then
  begin
    if VarIsNull(lcbApplMID.Value) then
    begin
      cnError.SetError(lcbApplMID, rsRequiredDict, iaMiddleLeft, bsNeverBlink);
      ednCost.Text := '';
      Exit;
    end
    else
      cnError.Dispose(lcbApplMID);

    edtName.Text := lcbApplMID.Text;
    if not dsMat.FieldByName('COST').IsNull then
      ednCost.Value := dsMat['COST']
    else
      ednCost.Text := '';
  end;
end;

procedure TEditApplianceForm.OpenDS();
begin
  dsDevType.Open;
  dsMat.Open;
end;

procedure TEditApplianceForm.CloseDS();
begin
  dsMat.Close;
  dsDevType.Close;
end;

procedure TEditApplianceForm.ReadData();
begin
  dsAppl.ParamByName('ID').AsInt64 := fApplID;
  dsAppl.Open;

  if not dsAppl.FieldByName('NAME').IsNull then
    edtName.Text := dsAppl['NAME'];
  if not dsAppl.FieldByName('MAC').IsNull then
    edtMAC.Text := dsAppl['MAC'];
  if not dsAppl.FieldByName('SN').IsNull then
    edtSN.Text := dsAppl['SN'];
  if not dsAppl.FieldByName('NOTICE').IsNull then
    mmoNotice.Lines.Text := dsAppl['NOTICE'];
  if not dsAppl.FieldByName('COST').IsNull then
    ednCost.Value := dsAppl['COST'];
  if not dsAppl.FieldByName('M_ID').IsNull then
    lcbApplMID.KeyValue := dsAppl['M_ID'];
  if not dsAppl.FieldByName('A_TYPE').IsNull then
    lcbApplType.KeyValue := dsAppl['A_TYPE'];

  if fCI.isType = 0 then begin
    if not dsAppl.FieldByName('PROPERTY').IsNull then
      cbApplProperty.Value := dsAppl['PROPERTY'];
  end
  else begin
    cbApplProperty.Value := 1;
    cbApplProperty.Enabled := False;
  end;
end;

function TEditApplianceForm.CheckSN(const SN: String): string;
begin
  Result := '';
  if SN = '' then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select c.Account_No, a.NAME';
      sql.Add(' from Appliance a left outer join customer c on (a.Own_Id = c.Customer_Id and Own_Type = 0)');
      sql.Add(' where a.SN = :SN');

      if fApplID <> -1 then
      begin
        sql.Add('and a.ID <> :fApplID');
        ParamByName('fApplID').AsInteger := fApplID;
      end;
      ParamByName('SN').asString := SN;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Account_No').IsNull then
        Result := Result + rsACCOUNT + ' ' + FieldByName('Account_No').Value + ' ';
      if not FieldByName('NAME').IsNull then
        Result := Result + ' ' + FieldByName('NAME').Value;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

function TEditApplianceForm.CheckMAC(const MAC: String): string;
begin
  Result := '';
  if MAC = '' then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select c.Account_No, a.NAME';
      sql.Add(' from Appliance a left outer join customer c on (a.Own_Id = c.Customer_Id and Own_Type = 0)');
      sql.Add(' where a.MAC = :MAC');

      if fApplID <> -1 then
      begin
        sql.Add('and a.ID <> :fApplID');
        ParamByName('fApplID').AsInteger := fApplID;
      end;
      ParamByName('MAC').asString := MAC;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('Account_No').IsNull then
        Result := Result + rsACCOUNT + ' ' + FieldByName('Account_No').Value + ' ';
      if not FieldByName('NAME').IsNull then
        Result := Result + ' ' + FieldByName('NAME').Value;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

procedure TEditApplianceForm.bbOkClick(Sender: TObject);
begin
  if CheckData then
    ModalResult := mrOk;
end;

procedure TEditApplianceForm.cbApplPropertyChange(Sender: TObject);
begin
  edtName.Enabled := (cbApplProperty.Value = 0);
  lcbApplMID.Enabled := (cbApplProperty.Value <> 0);
end;

function TEditApplianceForm.CheckData: Boolean;
var
  ErrorNF: Boolean; // ErrorNotFound
  s: string;
begin
  ErrorNF := True;

  if lcbApplType.Text = '' then
  begin
    cnError.SetError(lcbApplType, rsRequiredField, iaMiddleLeft, bsNeverBlink);
    // lcbApplType.SetFocus;
    // ErrorNF := False;
  end
  else
    cnError.Dispose(lcbApplType);

  if cbApplProperty.Text = '' then
  begin
    cnError.SetError(cbApplProperty, rsRequiredField, iaMiddleLeft, bsNeverBlink);
    cbApplProperty.SetFocus;
    ErrorNF := False;
  end
  else
    cnError.Dispose(cbApplProperty);

  if edtName.Text = '' then
  begin
    cnError.SetError(edtName, rsRequiredField, iaMiddleLeft, bsNeverBlink);
    if edtName.Enabled then
      edtName.SetFocus;
    ErrorNF := False;
  end
  else
    cnError.Dispose(edtName);

  s := CheckSN(edtSN.Text);
  if s <> '' then
  begin
    // если такой ип есть сообщим где
    cnError.SetError(edtSN, s, iaMiddleLeft, bsNeverBlink);
    edtSN.SetFocus;
    ErrorNF := False;
  end
  else
    cnError.Dispose(edtSN);

  if (edtMAC.Text <> '') then
  begin
    s := ValidateMAC(edtMAC.Text);
    if (s = '') then
    begin
      cnError.SetError(edtMAC, rsMACIncorrect, iaMiddleLeft, bsNeverBlink);
      ErrorNF := False;
      edtMAC.SetFocus;
    end
    else
    begin
      s := CheckMAC(edtMAC.Text);
      if s <> '' then
      begin
        cnError.SetError(edtMAC, s, iaMiddleLeft, bsNeverBlink);
        edtMAC.SetFocus;
        ErrorNF := False;
      end
      else
        cnError.Dispose(edtMAC);
    end;
  end
  else
    cnError.Dispose(edtMAC);

  Result := ErrorNF;
end;

procedure TEditApplianceForm.SaveData();
begin
  if fApplID = -1 then
  begin
    dsAppl.Insert;
    dsAppl['ID'] := dmMain.dbTV.Gen_Id('GEN_APPLIANCE_UID', 1);
  end
  else
  begin
    dsAppl.Edit;
    dsAppl['ID'] := fApplID;
  end;
  if fCI.isType = 1 // узел
  then dsAppl['OWN_TYPE'] := 1
  else dsAppl['OWN_TYPE'] := 0; // абонент
  dsAppl['OWN_ID'] := fCI.CUSTOMER_ID;
  dsAppl['NAME'] := edtName.Text;
  dsAppl['PROPERTY'] := cbApplProperty.Value;
  dsAppl['MAC'] := edtMAC.Text;
  dsAppl['SN'] := edtSN.Text;
  dsAppl['NOTICE'] := mmoNotice.Lines.Text;
  if ednCost.Text <> '' then
    dsAppl['COST'] := ednCost.Value;
  if lcbApplMID.Text <> '' then
    dsAppl['M_ID'] := lcbApplMID.KeyValue;
  if lcbApplType.Text <> '' then
    dsAppl['A_TYPE'] := lcbApplType.KeyValue;
  dsAppl.Post;
  {
    ID       UID
    A_TYPE   Тип устройства. в справочнике Objects_type = 48
    OWN_ID   ID владельца (абонента/узла)
    OWN_TYPE где установлен 0=абонента, 1=узел
    NAME     Название
    NOTICE   Примечание
    M_ID     Ссылка на материал, если это собственность компании
    MAC      MAC адрес устройства
    SN       Серийный номер
    COST     D_N15_2
    PROPERTY Собственность. 0-абонента. 1-компании. 2-рассрочка. 3-аренда.
  }
end;

end.
