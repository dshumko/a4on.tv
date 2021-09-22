unit MatMoveForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, DBGridEh, StdCtrls, DBCtrls,
  DBCtrlsEh, Mask, DBLookupEh;

type
  TMatMoveForm = class(TForm)
    frmOK: TOkCancelFrame;
    trReadQ: TpFIBTransaction;
    trWriteQ: TpFIBTransaction;
    dsWH: TpFIBDataSet;
    dsFROMWH: TpFIBDataSet;
    cbWH: TDBLookupComboboxEh;
    cbbFROM_WH: TDBLookupComboboxEh;
    edDate: TDBDateTimeEditEh;
    edQuant: TDBNumberEditEh;
    dsMW: TpFIBDataSet;
    edCost: TDBNumberEditEh;
    edNumber: TDBEditEh;
    srcMW: TDataSource;
    dbmNotice: TDBMemoEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    srcWH: TDataSource;
    srcFROMWH: TDataSource;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    procedure FormShow(Sender: TObject);
    procedure cbWHExit(Sender: TObject);
    procedure dsWHAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MatMoveForm: TMatMoveForm;


function MoveMaterial(const M_ID : Integer) : Boolean;
implementation

uses
  DM;

{$R *.dfm}

function MoveMaterial(const M_ID : Integer) : Boolean;
begin
  with TMatMoveForm.Create(Application) do
  try
    dsMW.ParamByName('M_ID').AsInteger := M_ID;
    dsMW.Open;
    dsMW.Insert;
    dsMW['M_ID'] := M_ID;
    if (ShowModal = mrOk)
    then begin
      dsMW.Post;
      Result := True;
    end
    else begin
      dsMW.Cancel;
      Result := False;
    end;

  finally
    Free;
  end;
end;

procedure TMatMoveForm.cbWHExit(Sender: TObject);
var
  b : Boolean;
begin
  b := (not VarIsEmpty(cbWH.Value));
  if (not VarIsEmpty(edQuant.Value))
  then b := edQuant.Value <> 0
  else b := False;

  frmOK.bbOk.Enabled := b;
  
end;

procedure TMatMoveForm.dsWHAfterOpen(DataSet: TDataSet);
begin
  cbWH.KeyValue := dsWH['O_ID'];
end;

procedure TMatMoveForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then ModalResult := mrOk;
end;

procedure TMatMoveForm.FormShow(Sender: TObject);
begin
  dsWH.Open;
  dsFROMWH.Open;
  edQuant.SetFocus;
end;

end.
