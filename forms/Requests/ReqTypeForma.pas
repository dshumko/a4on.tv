unit ReqTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  OkCancel_frame, DBCtrlsEh, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, DBGridEh, DBLookupEh;

type
  TReqTypeForm = class(TForm)
    okcnclfrm1: TOkCancelFrame;
    lblName: TLabel;
    lblPrint: TLabel;
    srcRT: TDataSource;
    dbedt1: TDBEditEh;
    dbedt2: TDBEditEh;
    dbmmo1: TDBMemoEh;
    cbb1: TDBComboBoxEh;
    lblPPR: TLabel;
    dsRT: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    dlgColor: TColorDialog;
    btnColor: TBitBtn;
    btnClear: TButton;
    dbckDefault: TDBCheckBoxEh;
    chkCAUSE_NEED: TDBCheckBoxEh;
    chkCommissing: TDBCheckBoxEh;
    procedure btnColorClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dsRTAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


function ReguestTypeModify (const aRT_ID:Integer): Integer;
  
implementation

uses
  DM;

{$R *.dfm}

function ReguestTypeModify (const aRT_ID:Integer): Integer;
begin
  result := aRT_ID;
  with TReqTypeForm.Create(Application) do
  try
    dsRT.ParamByName('RT_ID').AsInteger := aRT_ID;
    dsRT.Open;
    if aRT_ID = -1 then dsRT.Insert;
    if ShowModal = mrOk
    then begin
      if aRT_ID = -1
      then begin
        result := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID',1);
        dsRT.ParamByName('RT_ID').AsInteger := Result;
      end;
      if dsRT.State in [dsEdit, dsInsert] then dsRT.Post;
    end
    else
      if dsRT.State in [dsEdit, dsInsert] then dsRT.Cancel;
    dsRT.Close;
  finally
    free
  end;
end;

procedure TReqTypeForm.btnClearClick(Sender: TObject);
begin
    Self.Color := clBtnFace;
    if not ( dsRT.State in [dsInsert,dsEdit] )
    then dsRT.Edit;
    dsRT.FieldByName('RT_COLOR').Clear;
end;

procedure TReqTypeForm.btnColorClick(Sender: TObject);
begin
  if dlgColor.Execute
  then begin
    Self.Color := dlgColor.Color;
    if not ( dsRT.State in [dsInsert,dsEdit] )
    then dsRT.Edit;
    dsRT['RT_COLOR'] := ColorToString(dlgColor.Color);
  end;
end;

procedure TReqTypeForm.dsRTAfterOpen(DataSet: TDataSet);
begin
  if not dsRT.FieldByName('RT_COLOR').IsNull
  then
    try
      Self.Color := StringToColor(dsRT.FieldByName('RT_COLOR').Value);
    except
    end;
end;

procedure TReqTypeForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then okcnclfrm1bbOkClick(Sender);
end;

procedure TReqTypeForm.okcnclfrm1bbOkClick(Sender: TObject);
begin
  okcnclfrm1.actExitExecute(Sender);
end;

end.
