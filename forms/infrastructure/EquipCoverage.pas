unit EquipCoverage;

{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FIBDataSet, pFIBDataSet, DBLookupEh, DBCtrlsEh, OkCancel_frame, FIBQuery, pFIBQuery, GridsEh, PrjConst, DBGridEh;

type
  TEquipCoverageForm = class(TForm)
    Label6: TLabel;
    Label1: TLabel;
    LupStreets: TDBLookupComboboxEh;
    dsStreets: TpFIBDataSet;
    dsHouses: TpFIBDataSet;
    srcStreet: TDataSource;
    srcHouse: TDataSource;
    LupHOUSE_ID: TDBLookupComboboxEh;
    Query: TpFIBQuery;
    eNotice: TDBMemoEh;
    OkCancelFrame: TOkCancelFrame;
    srcCoverage: TDataSource;
    dsCoverage: TpFIBDataSet;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LupHOUSE_IDChange(Sender: TObject);
    procedure LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure LupHOUSE_IDEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure LupStreetsNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
    procedure pnlColorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OkCancelFramebbOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure CheckValidData;
  public

  end;

function EditEQCoverage(const EID: Integer; const HOUSE: Integer): Boolean;

implementation

uses
  DM, AtrCommon, StreetEditForma, HouseForma;

{$R *.dfm}

function EditEQCoverage(const EID: Integer; const HOUSE: Integer): Boolean;
begin
  with TEquipCoverageForm.Create(Application) do
    try
      dsCoverage.ParamByName('EID').AsInt64 := EID;
      dsCoverage.ParamByName('house_id').AsInt64 := HOUSE;
      dsCoverage.Open;
      if HOUSE = -1 then
        dsCoverage.Insert
      else
      begin
        LupStreets.Enabled := False;
        LupHOUSE_ID.Enabled := False;
        dsCoverage.Edit;
      end;
      dsCoverage['EID'] := EID;
      if ShowModal = mrOk then
      begin
        try
          dsCoverage.Post;
          result := true;
        except
          result := False;
        end;
      end
      else
        result := False;
    finally
      free
    end;
end;

procedure TEquipCoverageForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TEquipCoverageForm.CheckValidData;
var
  i: Boolean;
begin
  i := (dmMain.AllowedAction(rght_Customer_full)); // Изменение инфы о абоненте
  i := i or (dmMain.AllowedAction(rght_Dictionary_full)); // полный доступ
  i := i or dmMain.AllowedAction(rght_Dictionary_Equipment); // доступ к оборудованию
  i := i and not VarIsNull(LupHOUSE_ID.Value);

  OkCancelFrame.bbOk.Enabled := i;
end;

procedure TEquipCoverageForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsStreets.Close;
  dsHouses.Close;
end;

procedure TEquipCoverageForm.FormDestroy(Sender: TObject);
begin
  if dsCoverage.State in [dsEdit, dsInsert] then
    dsCoverage.Cancel;
end;

procedure TEquipCoverageForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  try
    if LupStreets.Text = '' then
    begin
      LupStreets.SetFocus;
      LupStreets.DropDown;
      ModalResult := mrNone;
      exit;
    end;
    if LupHOUSE_ID.Text = '' then
    begin
      LupHOUSE_ID.SetFocus;
      LupHOUSE_ID.DropDown;
      ModalResult := mrNone;
      exit;
    end;
  except
    ShowMessage(rsERROR_NOT_FILL_ALL);
    ModalResult := mrNone;
  end;
end;

procedure TEquipCoverageForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  OkCancelFrame.actExitExecute(Sender);

end;

procedure TEquipCoverageForm.FormShow(Sender: TObject);
begin
  dsStreets.Open;
  dsHouses.Open;

  OkCancelFrame.bbOk.Enabled := ((dmMain.AllowedAction(rght_Dictionary_full)) or
    (dmMain.AllowedAction(rght_Customer_full)));

  // спрячем кнопку + для добавления адреса если это запрещено
  LupStreets.EditButtons[0].Visible := ((dmMain.AllowedAction(rght_Dictionary_full)) or
    (dmMain.AllowedAction(rght_Customer_full)));
  LupHOUSE_ID.EditButtons[0].Visible := LupStreets.EditButtons[0].Visible;

end;

procedure TEquipCoverageForm.LupHOUSE_IDChange(Sender: TObject);
begin
  CheckValidData;
end;

procedure TEquipCoverageForm.LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: int64;
begin
  i := EditStreet(-1);
  if i > -1 then
  begin
    dsStreets.CloseOpen(true);
    dsCoverage['STREET_ID'] := i;
  end;
  Handled := true;
end;

procedure TEquipCoverageForm.LupHOUSE_IDEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: int64;
begin
  i := EditHouse(-1, dsStreets['STREET_ID']);
  if i > -1 then
  begin
    dsHouses.CloseOpen(true);
    dsCoverage['HOUSE_ID'] := i;
  end;
  Handled := true;
end;

procedure TEquipCoverageForm.LupStreetsNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  if (MessageDlg(rsStreetNotFound, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    LupStreetsEditButtons0Click(Sender, RecheckInList);
end;

procedure TEquipCoverageForm.pnlColorClick(Sender: TObject);
begin

end;

// ColorToRGB
end.
