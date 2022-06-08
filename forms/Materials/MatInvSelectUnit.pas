unit MatInvSelectUnit;

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
  ToolCtrlsEh, DBGridEhToolCtrls, MemTableDataEh, DBAxisGridsEh, DropDownFormEh, DataDriverEh, DBVertGridsEh, DynVarsEh, EhLibVCL,
  FIBDatabase, FIBDataSet, DBGridEhGrouping, pFIBDataDriverEh;

type
  TMaterialsInvSelect = class(TCustomDropDownFormEh)
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
    procedure CustomDropDownFormEhClose(Sender: TObject;
      var Action: TCloseAction);
  public
    class function GetGlobalRef: TCustomDropDownFormEh; override;
  end;

var
  SelectMaterials: TMaterialsInvSelect;

implementation

uses
  Data.DBConsts;

{$R *.DFM}

procedure TMaterialsInvSelect.FormCreate(Sender: TObject);
begin
  Panel3.DoubleBuffered := True;
  Panel3.ParentBackground := False;

  FormElements := [ddfeLeftGripEh, ddfeRightGripEh, ddfeCloseButtonEh];
end;

procedure TMaterialsInvSelect.sbOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

procedure TMaterialsInvSelect.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TMaterialsInvSelect.MainGridDblClick(Sender: TObject);
begin
  if sbOk.Enabled then
    sbOkClick(Sender);
end;

procedure TMaterialsInvSelect.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TMaterialsInvSelect.srcMaterialsDataChange(Sender: TObject; Field: TField);
begin
  sbOk.Enabled := not srcMaterials.DataSet.IsEmpty;
end;

procedure TMaterialsInvSelect.CustomDropDownFormEhClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  srcMaterials.DataSet.Close;
//  Action := caFree;
end;

procedure TMaterialsInvSelect.CustomDropDownFormEhInitForm(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
var
  vMaterial: String;
begin
  MainGrid.SearchPanel.CancelSearchFilter;
  MainGrid.SearchPanel.SearchingText := '';

  if DynParams = nil then
    Exit;

  vMaterial := DynParams['NAME'].AsString;
  srcMaterials.DataSet := (DynParams['DATASET'].AsRefObject as TDataSet);
  if srcMaterials.DataSet.Active then
    srcMaterials.DataSet.Close;
  srcMaterials.DataSet.Open;
  if vMaterial <> '' then
    MainGrid.SearchPanel.SearchingText := vMaterial;
end;

procedure TMaterialsInvSelect.CustomDropDownFormEhReturnParams(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
begin
  if DynParams = nil then
    Exit;

  DynParams['ID'].AsInteger := srcMaterials.DataSet.FieldByName('M_Id').AsInteger;
  DynParams['Name'].AsString := srcMaterials.DataSet.FieldByName('name').AsString;
  DynParams['Cost'].AsFloat := srcMaterials.DataSet.FieldByName('Cost').AsFloat;
  DynParams['B_Quant'].AsFloat := srcMaterials.DataSet.FieldByName('B_Quant').AsFloat;
  DynParams['dimension'].AsString := srcMaterials.DataSet.FieldByName('dimension').AsString;
end;

class function TMaterialsInvSelect.GetGlobalRef: TCustomDropDownFormEh;
begin
  if SelectMaterials = nil then
    Application.CreateForm(TMaterialsInvSelect, SelectMaterials);
  Result := SelectMaterials;
end;

procedure TMaterialsInvSelect.CustomDropDownFormEhShow(Sender: TObject);
begin
  MainGrid.SetFocus;
  MainGrid.SearchPanel.Active := True;
end;

initialization

RegisterClass(TMaterialsInvSelect);

end.
