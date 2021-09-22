unit OTPTypesForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, System.Actions, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider, System.UITypes, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, DBLookupEh, DBCtrlsEh, Vcl.Mask,
  MemTableDataEh, MemTableEh;

type
  TOTPTypesForm = class(TGridForm)
    dsOTPTypes: TpFIBDataSet;
    srcSnglSrv: TDataSource;
    dsSnglSrv: TpFIBDataSet;
    pnlMain: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    mmoO_DESCRIPTION: TDBMemoEh;
    edtName: TDBEditEh;
    lbl2: TLabel;
    lcbSinglSrv: TDBLookupComboboxEh;
    chkPeriod: TDBCheckBoxEh;
    lbl1: TLabel;
    cbReport: TDBComboBoxEh;
    dbgAddons: TDBGridEh;
    srcAddons: TDataSource;
    ednCharCnt: TDBNumberEditEh;
    chkCharCalc: TDBCheckBoxEh;
    ednBasicCost: TDBNumberEditEh;
    ednMoreCost: TDBNumberEditEh;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    mtAddons: TMemTableEh;
    spl1: TSplitter;
    pmAddons: TPopupMenu;
    miDel: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure miDelClick(Sender: TObject);
  private
    procedure StartEdt(const New: Boolean = False);
    procedure StopEdt(const Cancel: Boolean);
    procedure InitControls;
    function GetJson: String;
    procedure ParseJson(const json: String);
    // function AccountExists: Boolean;
    procedure UpdateComboReport;
  public
    { Public declarations }
  end;

var
  OTPTypesForm: TOTPTypesForm;

implementation

uses DM, JsonDataObjects, FIBQuery, pFIBQuery;

{$R *.dfm}

procedure TOTPTypesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsOTPTypes.Close;
  Action := caFree;
  OTPTypesForm := nil;
end;

procedure TOTPTypesForm.FormShow(Sender: TObject);
begin
  inherited;
  // права пользователей
  fCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_OrdersTPType);
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  tbOk.Visible := False;
  tbCancel.Visible := tbOk.Visible;

  dsOTPTypes.Open;
  dbGrid.DefaultApplySorting;
  dsOTPTypes.First;
end;

procedure TOTPTypesForm.actNewExecute(Sender: TObject);
begin
  inherited;

  if fCanEdit then
    StartEdt(True);
end;

procedure TOTPTypesForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdt(True);
end;

procedure TOTPTypesForm.btnSaveLinkClick(Sender: TObject);
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

  {
    CnErrors.Dispose(edtAccount);
    if (not edtAccount.Text.IsEmpty) then
    begin
    if not AccountExists() then
    begin
    errors := True;
    CnErrors.SetError(edtAccount, rsSelectAccount, iaMiddleLeft, bsNeverBlink);
    end
    end;
  }

  if not errors then
    StopEdt(False);
end;

procedure TOTPTypesForm.actDeleteExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (not fCanEdit) then
    exit;

  if (not (srcDataSource.DataSet.State in [dsEdit, dsInsert])) then
  begin
    if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
  end
  else
  begin
    if Self.ActiveControl = dbgAddons then
    begin
      if not mtAddons.FieldByName('name').IsNull then
        s := mtAddons['name']
      else
        s := '';
      if (MessageDlg(format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        mtAddons.Delete;
    end;

  end;
end;

procedure TOTPTypesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdt();
end;

procedure TOTPTypesForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
end;

procedure TOTPTypesForm.StartEdt(const New: Boolean = False);
begin
  InitControls;

  if mtAddons.Active then
    mtAddons.Close;
  mtAddons.Open;
  mtAddons.EmptyTable;

  dsSnglSrv.Open;

  if not dsOTPTypes.FieldByName('O_CHARFIELD').IsNull then
    ParseJson(dsOTPTypes['O_CHARFIELD']);

  StartEdit(New);

  // if (not New) then
  // dsOTPTypes.Edit;
end;

procedure TOTPTypesForm.StopEdt(const Cancel: Boolean);
var
  s: string;
begin
  if (not Cancel) then
  begin
    if (mtAddons.Active and (mtAddons.State in [dsEdit, dsInsert])) then
      mtAddons.Post;

    s := GetJson;
    dsOTPTypes['O_CHARFIELD'] := s;
  end;

  StopEdit(Cancel);

  dsSnglSrv.Close;
  if mtAddons.Active then
    mtAddons.Close;
end;

procedure TOTPTypesForm.InitControls;
begin
  lcbSinglSrv.Value := null;
  cbReport.Text := '';
  chkCharCalc.Checked := False;
  chkPeriod.Checked := False;

  if cbReport.Items.Count = 0 then
    UpdateComboReport;

  cbReport.Text := '';
end;

procedure TOTPTypesForm.miDelClick(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (not mtAddons.Active) or (mtAddons.RecordCount = 0) then
    exit;

  if not mtAddons.FieldByName('name').IsNull then
    s := mtAddons['NAME']
  else
    s := '';

  if (MessageDlg(format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    mtAddons.Delete;
end;

procedure TOTPTypesForm.ParseJson(const json: String);
var
  JO: TJsonObject;
  i: Integer;
begin
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('SnglSrv') then
    begin
      if not JO['SnglSrv'].IsNull then
        lcbSinglSrv.Value := JO['SnglSrv'];
    end;

    if JO.Contains('CharCalc') then
    begin
      if not JO['CharCalc'].IsNull then
        chkCharCalc.Checked := JO.B['CharCalc'];
    end;

    if JO.Contains('CCnt') then
    begin
      if not JO['CCnt'].IsNull then
        ednCharCnt.Value := JO.i['CCnt'];
    end;
    if JO.Contains('BCost') then
    begin
      if not JO['BCost'].IsNull then
        ednBasicCost.Value := JO.F['BCost'];
    end;
    if JO.Contains('MCost') then
    begin
      if not JO['MCost'].IsNull then
        ednMoreCost.Value := JO.F['MCost'];
    end;

    if JO.Contains('Period') then
    begin
      if not JO['Period'].IsNull then
        chkPeriod.Checked := JO.B['Period'];
    end;

    if JO.Contains('report') then
    begin
      if not JO['report'].IsNull then
        cbReport.Value := JO.i['report'];
    end;

    if JO.Contains('Params') then
    begin
      mtAddons.Open;
      mtAddons.DisableControls;
      mtAddons.EmptyTable;
      for i := 0 to JO.A['Params'].Count - 1 do
      begin
        mtAddons.Append;
        mtAddons['name'] := JO.A['Params'].O[i].s['name'];
        mtAddons['cost'] := JO.A['Params'].O[i].F['cost'];
        if JO.A['Params'].O[i].Contains('dc') then
          mtAddons['dc'] := JO.A['Params'].O[i].i['dc']
        else
          mtAddons['dc'] := 0;
        if JO.A['Params'].O[i].Contains('rc') then
          mtAddons['rc'] := JO.A['Params'].O[i].i['rc']
        else
          mtAddons['rc'] := 0;
        mtAddons.Post;
      end;
      mtAddons.First;
      mtAddons.EnableControls;
    end;
  finally
    JO.Free;
  end;
end;

function TOTPTypesForm.GetJson: String;
var
  JO, O: TJsonObject;
begin
  JO := TJsonObject.Create;
  try
    if not lcbSinglSrv.Text.IsEmpty then
      JO['SnglSrv'] := lcbSinglSrv.Value;
    if not cbReport.Text.IsEmpty then
      JO.i['report'] := cbReport.Value;

    JO.B['CharCalc'] := chkCharCalc.Checked;
    if not ednCharCnt.Text.IsEmpty then
      JO.F['CCnt'] := ednCharCnt.Value;
    if not ednBasicCost.Text.IsEmpty then
      JO.F['BCost'] := ednBasicCost.Value;
    if not ednMoreCost.Text.IsEmpty then
      JO.F['MCost'] := ednMoreCost.Value;

    JO.B['Period'] := chkPeriod.Checked;

    if mtAddons.RecordCount > 0 then
    begin
      mtAddons.DisableControls;
      mtAddons.First;
      while not mtAddons.Eof do
      begin
        if (not mtAddons.FieldByName('name').IsNull) and (mtAddons['name'] <> '') then
        begin
          O := TJsonObject.Create;
          O.s['name'] := mtAddons['name'];
          if not mtAddons.FieldByName('cost').IsNull then
            O.F['cost'] := mtAddons['cost'];
          if (not mtAddons.FieldByName('dc').IsNull) and (mtAddons['dc'] = 1) then
            O.i['dc'] := mtAddons['dc'];
          if (not mtAddons.FieldByName('rc').IsNull) and (mtAddons['rc'] = 1) then
            O.i['rc'] := mtAddons['rc'];
          JO.A['Params'].Add(O);
        end;
        mtAddons.Next;
      end;
      mtAddons.EnableControls;
    end;

    Result := JO.ToString;
  finally
    JO.Free;
  end;
end;

{
  function TOTPTypesForm.AccountExists: Boolean;
  var
  s: String;
  fq: TpFIBQuery;
  begin
  Result := False;
  s := edtAccount.Text.Trim;
  if s.IsEmpty then
  exit;

  fq := TpFIBQuery.Create(Self);
  try
  fq.Database := dmMain.dbTV;
  fq.Transaction := dmMain.trReadQ;
  fq.sql.Text := 'select customer_id from customer where account_no = :account_no';

  fq.ParamByName('ACCOUNT_NO').AsString := s;
  fq.Transaction.StartTransaction;
  fq.ExecQuery;
  Result := (fq.RecordCount > 0);
  fq.Close;
  fq.Transaction.Commit;
  finally
  fq.Free;
  end;
  end;
}

procedure TOTPTypesForm.UpdateComboReport;
var
  s: string;
  fq: TpFIBQuery;
begin
  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trReadQ;
    fq.sql.Clear;

    fq.sql.Add('select');
    fq.sql.Add('r.report_name,');
    fq.sql.Add('coalesce((select FULL_NAME from get_fullname_report(r.id_parent, ''/'')),'''') FULL_NAME,');
    fq.sql.Add('r.id_report');
    fq.sql.Add('from REPORTS r');
    fq.sql.Add('where not r.report_body is null');
    fq.sql.Add('order by 2,1');
    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    while not fq.Eof do
    begin
      s := fq.FN('report_name').AsString;
      if (fq.FN('FULL_NAME').AsString <> '') then
        s := fq.FN('FULL_NAME').AsString + '/' + s;

      cbReport.Items.Add(s);
      cbReport.KeyItems.Add(fq.FN('id_report').AsString);
      fq.Next;
    end;
    fq.Close;
    fq.Transaction.Commit;
  finally
    fq.Free;
  end;
end;

end.
