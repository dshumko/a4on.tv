unit DecoderPacketForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, StdCtrls, DBCtrls, Mask,
  DBCtrlsEh, DBLookupEh, Buttons, ExtCtrls, DBGridEh;

type
  TDecoderPacketForm = class(TForm)
    cbbPaket: TDBLookupComboboxEh;
    dbmmoNotice: TDBMemoEh;
    lbl1: TLabel;
    lbl2: TLabel;
    srcDecPacket: TDataSource;
    srcPacket: TDataSource;
    dsPacket: TpFIBDataSet;
    dsDecPacket: TpFIBDataSet;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddPaket(const DECODER: string): boolean;

implementation

uses
  DM;

{$R *.dfm}

function AddPaket(const DECODER: string): boolean;
var
  df: TDecoderPacketForm;
begin
  Result := False;
  df := TDecoderPacketForm.Create(application);
  try
    df.dsPacket.ParamByName('decoder_n').AsString := DECODER;
    df.dsPacket.Open;
    df.dsDecPacket.ParamByName('decoder_n').AsString := DECODER;
    df.dsDecPacket.Open;
    df.dsDecPacket.Insert;
    if df.ShowModal = mrOk then
    begin
      df.dsDecPacket['DECODER_N'] := DECODER;
      df.dsDecPacket.Post;
      Result := true;
    end
    else
      df.dsDecPacket.Cancel;
    df.dsPacket.Close;
    df.dsDecPacket.Close;
  finally
    df.Free;
  end;
end;

procedure TDecoderPacketForm.btnOkClick(Sender: TObject);
begin
  if (not VarIsClear(cbbPaket.KeyValue)) and (cbbPaket.Text <> '') then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TDecoderPacketForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

end.
