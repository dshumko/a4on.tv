unit DistrContractForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, FIBDatabase, pFIBDatabase, CnErrorProvider, PrjConst, DBGridEh;

type
  TDistrContractForm = class(TForm)
    Label3: TLabel;
    OkCancelFrame: TOkCancelFrame;
    edtC_NUMBER: TDBEditEh;
    DBMemo1: TDBMemoEh;
    trSRead: TpFIBTransaction;
    trSWrite: TpFIBTransaction;
    CnErrors: TCnErrorProvider;
    dsContract: TpFIBDataSet;
    srcContract: TDataSource;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    edtC_DATE: TDBDateTimeEditEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbREPORT_FORM: TDBComboBoxEh;
    dsReports: TpFIBDataSet;
    lbl4: TLabel;
    cbbREPORT_FRMT: TDBComboBoxEh;
    lbl5: TLabel;
    edtFINTERMS: TDBNumberEditEh;
    edtMINTERMS: TDBNumberEditEh;
    lbl6: TLabel;
    lbl7: TLabel;
    cbbREPORT_FRMT1: TDBComboBoxEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtC_NUMBERChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFramebbOkClick(Sender: TObject);
    procedure dblAreaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEnterSecondPress: Boolean;
    procedure CheckData;
    procedure UpdateComboReport;
  public
    { Public declarations }
  end;

function EditContract(const aDistr_ID: Integer; const aContract_ID: Integer = -1): Integer;

implementation

uses
  DM;

{$R *.dfm}

function EditContract(const aDistr_ID: Integer; const aContract_ID: Integer = -1): Integer;
var
  vID: Int64;
begin
  result := -1;
  with TDistrContractForm.Create(Application) do
    try
      trSWrite.Active := true;
      trSRead.Active := true;
      dsContract.ParamByName('ID').AsInteger := aContract_ID;
      dsContract.Open;
      if aContract_ID = -1 then begin
        dsContract.Insert;
      end
      else
        dsContract.Edit;
      dsContract['DISTRIBUTOR_ID'] := aDistr_ID;
      CheckData;
      if ShowModal = mrOk then begin
        try
          if aContract_ID = -1 then begin
            vID := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1, dmMain.trWriteQ);
            dsContract['ID'] := vID;
          end
          else
            vID := aContract_ID;
          dsContract.Post;
          result := vID;
        except
          result := -1;
        end;
      end
      else
        dsContract.Cancel;
      dsContract.Close;
    finally
      free
    end;
end;

procedure TDistrContractForm.CheckData;
var
  En: Boolean;
begin
  En := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Distributor)));
  if not En then
    CnErrors.SetError(OkCancelFrame.bbOk, rsNoRights, iaMiddleLeft, bsNeverBlink);

  if edtC_NUMBER.Text = '' then begin
    CnErrors.SetError(edtC_NUMBER, rsLabelName, iaMiddleLeft, bsNeverBlink);
    En := False;
  end
  else
    CnErrors.Dispose(edtC_NUMBER);

  if edtC_DATE.Text = '' then begin
    CnErrors.SetError(edtC_DATE, rsSelectCity, iaMiddleLeft, bsNeverBlink);
    En := False;
  end
  else
    CnErrors.Dispose(edtC_DATE);

  OkCancelFrame.bbOk.Enabled := En;
end;

procedure TDistrContractForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (OkCancelFrame.bbOk.Enabled) then
    OkCancelFrame.actExitExecute(Sender);
end;

procedure TDistrContractForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    //else if (ActiveControl is TDBGridEh) then
    //  go := False	  
    else
    begin
      if (ActiveControl is TDBMemoEh) and (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
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

procedure TDistrContractForm.FormShow(Sender: TObject);
begin
  UpdateComboReport;
end;

procedure TDistrContractForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  OkCancelFrame.actExitExecute(Sender);
end;

procedure TDistrContractForm.dblAreaChange(Sender: TObject);
begin
  CheckData
end;

procedure TDistrContractForm.edtC_NUMBERChange(Sender: TObject);
begin
  CheckData
end;

procedure TDistrContractForm.UpdateComboReport;
var
  s: string;
begin
  dsReports.Open;
  while not dsReports.Eof do begin
    s := dsReports['report_name'];
    if (dsReports['FULL_NAME'] <> '') then
      s := dsReports['FULL_NAME'] + '/' + s;

    cbbREPORT_FORM.Items.Add(s);
    cbbREPORT_FORM.KeyItems.Add(dsReports.FieldByName('id_report').AsString);
    dsReports.Next;
  end;
  dsReports.Close;
end;

end.
