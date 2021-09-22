unit OrgnzEditForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, DB, FIBDataSet, pFIBDataSet,
  DBCtrlsEh, StdCtrls, Mask, DBLookupEh, DBCtrls, DBGridEh;

type
  TOrgnzEditForm = class(TForm)
    frmOk: TOkCancelFrame;
    dsOrgan: TpFIBDataSet;
    srcDataSource: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    dsVATG: TpFIBDataSet;
    srcVATG: TDataSource;
    cbbVATG: TDBLookupComboboxEh;
    edContr: TDBEditEh;
    edName: TDBEditEh;
    edDir: TDBEditEh;
    edBuh: TDBEditEh;
    edAdres: TDBEditEh;
    edPAdres: TDBEditEh;
    edPhone: TDBEditEh;
    edRS: TDBEditEh;
    edUNN: TDBEditEh;
    edCode: TDBEditEh;
    edtCD: TDBDateTimeEditEh;
    edtCDD: TDBDateTimeEditEh;
    cbbBank: TDBLookupComboboxEh;
    edEmail: TDBEditEh;
    edBcode: TDBEditEh;
    dbmNotice: TDBMemoEh;
    dsBANKS: TpFIBDataSet;
    srcBanks: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbVATGExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ChekData;
  public
    { Public declarations }
  end;

Function EditOrganization(var ORG_ID : Integer):Boolean;

implementation

uses
  DM;

{$R *.dfm}

Function EditOrganization(var ORG_ID : Integer):Boolean;
begin
   Result := False;
   with TOrgnzEditForm.Create(Application) do
   try
     dsOrgan.ParamByName('ORG_ID').AsInteger := ORG_ID;
     dsOrgan.Open;
     if ORG_ID<0
     then dsOrgan.Insert
     else dsOrgan.Edit;

     if ShowModal = mrOk
     then begin
       dsOrgan.Post;
       Result := True;
     end
     else dsOrgan.Cancel;
   finally
     Free;
   end;
end;

procedure TOrgnzEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsBANKS.Close;
  dsVATG.Close;
end;

procedure TOrgnzEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (frmOk.bbOk.Enabled)
  then ModalResult := mrOk;
end;

procedure TOrgnzEditForm.FormShow(Sender: TObject);
begin
  dsBANKS.Open;
  dsVATG.Open;
end;

procedure TOrgnzEditForm.cbbVATGExit(Sender: TObject);
begin
ChekData;
end;

procedure TOrgnzEditForm.ChekData;
begin
  frmOk.bbOk.Enabled := (edName.Text <> '') and (not VarIsNull(cbbVATG.Value) );
end;

end.
