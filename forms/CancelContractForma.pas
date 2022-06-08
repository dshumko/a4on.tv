unit CancelContractForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, DBGridEh;

type
  TCancelContractForm = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    srcServiceOff: TDataSource;
    dsServiceOff: TpFIBDataSet;
    ServiceOff: TDBLookupComboboxEh;
    CancelDate: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    label3: TLabel;
    ABONENT: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelDateExit(Sender: TObject);
  private
    { Private declarations }
    procedure SetFIO(const value: string);
  public
    { Public declarations }
    property FIO: string write SetFIO;
  end;

var
  CancelContractForm: TCancelContractForm;

implementation

uses
  DM, PrjConst;

{$R *.dfm}

procedure TCancelContractForm.SetFIO(const value: String);
begin
  ABONENT.Caption := value;
end;

procedure TCancelContractForm.FormShow(Sender: TObject);
begin
  dsServiceOff.Open;
  if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    CancelDate.value := NOW;
end;

procedure TCancelContractForm.bbOkClick(Sender: TObject);
begin
  if VarIsNull(CancelDate.value) then
  begin
    CancelDate.SetFocus;
    ModalResult := mrNone;
  end
  else
    ModalResult := mrOk;
end;

procedure TCancelContractForm.CancelDateExit(Sender: TObject);
begin
  bbOk.Enabled := False;
  if (dmMain.AllowedAction(rght_Customer_add)) then
    if VarToDateTime(CancelDate.value) >= dmMain.CurrentMonth then
      bbOk.Enabled := true;
  if (dmMain.AllowedAction(rght_Customer_full)) then
    bbOk.Enabled := true;
end;

end.
