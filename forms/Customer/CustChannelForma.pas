unit CustChannelForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DB, FIBDataSet, pFIBDataSet, StdCtrls, DBCtrls,
  DBCtrlsEh, Mask, DBLookupEh, OkCancel_frame;

type
  TCustChannelForm = class(TForm)
    okf: TOkCancelFrame;
    DBLChannels: TDBLookupComboboxEh;
    deStart: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBMemo1: TDBMemo;
    srcChannels: TDataSource;
    dsChannels: TpFIBDataSet;
    srcChannList: TDataSource;
    dsChannList: TpFIBDataSet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure okfbbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CustomerChannels(const aDecoder_ID, aCh_ID:Int64):Boolean;


implementation

uses
  DM;

{$R *.dfm}
function CustomerChannels(const aDecoder_ID, aCh_ID:Int64):Boolean;
begin
  Result := False;
  with TCustChannelForm.Create(application) do
  try
    dsChannels.ParamByName('DECODER_ID').AsInt64 :=  aDecoder_ID;
    dsChannels.ParamByName('Ch_ID').AsInt64 :=  aCh_ID;
    if ach_id = -1
    then dsChannList.ParamByName('DECODER_ID').AsInt64 :=  aDecoder_ID
    else begin
      dsChannList.ParamByName('DECODER_ID').AsInt64 :=  -1;
      DBLChannels.Enabled := False;
    end;
    dsChannList.Open;
    dsChannels.Open;
    if ach_id = -1
    then dsChannels.Insert
    else dsChannels.Edit;
    if ShowModal = mrOk
    then begin
      dsChannels.Post;
      Result := True;
    end;
  finally
    free;
  end;
end;

procedure TCustChannelForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if VarIsNull(DBLChannels.Value)
  then begin
    ShowMessage('Укажиет канал!');
    DBLChannels.SetFocus;
    exit;
  end;
  if VarIsNull(deStart.Value)
  then begin
    ShowMessage('Укажиет дату!');
    deStart.SetFocus;
    exit;
  end;
  ModalResult:= mrOk;
end;

procedure TCustChannelForm.okfbbCancelClick(Sender: TObject);
begin
dsChannels.Cancel;
end;

end.
