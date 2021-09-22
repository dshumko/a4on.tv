unit MatOutForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, DBGridEh, StdCtrls, DBCtrls,
  DBCtrlsEh, Mask, DBLookupEh;

type
  TMatOutForm = class(TForm)
    frmOK: TOkCancelFrame;
    trReadQ: TpFIBTransaction;
    trWriteQ: TpFIBTransaction;
    dsMO: TpFIBDataSet;
    cbWH: TDBLookupComboboxEh;
    edDate: TDBDateTimeEditEh;
    edQuant: TDBNumberEditEh;
    dsMW: TpFIBDataSet;
    edNumber: TDBEditEh;
    srcMW: TDataSource;
    dbmNotice: TDBMemoEh;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    srcMO: TDataSource;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbWHExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MaterialOut(const M_ID : Integer; const MO_ID : Integer = -1) : Boolean;

implementation

uses
  DM;

{$R *.dfm}

function MaterialOut(const M_ID : Integer; const MO_ID : Integer = -1) : Boolean;
begin
  with TMatOutForm.Create(Application) do
  try
    dsMW.ParamByName('M_ID').AsInteger := M_ID;
    dsMW.Open;
    dsMO.ParamByName('MO_ID').AsInteger := MO_ID;
    dsMO.Open;
    if MO_ID = -1
    then begin
      dsMO.Insert;
      dsMO['M_ID'] := M_ID;      
      dsMO['MI_ID'] := dsMW['MI_ID'];
    end
    else
      dsMO.Edit;

    if (ShowModal = mrOk)
    then begin
      dsMO.Post;
      Result := True;
    end
    else begin
      dsMO.Cancel;
      Result := False;
    end;

  finally
    Free;
  end;
end;

procedure TMatOutForm.cbWHExit(Sender: TObject);
var
  b : Boolean;
begin

  if (not VarIsEmpty(edQuant.Value))
  then b := edQuant.Value <> 0
  else b := False;

  frmOK.bbOk.Enabled := b;
  
end;

procedure TMatOutForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (frmOK.bbOk.Enabled)
  then ModalResult := mrOk;
end;

procedure TMatOutForm.FormShow(Sender: TObject);
begin
  edQuant.SetFocus;
end;

end.
