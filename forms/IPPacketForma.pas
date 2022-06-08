unit IPPacketForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, DBGridEh;

type
  TIPPacketForm = class(TForm)
    cbbPaket: TDBLookupComboboxEh;
    dbmmoNotice: TDBMemoEh;
    lbl1: TLabel;
    lbl2: TLabel;
    srcIPPacket: TDataSource;
    srcPacket: TDataSource;
    dsPacket: TpFIBDataSet;
    dsIPPacket: TpFIBDataSet;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddIPPaket(const LAN_ID : integer) : boolean;

implementation

uses
  DM;

{$R *.dfm}

function AddIPPaket(const LAN_ID : integer) : boolean;
var
  df : TIPPacketForm;
begin
  Result := False;
  df := TIPPacketForm.Create(application);
  try
    df.dsPacket.ParamByName('LAN_ID').AsInteger := LAN_ID;
    df.dsPacket.Open;
    df.dsIPPacket.ParamByName('LAN_ID').AsInteger := LAN_ID;
    df.dsIPPacket.Open;

    df.dsIPPacket.Insert;
    if df.ShowModal = mrOk
    then begin
      df.dsIPPacket['LAN_ID'] := LAN_ID;
      df.dsIPPacket.Post;
      Result := true;
    end;
    df.dsPacket.Close;
    df.dsIPPacket.Close;
  finally
    df.Free;
  end;
end;

procedure TIPPacketForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then ModalResult := mrOk;
end;

end.
