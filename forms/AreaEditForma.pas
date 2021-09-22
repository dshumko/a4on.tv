unit AreaEditForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, DBLookupEh, DB, FIBDataSet, pFIBDataSet,
  Mask, OkCancel_frame, DBCtrls, StdCtrls, FIBDatabase, pFIBDatabase,
  CnErrorProvider, PrjConst;

type
  TAreaViewForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    OkCancelFrame: TOkCancelFrame;
    dbEditCode: TDBEditEh;
    dbeName: TDBEditEh;
    Label4: TLabel;
    DBMemo1: TDBMemoEh;
    trSRead: TpFIBTransaction;
    trSWrite: TpFIBTransaction;
    dsArea: TpFIBDataSet;
    srcArea: TDataSource;
    CnErrors: TCnErrorProvider;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblu_AreasExit(Sender: TObject);
    procedure dbeNameChange(Sender: TObject);
    procedure dbEditCodeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkCancelFramebbOkClick(Sender: TObject);
    procedure dbeNameEnter(Sender: TObject);
  private
    { Private declarations }
    procedure CheckData;
  public
    { Public declarations }
  end;

function EditArea(const aArea_ID:Int64): Int64;

implementation

uses DM;


{$R *.dfm}

function EditArea(const aArea_ID:Int64): Int64;
var
  vArea_ID : Int64;
begin
  result := -1;
  with TAreaViewForm.Create(Application) do
  try
    trSWrite.Active := true;
    trSRead.Active  := true;

    dsArea.ParamByName('AREA_ID').AsInteger := aArea_ID;
    dsArea.Open;
    if aArea_ID = -1
    then dsArea.Insert
    else dsArea.Edit;
    CheckData;
    if ShowModal = mrOk
    then begin
      try
        if aArea_ID = -1
        then begin
          vArea_ID := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID',1, dmMain.trWriteQ);
          dsArea['AREA_ID'] := vArea_ID;
        end
        else vArea_ID := aArea_ID;
        dsArea.Post;
        result := vArea_ID;
      except
        result := -1;
      end;
    end
    else dsArea.Cancel;
    dsArea.Close;
  finally
    free
  end;
end;

procedure TAreaViewForm.CheckData;
var
  En : Boolean;
begin
  en := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)));
  if not en then
      CnErrors.SetError(OkCancelFrame.bbOk, rsNoRights, iaTopCenter, bsNeverBlink);

  if dbeName.Text = '' then begin
      CnErrors.SetError(dbeName, rsSelectCity, iaTopCenter, bsNeverBlink);
      en := False;
  end
  else CnErrors.Dispose(dbeName);

  OkCancelFrame.bbOk.Enabled := en;
end;


procedure TAreaViewForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (OkCancelFrame.bbOk.Enabled)
  then OkCancelFrame.actExitExecute(Sender);
end;

procedure TAreaViewForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TAreaViewForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  OkCancelFrame.actExitExecute(Sender);
end;

procedure TAreaViewForm.dblu_AreasExit(Sender: TObject);
begin
  CheckData
end;

procedure TAreaViewForm.dbeNameChange(Sender: TObject);
begin
  CheckData
end;

procedure TAreaViewForm.dbeNameEnter(Sender: TObject);
begin
  CnErrors.Dispose(dbeName);
end;

procedure TAreaViewForm.dbEditCodeChange(Sender: TObject);
begin
  CheckData
end;

end.
