unit MatMoveSelectUnit;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  DBGridEh, GridsEh,
{$IFDEF EH_LIB_7}
  Winapi.UxTheme,
  Vcl.Themes,
{$ENDIF}
{$IFDEF EH_LIB_17}
  System.UITypes,
{$ENDIF}
  Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.DBCtrls,
  ToolCtrlsEh, DBGridEhToolCtrls, MemTableDataEh, DBAxisGridsEh, DropDownFormEh, DataDriverEh, DBVertGridsEh, DynVarsEh,
  EhLibVCL,
  FIBDatabase, FIBDataSet, DBGridEhGrouping;

type
  TMaterialsMoveSelect = class(TCustomDropDownFormEh)
    srcMaterials: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBVertGridEh1: TDBVertGridEh;
    MainGrid: TDBGridEh;
    sbOk: TSpeedButton;
    procedure sbOkClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MainGridDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure srcMaterialsDataChange(Sender: TObject; Field: TField);
    procedure CustomDropDownFormEhInitForm(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
    procedure CustomDropDownFormEhReturnParams(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
    procedure CustomDropDownFormEhShow(Sender: TObject);
    procedure CustomDropDownFormEhClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    function ShipperCostExists: Boolean;
  public
    class function GetGlobalRef: TCustomDropDownFormEh; override;
  end;

var
  SelectMaterials: TMaterialsMoveSelect;

implementation

uses
  DM, MAIN, AtrStrUtils;

{$R *.DFM}

type
  TSpeedButtonCrack = class(TSpeedButton);

procedure TMaterialsMoveSelect.FormCreate(Sender: TObject);
var
  i, c: Integer;
  Font_size: Integer;
  Font_name, s: string;
  Row_height: Integer;
begin
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);

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
      for c := 0 to (Components[i] as TDBGridEh).Columns.Count - 1 do
      begin
        s := (Components[i] as TDBGridEh).Columns[c].FieldName.toUpper;
        if (s.Contains('NOTICE') or s.Contains('DESCRIPTION')) and
          (not Assigned((Components[i] as TDBGridEh).Columns[c].OnGetCellParams)) then
          (Components[i] as TDBGridEh).Columns[c].OnGetCellParams := dbGridColumnsGetCellParams
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemo) then
      begin
        (Components[i] as TDBMemo).Font.Name := Font_name;
        (Components[i] as TDBMemo).Font.Size := Font_size;
      end;
    end
  end;

  Panel3.DoubleBuffered := True;
  Panel3.ParentBackground := False;

  FormElements := [ddfeLeftGripEh, ddfeRightGripEh, ddfeCloseButtonEh];
end;

procedure TMaterialsMoveSelect.dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, ' ', [rfReplaceAll]);
end;

procedure TMaterialsMoveSelect.sbOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

procedure TMaterialsMoveSelect.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TMaterialsMoveSelect.MainGridDblClick(Sender: TObject);
begin
  if sbOk.Enabled then
    sbOkClick(Sender);
end;

procedure TMaterialsMoveSelect.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if not MainGrid.SearchPanel.Active then
    begin
      ModalResult := mrCancel;
      Visible := False;
    end;
  end
  else if Key = VK_RETURN then
  begin
    if not MainGrid.SearchPanel.Active then
      sbOkClick(Sender);
  end;
end;

procedure TMaterialsMoveSelect.srcMaterialsDataChange(Sender: TObject; Field: TField);
begin
  sbOk.Enabled := not srcMaterials.DataSet.IsEmpty;
end;

procedure TMaterialsMoveSelect.CustomDropDownFormEhClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, False);
end;

procedure TMaterialsMoveSelect.CustomDropDownFormEhInitForm(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
var
  vMaterial: String;
begin
  MainGrid.SearchPanel.CancelSearchFilter;
  MainGrid.SearchPanel.SearchingText := '';

  if DynParams = nil then
    Exit;

  vMaterial := DynParams['NAME'].AsString;
  srcMaterials.DataSet := (DynParams['DATASET'].AsRefObject as TDataSet);

  if DynParams.FindDynVar('WIDTH') <> nil then
    Self.Width := DynParams['WIDTH'].AsInteger;

  if vMaterial <> '' then
    MainGrid.SearchPanel.SearchingText := vMaterial;
end;

function TMaterialsMoveSelect.ShipperCostExists: Boolean;
begin
  Result := (srcMaterials.DataSet.FindField('Ship_Cost') <> nil);
end;

procedure TMaterialsMoveSelect.CustomDropDownFormEhReturnParams(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
begin
  if DynParams = nil then
    Exit;
  DynParams['ID'].AsInteger := srcMaterials.DataSet.FieldByName('M_Id').AsInteger;
  DynParams['Name'].AsString := srcMaterials.DataSet.FieldByName('name').AsString;
  DynParams['Cost'].AsFloat := srcMaterials.DataSet.FieldByName('Mr_Cost').AsFloat;
  DynParams['Quant'].AsFloat := srcMaterials.DataSet.FieldByName('Mr_Quant').AsFloat;
  if not srcMaterials.DataSet.FieldByName('SERIAL').IsNull then
    DynParams['SERIAL'].AsString := srcMaterials.DataSet.FieldByName('SERIAL').AsString
  else
    DynParams['SERIAL'].AsString := '';
  if not srcMaterials.DataSet.FieldByName('dimension').IsNull then
    DynParams['dimension'].AsString := srcMaterials.DataSet.FieldByName('dimension').AsString
  else
    DynParams['dimension'].AsString := '';

  if (ShipperCostExists) and (not srcMaterials.DataSet.FieldByName('Ship_Cost').IsNull) then
    DynParams['Ship_Cost'].AsFloat := srcMaterials.DataSet.FieldByName('Ship_Cost').AsFloat
end;

class function TMaterialsMoveSelect.GetGlobalRef: TCustomDropDownFormEh;
begin
  if SelectMaterials = nil then
    Application.CreateForm(TMaterialsMoveSelect, SelectMaterials);
  Result := SelectMaterials;
end;

procedure TMaterialsMoveSelect.CustomDropDownFormEhShow(Sender: TObject);
begin
  MainGrid.SetFocus;
  MainGrid.SearchPanel.Active := True;
end;

initialization

RegisterClass(TMaterialsMoveSelect);

end.
