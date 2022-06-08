unit RequestManyClose;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls,
  OkCancel_frame, DBGridEh, DBLookupEh, DBCtrlsEh, DBGridEhGrouping, GridsEh, MemTableDataEh, MemTableEh, FIBDataSet, pFIBDataSet;

type
  TRequestManyCloseForm = class(TForm)
    frm1: TOkCancelFrame;
    pnlExecTime: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblRes: TLabel;
    deEndExecDateTime: TDBDateTimeEditEh;
    cbbResultExec: TDBComboBoxEh;
    luResult: TDBLookupComboboxEh;
    pnl1: TPanel;
    lbl3: TLabel;
    mmoMemDefect: TDBMemoEh;
    pnl2: TPanel;
    lbl4: TLabel;
    luType: TDBLookupComboboxEh;
    lbl5: TLabel;
    edReceipt: TDBEditEh;
    pnlRWorks: TPanel;
    dbgWorks: TDBGridEh;
    pnlBW: TPanel;
    btnAddWork: TButton;
    btnDelWork: TButton;
    dsWorks: TMemTableEh;
    intgrfldWorksW_ID: TIntegerField;
    sfWorksNAME: TStringField;
    bcdfldWorksW_TIME: TBCDField;
    sfWorksNOTICE: TStringField;
    fltfldWorksQUANT: TFloatField;
    srcWorks: TDataSource;
    dsRequestType: TpFIBDataSet;
    srcRequestType: TDataSource;
    dsResult: TpFIBDataSet;
    srcResult: TDataSource;
    procedure btnAddWorkClick(Sender: TObject);
    procedure btnDelWorkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RequestManyCloseForm: TRequestManyCloseForm;

implementation

{$R *.dfm}
uses
  DM, ReqAddWorkForma;

procedure TRequestManyCloseForm.btnAddWorkClick(Sender: TObject);
var
  work_id  : Integer;
  wname     : String;
  quant    : Integer;
  w_time   : single;
  notice   : string;
begin
  if varIsNull(luType.Value) then Exit;
  if SelectRequestWork(luType.Value, work_id,wname, quant, w_time, notice)
  then begin
    dsWorks.Append;
    dsWorks['W_ID']   := work_id;
    dsWorks['name']   := wname;
    dsWorks['quant']  := quant;
    dsWorks['w_time'] := w_time;
    dsWorks['notice'] := notice;
    dsWorks.Post;
  end;
end;

procedure TRequestManyCloseForm.btnDelWorkClick(Sender: TObject);
begin
  if dsWorks.FieldByName('w_id').IsNull then Exit;

  if Application.MessageBox('Удалить работу'//+PansiChar(dsWorks.FieldByName('NAME').AsString)
                            , 'Удалить', MB_YESNO
    + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES
  then begin
    dsWorks.Delete;
  end;
end;

procedure TRequestManyCloseForm.FormShow(Sender: TObject);
begin
  dsRequestType.Open;
  dsResult.Open;
  dsWorks.Open;
end;

end.
