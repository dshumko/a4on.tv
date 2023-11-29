unit SelectPromoForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBCtrlsEh, FIBDataSet, pFIBDataSet, DBLookupEh, DBGridEh;

type
  TfmSelectPromo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dsPromo: TpFIBDataSet;
    srcPromo: TDataSource;
    cbPromo: TDBLookupComboboxEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbPromoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectPromo(const aService: Integer; const aDate: TDate; var vName: string): Integer;

implementation

uses
  System.Variants,
  DM, AtrCommon;

{$R *.DFM}

function SelectPromo(const aService: Integer; const aDate: TDate; var vName: string): Integer;
var
  fmSelectPromo: TfmSelectPromo;
begin
  Result := -1;
  fmSelectPromo := TfmSelectPromo.Create(Application);
  try
    with fmSelectPromo do
    begin
      dsPromo.ParamByName('DS').AsDate := aDate;
      dsPromo.ParamByName('SID').AsInteger := aService;
      dsPromo.Open;
      ShowModal;
      if ModalResult = mrOk then
      begin
        if (not VarIsNull(cbPromo.Value)) and (cbPromo.Text <> '') then
        begin
          Result := cbPromo.Value;
          vName := cbPromo.Text;
        end;
      end;
    end;
  finally
    fmSelectPromo.dsPromo.Close;
    FreeAndNil(fmSelectPromo);
  end;
end;

procedure TfmSelectPromo.cbPromoClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
end;

procedure TfmSelectPromo.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
end;

procedure TfmSelectPromo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

end.
