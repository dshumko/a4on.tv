unit ReqWorkForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  OkCancel_frame, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, FIBQuery, pFIBQuery,
  DBGridEh;

type
  TReqWorkForm = class(TForm)
    okcnclfrm1: TOkCancelFrame;
    srcWork: TDataSource;
    dsWork: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    Label2: TLabel;
    Label3: TLabel;
    dbmmoSolution: TDBMemoEh;
    dbeName: TDBEditEh;
    edtHours: TDBNumberEditEh;
    lbl1: TLabel;
    grpAfterAdd: TGroupBox;
    lbl3: TLabel;
    cbATRAction: TDBComboBoxEh;
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    cbbAttribute: TDBLookupComboboxEh;
    lbl4: TLabel;
    cbService: TDBLookupComboboxEh;
    dsService: TpFIBDataSet;
    srcService: TDataSource;
    dbckDefault: TDBCheckBoxEh;
    lbl5: TLabel;
    ednW_COST: TDBNumberEditEh;
    Label1: TLabel;
    lbl2: TLabel;
    lcbW_SRV: TDBLookupComboboxEh;
    lcbOnOffService: TDBLookupComboboxEh;
    srcOnOffService: TDataSource;
    dsOnOffService: TpFIBDataSet;
    dsServiceON: TpFIBDataSet;
    srcServiceOn: TDataSource;
    chkW_ONOFF: TDBCheckBoxEh;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
    procedure lcbW_SRVChange(Sender: TObject);
    procedure dsWorkNewRecord(DataSet: TDataSet);
    procedure chkW_ONOFFClick(Sender: TObject);
    procedure cbServiceChange(Sender: TObject);
    procedure cbServiceEnter(Sender: TObject);
  private
    procedure ReloadOnOfSrev;
  public
    { Public declarations }
  end;

function ReguestWorkModify(const aW_ID: Integer; const aRT_ID: Integer): Integer;

implementation

uses
  DM;

{$R *.dfm}

function ReguestWorkModify(const aW_ID: Integer; const aRT_ID: Integer): Integer;
begin
  result := aW_ID;
  with TReqWorkForm.Create(Application) do
    try
      dsWork.ParamByName('W_ID').AsInteger := aW_ID;
      dsWork.Open;
      dsService.ParamByName('W_ID').AsInteger := aW_ID;
      dsService.Open;
      dsAttributes.ParamByName('W_ID').AsInteger := aW_ID;
      dsAttributes.Open;
      dsServiceON.ParamByName('W_ID').AsInteger := aW_ID;
      dsServiceON.Open;

      if aW_ID = -1 then
        dsWork.Insert;

      if ShowModal = mrOk then
      begin
        if aW_ID = -1 then
        begin
          result := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
          dsWork.ParamByName('W_ID').AsInteger := result;
          dsWork['RQ_TYPE'] := aRT_ID;
        end;
        if dsWork.State in [dsEdit, dsInsert] then
          dsWork.Post;
      end
      else
      begin
        if dsWork.State in [dsEdit, dsInsert] then
          dsWork.Cancel;
        result := -1;
      end;

      dsWork.Close;
      dsService.Close;
      dsAttributes.Close;
      if dsOnOffService.Active then
        dsOnOffService.Close;

      dsServiceON.Close;
    finally
      free
    end;
end;

procedure TReqWorkForm.cbServiceChange(Sender: TObject);
var
  v: Variant;
begin
  ednW_COST.Enabled := true;
  if dsService.Active then begin
    if (cbService.Text <> '') and (not VarIsNull(cbService.Value)) then begin
      v := dsService.Lookup('SERVICE_ID', cbService.Value, 'srv_type_id');
      if not (VarType(V) in [varNull]) then
        ednW_COST.Enabled := (v <> 1);
    end;
  end;
end;

procedure TReqWorkForm.cbServiceEnter(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
end;

procedure TReqWorkForm.chkW_ONOFFClick(Sender: TObject);
begin
  ReloadOnOfSrev;
end;

procedure TReqWorkForm.dsWorkNewRecord(DataSet: TDataSet);
begin
  dsWork['W_ONOFF'] := 0;
  dsWork['ON_DEFAULT'] := 0;
end;

procedure TReqWorkForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    okcnclfrm1bbOkClick(Sender);
end;

procedure TReqWorkForm.lcbW_SRVChange(Sender: TObject);
begin
  ReloadOnOfSrev;
end;

procedure TReqWorkForm.okcnclfrm1bbOkClick(Sender: TObject);
begin
  okcnclfrm1.actExitExecute(Sender);

end;

procedure TReqWorkForm.ReloadOnOfSrev;
begin
  if dsOnOffService.Active then
    dsOnOffService.Close;

  if (not lcbW_SRV.Text.IsEmpty) then
  begin
    dsOnOffService.ParamByName('FOR_SRV').value := lcbW_SRV.KeyValue;
    if chkW_ONOFF.Checked then
      dsOnOffService.ParamByName('ONOFF').value := 1
    else
      dsOnOffService.ParamByName('ONOFF').value := 0;
    dsOnOffService.Open;
  end;
end;

end.
