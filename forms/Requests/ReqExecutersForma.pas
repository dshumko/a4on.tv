unit ReqExecutersForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGridEh, ExtCtrls,
  OkCancel_frame, GridsEh, StdCtrls, EhLibFIB,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, RxPlacemnt,
  EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TReqExecutorsForm = class(TForm)
    Panel2: TPanel;
    srcDataSource: TDataSource;
    dsReqExecutors: TpFIBDataSet;
    OkCancelFrame1: TOkCancelFrame;
    pnlWork: TPanel;
    Panel3: TPanel;
    dbGrid: TDBGridEh;
    spl1: TSplitter;
    pnlTime: TPanel;
    lbl1: TLabel;
    dbgSame: TDBGridEh;
    srcSame: TDataSource;
    dsSame: TpFIBDataSet;
    dsRqst: TpFIBDataSet;
    srcRqst: TDataSource;
    srcTeams: TDataSource;
    dsTeams: TpFIBDataSet;
    dbgrdTeam: TDBGridEh;
    spl2: TSplitter;
    frmStore: TFormStorage;
    procedure dbGridExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
  private
    { Private declarations }
    fEditMode: Byte;
  public
    { Public declarations }
    property EditMode: Byte read fEditMode write fEditMode;
  end;

function ReqExecutors(const aRequest: Integer; const aEditMode: Byte): boolean;

implementation

uses DM, MAIN;

{$R *.dfm}

function ReqExecutors(const aRequest: Integer; const aEditMode: Byte): boolean;
begin
  result := false;
  with TReqExecutorsForm.Create(Application) do
    try
      EditMode := aEditMode;
      dsTeams.ParamByName('RQ_ID').AsInteger := aRequest;
      dsTeams.Open;
      dsReqExecutors.ParamByName('RQ_ID').AsInteger := aRequest;
      dsReqExecutors.Open;
      dsRqst.ParamByName('RQ_ID').AsInteger := aRequest;
      dsRqst.Open;
      // dsSame.Open;
      if ShowModal = mrOk then
        result := true;
    finally
      free
    end;
end;

procedure TReqExecutorsForm.dbGridEnter(Sender: TObject);
begin
  dbGrid.SelectedField := dbGrid.FindFieldColumn('SELECTED').Field;
end;

procedure TReqExecutorsForm.dbGridExit(Sender: TObject);
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Post;
end;

procedure TReqExecutorsForm.FormCreate(Sender: TObject);
begin
  frmStore.IniFileName := A4MainForm.GetIniFileName;
end;

procedure TReqExecutorsForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  // then OkCancelFrame1bbOkClick(Sender);
  then
    ModalResult := mrCancel;
end;

procedure TReqExecutorsForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
end;

end.
