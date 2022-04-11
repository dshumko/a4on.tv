unit WireLinkForma;

interface

uses
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Types,
  WinAPI.Windows, WinAPI.Messages, Data.DB, System.StrUtils,
  Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask, Vcl.Forms,
  FIBDataSet, pFIBDataSet,
  DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst,
  GridsEh, DBGridEh, OkCancel_frame, FIBDatabase, pFIBDatabase,
  A4onTypeUnit, EhLibVCL, DBAxisGridsEh, DBVertGridsEh, Vcl.ComCtrls,
  CustomerInfoFrame, System.Actions, Vcl.ActnList;

type

  TWireLinkForm = class(TForm)
    OkCancelFrame: TOkCancelFrame;
    CnErrors: TCnErrorProvider;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlSecond: TPanel;
    actlst1: TActionList;
    actFind: TAction;
    actAddPort: TAction;
    actEditPort: TAction;
    pnlFind: TPanel;
    actEditWire: TAction;
    Label1: TLabel;
    lcbPortS: TDBLookupComboboxEh;
    Label2: TLabel;
    dbleEqpmntS: TDBLookupComboboxEh;
    Label3: TLabel;
    dbleEqpmntE: TDBLookupComboboxEh;
    Label4: TLabel;
    lcbPortE: TDBLookupComboboxEh;
    dsEqS: TpFIBDataSet;
    srcEqS: TDataSource;
    dsPortS: TpFIBDataSet;
    srcPortS: TDataSource;
    srcPortE: TDataSource;
    srcEqE: TDataSource;
    dsEqE: TpFIBDataSet;
    dsPortE: TpFIBDataSet;
    cbLABELS: TDBComboBoxEh;
    lblLabel: TLabel;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pgcFindChange(Sender: TObject);
    procedure actAddPortExecute(Sender: TObject);
    procedure actEditPortExecute(Sender: TObject);
  private
    FCanEdit: Boolean;
    FCanEditPort: Boolean;
    FCustomerRecord: TCustomerInfo;
    FNodeStart: Integer;
    FNodeEnd: Integer;
    FWID: Integer;
    FLabels: string;
    procedure SavePort;
    procedure SaveEndpoint(const eid: Integer; const port: string);
    procedure SetLabel(const Value: string);
  public
    property WID: Integer write FWID;
    property Labels: String write SetLabel;
    property NodeStart: Integer write FNodeStart;
    property NodeEnd: Integer write FNodeEnd;
  end;

function WireLink(const aWid: Integer; const aLabels: string; const aPoint_S: Integer; const aPoint_E: Integer): Boolean;

implementation

uses DM, pFIBQuery, EQPort, NodeLinkForma, AtrStrUtils;

{$R *.dfm}

function WireLink(const aWid: Integer; const aLabels: string; const aPoint_S: Integer; const aPoint_E: Integer): Boolean;
begin
  Result := false;
  with TWireLinkForm.Create(Application) do
  begin
    try
      WID := aWid;
      NodeStart := aPoint_S;
      NodeEnd := aPoint_E;
      Labels := aLabels;
      if ShowModal = mrOk then
      begin
        Result := true;
      end;
    finally
      free
    end;
  end;
end;

procedure TWireLinkForm.SetLabel(const Value: string);
var
  i, j: Integer;
  s, v: string;
  ports: TStringDynArray;
begin
  cbLABELS.Items.Clear;
  cbLABELS.KeyItems.Clear;
  FLabels := Value;
  if FLabels.IsEmpty then
    Exit;

  cbLABELS.Items.Delimiter := ',';
  cbLABELS.Items.StrictDelimiter := true;
  cbLABELS.Items.DelimitedText := FLabels;

  cbLABELS.KeyItems.Delimiter := ',';
  cbLABELS.KeyItems.StrictDelimiter := true;
  cbLABELS.KeyItems.DelimitedText := FLabels;
end;

procedure TWireLinkForm.actAddPortExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
begin
  {
    if (dsEndPort.RecordCount = 0) or (not FCanEdit) then
    Exit;

    if (lcbPortS.Text.IsEmpty) or (VarIsNull(lcbPortS.Value)) then
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
  }
end;

procedure TWireLinkForm.actEditPortExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  {
    if (dsEndPort.RecordCount = 0) or (not FCanEdit) or (lcbPortS.Text.IsEmpty) then
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
  }
end;

procedure TWireLinkForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsPortS.Close;
  dsPortE.Close;
  dsEqS.Close;
  dsEqE.Close;
end;

procedure TWireLinkForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TWireLinkForm.FormShow(Sender: TObject);
begin
  FCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment);
  FCanEdit := FCanEdit or dmMain.AllowedAction(rght_Dictionary_Equipment_Ports);

  OkCancelFrame.bbOk.Visible := FCanEdit;

  dsEqS.ParamByName('Node_ID').Value := FNodeStart;
  dsEqS.Open;
  dsPortS.Open;

  dsEqE.ParamByName('Node_ID').Value := FNodeEnd;
  dsEqE.Open;
  dsPortE.Open;

  lcbPortS.EditButtons.Items[0].Visible := FCanEdit;
  lcbPortE.EditButtons.Items[0].Visible := FCanEdit;
end;

procedure TWireLinkForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if not(FCanEdit) then
  begin
    errors := true;
    Exit;
  end;

  if not errors then
    SavePort
  else
    ModalResult := mrNone;
end;

procedure TWireLinkForm.pgcFindChange(Sender: TObject);
begin
  OkCancelFrame.bbOk.Enabled := false;
end;

procedure TWireLinkForm.SavePort;
var
  eid: Integer;
  port: string;
begin
  if not dbleEqpmntS.Text.IsEmpty then begin
    eid := dbleEqpmntS.KeyValue;
    if not lcbPortS.Text.IsEmpty then
      port := lcbPortS.KeyValue
    else
      port := '';
    SaveEndpoint(eid, port);
  end;

  if not dbleEqpmntE.Text.IsEmpty then begin
    eid := dbleEqpmntE.KeyValue;
    if not lcbPortE.Text.IsEmpty then
      port := lcbPortE.KeyValue
    else
      port := '';
    SaveEndpoint(eid, port);
  end;

  ModalResult := mrOk;
end;

procedure TWireLinkForm.SaveEndpoint(const eid: Integer; const port: string);
begin
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'update or insert into Port (Eid, Port, WID, WLABEL)';
      sql.Add('values (:Eid, :Port, :WID, :WLABEL)');
      sql.Add('matching (Eid, Port)');
      ParamByName('Eid').AsInteger := eid;
      ParamByName('Port').asString := port;
      ParamByName('WID').AsInteger := FWID;
      if not cbLABELS.Text.IsEmpty then
          ParamByName('WLABEL').asString := cbLABELS.Text;

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

end.
