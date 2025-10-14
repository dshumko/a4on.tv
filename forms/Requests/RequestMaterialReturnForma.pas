unit RequestMaterialReturnForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FIBDatabase, pFIBDatabase, Data.DB,
  FIBDataSet, pFIBDataSet, Vcl.StdCtrls, DBGridEh, DBCtrlsEh, DBLookupEh,
  Vcl.Mask;

type
  TRequestMaterialReturn = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    dsAppliance: TpFIBDataSet;
    srcAppliance: TDataSource;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    ednCOST: TDBNumberEditEh;
    cbProp: TDBComboBoxEh;
    lcb1: TDBLookupComboboxEh;
    mmoNotice: TDBMemoEh;
    dsWH: TpFIBDataSet;
    srcWH: TDataSource;
    lcbWH: TDBLookupComboboxEh;
    lbl2: TLabel;
    ednQUANT: TDBNumberEditEh;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FEnterSecondPress: Boolean;
  public
    { Public declarations }
  end;

function RequestMaterialReturn(const aRequest: Integer; const aReadOnly: Boolean = True): Boolean;

implementation

uses
  DM;

{$R *.dfm}

function RequestMaterialReturn(const aRequest: Integer; const aReadOnly: Boolean = True): Boolean;
var
  FWHOwner: Boolean;
begin
  result := false;
  with TRequestMaterialReturn.Create(Application) do
    try
      {
      ReadOnlyMode := aReadOnly;
      dsMatGropups.Open;
      pRequest := aRequest;

      FWHOwner := (dmMain.GetSettingsValue('WH_REQ_OWNER') = '1');

      // if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full))))
      if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full)))) then
        dsReqMaterials.ParamByName('WH_OWNER').Value := '1'
      else
        dsReqMaterials.ParamByName('WH_OWNER').Value := '0';

      dsReqMaterials.ParamByName('RQ_ID').AsInteger := aRequest;

      dsMatGropups.Open;
      }
      if ShowModal = mrOk then
        result := True;
    finally
      free
    end;

end;

procedure TRequestMaterialReturn.btnOkClick(Sender: TObject);
begin
//
end;

procedure TRequestMaterialReturn.FormCreate(Sender: TObject);
begin
  cbProp.Value := 4;
end;

procedure TRequestMaterialReturn.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin
    case Ord(Key) of
      VK_RETURN:
        btnOkClick(Sender);
    end;
  end;
end;

procedure TRequestMaterialReturn.FormKeyPress(Sender: TObject;
  var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;

end;

procedure TRequestMaterialReturn.FormShow(Sender: TObject);
begin
  dsWH.Open;
end;

end.
