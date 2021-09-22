unit MatSelectUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBGridEh, Buttons, Db, ExtCtrls, ComCtrls, GridsEh,
{$IFDEF EH_LIB_7} Themes, UxTheme, {$ENDIF}
{$IFDEF EH_LIB_17} System.UITypes, {$ENDIF}
  ADODB, ToolCtrlsEh, DBGridEhToolCtrls, MemTableDataEh,
  DBAxisGridsEh, StdCtrls, DropDownFormEh, DataDriverEh,
  DBVertGridsEh, DynVarsEh, DBCtrls, EhLibVCL,
  FIBDatabase, FIBDataSet, DBGridEhGrouping;

type
  TMaterialsSelect = class(TCustomDropDownFormEh)
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
  SelectMaterials: TMaterialsSelect;

implementation

uses DBConsts;

{$R *.DFM}

type
  TSpeedButtonCrack = class(TSpeedButton);

  { TForm2 }

procedure TMaterialsSelect.FormCreate(Sender: TObject);
begin
  // ditVendor := TfEditVendor.Create(Self);

  Panel3.DoubleBuffered := True;
  Panel3.ParentBackground := False;

  FormElements := [ddfeLeftGripEh, ddfeRightGripEh, ddfeCloseButtonEh];
end;

procedure TMaterialsSelect.sbOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

procedure TMaterialsSelect.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TMaterialsSelect.MainGridDblClick(Sender: TObject);
begin
  if sbOk.Enabled
  then sbOkClick(Sender);
end;

procedure TMaterialsSelect.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TMaterialsSelect.SpeedButton4Click(Sender: TObject);
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
  finally KeepFormVisible := False;
  end;
end;

procedure TMaterialsSelect.SpeedButton3Click(Sender: TObject);
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
  finally KeepFormVisible := False;
  end;
end;

procedure TMaterialsSelect.srcMaterialsDataChange(Sender: TObject; Field: TField);
begin
  sbOk.Enabled := not srcMaterials.DataSet.IsEmpty;
end;

procedure TMaterialsSelect.CustomDropDownFormEhInitForm(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
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

procedure TMaterialsSelect.CustomDropDownFormEhReturnParams(Sender: TCustomDropDownFormEh; DynParams: TDynVarsEh);
begin
  if DynParams = nil
  then Exit;
  DynParams['ID'].AsInteger := srcMaterials.DataSet.FieldByName('M_Id').AsInteger;
  DynParams['Name'].AsString := srcMaterials.DataSet.FieldByName('name').AsString;

  if not srcMaterials.DataSet.FieldByName('dimension').IsNull
  then DynParams['dimension'].AsString := srcMaterials.DataSet.FieldByName('dimension').AsString
  else DynParams['dimension'].AsString := '';

end;

class function TMaterialsSelect.GetGlobalRef: TCustomDropDownFormEh;
begin
  if SelectMaterials = nil
  then Application.CreateForm(TMaterialsSelect, SelectMaterials);
  Result := SelectMaterials;
end;

procedure TMaterialsSelect.CustomDropDownFormEhShow(Sender: TObject);
begin
  MainGrid.SetFocus;
  MainGrid.SearchPanel.Active := True;
end;

initialization

RegisterClass(TMaterialsSelect);

end.
