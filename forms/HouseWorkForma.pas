unit HouseWorkForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.SysUtils, System.Variants,
  Data.DB,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask, Vcl.Graphics, Vcl.Dialogs, Vcl.DBCtrls,
  DBLookupEh, OkCancel_frame, DBGridEh, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, DBCtrlsEh;

type
  THouseWorkForm = class(TForm)
    edtDateWork: TDBDateTimeEditEh;
    dbcbWorker: TDBLookupComboboxEh;
    dbmmo1: TDBMemoEh;
    okcnl: TOkCancelFrame;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    srcWork: TDataSource;
    dsWork: TpFIBDataSet;
    dsWorker: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcWorker: TDataSource;
    procedure okcnlbbOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function HouseWorkEdit(const aH_ID: Int64; aHW_ID: Int64): Boolean;

implementation

uses
  DM;

{$R *.dfm}

function HouseWorkEdit(const aH_ID: Int64; aHW_ID: Int64): Boolean;
begin
  result := False;
  with THouseWorkForm.Create(Application) do
    try
      dsWorker.Open;
      if aHW_ID = -1 then
      begin
        dsWork.Open;
        dsWork.Insert;
        dsWork['HOUSE_ID'] := aH_ID;
        if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
          dsWork['DATE_PPR'] := Now(); // edtDateWork.Value := NOW;
      end
      else
      begin
        dsWork.ParamByName('HW_ID').AsInt64 := aHW_ID;
        dsWork.Open;
      end;

      if ShowModal = mrOk then
      begin
        if dsWork.State in [dsEdit, dsInsert] then
          dsWork.Post;

        result := True;
      end;

    finally
      dsWorker.Close;
      Free;
    end;
end;

procedure THouseWorkForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    okcnlbbOkClick(Sender);
end;

procedure THouseWorkForm.okcnlbbOkClick(Sender: TObject);
begin
  if VarIsNull(edtDateWork.Value) then
    okcnl.bbOk.ModalResult := mrNone;
  if VarIsNull(dbcbWorker.Value) then
    okcnl.bbOk.ModalResult := mrNone;
end;

end.
