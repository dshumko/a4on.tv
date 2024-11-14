unit ReqMaterialsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Math,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  FIBDataSet, pFIBDataSet, DBGridEh, EhLibFIB, OkCancel_frame, GridsEh, PropFilerEh, PropStorageEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, PrjConst,
  FIBDatabase, pFIBDatabase, amSplitter;

type
  TReqMaterialsForm = class(TForm)
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
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure dbGridExit(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure dsReqMaterialsBeforePost(DataSet: TDataSet);
    procedure srcDataSourceUpdateData(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OkCancelFrame1bbCancelClick(Sender: TObject);
  private
    { Private declarations }
    FReadOnly: Boolean;
    fRequest: Integer;
    fVisibleCost: Boolean;
    procedure SetRequest(const Value: Integer);
    procedure SetEditMode(const Value: Boolean);
    procedure SaveAndExit;
  public
    { Public declarations }
    property ReadOnlyMode: Boolean read FReadOnly write SetEditMode;
    property pRequest: Integer read fRequest write SetRequest;
  end;

function ReqMaterials(const aRequest: Integer; const aReadOnly: Boolean = True): Boolean;

var
  ReqMaterialsForm: TReqMaterialsForm;

implementation

uses
  DM, MAIN;

{$R *.dfm}

function ReqMaterials(const aRequest: Integer; const aReadOnly: Boolean = True): Boolean;
var
  FWHOwner: Boolean;
begin
  result := false;
  with TReqMaterialsForm.Create(Application) do
    try
      ReadOnlyMode := aReadOnly;

      FWHOwner := (dmMain.GetSettingsValue('WH_REQ_OWNER') = '1');

      pRequest := aRequest;
      // if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full))))
      if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full)))) then
        dsReqMaterials.ParamByName('Rq_Owner').AsInteger := 1
      else
        dsReqMaterials.ParamByName('Rq_Owner').AsInteger := 0;

      dsReqMaterials.ParamByName('RQ_ID').AsInteger := aRequest;

      if ShowModal = mrOk then
        result := True;
    finally
      free
    end;
end;

procedure TReqMaterialsForm.SetRequest(const Value: Integer);
begin
  fRequest := Value;
end;

procedure TReqMaterialsForm.dbGridExit(Sender: TObject);
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
  begin
    srcDataSource.DataSet.Post;
  end;
end;

procedure TReqMaterialsForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
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

procedure TReqMaterialsForm.dsReqMaterialsBeforePost(DataSet: TDataSet);
begin
  DataSet['RQ_ID'] := fRequest;
  if not DataSet.FieldByName('RM_QUANT').IsNull then
    DataSet['RM_QUANT'] := RoundTo(DataSet['RM_QUANT'], -5);
end;

procedure TReqMaterialsForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);
  // dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'RecMatGrid', true);
end;

procedure TReqMaterialsForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  fVisibleCost := dmMain.AllowedAction(rght_Material_Cost); // просмотр цены
  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if dbGrid.Columns[i].FieldName = 'RM_COST' then
      dbGrid.Columns[i].Visible := fVisibleCost;
  end;
end;

procedure TReqMaterialsForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    SaveAndExit;
end;

procedure TReqMaterialsForm.FormShow(Sender: TObject);
var
  i: Integer;
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

  dsMatGropups.Open;
  dsReqMaterials.Open;
end;

procedure TReqMaterialsForm.OkCancelFrame1bbCancelClick(Sender: TObject);
begin
  SaveAndExit;
end;

procedure TReqMaterialsForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  SaveAndExit;
end;

procedure TReqMaterialsForm.srcDataSourceUpdateData(Sender: TObject);
begin
  dsReqMaterials.DisableControls;
  if (dsReqMaterials['RM_QUANT'] <> 0) then
  begin
    if not(dsReqMaterials.FieldByName('RM_QUANT').IsNull) then
    begin
      if (dsReqMaterials['RM_QUANT'] > 0) then
      begin
        if (dsReqMaterials['RM_QUANT'] > dsReqMaterials['QUANT_TOTAL']) then
          dsReqMaterials['RM_QUANT'] := dsReqMaterials['QUANT_IN_REQUEST'];
      end
    end
  end
  else
  begin
    if not(dsReqMaterials.FieldByName('RM_QUANT').IsNull) then
    begin
      if (dsReqMaterials['RM_QUANT'] > 0) then
      begin
        if (dsReqMaterials.FieldByName('RM_QUANT').NewValue > dsReqMaterials['QUANT_TOTAL']) then
          dsReqMaterials.FieldByName('RM_QUANT').Value := dsReqMaterials['QUANT_TOTAL'];
      end
      else
        dsReqMaterials['RM_QUANT'] := 0;
    end;
  end;
  dsReqMaterials.EnableControls;
end;

procedure TReqMaterialsForm.SetEditMode(const Value: Boolean);
var
  i: Integer;
begin
  FReadOnly := Value;

  if FReadOnly then
    Caption := Caption + rsRequestReadOnly;

  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'RM_QUANT') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'CALC') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'RM_COST') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'PROP') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'RM_NOTICE') then
      dbGrid.Columns[i].ReadOnly := FReadOnly;
  end;
end;

procedure TReqMaterialsForm.SaveAndExit;
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
  begin
    srcDataSource.DataSet.Post;
  end;

  OkCancelFrame1.actExitExecute(nil);
  ModalResult := mrOk;
end;

end.
