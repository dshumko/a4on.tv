unit ReqMatBaybackForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  FIBDataSet, pFIBDataSet, DBGridEh, EhLibFIB, OkCancel_frame, GridsEh, PropFilerEh, PropStorageEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh,
  DBCtrlsEh, Vcl.Mask, DBLookupEh, Vcl.Buttons, CnErrorProvider;

type
  TReqMatBaybackForm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    srcDataSource: TDataSource;
    dsReqMaterials: TpFIBDataSet;
    PropStorage: TPropStorageEh;
    ednCost: TDBNumberEditEh;
    ednQuant: TDBNumberEditEh;
    mmoNotice: TDBMemoEh;
    lcbEQ: TDBLookupComboboxEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    cnErrors: TCnErrorProvider;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
    fRequest: Integer;
    procedure SetRequest(Value: Integer);
    function CheckData:Boolean;
  public
    { Public declarations }
    property Request: Integer read fRequest write SetRequest;
  end;

function ReqBayBack(const aRequest: Integer): boolean;

var
  ReqMatBaybackForm: TReqMatBaybackForm;

implementation

uses
  DM, MAIN, PrjConst;

{$R *.dfm}

function ReqBayBack(const aRequest: Integer): boolean;
var
  FWHOwner: boolean;
begin
  result := false;
  with TReqMatBaybackForm.Create(Application) do
    try
      Request := aRequest;

      if ShowModal = mrOk then begin
        result := true;
      end;
    finally
      free
    end;
end;

procedure TReqMatBaybackForm.SetRequest(Value: Integer);
begin
  fRequest := Value;
  if dsReqMaterials.Active then
    dsReqMaterials.Close;
  dsReqMaterials.ParamByName('RQ_ID').AsInteger := fRequest;
end;

procedure TReqMatBaybackForm.bbOkClick(Sender: TObject);
begin
   if CheckData then
     ModalResult := mrOk;
end;

procedure TReqMatBaybackForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TReqMatBaybackForm.FormShow(Sender: TObject);
begin
  if dsReqMaterials.Active then
    dsReqMaterials.Close;

  dsReqMaterials.Open;
end;

function TReqMatBaybackForm.CheckData:Boolean;
begin
  RESULT := True;
end;

end.
