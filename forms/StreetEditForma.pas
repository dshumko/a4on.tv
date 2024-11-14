unit StreetEditForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, FIBDatabase, pFIBDatabase, CnErrorProvider, PrjConst,
  DBGridEh;

type
  TStreetViewForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    srcAreas: TDataSource;
    dsAreas: TpFIBDataSet;
    dblShort: TDBLookupComboboxEh;
    Label9: TLabel;
    OkCancelFrame: TOkCancelFrame;
    dbEditCode: TDBEditEh;
    dbEditStreetName: TDBEditEh;
    srcStreeType: TDataSource;
    dsStreeType: TpFIBDataSet;
    dblArea: TDBLookupComboboxEh;
    Label1: TLabel;
    DBMemo1: TDBMemoEh;
    srcStreet: TDataSource;
    dsEditStreet: TpFIBDataSet;
    trSRead: TpFIBTransaction;
    trSWrite: TpFIBTransaction;
    CnErrors: TCnErrorProvider;
    ednTAG: TDBNumberEditEh;
    edtTAGSTR: TDBEditEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbEditStreetNameChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFramebbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblAreaEditButtons0Click(Sender: TObject; var Handled: Boolean);
  private
    FEnterSecondPress: Boolean;
    procedure CheckData;
  public
    { Public declarations }
  end;

function EditStreet(const aStreet_ID: Int64): Int64;

implementation

uses
  DM, AreaEditForma;

{$R *.dfm}

function EditStreet(const aStreet_ID: Int64): Int64;
var
  vStreet: Int64;
begin
  result := -1;
  with TStreetViewForm.Create(Application) do
    try
      trSWrite.Active := true;
      trSRead.Active := true;

      dsStreeType.Open;
      dsAreas.Open;
      dsEditStreet.ParamByName('STREET_ID').AsInteger := aStreet_ID;
      dsEditStreet.Open;
      if aStreet_ID = -1 then
        dsEditStreet.Insert
      else
        dsEditStreet.Edit;
      CheckData;
      if ShowModal = mrOk then
      begin
        try
          if aStreet_ID = -1 then
          begin
            vStreet := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1, dmMain.trWriteQ);
            dsEditStreet['STREET_ID'] := vStreet;
          end
          else
            vStreet := aStreet_ID;
          dsEditStreet.Post;
          result := vStreet;
        except
          result := -1;
        end;
      end
      else
        dsEditStreet.Cancel;
      dsEditStreet.Close;
      dsStreeType.Close;
      dsAreas.Close;

    finally
      free
    end;
end;

procedure TStreetViewForm.CheckData;
var
  En: Boolean;
begin
  En := true;
  if dbEditStreetName.Text = '' then
  begin
    CnErrors.SetError(dbEditStreetName, rsSelectStreet, iaTopCenter, bsNeverBlink);
    En := False;
  end
  else
    CnErrors.Dispose(dbEditStreetName);

  OkCancelFrame.bbOk.Enabled := En;
end;

procedure TStreetViewForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
  begin
    CheckData;
    if (OkCancelFrame.bbOk.Enabled) then
      ModalResult := mrOk;
  end;
end;

procedure TStreetViewForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
      // else if (ActiveControl is TDBGridEh) then
      // go := False
      // else if (ActiveControl is TDBSynEdit) and not(Trim((ActiveControl as TDBSynEdit).Lines.Text) = '') then
      // go := False;
      // else if (ActiveControl is TDBAxisGridInplaceEdit) then
      // go := False
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure TStreetViewForm.FormShow(Sender: TObject);
begin
  dblArea.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)));
end;

procedure TStreetViewForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  OkCancelFrame.actExitExecute(Sender);
end;

procedure TStreetViewForm.dblAreaEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: Integer;
begin
  Handled := true;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas))) then
    exit;
  i := EditArea(-1);
  if i > 0 then
  begin
    dsAreas.CloseOpen(true);
    dsAreas.Locate('Area_id', i, []);
  end;
end;

procedure TStreetViewForm.dbEditStreetNameChange(Sender: TObject);
begin
  CheckData
end;

end.
