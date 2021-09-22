unit CardSerialForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, OkCancel_frame,
  DB, FIBDataSet, pFIBDataSet, DBCtrls, FIBDatabase, DBGridEh;

type
  TfmCardSerial = class(TForm)
    dsCardSerial: TpFIBDataSet;
    srcCardSerial: TDataSource;
    dsPaySource: TpFIBDataSet;
    srcPaySource: TDataSource;
    okcnclfrm1: TOkCancelFrame;
    LupPaySrc: TDBLookupComboboxEh;
    lbl1: TLabel;
    lbl2: TLabel;
    edtSerial: TDBEditEh;
    lblNotice: TLabel;
    dbmmoNotice: TDBMemoEh;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditCardSerial(const aSerial_ID:Int64): Int64;

implementation

uses DM;

{$R *.dfm}

function EditCardSerial(const aSerial_ID:Int64): Int64;
var
  vSerial : Int64;
begin
  result := -1;
  with TfmCardSerial.Create(Application) do
  try
    dsPaySource.Open;
    dsCardSerial.ParamByName('Cs_Id').AsInteger := aSerial_ID;
    dsCardSerial.Open;
    if aSerial_ID = -1
    then dsCardSerial.Insert
    else dsCardSerial.Edit;
    if ShowModal = mrOk
    then begin
      try
        if aSerial_ID = -1
        then begin
          vSerial := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID',1, dmMain.trWriteQ);
          dsCardSerial['Cs_Id'] := vSerial;
        end
        else vSerial := aSerial_ID;
        dsCardSerial.Post;
        result := vSerial;
      except
        result := -1;
      end;
    end
    else dsCardSerial.Cancel;
    dsCardSerial.Close;
    dsPaySource.Close;
  finally
    free
  end;
end;

procedure TfmCardSerial.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (okcnclfrm1.bbOk.Enabled)
  then ModalResult := mrOk;
end;

end.
