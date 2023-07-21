unit WirePointForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  System.Types, System.StrUtils, System.Actions,
  Data.DB,
  Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Forms, Vcl.ComCtrls, Vcl.ActnList,
  FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery,
  PrjConst, GridsEh, DBGridEh,
  OkCancel_frame,
  FIBDatabase, pFIBDatabase, A4onTypeUnit, EhLibVCL, DBAxisGridsEh,
  DBVertGridsEh, CustomerInfoFrame;

type

  TWirePointForm = class(TForm)
    OkCancelFrame: TOkCancelFrame;
    CnErrors: TCnErrorProvider;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlSecond: TPanel;
    pnlFind: TPanel;
    dsStreets: TpFIBDataSet;
    srcStreets: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHomes: TDataSource;
    Label2: TLabel;
    dblHouseNo: TDBLookupComboboxEh;
    dblStreet: TDBLookupComboboxEh;
    Label1: TLabel;
    srcNodes: TDataSource;
    dsNodes: TpFIBDataSet;
    lbl1: TLabel;
    lcbNode: TDBLookupComboboxEh;
    mmoNotice: TDBMemoEh;
    ednMeters: TDBNumberEditEh;
    lbl2: TLabel;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lcbNodeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    FCanEdit: Boolean;
    // FCanEditPort: Boolean;
    // FCustomerRecord: TCustomerInfo;
    FNodeID: Integer;
    FWID: Integer;
    function CheckData: Boolean;
    procedure SavePoint;
  public
    property WID: Integer write FWID;
    property NodeID: Integer write FNodeID;
  end;

function WirePoint(const aWid: Integer): Boolean;

implementation

uses
  DM, pFIBQuery, EQPort, NodeLinkForma, AtrStrUtils;

{$R *.dfm}

function WirePoint(const aWid: Integer): Boolean;
begin
  Result := false;
  with TWirePointForm.Create(Application) do
  begin
    try
      WID := aWid;
      if ShowModal = mrOk then
      begin
        Result := true;
      end;
    finally
      free
    end;
  end;
end;

procedure TWirePointForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsNodes.Close;
  dsHomes.Close;
  dsStreets.Close;
end;

procedure TWirePointForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TWirePointForm.FormShow(Sender: TObject);
begin
  FCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Nodes);

  OkCancelFrame.bbOk.Visible := FCanEdit;

  dsStreets.Open;
  dsHomes.Open;
  dsNodes.Open;
end;

procedure TWirePointForm.lcbNodeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsNodes.Active) and (not dsNodes.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsNodes['COLOR'])
  else
    Background := clWindow;
end;

procedure TWirePointForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  if not(FCanEdit) then
  begin
    Exit;
  end;

  errors := CheckData;

  if not errors then
    SavePoint
  else
    ModalResult := mrNone;
end;

function TWirePointForm.CheckData: Boolean;
begin
  Result := false;
  if VarIsNull(lcbNode.value) then
  begin
    Result := true;
    CnErrors.SetError(lcbNode, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(lcbNode);
end;

procedure TWirePointForm.SavePoint;
begin
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'update or insert into Wire_Point (Wid, Node_Id, Meters, Notice)';
      sql.Add('values (:Wid, :Node_Id, :Meters, :Notice)');
      sql.Add('matching (Wid, Node_Id)');
      ParamByName('WID').AsInteger := FWID;
      ParamByName('Node_Id').AsInteger := lcbNode.value;
      if not ednMeters.Text.IsEmpty then
        ParamByName('Meters').AsDouble := ednMeters.value;
      ParamByName('Notice').asString := mmoNotice.Lines.Text;

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      free;
    end;
  end;
  ModalResult := mrOk;
end;

end.
