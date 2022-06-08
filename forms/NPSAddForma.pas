unit NPSAddForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ImgList, Vcl.Buttons,
  DBCtrlsEh, FIBQuery, pFIBQuery;

type
  TNPSAddForm = class(TForm)
    ilSmiles: TImageList;
    cbRating: TDBComboBoxEh;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    mmoNotice: TDBMemoEh;
    lbl1: TLabel;
    qInsert: TpFIBQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbRatingKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddNpsRating(const aCustomer_id: int64): int64;

implementation

uses
  DM;

{$R *.dfm}

function AddNpsRating(const aCustomer_id: int64): int64;
var
  frm: TNPSAddForm;
  v : integer;
begin
  Result := -1;
  frm := TNPSAddForm.Create(application);
  try
    if frm.showmodal = mrOk then
    begin
      if TryStrToInt(frm.cbRating.Text, v) then begin
        frm.qInsert.ParamByName('CUSTOMER_ID').AsInteger := aCustomer_id;
        frm.qInsert.ParamByName('Rating').AsInteger := v;
        frm.qInsert.ParamByName('NOTICE').AsString := frm.mmoNotice.Lines.Text;
        frm.qInsert.Transaction.StartTransaction;
        frm.qInsert.ExecQuery;
        frm.qInsert.Transaction.Commit;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TNPSAddForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TNPSAddForm.bbOkClick(Sender: TObject);
var
  AllFine: Boolean;
  i: Integer;
begin
  AllFine := False;

  if TryStrToInt(cbRating.Text, i) and (Length(mmoNotice.Lines.Text) > 3) then
    AllFine := (i >= 0) and (i <= 10);

  if AllFine then
    ModalResult := mrOk;
end;

procedure TNPSAddForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13 { VK_RETURN } ) and (ActiveControl = cbRating) then
  begin
    Key := #0;
    PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TNPSAddForm.cbRatingKeyPress(Sender: TObject; var Key: Char);
begin
  if not(CharInSet(Key, ['0' .. '9', #8 { VK_BACK } , #40 { VK_DOWN } , #38 { VK_UP } , #27 { VK_ESCAPE } ])) then
    Key := #0
end;

end.
