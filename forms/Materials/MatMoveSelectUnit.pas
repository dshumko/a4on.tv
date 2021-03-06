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
  ToolCtrlsEh, DBGridEhToolCtrls, MemTableDataEh, DBAxisGridsEh, DropDownFormEh, DataDriverEh, DBVertGridsEh, DynVarsEh, EhLibVCL,
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
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure srcMaterialsDataChange(Sender: TObject; Field: TField);
    procedure CustomDropDownFormEhInitForm(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
    procedure CustomDropDownFormEhReturnParams(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
    procedure CustomDropDownFormEhShow(Sender: TObject);
  public
    class function GetGlobalRef: TCustomDropDownFormEh; override;
  end;

var
  SelectMaterials: TMaterialsMoveSelect;

implementation

uses
  Data.DBConsts;

{$R *.DFM}

type
  TSpeedButtonCrack = class(TSpeedButton);

  { TForm2 }

procedure TMaterialsMoveSelect.FormCreate(Sender: TObject);
begin
  // ditVendor := TfEditVendor.Create(Self);

  Panel3.DoubleBuffered := True;
  Panel3.ParentBackground := False;

  FormElements := [ddfeLeftGripEh, ddfeRightGripEh, ddfeCloseButtonEh];
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
  if sbOk.Enabled
  then sbOkClick(Sender);
end;

procedure TMaterialsMoveSelect.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE
  then begin
    if not MainGrid.SearchPanel.Active
    then begin
      ModalResult := mrCancel;
      Visible := False;
    end;
  end
  else if Key = VK_RETURN
  then begin
    if not MainGrid.SearchPanel.Active
    then sbOkClick(Sender);
  end;
end;

procedure TMaterialsMoveSelect.SpeedButton4Click(Sender: TObject);
begin
  KeepFormVisible := True;
  try
    // fEditVendor.Position := poDesigned;
    // fEditVendor.Position := poOwnerFormCenter;
    // if fEditVendor.ShowModal = mrOk
    // then begin
    // if dsEdit = MemTableEh1.State
    // then MemTableEh1.Post
    // end
    // else MemTableEh1.Cancel;
  finally
    KeepFormVisible := False;
  end;
end;

procedure TMaterialsMoveSelect.SpeedButton3Click(Sender: TObject);
begin
  KeepFormVisible := True;
  try
    // MemTableEh1.Append;
    // fEditVendor.Position := poDesigned;
    // fEditVendor.Position := poOwnerFormCenter;
    // if (fEditVendor.ShowModal = mrOk) and MemTableEh1.Modified
    // then begin
    // MemTableEh1.Post
    // end
    // else MemTableEh1.Cancel;
  finally
    KeepFormVisible := False;
  end;
end;

procedure TMaterialsMoveSelect.srcMaterialsDataChange(Sender: TObject; Field: TField);
begin
  sbOk.Enabled := not srcMaterials.DataSet.IsEmpty;
end;

procedure TMaterialsMoveSelect.CustomDropDownFormEhInitForm(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
var
  vMaterial: String;
begin
  MainGrid.SearchPanel.CancelSearchFilter;
  MainGrid.SearchPanel.SearchingText := '';

  if DynParams = nil
  then Exit;

  vMaterial := DynParams['NAME'].AsString;
  srcMaterials.DataSet := (DynParams['DATASET'].AsRefObject as TDataSet);

  if vMaterial <> ''
  then MainGrid.SearchPanel.SearchingText := vMaterial;
end;

procedure TMaterialsMoveSelect.CustomDropDownFormEhReturnParams(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
begin
  if DynParams = nil
  then Exit;
  DynParams['ID'].AsInteger  := srcMaterials.DataSet.FieldByName('M_Id').AsInteger;
  DynParams['Name'].AsString := srcMaterials.DataSet.FieldByName('name').AsString;
  DynParams['Cost'].AsFloat  := srcMaterials.DataSet.FieldByName('Mr_Cost').AsFloat;
  DynParams['Quant'].AsFloat  := srcMaterials.DataSet.FieldByName('Mr_Quant').AsFloat;

  if not srcMaterials.DataSet.FieldByName('dimension').IsNull
  then DynParams['dimension'].AsString := srcMaterials.DataSet.FieldByName('dimension').AsString
  else DynParams['dimension'].AsString := '';

end;

class function TMaterialsMoveSelect.GetGlobalRef: TCustomDropDownFormEh;
begin
  if SelectMaterials = nil
  then Application.CreateForm(TMaterialsMoveSelect, SelectMaterials);
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
