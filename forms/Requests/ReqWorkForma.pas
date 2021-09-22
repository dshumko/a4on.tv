unit ReqWorkForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, StdCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, Mask, DBCtrls, DBCtrlsEh, DBLookupEh,
  FIBQuery, pFIBQuery, DBGridEh;

type
  TReqWorkForm = class(TForm)
    okcnclfrm1: TOkCancelFrame;
    srcWork: TDataSource;
    dsWork: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    Label2: TLabel;
    Label3: TLabel;
    dbmmoSolution: TDBMemoEh;
    dbeName: TDBEditEh;
    edtHours: TDBNumberEditEh;
    lbl1: TLabel;
    grpAfterAdd: TGroupBox;
    lbl3: TLabel;
    cbATRAction: TDBComboBoxEh;
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    cbbAttribute: TDBLookupComboboxEh;
    lbl4: TLabel;
    cbService: TDBLookupComboboxEh;
    dsService: TpFIBDataSet;
    srcService: TDataSource;
    dbckDefault: TDBCheckBoxEh;
    lbl5: TLabel;
    ed1: TDBNumberEditEh;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ReguestWorkModify (const aW_ID:Integer; const aRT_ID : Integer): Integer;

implementation

uses
  DM;

{$R *.dfm}

function ReguestWorkModify (const aW_ID:Integer; const aRT_ID : Integer): Integer;
begin
  result := aW_ID;
  with TReqWorkForm.Create(Application) do
  try
    dsWork.ParamByName('W_ID').AsInteger := aW_ID;
    dsWork.Open;
    dsService.Open;
    dsAttributes.Open;
    if aW_ID = -1 then dsWork.Insert;
    if ShowModal = mrOk
    then begin
      if aW_ID = -1
      then begin
        result := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID',1);
        dsWork.ParamByName('W_ID').AsInteger := Result;
        dsWork['RQ_TYPE'] := aRT_ID;
      end;
      if dsWork.State in [dsEdit, dsInsert] then dsWork.Post;
    end
    else begin
      if dsWork.State in [dsEdit, dsInsert] then dsWork.Cancel;
      result := -1;
    end;
    dsWork.Close;
    dsService.Close;
    dsAttributes.Close;
  finally
    free
  end;
end;

procedure TReqWorkForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then okcnclfrm1bbOkClick(sender);
end;

procedure TReqWorkForm.okcnclfrm1bbOkClick(Sender: TObject);
begin
  okcnclfrm1.actExitExecute(Sender);

end;

end.
