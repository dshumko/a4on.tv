unit PromoForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider,
  DBCtrlsEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh, DBLookupEh,
  FIBDatabase, pFIBDatabase, MemTableDataEh, MemTableEh,
  JsonDataObjects;

type
  TPromoForm = class(TGridForm)
    dsPromo: TpFIBDataSet;
    Label1: TLabel;
    dbeName: TDBEditEh;
    edStart: TDBDateTimeEditEh;
    edEND: TDBDateTimeEditEh;
    lbl2: TLabel;
    lbl3: TLabel;
    chkAll: TCheckBox;
    pnlService: TPanel;
    lbl4: TLabel;
    lcbService: TDBLookupComboboxEh;
    pnlSrvType: TPanel;
    lbl11: TLabel;
    lcbSrvType: TDBLookupComboboxEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsSrvType: TpFIBDataSet;
    dsService: TpFIBDataSet;
    srcSrvType: TDataSource;
    srcService: TDataSource;
    mmoText: TDBMemoEh;
    Label2: TLabel;
    dbgCF: TDBGridEh;
    mtCF: TMemTableEh;
    srcCF: TDataSource;
    lblCF: TLabel;
    btnPlus: TButton;
    btnMinus: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure dbeNameEnter(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure chkAllClick(Sender: TObject);
    procedure lcbServiceEnter(Sender: TObject);
    procedure lcbServiceClick(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
  private
    procedure InitControls;
    procedure ParseJson(const json: String);
    function GetJson: String;
    procedure StartEdt(const New: Boolean = False);
    procedure StopEdt(const Cancel: Boolean);
    function CheckDataOk: Boolean;
    procedure SetControls;
    procedure DatasetFromJson(var AJson: TJsonObject);
    procedure DatasetToJson(var AJson: TJsonObject);
  public
    { Public declarations }
  end;

var
  PromoForm: TPromoForm;

implementation

uses
  System.StrUtils, DM;

{$R *.dfm}

procedure TPromoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsPromo.Close;
  PromoForm := nil;
end;

procedure TPromoForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if ((not dmMain.AllowedAction(rght_Dictionary_full)) or (not dmMain.AllowedAction(rght_Dictionary_Services))) then
    exit;
  StartEdt(True);
end;

procedure TPromoForm.btnCancelLinkClick(Sender: TObject);
begin
  inherited;
  StopEdt(True);
end;

procedure TPromoForm.btnMinusClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Удалить запись?', 'Удаление', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    mtCF.Delete;
    dbgCF.SetFocus;
  end;
end;

procedure TPromoForm.btnPlusClick(Sender: TObject);
begin
  inherited;
  mtCF.Append;
  dbgCF.SetFocus;
end;

procedure TPromoForm.btnSaveLinkClick(Sender: TObject);
var
  NoErrors: Boolean;
begin
  NoErrors := CheckDataOk;
  if NoErrors then
  begin
    dsPromo.FieldByName('O_CHARFIELD').AsString := GetJson;
    inherited;
  end;
end;

procedure TPromoForm.dbeNameEnter(Sender: TObject);
begin
  inherited;
  CnErrors.Dispose(dbeName);
end;

procedure TPromoForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if ((not dmMain.AllowedAction(rght_Dictionary_full)) or (not dmMain.AllowedAction(rght_Dictionary_Services))) then
    exit;

  if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
    srcDataSource.DataSet.Delete;
end;

procedure TPromoForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if ((not dmMain.AllowedAction(rght_Dictionary_full)) or (not dmMain.AllowedAction(rght_Dictionary_Services))) then
    exit;
  StartEdt();
end;

procedure TPromoForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TPromoForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  tbOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  btnNew.Enabled := not tbOk.Enabled;
  btnEdit.Enabled := not tbOk.Enabled;
  btnDelete.Enabled := not tbOk.Enabled;
end;

procedure TPromoForm.FormCreate(Sender: TObject);
begin
  fCanEdit := dmMain.AllowedAction(rght_Mobile_full) or dmMain.AllowedAction(rght_Dictionary_Services);
  fCanCreate := dmMain.AllowedAction(rght_Mobile_full) or dmMain.AllowedAction(rght_Dictionary_Services);
  inherited;
  // права пользователей
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;
end;

procedure TPromoForm.FormShow(Sender: TObject);
begin
  inherited;
  dsPromo.Open;
end;

procedure TPromoForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
end;

function TPromoForm.CheckDataOk: Boolean;
var
  errors: Boolean;
begin
  errors := False;

  if (dbeName.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(dbeName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbeName);

  if (edStart.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edStart, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edStart);

  if (edEND.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edEND, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edEND);

  if mtCF.State in [dsEdit, dsInsert] then
  begin
    if (mtCF.FieldByName('dur').IsNull or mtCF.FieldByName('cf').IsNull) then
      mtCF.Cancel
    else
      mtCF.Post;
  end;
  if (mtCF.RecordCount = 0) then
  begin
    errors := True;
    CnErrors.SetError(lblCF, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(lblCF);

  Result := not errors;
end;

procedure TPromoForm.chkAllClick(Sender: TObject);
begin
  inherited;
  SetControls;
end;

procedure TPromoForm.InitControls;
begin
  chkAll.Checked := False;
  lcbService.Clear;
  lcbSrvType.Clear;
end;

procedure TPromoForm.lcbServiceClick(Sender: TObject);
begin
  inherited;
  if not(Sender is TDBLookupComboboxEh) then
    exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
end;

procedure TPromoForm.lcbServiceEnter(Sender: TObject);
begin
  inherited;
  //
end;

procedure TPromoForm.ParseJson(const json: String);
var
  JO: TJsonObject;
begin
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('cfs') then
    begin
      if not JO['cfs'].IsNull then
        DatasetFromJson(JO);
    end;
    if JO.Contains('all') then
    begin
      if not JO['all'].IsNull then
        chkAll.Checked := JO.B['all'];
    end;
    if JO.Contains('srv') then
    begin
      if not JO['srv'].IsNull then
        lcbService.Value := JO['srv'];
    end;
    if JO.Contains('srvt') then
    begin
      if not JO['srvt'].IsNull then
        lcbSrvType.Value := JO['srvt'];
    end;
  finally
    JO.Free;
  end;
  SetControls;
end;

function TPromoForm.GetJson: String;
var
  JO: TJsonObject;
begin
  JO := TJsonObject.Create;
  try
    JO.B['all'] := chkAll.Checked;
    if chkAll.Checked then
    begin
      if not lcbSrvType.Text.IsEmpty then
        JO['srvt'] := lcbSrvType.Value;
    end
    else
    begin
      if not lcbService.Text.IsEmpty then
        JO['srv'] := lcbService.Value;
    end;
    DatasetToJson(JO);
    Result := JO.ToString
  finally
    JO.Free;
  end;
end;

procedure TPromoForm.StartEdt(const New: Boolean = False);
begin
  InitControls;

  dsSrvType.Open;
  dsService.Open;
  mtCF.Open;
  mtCF.EmptyTable;

  if ((not New) and (not dsPromo.FieldByName('O_CHARFIELD').IsNull)) then
    ParseJson(dsPromo['O_CHARFIELD']);

  StartEdit(New);
end;

procedure TPromoForm.StopEdt(const Cancel: Boolean);
var
  s: string;
begin
  if (not Cancel) then
  begin
    s := GetJson;
    dsPromo['O_CHARFIELD'] := s;
  end;

  dsSrvType.Close;
  dsService.Close;
  mtCF.EmptyTable;
  mtCF.Close;

  StopEdit(Cancel);
end;

procedure TPromoForm.SetControls;
begin
  pnlService.Visible := not chkAll.Checked;
  pnlSrvType.Visible := chkAll.Checked;
end;

procedure TPromoForm.DatasetToJson(var AJson: TJsonObject);
var
  o: TJsonObject;
begin
  if mtCF.RecordCount = 0 then
    exit;

  mtCF.DisableControls;
  mtCF.First;
  while (not mtCF.EOF) do begin
    o := AJson.A['cfs'].AddObject;
    o.I['dur'] := mtCF.FieldByName('dur').AsInteger;
    o.F['cf'] := mtCF.FieldByName('cf').AsFloat;
    mtCF.Next;
  end;
  mtCF.EnableControls;
end;

procedure TPromoForm.DatasetFromJson(var AJson: TJsonObject);
var
  I: Integer;
  o: TJsonObject;
begin
  mtCF.DisableControls;
  mtCF.EmptyTable;
  for I := 0 to AJson.A['cfs'].Count - 1 do
  begin
    mtCF.Append;
    o := AJson.A['cfs'][I];
    mtCF.FieldByName('dur').AsInteger := o.I['dur'];
    mtCF.FieldByName('cf').AsFloat := o.F['cf'];
    mtCF.Post;
  end;
  mtCF.First;
  mtCF.EnableControls;
end;

end.
