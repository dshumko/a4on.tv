unit ReqAddWorkForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, DBGridEh;

type
  TReqAddWork = class(TForm)
    frmOk: TOkCancelFrame;
    dsRTWorks: TpFIBDataSet;
    srcRTWorks: TDataSource;
    luWork: TDBLookupComboboxEh;
    edQuant: TDBNumberEditEh;
    mmoNotice: TDBMemoEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FEnterSecondPress: Boolean;
  public
    { Public declarations }
  end;

function SelectRequestWork(const reqType: Integer; var work_id: Integer; var wname: string; var quant: Integer;
  var worktime: single; var workcost: single; var notice: string): Boolean;

function SelectWork(var work_id: Integer; var wname: string; var quant: double;
  var worktime: double; var workcost: double; var notice: string): Boolean;

implementation

uses
  DM;

{$R *.dfm}

function SelectRequestWork(const reqType: Integer; var work_id: Integer; var wname: string; var quant: Integer;
  var worktime: single; var workcost: single; var notice: string): Boolean;
begin
  Result := False;
  with TReqAddWork.Create(application) do
    try
      dsRTWorks.ParamByName('rt_id').AsInteger := reqType;
      dsRTWorks.Open;
      edQuant.Value := 1;

      if showModal = mrOk then
      begin
        if not varIsNull(luWork.Value) then
        begin
          work_id := dsRTWorks['W_ID'];
          wname := dsRTWorks['NAME'];
          try
            quant := edQuant.Value;
          except
            quant := 1;
          end;
          if (not dsRTWorks.FieldByName('W_TIME').IsNull) then
            worktime := dsRTWorks['W_TIME']
          else
            worktime := 0;

          if (not dsRTWorks.FieldByName('W_COST').IsNull) then
            workcost := dsRTWorks['W_COST']
          else
            workcost := 0;
          notice := mmoNotice.Lines.Text;
          Result := True;
        end;
      end;
      dsRTWorks.Close;
    finally
      free;
    end;
end;

function SelectWork(var work_id: Integer; var wname: string; var quant: double;
  var worktime: double; var workcost: double; var notice: string): Boolean;
begin
  Result := False;
  with TReqAddWork.Create(application) do
    try
      dsRTWorks.ParamByName('rt_id').AsInteger := -1;
      dsRTWorks.Open;
      edQuant.Value := 1;

      if showModal = mrOk then
      begin
        if not varIsNull(luWork.Value) then
        begin
          work_id := dsRTWorks['W_ID'];
          wname := dsRTWorks['NAME'];
          try
            quant := edQuant.Value;
          except
            quant := 1;
          end;
          if (not dsRTWorks.FieldByName('W_TIME').IsNull) then
            worktime := dsRTWorks['W_TIME']
          else
            worktime := 0;

          if (not dsRTWorks.FieldByName('W_COST').IsNull) then
            workcost := dsRTWorks['W_COST']
          else
            workcost := 0;

          notice := mmoNotice.Lines.Text;
          Result := True;
        end;
      end;
      dsRTWorks.Close;
    finally
      free;
    end;
end;


procedure TReqAddWork.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TReqAddWork.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
      // else if (ActiveControl is TDBGridEh) then
      // go := False
      // else if (ActiveControl is TDBSynEdit) and not(Trim((ActiveControl as TDBSynEdit).Lines.Text) = '') then
      // go := False;
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
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

end.
