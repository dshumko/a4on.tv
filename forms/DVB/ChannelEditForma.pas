unit ChannelEditForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, StdCtrls, DBCtrls, Mask, DBCtrlsEh, ExtDlgs,
  uDBImages, Vcl.Imaging.Jpeg, Vcl.Imaging.pngimage, EhLibVCL, Vcl.Buttons,
  DBGridEh, Vcl.Menus, CnErrorProvider, PrjConst, DBLookupEh;

type
  TDBImage = class(TpDBImage);

  TChannelEditForm = class(TForm)
    dsChannel: TpFIBDataSet;
    trSRead: TpFIBTransaction;
    trSWrite: TpFIBTransaction;
    Label1: TLabel;
    srcChannel: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBMemo2: TDBMemoEh;
    DBNumberEditEh2: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    edtCH_NAME: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBComboBoxEh1: TDBComboBoxEh;
    Label6: TLabel;
    OpenDialog1: TOpenDialog;
    lbl1: TLabel;
    cbLANG: TDBComboBoxEh;
    edtDVBGENRES: TDBEditEh;
    Label10: TLabel;
    lbl2: TLabel;
    edt1: TDBNumberEditEh;
    imgGraphic: TDBImageEh;
    lbl3: TLabel;
    edtACCESS_ID: TDBNumberEditEh;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    pmLogo: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SaveDialog: TSavePictureDialog;
    lbl4: TLabel;
    edtCH_LIC: TDBEditEh;
    lbl5: TLabel;
    edtCH_CERT: TDBEditEh;
    lbl6: TLabel;
    CnErrors: TCnErrorProvider;
    lcbCH_THEME: TDBLookupComboboxEh;
    trReadQ: TpFIBTransaction;
    dsTheme: TpFIBDataSet;
    srcTheme: TDataSource;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure logoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDVBGENRESEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgGraphicButtonClick(Sender: TObject; var Handled: Boolean);
    procedure imgGraphicDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure logoLoad;
    procedure logoSave;
  public
    { Public declarations }
  end;

function EditChannel(const aChannel_ID: Int64; const Mode: integer): Int64;

implementation

uses
  DM, DVBGanresForma;

{$R *.dfm}

function EditChannel(const aChannel_ID: Int64; const Mode: integer): Int64;
var
  ChannelEditForm: TChannelEditForm;
  vChannel: Int64;
begin
  result := -1;

  ChannelEditForm := TChannelEditForm.Create(Application);
  with ChannelEditForm do
    try
      trSWrite.Active := true;
      trSRead.Active := true;

      dsChannel.ParamByName('Ch_ID').AsInteger := aChannel_ID;
      dsChannel.Open;
      if aChannel_ID = -1 then
        dsChannel.Insert
      else
        dsChannel.Edit;
      if ShowModal = mrOk then begin
        try
          if aChannel_ID = -1 then begin
            vChannel := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1, dmMain.trWriteQ);
            dsChannel['Ch_ID'] := vChannel;
          end
          else
            vChannel := aChannel_ID;
          dsChannel.Post;

          result := vChannel;
        except
          result := -1;
        end;
      end
      else
        dsChannel.Cancel;
      dsChannel.Close;
    finally
      ChannelEditForm.free;
    end;
end;

procedure TChannelEditForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TChannelEditForm.logoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 46 then
    dsChannel.FieldByName('CH_ICON').Clear;
end;

procedure TChannelEditForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if (edtCH_NAME.Text = '') then begin
    errors := true;
    CnErrors.SetError(edtCH_NAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtCH_NAME);

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

procedure TChannelEditForm.edtDVBGENRESEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edtDVBGENRES.Text := SelectDVBGanres(edtDVBGENRES.Text);
  Handled := true;
end;

procedure TChannelEditForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TChannelEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsTheme.Close;
  Action := caFree;
end;

procedure TChannelEditForm.FormCreate(Sender: TObject);
begin
  dsTheme.Open;
end;

procedure TChannelEditForm.logoLoad;
var
  fs : TFileStream;
begin
  if OpenDialog1.Execute then begin
    if not(dsChannel.State in [dsEdit, dsInsert]) then
      dsChannel.Edit;
    fs := TFileStream.Create(OpenDialog1.FileName, fmShareDenyNone);
    try
      TBlobField(dsChannel.FieldByName('CH_ICON')).LoadFromStream(fs);
    finally
      fs.Free;
    end;
  end;
end;

procedure TChannelEditForm.logoSave;
begin
  if not(dsChannel.FieldByName('CH_ICON').IsNull) then begin
    if SaveDialog.Execute then
      TBlobField(dsChannel.FieldByName('CH_ICON')).SaveToFile(SaveDialog.FileName);
  end;
end;

procedure TChannelEditForm.imgGraphicButtonClick(Sender: TObject; var Handled: Boolean);
begin
  logoLoad;
  Handled := true;
end;

procedure TChannelEditForm.imgGraphicDblClick(Sender: TObject);
begin
  logoLoad;
end;

procedure TChannelEditForm.N1Click(Sender: TObject);
begin
  logoLoad;
end;

procedure TChannelEditForm.N2Click(Sender: TObject);
begin
  logoSave;
end;

procedure TChannelEditForm.N3Click(Sender: TObject);
begin
  if not(dsChannel.State in [dsEdit, dsInsert]) then
    dsChannel.Edit;
  dsChannel.FieldByName('CH_ICON').Clear;
end;

end.
