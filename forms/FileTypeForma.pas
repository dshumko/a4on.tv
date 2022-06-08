unit FileTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, DBLookupEh;

type
  TFileTypeForm = class(TGridForm)
    dsFileType: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    pmMemo: TPopupMenu;
    lcbSrvType: TDBLookupComboboxEh;
    lcbOnOffSrv: TDBLookupComboboxEh;
    cbOnOff: TDBComboBoxEh;
    lcbRequest: TDBLookupComboboxEh;
    dsSrvType: TpFIBDataSet;
    srcSrvType: TDataSource;
    dsReqType: TpFIBDataSet;
    srcReqType: TDataSource;
    dsOnOffSrv: TpFIBDataSet;
    srcOnOffSrv: TDataSource;
    chkOpenInet: TDBCheckBoxEh;
    dsReqTempl: TpFIBDataSet;
    srcReqTempl: TDataSource;
    lcbTempl: TDBLookupComboboxEh;
    lbl1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
  private
    { Private declarations }
    procedure memoMiClick(Sender: TObject);
    procedure StartEdt(const New: Boolean = False);
    procedure StopEdt(const Cancel: Boolean);
    procedure ParseJson(const json: String);
    function GetJson: String;
    procedure InitControls;
  public
    { Public declarations }
  end;

var
  FileTypeForm: TFileTypeForm;

implementation

uses
  DM, JsonDataObjects;

{$R *.dfm}

procedure TFileTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsFileType.Close;
  FileTypeForm := nil;
end;

procedure TFileTypeForm.FormCreate(Sender: TObject);
var
  NewItem: TMenuItem;
begin
  inherited;

  pmMemo.Items.Clear;

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldACCOUNT;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldBalance;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFULLNAME;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldSTREET;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldHouse;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFlat;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldCodeAbonent;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldOperator;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldCurrentDate;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFileSrv;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFileDate;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsFldFileOnOffSrv;
  NewItem.OnClick := memoMiClick;
  pmMemo.Items.Add(NewItem);

end;

procedure TFileTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdt(True);
end;

procedure TFileTypeForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdt(True);
end;

procedure TFileTypeForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

  if (edtName.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  if not errors then
    StopEdt(False);
end;

procedure TFileTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TFileTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdt();
end;

procedure TFileTypeForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := vFull;
  fCanCreate := fCanEdit;
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsFileType.Open;
  dbGrid.DefaultApplySorting;
  dsFileType.First;
end;

procedure TFileTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TFileTypeForm.memoMiClick(Sender: TObject);
begin
  if (Sender is TMenuItem) and (ActiveControl is TDBMemoEh) then
    (ActiveControl as TDBMemoEh).SelText := (Sender as TMenuItem).Caption;
end;

procedure TFileTypeForm.StartEdt(const New: Boolean = False);
begin
  InitControls;

  dsSrvType.Open;
  dsOnOffSrv.Open;
  dsReqType.Open;
  dsReqTempl.Open;

  if not dsFileType.FieldByName('O_CHARFIELD').IsNull then
    ParseJson(dsFileType['O_CHARFIELD']);

  StartEdit(New);
end;

procedure TFileTypeForm.StopEdt(const Cancel: Boolean);
var
  s: string;
begin
  if (not Cancel) then
  begin
    s := GetJson;
    dsFileType['O_CHARFIELD'] := s;
  end;

  StopEdit(Cancel);

  dsReqTempl.Close;
  dsReqType.Close;
  dsOnOffSrv.Close;
  dsSrvType.Close;
end;

procedure TFileTypeForm.ParseJson(const json: String);
var
  JO: TJsonObject;
begin
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('OnOff') then
    begin
      if not JO['OnOff'].IsNull then
        cbOnOff.Value := JO['OnOff'];
    end;
    if JO.Contains('SrvType') then
    begin
      if not JO['SrvType'].IsNull then
        lcbSrvType.Value := JO['SrvType'];
    end;
    if JO.Contains('SrvOnOff') then
    begin
      if not JO['SrvOnOff'].IsNull then
        lcbOnOffSrv.Value := JO['SrvOnOff'];
    end;
    if JO.Contains('ReqType') then
    begin
      if not JO['ReqType'].IsNull then
        lcbRequest.Value := JO['ReqType'];
    end;
    if JO.Contains('ReqTempl') then
    begin
      if not JO['ReqTempl'].IsNull then
        lcbTempl.Value := JO['ReqTempl'];
    end;

    if JO.Contains('OpenInet') then
    begin
      if not JO['OpenInet'].IsNull then
        chkOpenInet.Checked := JO.B['OpenInet'];
    end;
  finally
    JO.Free;
  end;
end;

function TFileTypeForm.GetJson: String;
var
  JO: TJsonObject;
begin
  JO := TJsonObject.Create;
  try
    if not cbOnOff.Text.IsEmpty then
      JO['OnOff'] := cbOnOff.Value;

    if not lcbSrvType.Text.IsEmpty then
      JO['SrvType'] := lcbSrvType.Value;

    if not lcbOnOffSrv.Text.IsEmpty then
      JO['SrvOnOff'] := lcbOnOffSrv.Value;

    if not lcbRequest.Text.IsEmpty then
      JO['ReqType'] := lcbRequest.Value;

    if not lcbTempl.Text.IsEmpty then
      JO['ReqTempl'] := lcbTempl.Value;

    JO.B['OpenInet'] := chkOpenInet.Checked;
    Result := JO.ToString
  finally
    JO.Free;
  end;
end;

procedure TFileTypeForm.InitControls;
begin
  cbOnOff.Value := null;
  lcbSrvType.Value := null;
  lcbOnOffSrv.Value := null;
  lcbRequest.Value := null;
  lcbTempl.Value := null;
  chkOpenInet.Checked := False;
end;

end.
