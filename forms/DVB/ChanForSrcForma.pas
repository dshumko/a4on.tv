unit ChanForSrcForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtDlgs,
  FIBDataSet, pFIBDataSet, OkCancel_frame, FIBDatabase, pFIBDatabase, DBCtrlsEh, uDBImages, CnErrorProvider, DBGridEh, DBLookupEh;

type

  TChanForSrcForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    dsChForSrc: TpFIBDataSet;
    srcChForSrc: TDataSource;
    trWrite: TpFIBTransaction;
    cnError: TCnErrorProvider;
    dsSYSTEM: TpFIBDataSet;
    Label2: TLabel;
    cbbSYSTEM: TDBLookupComboboxEh;
    srcSYSTEM: TDataSource;
    lbl1: TLabel;
    edtNAME1: TDBEditEh;
    edtURL: TDBEditEh;
    Label3: TLabel;
    dbmNOTICE: TDBMemoEh;
    trRead: TpFIBTransaction;
    dsChan: TpFIBDataSet;
    srcChan: TDataSource;
    srcCODEC: TDataSource;
    dsCODEC: TpFIBDataSet;
    lblChan: TLabel;
    cbbChan: TDBLookupComboboxEh;
    srcCrypt: TDataSource;
    dsCrypt: TpFIBDataSet;
    lbl2: TLabel;
    cbbS_Crypt: TDBLookupComboboxEh;
    lblVideo: TLabel;
    cbbVideo: TDBLookupComboboxEh;
    lbl3: TLabel;
    edtSYMRATE: TDBEditEh;
    lbl4: TLabel;
    cbbCARD: TDBLookupComboboxEh;
    dsCard: TpFIBDataSet;
    srcCard: TDataSource;
    chkAnalog: TDBCheckBoxEh;
    chkDVB: TDBCheckBoxEh;
    chkIPTV: TDBCheckBoxEh;
    grpSrc: TGroupBox;
    ednNID: TDBNumberEditEh;
    ednONID: TDBNumberEditEh;
    ednTSID: TDBNumberEditEh;
    ednSID: TDBNumberEditEh;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    ednONID1: TDBNumberEditEh;
    lbl9: TLabel;
    ednNID1: TDBNumberEditEh;
    lbl10: TLabel;
    lbl11: TLabel;
    ednTSID1: TDBNumberEditEh;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEditEh2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function CheckData: Boolean;
  public
    { Public declarations }
  end;

function EditChanForSource(const aCH_ID: Int64; const aCS_ID: Int64): Boolean;

implementation

uses
  DM, PrjConst;

{$R *.dfm}

function EditChanForSource(const aCH_ID: Int64; const aCS_ID: Int64): Boolean;
var
  ChanForSrcForm: TChanForSrcForm;
begin
  result := False;

  ChanForSrcForm := TChanForSrcForm.Create(Application);
  with ChanForSrcForm do
    try
      dsChForSrc.ParamByName('CH_ID').AsInt64 := aCH_ID;
      dsChForSrc.ParamByName('CS_ID').AsInt64 := aCS_ID;
      dsChForSrc.Open;
      if aCH_ID > 0 then
        dsChForSrc.Edit
      else
        dsChForSrc.Insert;
      cbbChan.Enabled := (aCH_ID < 0);
      if ShowModal = mrOk then begin
        dsChForSrc['CS_ID'] := aCS_ID;
        dsChForSrc.Post;
        result := true;
      end
      else begin
        if dsChForSrc.State in [dsEdit, dsInsert] then
          dsChForSrc.Cancel;
      end;
    finally
      free
    end;
end;

procedure TChanForSrcForm.DBEditEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((UpCase(Key) < 'A') or (UpCase(Key) > 'Z')) then
    Key := #0;
end;

procedure TChanForSrcForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsSYSTEM.Close;
  dsChan.Close;
  dsCODEC.Close;
  dsCrypt.Close;
  dsCard.Close;
end;

procedure TChanForSrcForm.FormCreate(Sender: TObject);
begin
  dsSYSTEM.Open;
  dsChan.Open;
  dsCODEC.Open;
  dsCrypt.Open;
  dsCard.Open;
end;

procedure TChanForSrcForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    if CheckData then
      OkCancelFrame1bbOkClick(Sender);
end;

procedure TChanForSrcForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if CheckData then
    OkCancelFrame1.actExitExecute(Sender);
end;

function TChanForSrcForm.CheckData: Boolean;
begin
  result := true;

  if (cbbChan.Text.IsEmpty) then begin
    cnError.SetError(cbbChan, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    cbbChan.SetFocus;
    result := False;
  end

end;

end.
