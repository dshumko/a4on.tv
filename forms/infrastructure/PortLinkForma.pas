unit PortLinkForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Types, System.StrUtils, System.Actions,
  Data.DB,
  Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask, Vcl.Forms, Vcl.ComCtrls, Vcl.ActnList,
  FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst, GridsEh, DBGridEh,
  OkCancel_frame,
  FIBDatabase, pFIBDatabase, A4onTypeUnit, EhLibVCL, DBAxisGridsEh, DBVertGridsEh, CustomerInfoFrame;

type

  TPortLinkForm = class(TForm)
    OkCancelFrame: TOkCancelFrame;
    dsPort: TpFIBDataSet;
    CnErrors: TCnErrorProvider;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlSecond: TPanel;
    srcPort: TDataSource;
    dbVertGrid: TDBVertGridEh;
    actlst1: TActionList;
    actFind: TAction;
    dsEndPort: TpFIBDataSet;
    srcEndPort: TDataSource;
    actAddPort: TAction;
    actEditPort: TAction;
    pnlFind: TPanel;
    pgcFind: TPageControl;
    tsEq: TTabSheet;
    gbInfo: TGroupBox;
    Label3: TLabel;
    mmoEqpmnt: TMemo;
    lcbPort: TDBLookupComboboxEh;
    Panel1: TPanel;
    Label2: TLabel;
    edtEqIP: TDBEditEh;
    edtEqName: TDBEditEh;
    btnFndEqpmnt: TButton;
    tsCust: TTabSheet;
    pnlSearchAbonent: TPanel;
    Label1: TLabel;
    edCode: TDBEditEh;
    edAccount: TDBEditEh;
    btnFndCustomer: TButton;
    CustomerInfofrm: TCustomerInfoFrm;
    pnlLink: TPanel;
    dsWire: TpFIBDataSet;
    srcWire: TDataSource;
    lblWire: TLabel;
    lblLabel: TLabel;
    lcbWIRE: TDBLookupComboboxEh;
    cbLABELS: TDBComboBoxEh;
    actEditWire: TAction;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnFndCustomerClick(Sender: TObject);
    procedure btnFndEqpmntClick(Sender: TObject);
    procedure pgcFindChange(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actAddPortExecute(Sender: TObject);
    procedure actEditPortExecute(Sender: TObject);
    procedure lcbWIREChange(Sender: TObject);
    procedure actEditWireExecute(Sender: TObject);
  private
    FCanEdit: Boolean;
    FCanEditPort: Boolean;
    FCustomerRecord: TCustomerInfo;
    FEID: Integer;
    FPort: String;
    FConType: Integer;
    FConID: Integer;
    procedure SavePort;
    procedure FindCustomer(const lic: string; const code: string; id: Integer);
    procedure FindEqpmnt(var vName: string; var vIp: string; var vId: Integer);
    procedure SetFindResult(const id, TypeID: Integer);
    procedure SetTab;
    procedure SaveEndpoint;
  public
    property EqID: Integer write FEID;
    property Port: String write FPort;
  end;

function LinkPort(const aEqID: Integer; const aPORT: String): Boolean;

implementation

uses
  DM, pFIBQuery, EQPort, NodeLinkForma, AtrStrUtils;

{$R *.dfm}

function LinkPort(const aEqID: Integer; const aPORT: String): Boolean;
begin
  Result := false;
  with TPortLinkForm.Create(Application) do
  begin
    try
      EqID := aEqID;
      Port := aPORT;
      if ShowModal = mrOk then
      begin
        Result := true;
      end;
    finally
      free
    end;
  end;
end;

procedure TPortLinkForm.FindCustomer(const lic: string; const code: string; id: Integer);
begin
  FCustomerRecord := dmMain.FindCustomer(lic, code, id);
  CustomerInfofrm.Customer := FCustomerRecord;
  OkCancelFrame.bbOk.Enabled := FCustomerRecord.CUSTOMER_ID > 0;
  if FCustomerRecord.CUSTOMER_ID > 0 then
  begin
    FConType := 1;
    FConID := FCustomerRecord.CUSTOMER_ID;
  end;
end;

procedure TPortLinkForm.actAddPortExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
begin
  if (dsEndPort.RecordCount = 0) or (not FCanEdit) then
    Exit;

  if (lcbPort.Text.IsEmpty) or (VarIsNull(lcbPort.Value)) then
  begin
    EQ.id := dsEndPort.FieldByName('Eid').AsInteger;
    if not dsEndPort.FieldByName('EQ_Name').IsNull then
      EQ.Name := dsEndPort.FieldByName('EQ_Name').asString;
    if not dsEndPort.FieldByName('Ip').IsNull then
      EQ.ip := dsEndPort.FieldByName('Ip').asString;
    if not dsEndPort.FieldByName('Mac').IsNull then
      EQ.MAC := dsEndPort.FieldByName('Mac').asString;
    if not dsEndPort.FieldByName('NODE_ID').IsNull then
      EQ.Node_Id := dsEndPort.FieldByName('NODE_ID').AsInteger;

    if CreatePort(EQ) then
      dsEndPort.CloseOpen(true);
  end
  else
    actEditPort.Execute;
end;

procedure TPortLinkForm.actEditPortExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  if (dsEndPort.RecordCount = 0) or (not FCanEdit) or (lcbPort.Text.IsEmpty) then
    Exit;

  Port := dsEndPort.FieldByName('PORT').asString;
  EQ.id := dsEndPort.FieldByName('Eid').AsInteger;
  if not dsEndPort.FieldByName('EQ_Name').IsNull then
    EQ.Name := dsEndPort.FieldByName('EQ_Name').asString;
  if not dsEndPort.FieldByName('Ip').IsNull then
    EQ.ip := dsEndPort.FieldByName('Ip').asString;
  if not dsEndPort.FieldByName('Mac').IsNull then
    EQ.MAC := dsEndPort.FieldByName('Mac').asString;
  if not dsEndPort.FieldByName('NODE_ID').IsNull then
    EQ.Node_Id := dsEndPort.FieldByName('NODE_ID').AsInteger;

  if EditPort(EQ, Port) then
  begin
    // dsPort.CloseOpen(True);
    dsEndPort.Refresh;
  end;
end;

procedure TPortLinkForm.actEditWireExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
  need_refresh: Boolean;
begin
  if not FCanEditPort then
    Exit;

  if (lcbWIRE.Text.IsEmpty) then
  begin
    LinkItem.Node_Id := -1;
    LinkItem.NODE_Name := '';
    LinkItem.LINK_ID := -1;

    SecondItem.Node_Id := -1;
    SecondItem.NODE_Name := '';
    SecondItem.LINK_ID := -1;
  end
  else
  begin
    LinkItem.LINK_ID := dsWire['WID'];
    LinkItem.Node_Id := dsWire['NODE_S_ID'];
    LinkItem.NODE_Name := dsWire['NODE_S'];

    SecondItem.LINK_ID := dsWire['WID'];
    SecondItem.Node_Id := dsWire['NODE_E_ID'];
    SecondItem.NODE_Name := dsWire['NODE_E'];
  end;

  need_refresh := LinkNodes(LinkItem, SecondItem);
  if need_refresh then
  begin
    dsWire.CloseOpen(true);
    dsWire.Locate('WID', LinkItem.LINK_ID, []);
  end
end;

procedure TPortLinkForm.actFindExecute(Sender: TObject);
begin
  if pgcFind.ActivePageIndex = 0 then
    btnFndEqpmntClick(Sender);
  if pgcFind.ActivePageIndex = 1 then
    btnFndCustomerClick(Sender);
end;

procedure TPortLinkForm.btnFndCustomerClick(Sender: TObject);
begin
  if (not edAccount.Text.IsEmpty) then
    FindCustomer(edAccount.Text, '', -1)
  else
  begin
    if (not edCode.Text.IsEmpty) then
      FindCustomer('', edCode.Text, -1);
  end;
end;

procedure TPortLinkForm.btnFndEqpmntClick(Sender: TObject);
var
  Name, ip: string;
  id: Integer;
begin
  id := -1;
  if (not edtEqName.Text.IsEmpty) then
    Name := edtEqName.Text
  else
  begin
    if (not edtEqIP.Text.IsEmpty) then
      ip := edtEqIP.Text;
  end;
  FindEqpmnt(Name, ip, id);
end;

procedure TPortLinkForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsPort.Active then
  begin
    if dsPort.State in [dsEdit, dsInsert] then
      dsPort.Cancel;
    dsPort.Close;
  end;
end;

procedure TPortLinkForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TPortLinkForm.FormShow(Sender: TObject);
begin
  FCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment);
  FCanEdit := FCanEdit or dmMain.AllowedAction(rght_Comm_Equipment_Ports);

  FCanEditPort := dmMain.AllowedAction(rght_Dictionary_full);
  FCanEditPort := FCanEditPort or dmMain.AllowedAction(rght_Comm_Nodes);
  FCanEditPort := FCanEditPort or dmMain.AllowedAction(rght_Comm_Node_Links);

  OkCancelFrame.bbOk.Visible := FCanEdit;

  dsPort.ParamByName('EID').Value := FEID;
  dsPort.ParamByName('PORT').Value := FPort;
  dsPort.Open;

  if not dsPort.FieldByName('EQ_NODE_ID').IsNull then
  begin
    dsWire.ParamByName('NODE').Value := dsPort['EQ_NODE_ID'];
    dsWire.Open;

  end;
  SetTab;

  lcbPort.EditButtons.Items[0].Visible := FCanEdit;
  lcbWIRE.EditButtons.Items[0].Visible := FCanEditPort;
end;

procedure TPortLinkForm.lcbWIREChange(Sender: TObject);
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

procedure TPortLinkForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if not(FCanEdit) then
  begin
    Exit;
  end;

  if not errors then
    SavePort
  else
    ModalResult := mrNone;
end;

procedure TPortLinkForm.pgcFindChange(Sender: TObject);
begin
  OkCancelFrame.bbOk.Enabled := false;
end;

procedure TPortLinkForm.SavePort;
begin
  dsPort.Edit;
  dsPort['CON'] := FConType;
  dsPort['CON_ID'] := FConID;
  dsPort.Post;

  SaveEndpoint;

  ModalResult := mrOk;
end;

procedure TPortLinkForm.SetTab;
var
  Name, ip: string;
  id: Integer;
begin
  FConID := -1;
  FConType := -1;
  if dsPort.FieldByName('CON').IsNull or dsPort.FieldByName('CON_ID').IsNull then
  begin
    pgcFind.ActivePageIndex := 0;
    edtEqName.SetFocus;
    Exit;
  end;

  SetFindResult(dsPort['CON_ID'], dsPort['CON']);
  if FConType = 1 then
  begin
    FindCustomer('', '', FConID);
    edAccount.Text := FCustomerRecord.Account_No;
    edAccount.SetFocus;
  end
  else
  begin
    if FConType = 0 then
    begin
      name := '';
      ip := '';
      id := FConID;
      FindEqpmnt(name, ip, id);
      edtEqName.SetFocus;
    end
  end;
end;

procedure TPortLinkForm.FindEqpmnt(var vName: string; var vIp: string; var vId: Integer);
var
  query: string;
begin
  if dsEndPort.Active then
    dsEndPort.Close;

  query := 'select e.Name, e.Ip, e.Eid from Equipment e where ';
  if vId >= 0 then
    query := query + Format(' e.Eid = %d ', [vId])
  else if not vName.IsEmpty then
    query := query + Format(' e.Name = ''%s'' ', [vName])
  else if not vIp.IsEmpty then
    query := query + Format(' e.IP = ''%s'' ', [vIp])
  else
    query := '';

  vIp := '';
  vName := '';
  vId := -1;
  mmoEqpmnt.Lines.Clear;

  if query.IsEmpty then
    Exit;

  with dmMain.qRead do
  begin
    sql.Text := query;
    Transaction.StartTransaction;
    ExecQuery;

    if not FieldByName('ip').IsNull then
      vIp := FieldByName('ip').asString;

    if not FieldByName('Name').IsNull then
      vName := FieldByName('Name').asString;

    if not FieldByName('Eid').IsNull then
      vId := FieldByName('Eid').AsInteger;
    Close;
    Transaction.Rollback;
  end;

  if vId > 0 then
  begin
    edtEqName.Text := vName;
    edtEqIP.Text := vIp;
    SetFindResult(vId, 0);
    mmoEqpmnt.Lines.Text := vName;
    mmoEqpmnt.Lines.Add('IP: ' + vIp);
    dsEndPort.ParamByName('EID').AsInteger := vId;
    dsEndPort.Open;
    if not dsPort.FieldByName('PORT_OUT').IsNull then
      lcbPort.Value := dsPort['PORT_OUT'];
  end;
end;

procedure TPortLinkForm.SetFindResult(const id, TypeID: Integer);
begin
  FConType := TypeID;
  FConID := id;
  pgcFind.ActivePageIndex := FConType;
  OkCancelFrame.bbOk.Enabled := id > 0;
end;

procedure TPortLinkForm.SaveEndpoint;
begin
  if ((lcbPort.Text.IsEmpty) or (pgcFind.ActivePageIndex = 1)) then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'update or insert into Port (Eid, Port, Con, Con_Id, Con_Port, WID, WLABEL)';
      sql.Add('values (:Eid, :Port, :Con, :Con_Id, :Con_Port, :WID, :WLABEL)');
      sql.Add('matching (Eid, Port)');
      ParamByName('Eid').AsInteger := dsEndPort['EID'];
      ParamByName('Port').asString := dsEndPort['PORT'];
      ParamByName('Con').AsInteger := 0;
      ParamByName('Con_Id').AsInteger := dsPort['EID'];
      ParamByName('Con_Port').asString := dsPort['PORT'];
      if not dsPort.FieldByName('WID').IsNull then
      begin
        ParamByName('WID').AsInteger := dsPort['WID'];
        if not dsPort.FieldByName('WLABEL').IsNull then
          ParamByName('WLABEL').asString := dsPort['WLABEL'];
      end;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

end.
