unit RequestWorksForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGridEh, ExtCtrls,
  OkCancel_frame, GridsEh, StdCtrls, PropFilerEh,
  PropStorageEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  DBGridEhGrouping, DynVarsEh, EhLibVCL;

type
  TRequestWorksForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbGrid: TDBGridEh;
    srcDataSource: TDataSource;
    dsWorks: TpFIBDataSet;
    OkCancelFrame1: TOkCancelFrame;
    dbGridGroups: TDBGridEh;
    cbAllMaterials: TCheckBox;
    dsWorkGrps: TpFIBDataSet;
    srcWorkGrps: TDataSource;
    Splitter1: TSplitter;
    PropStorage: TPropStorageEh;
    procedure cbAllMaterialsClick(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fEditMode : Byte;
  public
    { Public declarations }
    property EditMode : Byte read fEditMode write fEditMode;
  end;

function ReqWorks(const aRequest:Integer; const aEditMode : Byte; const RQ_TYPE : Integer = -1): boolean;

var
  RequestWorksForm: TRequestWorksForm;

implementation

uses DM, MAIN;

{$R *.dfm}
function ReqWorks(const aRequest:Integer; const aEditMode : Byte; const RQ_TYPE : Integer = -1): boolean;
begin
  result := false;
  with TRequestWorksForm.Create(Application) do
  try
    EditMode:=aEditMode;
    dsWorkGrps.Open;
    dsWorks.ParamByName('RQ_ID').AsInteger := aRequest;
    dsWorks.Open;
    if RQ_TYPE > -1 then dsWorkGrps.Locate('RT_ID', VarArrayOf([RQ_TYPE]),[]);
    if ShowModal = mrOk
    then result := true;
  finally
    free
  end;
end;

procedure TRequestWorksForm.cbAllMaterialsClick(Sender: TObject);
var
 s : string;
begin
  dsWorks.Close;
  s := dsWorks.SelectSQL.Text;
  s := StringReplace(s,'and w.rq_type = :rt_id','',[rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s,'ORDER BY 2','',[rfReplaceAll, rfIgnoreCase]);
  dsWorks.SelectSQL.Text := Trim(s);
  if not cbAllMaterials.Checked
  then dsWorks.SelectSQL.Add(' and w.rq_type = :rt_id ');
  dsWorks.SelectSQL.Add(' ORDER BY 2 ');
  dsWorks.Open;

  dbGridGroups.Visible     := not cbAllMaterials.Checked;
end;

procedure TRequestWorksForm.dbGridExit(Sender: TObject);
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then srcDataSource.DataSet.Post;
end;

procedure TRequestWorksForm.dbGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gdFocused in State
  then begin
    if (Column.ReadOnly)
    then begin
      if not (dghPreferIncSearch in dbGrid.OptionsEh)
      then dbGrid.OptionsEh := dbGrid.OptionsEh + [dghPreferIncSearch];
    end
    else begin
      if dghPreferIncSearch in dbGrid.OptionsEh
      then dbGrid.OptionsEh := dbGrid.OptionsEh - [dghPreferIncSearch];
    end;
  end
end;

procedure TRequestWorksForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'RecWorkGrid', true);
end;

procedure TRequestWorksForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then OkCancelFrame1bbOkClick(sender);
end;

procedure TRequestWorksForm.FormShow(Sender: TObject);
begin
  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'RecWorkGrid', [crpColIndexEh,crpColWidthsEh,crpColVisibleEh]);
end;

procedure TRequestWorksForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
  ModalResult := mrOk;
end;

end.
