unit ReqGiveForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  OkCancel_frame, DBGridEh, DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, ToolCtrlsEh, MemTableDataEh, MemTableEh, GridsEh,
  DBGridEhGrouping, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, DBAxisGridsEh;

type
  TReqGiveForm = class(TForm)
    frmOk: TOkCancelFrame;
    lbl1: TLabel;
    luWorkGroup: TDBLookupComboboxEh;
    deDate: TDBDateTimeEditEh;
    lbl2: TLabel;
    dsWORKGROUP: TpFIBDataSet;
    srcWORKGROUP: TDataSource;
    dsW: TpFIBDataSet;
    srcWorkers: TDataSource;
    dbGrid: TDBGridEh;
    Label1: TLabel;
    memWorkers: TMemTableEh;
    procedure frmOkbbOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function  GetWorkers:string;
    procedure CopyData;
  public
    { Public declarations }
  end;

function GiveRequestParams(var aWorkGroup : Integer; var aDate : TDateTime; var Workers : string):Boolean;

implementation

uses
  DM;

{$R *.dfm}

function GiveRequestParams(var aWorkGroup : Integer; var aDate : TDateTime; var Workers : string):Boolean;
begin
  aWorkGroup := -1;
  aDate := Now();

  with TReqGiveForm.Create(Application) do begin
    deDate.Value := Now();
    dsWORKGROUP.Open;
    CopyData;
    if ShowModal = mrOk
    then begin
      aWorkGroup := -1;
      if not VarIsNull(luWorkGroup.Value)
      then aWorkGroup := luWorkGroup.Value;
      if not VarIsNull(deDate.Value)
      then aDate := deDate.Value;
      Workers := GetWorkers;
      Result := True;
    end
    else Result := False;
  end;
end;

procedure TReqGiveForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then frmOkbbOkClick(Sender);
end;

function TReqGiveForm.GetWorkers : string;
var
  w : String;
begin
  w := '';
  if memWorkers.State = dsEdit then memWorkers.Post;
  memWorkers.DisableControls;
  memWorkers.First;
  while not memWorkers.Eof do begin
    if memWorkers['SELECTED']
    then
      w := w + memWorkers.FieldByName('WORKER_ID').AsString + ',';
    memWorkers.Next;
  end;
  memWorkers.Close;
  if Length(w) > 0
  then w:=Copy(w,0,Length(w)-1);
  Result := w;
end;
procedure TReqGiveForm.CopyData;
begin
  memWorkers.EmptyTable;
  memWorkers.Open;
  memWorkers.DisableControls;
  dsW.Open;
  while not dsW.Eof do begin
    memWorkers.AppendRecord([dsW['WORKER_ID'], dsW['FIO'], False]);
    dsW.Next;
  end;
  dsW.Close;
  memWorkers.First;
  memWorkers.EnableControls;
end;

procedure TReqGiveForm.frmOkbbOkClick(Sender: TObject);
begin
  frmOk.actExitExecute(Sender);

end;

end.
