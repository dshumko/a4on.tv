unit EQPort;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.ActnList,
  CnErrorProvider, DM, DBGridEh, DBCtrlsEh, DBLookupEh, GridsEh, FIBDataSet, pFIBDataSet, pFIBQuery, A4onTypeUnit;

type
  TEQPortForm = class(TForm)
    pnlBottom: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    cnError: TCnErrorProvider;
    ednCount: TDBNumberEditEh;
    lcbType: TDBLookupComboboxEh;
    mmoNotice: TDBMemoEh;
    lblCNT: TLabel;
    lblStart: TLabel;
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
    lblWire: TLabel;
    lcbWIRE: TDBLookupComboboxEh;
    dsWire: TpFIBDataSet;
    srcWire: TDataSource;
    lblLabel: TLabel;
    cbLABELS: TDBComboBoxEh;
    actlst: TActionList;
    actEditLink: TAction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lcbWIREDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure lcbWIREChange(Sender: TObject);
    procedure actEditLinkExecute(Sender: TObject);
  private
    FEqRecord: TEquipmentRecord;
    FPort: String;
    FNode_ID: Integer;
    FCanEditPort: Boolean;
    function CheckData: Boolean;
    procedure SaveAndClose;
    procedure SetEquipment(const value: TEquipmentRecord);
    procedure SetPort(const value: String);
    procedure GetPortInfo;
  public
    property Equipment: TEquipmentRecord read FEqRecord write SetEquipment;
    property Port: String read FPort write SetPort;
  end;

function CreatePort(const ER: TEquipmentRecord): Boolean;
function EditPort(const ER: TEquipmentRecord; const vPort: string): Boolean;

implementation

uses
  System.Types, System.StrUtils,
  PrjConst, NodeLinkForma;

{$R *.dfm}

function CreatePort(const ER: TEquipmentRecord): Boolean;
begin
  Result := False;
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
  Result := False;
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

  if dsWire.Active then
    dsWire.Close;
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
  FNode_ID := -1;

  dsType.Open;
  dsState.Open;
  dsVlans.Open;

  if FPort <> '' then
  begin
    GetPortInfo;
    if FNode_ID > -1 then
    begin
      if dsWire.Active then
        dsWire.Close;
      dsWire.ParamByName('NODE').AsInteger := FNode_ID;
      dsWire.Open;
    end;
  end;

  FCanEditPort := dmMain.AllowedAction(rght_Dictionary_full);
  FCanEditPort := FCanEditPort or dmMain.AllowedAction(rght_Dictionary_Nodes);
  FCanEditPort := FCanEditPort or dmMain.AllowedAction(rght_Dictionary_Node_Links);

  lcbWIRE.EditButtons.Items[0].Visible := FCanEditPort;
end;

procedure TEQPortForm.SetEquipment(const value: TEquipmentRecord);
begin
  FEqRecord := value;
  lblEquipment.Caption := FEqRecord.Name + ' / ' + FEqRecord.IP + ' / ' + FEqRecord.TypeName;
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
    fq.sql.Text := ' update or insert into Port(Eid, Port, Notice, P_Type, P_State, Speed, Vlan_Id, WID, WLABEL) ' +
      ' values (:Eid, :Port, :Notice, :P_Type, :P_State, :Speed, :Vlan_Id, :WID, :WLABEL) matching (Eid, Port) ';

    fq.ParamByName('Eid').AsInteger := FEqRecord.ID;
    fq.ParamByName('P_Type').AsInteger := lcbType.value;
    fq.ParamByName('P_State').AsInteger := lcbState.value;
    fq.ParamByName('Notice').AsString := mmoNotice.Lines.Text;
    if not ednSpeed.Text.IsEmpty then
      fq.ParamByName('Speed').AsInteger := ednSpeed.value;
    if not lcbVLAN.Text.IsEmpty then
      fq.ParamByName('Vlan_Id').AsInteger := lcbVLAN.value;
    if not lcbWIRE.Text.IsEmpty then
      fq.ParamByName('WID').AsInteger := lcbWIRE.value;
    fq.ParamByName('WLABEL').AsString := cbLABELS.value;

    if FPort = '' then
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
      fq.ParamByName('Port').AsString := FPort;
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

procedure TEQPortForm.actEditLinkExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
  need_refresh: Boolean;
begin
  if not FCanEditPort then
    Exit;

  if (lcbWIRE.Text.IsEmpty) then
  begin
    LinkItem.NODE_ID := -1;
    LinkItem.NODE_Name := '';
    LinkItem.LINK_ID := -1;

    SecondItem.NODE_ID := -1;
    SecondItem.NODE_Name := '';
    SecondItem.LINK_ID := -1;
  end
  else
  begin
    LinkItem.LINK_ID := dsWire['WID'];
    LinkItem.NODE_ID := dsWire['NODE_S_ID'];
    LinkItem.NODE_Name := dsWire['NODE_S'];

    SecondItem.LINK_ID := dsWire['WID'];
    SecondItem.NODE_ID := dsWire['NODE_E_ID'];
    SecondItem.NODE_Name := dsWire['NODE_E'];
  end;

  need_refresh := LinkNodes(LinkItem, SecondItem);
  if need_refresh then
  begin
    dsWire.CloseOpen(true);
    dsWire.Locate('WID', LinkItem.LINK_ID, []);
  end
end;

procedure TEQPortForm.btnOkClick(Sender: TObject);
begin
  if CheckData then
    SaveAndClose;
end;

procedure TEQPortForm.SetPort(const value: String);
begin
  FPort := value;
  lblStart.Visible := FPort.IsEmpty;
  ednCount.Visible := FPort.IsEmpty;
  edtNumber.ReadOnly := not FPort.IsEmpty;
  if not FPort.IsEmpty then
  begin
    edtNumber.Text := FPort;
    edtNumber.Left := ednCount.Left;
    lblCNT.Caption := 'Port';
    Caption := 'Редактрование порта ' + FPort;
  end;

  // спрячем при создании портов.
  lcbWIRE.Visible := not FPort.IsEmpty;
  lblWire.Visible := lcbWIRE.Visible;
  cbLABELS.Visible := lcbWIRE.Visible;
  lblLabel.Visible := lcbWIRE.Visible;
  if not lcbWIRE.Visible then
  begin
    mmoNotice.Top := lcbWIRE.Top;
    mmoNotice.Height := pnlBottom.Top - mmoNotice.Top;
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
    fq.sql.Text := 'select p.Notice, p.P_Type, p.P_State, p.Speed, p.Vlan_Id, p.WID, e.Node_Id, p.WLABEL';
    fq.sql.Add('from Port p inner join Equipment e on (p.Eid = e.Eid)');
    fq.sql.Add('where p.Eid = :Eid and p.Port = :Port');
    fq.ParamByName('Eid').AsInteger := FEqRecord.ID;
    fq.ParamByName('Port').AsString := FPort;

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
      if not fq.FN('Node_Id').IsNull then
        FNode_ID := fq.FN('Node_Id').AsInteger
      else
        FNode_ID := -1;
      if not fq.FN('WID').IsNull then
        lcbWIRE.value := fq.FN('WID').AsInteger;
      if not fq.FN('WLABEL').IsNull then
        cbLABELS.Text := fq.FN('WLABEL').AsString;
    end;
    fq.Transaction.Commit;
    fq.Close;
  finally
    fq.Free;
  end;
  ModalResult := mrOk;
end;

procedure TEQPortForm.lcbWIREChange(Sender: TObject);
var
  i, j: Integer;
  s, v: string;
  ports: TStringDynArray;
begin
  cbLABELS.Items.Clear;
  cbLABELS.KeyItems.Clear;
  if dsWire.FieldByName('LABELS').IsNull then
    Exit;

  cbLABELS.Items.Delimiter := ',';
  cbLABELS.Items.StrictDelimiter := true;
  cbLABELS.Items.DelimitedText := dsWire['LABELS'];

  cbLABELS.KeyItems.Delimiter := ',';
  cbLABELS.KeyItems.StrictDelimiter := true;
  cbLABELS.KeyItems.DelimitedText := dsWire['LABELS'];

  if (not dsWire.FieldByName('WlabelS').IsNull) then
  begin
    ports := SplitString(dsWire['WlabelS'], ';');
    for i := 0 to cbLABELS.Items.Count - 1 do
    begin
      s := '(' + cbLABELS.Items[i] + ')';
      for j := 0 to Length(ports) - 1 do
      begin
        if ports[j].Contains(s) then
        begin
          v := copy(ports[j], 1, pos(s, ports[j]) - 1);
          if v <> FPort then
            cbLABELS.Items[i] := cbLABELS.Items[i] + ' / подкл. к порту ' + v
          else
            cbLABELS.Items[i] := cbLABELS.Items[i] + ' / подкл. к текущем порту ' + v;
        end;
      end;
    end;
  end;
end;

procedure TEQPortForm.lcbWIREDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (not dsWire.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsWire['COLOR'])
  else
    Background := clWindow;

  if FEqRecord.NODE_ID > 0 then
  begin
    // пометим лини связи из узла или в узел
    if ((not dsWire.FieldByName('NODE_S_ID').IsNull) and (dsWire['NODE_S_ID'] = FEqRecord.NODE_ID)) then
      AFont.Style := [fsBold];

    if ((not dsWire.FieldByName('NODE_E_ID').IsNull) and (dsWire['NODE_E_ID'] = FEqRecord.NODE_ID)) then
      AFont.Style := [fsBold];
  end;
end;

end.
