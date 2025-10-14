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
    Panel2: TPanel;
    Panel3: TPanel;
    dbGrid: TDBGridEh;
    srcDataSource: TDataSource;
    dsWorks: TpFIBDataSet;
    OkCancelFrame1: TOkCancelFrame;
    dbGridGroups: TDBGridEh;
    dsWorkGrps: TpFIBDataSet;
    srcWorkGrps: TDataSource;
    Splitter1: TSplitter;
    PropStorage: TPropStorageEh;
    procedure dbGridExit(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbGridGroupsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    FReadOnly: Boolean;
    FROW_HL_WARNING : TColor;
    procedure SetEditMode(const Value: Boolean);
  public
    { Public declarations }
    property ReadOnlyMode: Boolean read FReadOnly write SetEditMode;
  end;

function ReqWorks(const aRequest: Integer; const aReadOnly: Boolean; const RQ_TYPE: Integer = -1): Boolean;

var
  RequestWorksForm: TRequestWorksForm;

implementation

uses
  DM, MAIN, PrjConst;

{$R *.dfm}

function ReqWorks(const aRequest: Integer; const aReadOnly: Boolean; const RQ_TYPE: Integer = -1): Boolean;
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

procedure TRequestWorksForm.dbGridGroupsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  s: string;
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    Exit;

  if (gdSelected in State) then
  begin
    AFont.Color := clHighlightText;
    Background := clHighlight;
  end
  else if (Sender as TDBGridEh).DataSource.DataSet['rt_id'] = -1 then
    Background := FROW_HL_WARNING;
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
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end;
    end;
  end;

  try
    FROW_HL_WARNING := StringToColor(dmMain.GetSettingsValue('ROW_HL_WARNING'));
  except
    FROW_HL_WARNING := $0066FFFF;
  end;

  s := dmMain.GetSettingsValue('REQ_WORKS_NOT_CALC');
  if (s = '1') then
  begin
    h := dmMain.AllowedAction(rght_Dictionary_ReqWorks) //
      or dmMain.AllowedAction(rght_Request_Full) //
      or dmMain.AllowedAction(rght_Dictionary_full);

    for i := 0 to dbGrid.Columns.Count - 1 do
    begin
      if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'NOT_CALC') then
        dbGrid.Columns[i].Visible := true
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
