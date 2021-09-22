unit ReqMaterialsForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGridEh, ExtCtrls, EhLibFIB,
  OkCancel_frame, GridsEh, StdCtrls, PropFilerEh,
  PropStorageEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, System.Math, PrjConst;

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
  private
    { Private declarations }
    fEditMode: Byte;
    fRequest: Integer;
    fVisibleCost: Boolean;
    procedure SetRequest(Value: Integer);
  public
    { Public declarations }
    property EditMode: Byte read fEditMode write fEditMode;
    property pRequest: Integer read fRequest write SetRequest;
  end;

function ReqMaterials(const aRequest: Integer; const aEditMode: Byte): Boolean;

var
  ReqMaterialsForm: TReqMaterialsForm;

implementation

uses DM, MAIN;

{$R *.dfm}

function ReqMaterials(const aRequest: Integer; const aEditMode: Byte): Boolean;
var
  FWHOwner: Boolean;
begin
  result := false;
  with TReqMaterialsForm.Create(Application) do
    try
      EditMode := aEditMode;

      FWHOwner := (dmMain.GetSettingsValue('WH_REQ_OWNER') = '1');

      pRequest := aRequest;
      // if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full))))
      if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full))))
      then
        dsReqMaterials.ParamByName('Rq_Owner').AsInteger := 1
      else
        dsReqMaterials.ParamByName('Rq_Owner').AsInteger := 0;

      dsReqMaterials.ParamByName('RQ_ID').AsInteger := aRequest;

      if ShowModal = mrOk then
        result := true;
    finally
      free
    end;
end;

procedure TReqMaterialsForm.SetRequest(Value: Integer);
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
        Self.Name + '.' + Components[i].Name, true);
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
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TReqMaterialsForm.FormShow(Sender: TObject);
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

  dsMatGropups.Open;
  dsReqMaterials.Open;
end;

procedure TReqMaterialsForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
  ModalResult := mrOk;
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

end.
