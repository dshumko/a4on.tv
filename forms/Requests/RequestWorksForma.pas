unit RequestWorksForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  FIBDataSet, pFIBDataSet, DBGridEh, OkCancel_frame, GridsEh, PropFilerEh, PropStorageEh, ToolCtrlsEh,
  DBGridEhToolCtrls,
  DBAxisGridsEh, DBGridEhGrouping, DynVarsEh, EhLibVCL, amSplitter;

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
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FReadOnly: Boolean;
    procedure SetEditMode(const Value: Boolean);
  public
    { Public declarations }
    property ReadOnlyMode: Boolean read FReadOnly write SetEditMode;
  end;

function ReqWorks(const aRequest: Integer; const aReadOnly: Boolean; const RQ_TYPE: Integer = -1): boolean;

var
  RequestWorksForm: TRequestWorksForm;

implementation

uses
  DM, MAIN, PrjConst;

{$R *.dfm}

function ReqWorks(const aRequest: Integer; const aReadOnly: Boolean; const RQ_TYPE: Integer = -1): boolean;
begin
  result := false;
  with TRequestWorksForm.Create(Application) do
    try
      ReadOnlyMode := aReadOnly;
      dsWorkGrps.Open;
      dsWorks.ParamByName('RQ_ID').AsInteger := aRequest;
      dsWorks.Open;
      if RQ_TYPE > -1 then
        dsWorkGrps.Locate('RT_ID', VarArrayOf([RQ_TYPE]), []);
      if ShowModal = mrOk then
        result := true;
    finally
      free
    end;
end;

procedure TRequestWorksForm.cbAllMaterialsClick(Sender: TObject);
var
  s: string;
begin
  dsWorks.Close;
  s := dsWorks.SelectSQL.Text;
  s := StringReplace(s, 'and w.rq_type = :rt_id', '', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s, 'ORDER BY 2', '', [rfReplaceAll, rfIgnoreCase]);
  dsWorks.SelectSQL.Text := Trim(s);
  if not cbAllMaterials.Checked then
    dsWorks.SelectSQL.Add(' and w.rq_type = :rt_id ');
  dsWorks.SelectSQL.Add(' ORDER BY 2 ');
  dsWorks.Open;

  dbGridGroups.Visible := not cbAllMaterials.Checked;
end;

procedure TRequestWorksForm.dbGridExit(Sender: TObject);
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Post;
end;

procedure TRequestWorksForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if gdFocused in State then
  begin
    if (Column.ReadOnly) then
    begin
      if not(dghPreferIncSearch in dbGrid.OptionsEh) then
        dbGrid.OptionsEh := dbGrid.OptionsEh + [dghPreferIncSearch];
    end
    else
    begin
      if dghPreferIncSearch in dbGrid.OptionsEh then
        dbGrid.OptionsEh := dbGrid.OptionsEh - [dghPreferIncSearch];
    end;
  end
end;

procedure TRequestWorksForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'RecWorkGrid', false);
end;

procedure TRequestWorksForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TRequestWorksForm.FormShow(Sender: TObject);
var
  i: Integer;
  s: String;
  h: Boolean;
begin
  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'RecWorkGrid',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);

  s := dmMain.GetSettingsValue('REQ_WORKS_NOT_CALC');
  if (s = '1') then begin
    h := dmMain.AllowedAction(rght_Dictionary_ReqWorks) //
      or dmMain.AllowedAction(rght_Request_Full) //
      or dmMain.AllowedAction(rght_Dictionary_full);

    for i := 0 to dbGrid.Columns.Count - 1 do
    begin
      if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'NOT_CALC') then
        dbGrid.Columns[i].Visible := True
      else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'W_COST') then
        dbGrid.Columns[i].ReadOnly := not h;
    end;
  end;
end;

procedure TRequestWorksForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
  ModalResult := mrOk;
end;

procedure TRequestWorksForm.SetEditMode(const Value: Boolean);
var
  i: Integer;
begin
  FReadOnly := Value;

  if FReadOnly then
    Caption := Caption + rsRequestReadOnly;

  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'W_QUANT') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'W_TIME') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'NOTICE') then
      dbGrid.Columns[i].ReadOnly := FReadOnly;
  end;
end;

end.
