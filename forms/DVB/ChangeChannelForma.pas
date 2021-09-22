unit ChangeChannelForma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, Buttons, DB, FIBDataSet, pFIBDataSet,
  DBLookupEh, DBGridEh, FIBQuery, pFIBQuery;

type
  TfrmChangeChannelForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    dsChannels: TpFIBDataSet;
    srcChannels: TDataSource;
    lcbSlave: TDBLookupComboboxEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    lbl1: TLabel;
    lblMaster: TLabel;
    chkAnalog: TDBCheckBoxEh;
    lbl2: TLabel;
    chkDVB: TDBCheckBoxEh;
    qryChange: TpFIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ChangeChannel(const CH_from: Integer; const FromName: String): Integer;

implementation

uses DM, AtrCommon, System.Variants;

{$R *.DFM}

function ChangeChannel(const CH_from: Integer; const FromName: String): Integer;
var
  frmChange: TfrmChangeChannelForm;
begin
  Result := -1;
  try
    Application.CreateForm(TfrmChangeChannelForm, frmChange);
    frmChange.lblMaster.Caption := FromName;
    frmChange.dsChannels.ParamByName('from_id').AsInteger := CH_from;
    frmChange.dsChannels.Open;
    frmChange.ShowModal;
    if frmChange.ModalResult = mrOk then
      if not frmChange.dsChannels.FieldByName('CH_ID').IsNull then
      begin
        try
          Result := frmChange.dsChannels['CH_ID'];
          frmChange.qryChange.ParamByName('From_Ch').AsInteger := CH_from;
          frmChange.qryChange.ParamByName('To_Ch').AsInteger := Result;
          if frmChange.chkAnalog.Checked then
            frmChange.qryChange.ParamByName('Analog').AsInteger := 1
          else
            frmChange.qryChange.ParamByName('Analog').AsInteger := 0;
          if frmChange.chkDVB.Checked then
            frmChange.qryChange.ParamByName('Dvb').AsInteger := 1
          else
            frmChange.qryChange.ParamByName('Dvb').AsInteger := 0;
          frmChange.qryChange.ExecProc;
        except
          Result := -1;
        end;

      end;
  finally
    frmChange.dsChannels.Close;
    FreeAndNil(frmChange);
  end;
end;

procedure TfrmChangeChannelForm.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
end;

procedure TfrmChangeChannelForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

end.
