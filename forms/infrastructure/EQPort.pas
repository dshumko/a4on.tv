unit EQPort;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CnErrorProvider, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  DM, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask, Data.DB, FIBDataSet,
  pFIBDataSet, pFIBQuery, A4onTypeUnit;

type
  TEQPortForm = class(TForm)
    pnlBottom: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    cnError: TCnErrorProvider;
    ednCount: TDBNumberEditEh;
    lcbType: TDBLookupComboboxEh;
    mmoNotice: TDBMemoEh;
    lbl1: TLabel;
    lbl2: TLabel;
    edtNumber: TDBEditEh;
    lbl3: TLabel;
    ednSpeed: TDBNumberEditEh;
    lbl4: TLabel;
    lbl5: TLabel;
    lcbState: TDBLookupComboboxEh;
    lblEquipment: TLabel;
    dsType: TpFIBDataSet;
    srcType: TDataSource;
    dsState: TpFIBDataSet;
    srcState: TDataSource;
    lblVLAN: TLabel;
    srcVLANS: TDataSource;
    dsVlans: TpFIBDataSet;
    lcbVLAN: TDBLookupComboboxEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    fEr: TEquipmentRecord;
    fPort: String;
    function CheckData: Boolean;
    procedure SaveAndClose;
    procedure SetEquipment(const value: TEquipmentRecord);
    procedure SetPort(const value: String);
    procedure GetPortInfo;
  public
    property Equipment: TEquipmentRecord read fEr write SetEquipment;
    property Port: String read fPort write SetPort;
  end;

function CreatePort(const ER: TEquipmentRecord): Boolean;
function EditPort(const ER: TEquipmentRecord; const vPort: string): Boolean;

implementation

uses PrjConst;

{$R *.dfm}

function CreatePort(const ER: TEquipmentRecord): Boolean;
begin
  if ER.ID = -1 then
    Exit;
  with TEQPortForm.Create(Application) do
  begin
    try
      Equipment := ER;
      Port := '';
      Result := (ShowModal = mrOk);
    finally
      Free;
    end;
  end;
end;

function EditPort(const ER: TEquipmentRecord; const vPort: string): Boolean;
begin
  if ER.ID = -1 then
    Exit;
  with TEQPortForm.Create(Application) do
  begin
    try
      Equipment := ER;
      Port := vPort;
      Result := (ShowModal = mrOk);
    finally
      Free;
    end;
  end;
end;

procedure TEQPortForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsType.Active then
    dsType.Close;

  if dsState.Active then
    dsState.Close;

  if dsVlans.Active then
    dsVlans.Close;
end;

procedure TEQPortForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;
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

procedure TEQPortForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
  begin
    if CheckData then
      SaveAndClose;
  end;
end;

procedure TEQPortForm.FormShow(Sender: TObject);
begin
  dsType.Open;
  dsState.Open;
  dsVlans.Open;
  if FPort <> '' then
    GetPortInfo;
end;

procedure TEQPortForm.SetEquipment(const value: TEquipmentRecord);
begin
  fEr := value;
  lblEquipment.Caption := fEr.Name + ' / ' + fEr.IP + ' / ' + fEr.TypeName;
end;

procedure TEQPortForm.SaveAndClose;
var
  fq: TpFIBQuery;
  i, cnt: Integer;
  pn: string;

  function MakeNumber(const n: Integer): string;
  var
    j: Integer;
  begin
    Result := edtNumber.Text;
    // if n = 0 then Exit;
    if TryStrToInt(Result, j) then
      Result := IntToStr(j + n)
    else
      Result := Result + IntToStr(n + 1);
  end;

begin
  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trWriteQ;
    fq.sql.Text := ' update or insert into Port(Eid, Port, Notice, P_Type, P_State, Speed, Vlan_Id) ' +
      ' values (:Eid, :Port, :Notice, :P_Type, :P_State, :Speed, :Vlan_Id) matching (Eid, Port) ';

    fq.ParamByName('Eid').AsInteger := fEr.ID;
    fq.ParamByName('P_Type').AsInteger := lcbType.value;
    fq.ParamByName('P_State').AsInteger := lcbState.value;
    fq.ParamByName('Notice').AsString := mmoNotice.Lines.Text;
    if not ednSpeed.Text.IsEmpty then
      fq.ParamByName('Speed').AsInteger := ednSpeed.value;
    if not lcbVLAN.Text.IsEmpty then
      fq.ParamByName('Vlan_Id').AsInteger := lcbVLAN.value;

    if fPort = '' then
    begin
      cnt := ednCount.value;
      for i := 0 to cnt - 1 do
      begin
        if cnt > 1 then
          pn := MakeNumber(i)
        else
          pn := edtNumber.Text;
        fq.ParamByName('Port').AsString := pn;
        fq.Transaction.StartTransaction;
        fq.ExecQuery;
        fq.Transaction.Commit;
      end;
    end
    else
    begin
      fq.ParamByName('Port').AsString := fPort;
      fq.Transaction.StartTransaction;
      fq.ExecQuery;
      fq.Transaction.Commit;
    end;
    fq.Close;
  finally
    fq.Free;
  end;
  ModalResult := mrOk;
end;

procedure TEQPortForm.btnOkClick(Sender: TObject);
begin
  if CheckData then
    SaveAndClose;
end;

procedure TEQPortForm.SetPort(const value: String);
begin
  fPort := value;
  lbl2.Visible := fPort.IsEmpty;
  ednCount.Visible := fPort.IsEmpty;
  edtNumber.ReadOnly := not fPort.IsEmpty;
  if not fPort.IsEmpty then begin
    edtNumber.Text := fPort;
    edtNumber.Left := ednCount.Left;
    lbl1.Caption := 'Port';
    Caption := 'Редактрование порта ' + fPort;
  end;
end;

function TEQPortForm.CheckData: Boolean;
var
  s: string;
begin
  Result := true;
  if (ednCount.Visible) and (ednCount.Text.IsEmpty) then
  begin
    cnError.SetError(ednCount, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    Result := False;
  end
  else
    cnError.Dispose(ednCount);

  if (edtNumber.Text.IsEmpty) then
  begin
    cnError.SetError(edtNumber, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    Result := False;
  end
  else
    cnError.Dispose(edtNumber);

  if (lcbType.Text.IsEmpty) then
  begin
    cnError.SetError(lcbType, s, iaMiddleLeft, bsNeverBlink);
    Result := False;
  end
  else
    cnError.Dispose(lcbType);

  if (lcbState.Text.IsEmpty) then
  begin
    cnError.SetError(lcbState, s, iaMiddleLeft, bsNeverBlink);
    Result := False;
  end
  else
    cnError.Dispose(lcbState);
end;

procedure TEQPortForm.GetPortInfo;
var
  fq: TpFIBQuery;
begin
  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trReadQ;
    fq.sql.Text := ' select Notice, P_Type, P_State, Speed, Vlan_Id ' + ' from Port where Eid = :Eid and Port = :Port ';
    fq.ParamByName('Eid').AsInteger := fEr.ID;
    fq.ParamByName('Port').AsString := fPort;

    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    if not fq.Eof then
    begin
      if not fq.FN('P_Type').IsNull then
        lcbType.value := fq.FN('P_Type').AsInteger;
      if not fq.FN('P_State').IsNull then
        lcbState.value := fq.FN('P_State').AsInteger;
      if not fq.FN('Vlan_Id').IsNull then
        lcbVLAN.value := fq.FN('Vlan_Id').AsInteger;
      if not fq.FN('Speed').IsNull then
        ednSpeed.value := fq.FN('Speed').AsInteger;
      if not fq.FN('Notice').IsNull then
        mmoNotice.Lines.Text := fq.FN('Notice').AsString;
    end;
    fq.Transaction.Commit;
    fq.Close;
  finally
    fq.Free;
  end;
  ModalResult := mrOk;
end;

end.
