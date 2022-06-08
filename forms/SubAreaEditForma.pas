unit SubAreaEditForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, FIBDatabase, pFIBDatabase, CnErrorProvider, PrjConst, DBGridEh;

type
  TSubAreaViewForm = class(TForm)
    Label3: TLabel;
    OkCancelFrame: TOkCancelFrame;
    dbeName: TDBEditEh;
    Label4: TLabel;
    DBMemo1: TDBMemoEh;
    trSRead: TpFIBTransaction;
    trSWrite: TpFIBTransaction;
    CnErrors: TCnErrorProvider;
    Label1: TLabel;
    dblArea: TDBLookupComboboxEh;
    dsSubArea: TpFIBDataSet;
    srcSubArea: TDataSource;
    dsAreas: TpFIBDataSet;
    srcAreas: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNameChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkCancelFramebbOkClick(Sender: TObject);
    procedure dblAreaEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dblAreaChange(Sender: TObject);
  private
    { Private declarations }
    procedure CheckData;
  public
    { Public declarations }
  end;

function EditSubArea(const aArea_ID:Integer; const aSubArea_ID:Integer): Integer;

implementation

uses
  DM, AreaEditForma;


{$R *.dfm}

function EditSubArea(const aArea_ID:Integer; const aSubArea_ID:Integer): Integer;
var
  vSubArea_ID : Int64;
begin
  result := -1;
  with TSubAreaViewForm.Create(Application) do
  try
    trSWrite.Active := true;
    trSRead.Active  := true;
    dsAreas.Open;
    dsSubArea.ParamByName('SubArea_ID').AsInteger := aSubArea_ID;
    dsSubArea.Open;
    if aSubArea_ID = -1
    then begin
      dsSubArea.Insert;
      dsSubArea['AREA_ID'] := aArea_ID;
    end
    else dsSubArea.Edit;
    CheckData;
    if ShowModal = mrOk
    then begin
      try
        if aSubArea_ID = -1
        then begin
          vSubArea_ID := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID',1, dmMain.trWriteQ);
          dsSubArea['SubArea_ID'] := vSubArea_ID;
        end
        else vSubArea_ID := aSubArea_ID;
        dsSubArea.Post;
        result := vSubArea_ID;
      except
        result := -1;
      end;
    end
    else dsSubArea.Cancel;
    dsSubArea.Close;
    dsAreas.Close;
  finally
    free
  end;
end;

procedure TSubAreaViewForm.CheckData;
var
  En : Boolean;
begin
  en := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)));
  if not en then
      CnErrors.SetError(OkCancelFrame.bbOk, rsNoRights, iaTopCenter, bsNeverBlink);

  if dbeName.Text = ''
  then begin
    CnErrors.SetError(dbeName, rsLabelName, iaTopCenter, bsNeverBlink);
    en := False;
  end
  else CnErrors.Dispose(dbeName);

  if dblArea.Text = ''
  then begin
    CnErrors.SetError(dblArea, rsSelectCity, iaTopCenter, bsNeverBlink);
    en := False;
  end
  else CnErrors.Dispose(dblArea);

  OkCancelFrame.bbOk.Enabled := en;
end;


procedure TSubAreaViewForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (OkCancelFrame.bbOk.Enabled)
  then OkCancelFrame.actExitExecute(Sender);
end;

procedure TSubAreaViewForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go:Boolean;
begin
  go:=True;
   if (Key=#13) then
   begin
      if (ActiveControl is TDBLookupComboboxEh)
      then go := not (ActiveControl as TDBLookupComboboxEh).ListVisible;

      if go
      then begin
        Key := #0;                     // eat enter key
        PostMessage( Self.Handle, WM_NEXTDLGCTL, 0, 0);
      end;
  end;
end;

procedure TSubAreaViewForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  OkCancelFrame.actExitExecute(Sender);
end;

procedure TSubAreaViewForm.dblAreaChange(Sender: TObject);
begin
  CheckData
end;

procedure TSubAreaViewForm.dblAreaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  i : Integer;
begin
  Handled := True;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas))) then exit;
  i := EditArea(-1);
  if i>0
  then begin
    dsAreas.CloseOpen(True);
    dsAreas.Locate('area_id',i,[]);
  end;

end;

procedure TSubAreaViewForm.dbeNameChange(Sender: TObject);
begin
  CheckData
end;

end.
