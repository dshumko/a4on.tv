unit ReqMatReturnForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  FIBDataSet, pFIBDataSet, DBGridEh, EhLibFIB, OkCancel_frame, GridsEh, PropFilerEh, PropStorageEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TReqMatReturnForm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    dbGrid: TDBGridEh;
    srcDataSource: TDataSource;
    dsReqMaterials: TpFIBDataSet;
    OkCancelFrame1: TOkCancelFrame;
    dbGridGroups: TDBGridEh;
    dsMatGropups: TpFIBDataSet;
    srcMatGropups: TDataSource;
    Splitter1: TSplitter;
    PropStorage: TPropStorageEh;
    procedure dbGridExit(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure dsReqMaterialsBeforePost(DataSet: TDataSet);
    procedure srcDataSourceUpdateData(Sender: TObject);
  private
    { Private declarations }
    fEditMode: Boolean;
    fRequest: Integer;
    procedure SetRequest(Value: Integer);
    procedure SetEditMode(Value: Boolean);
    function GetGridSortOrder(Grid: TDBGridEh): String;
  public
    { Public declarations }
    property EditMode: Boolean read fEditMode write SetEditMode;
    property pRequest: Integer read fRequest write SetRequest;
  end;

function ReqMaterialsReturn(const aRequest: Integer; const aReadOnly:Boolean = True ): boolean;

var
  ReqMatReturnForm: TReqMatReturnForm;

implementation

uses
  DM, MAIN, PrjConst;

{$R *.dfm}

function ReqMaterialsReturn(const aRequest: Integer; const aReadOnly:Boolean = True ): boolean;
var
  FWHOwner: boolean;
begin
  result := false;
  with TReqMatReturnForm.Create(Application) do
    try
      EditMode := not aReadOnly;
      dsMatGropups.Open;
      pRequest := aRequest;

      FWHOwner := (dmMain.GetSettingsValue('WH_REQ_OWNER') = '1');

      // if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full))))
      if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full)))) then
        dsReqMaterials.ParamByName('WH_FLTR').Value := '1'
      else
        dsReqMaterials.ParamByName('WH_FLTR').Value := '0';

      dsReqMaterials.ParamByName('RQ_ID').AsInteger := aRequest;

      dsMatGropups.Open;

      if ShowModal = mrOk then
        result := true;
    finally
      free
    end;
end;

procedure TReqMatReturnForm.SetRequest(Value: Integer);
begin
  fRequest := Value;
end;

procedure TReqMatReturnForm.dbGridExit(Sender: TObject);
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
  begin
    srcDataSource.DataSet.Post;
  end;
end;

procedure TReqMatReturnForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
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

procedure TReqMatReturnForm.dsReqMaterialsBeforePost(DataSet: TDataSet);
begin
  DataSet['RQ_ID'] := fRequest;
end;

procedure TReqMatReturnForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);
  // dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'RecMatReturnGrid', true);
end;

procedure TReqMatReturnForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TReqMatReturnForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
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
    end;
  end;
  if dsReqMaterials.Active then
    dsReqMaterials.Close;
  dsReqMaterials.OrderClause := GetGridSortOrder(dbGrid);
  dsReqMaterials.Open;
  // dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'RecMatReturnGrid',
  // [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
end;

procedure TReqMatReturnForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
  ModalResult := mrOk;

end;

procedure TReqMatReturnForm.srcDataSourceUpdateData(Sender: TObject);
begin
  dsReqMaterials.DisableControls;
  if not(dsReqMaterials.FieldByName('QUANT').IsNull) then
  begin
    if (dsReqMaterials['QUANT'] < 0) then
      dsReqMaterials['QUANT'] := 0;
  end;

  dsReqMaterials.EnableControls;
end;

function TReqMatReturnForm.GetGridSortOrder(Grid: TDBGridEh): String;
var
  i: Integer;
begin
  result := '';
  for i := 0 to pred(Grid.SortMarkedColumns.Count) do
  begin
    result := result + Grid.SortMarkedColumns[i].fieldname;
    if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      result := result + ' desc';
    result := result + ','
  end;
  result := result.TrimRight([',']);
end;

procedure TReqMatReturnForm.SetEditMode(Value: Boolean);
var
  i: Integer;
begin
  fEditMode := Value;

  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'QUANT') then
      dbGrid.Columns[i].ReadOnly := not fEditMode;
  end;
end;

end.
