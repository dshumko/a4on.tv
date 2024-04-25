unit VlansForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.UITypes, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.Controls,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, GridForma, ToolCtrlsEh, DBGridEhToolCtrls, FIBDataSet, pFIBDataSet, DBCtrlsEh,
  CnErrorProvider, GridsEh, DBAxisGridsEh, DBGridEh, PrjConst, amSplitter,
  PrnDbgeh;

type
  TVlansForm = class(TGridForm)
    dsVlans: TpFIBDataSet;
    dsEnabled: TpFIBDataSet;
    dsExists: TpFIBDataSet;
    srcExists: TDataSource;
    srcEnabled: TDataSource;
    pgcInfo: TPageControl;
    tsCoverage: TTabSheet;
    pnlCoverage: TPanel;
    spl2: TSplitter;
    pnlLeft: TPanel;
    lbl1: TLabel;
    dbgEnabled: TDBGridEh;
    pnlAddAdres: TPanel;
    lbl2: TLabel;
    dbgExists: TDBGridEh;
    spl1: TSplitter;
    tsUsers: TTabSheet;
    srcUsed: TDataSource;
    dbgUsed: TDBGridEh;
    dsUsed: TpFIBDataSet;
    btnViewInfo: TToolButton;
    btn1: TToolButton;
    actViewInfo: TAction;
    pnlButtons: TPanel;
    btnUGAdd: TSpeedButton;
    btnUGremove: TSpeedButton;
    actEditZones: TAction;
    btnFindIP: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    lbl3: TLabel;
    dbmmoNotice: TDBMemoEh;
    edtName: TDBEditEh;
    cbType: TDBComboBoxEh;
    edtVLAN_NUM: TDBEditEh;
    Label3: TLabel;
    edtIP_BEGIN: TDBEditEh;
    Label4: TLabel;
    edtMASK: TDBEditEh;
    edtIP_END: TDBEditEh;
    lbl5: TLabel;
    Label5: TLabel;
    edtGATEWAY: TDBEditEh;
    Label6: TLabel;
    edtDNS: TDBEditEh;
    Label7: TLabel;
    lbl6: TLabel;
    edtCONFIG_FILE: TDBEditEh;
    actCancel: TAction;
    tbPersTar: TToolBar;
    btnPersAdd: TToolButton;
    actEditAdr: TAction;
    tsAttr: TTabSheet;
    dbgCustAttr: TDBGridEh;
    srcAttributes: TDataSource;
    dsAttributes: TpFIBDataSet;
    ActListAttr: TActionList;
    actAttrAdd: TAction;
    actAttrEdit: TAction;
    actAttrDel: TAction;
    pnlAttrBtns: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnAdd: TSpeedButton;
    mmoCONFIG: TDBMemoEh;
    lblCFG: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure dbgEnabledDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure dbgEnabledDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure btnUGAddClick(Sender: TObject);
    procedure btnUGremoveClick(Sender: TObject);
    procedure dbgExistsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgExistsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pgcInfoChange(Sender: TObject);
    procedure actViewInfoExecute(Sender: TObject);
    procedure btnFindIPClick(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure edtIP_BEGINExit(Sender: TObject);
    procedure edtDNSEnter(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actEditAdrExecute(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure actAttrEditExecute(Sender: TObject);
    procedure actAttrDelExecute(Sender: TObject);
    procedure actAttrAddExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AddToCoverage;
    procedure DeleteFromCoverage;
  public
    { Public declarations }
  end;

var
  VlansForm: TVlansForm;

implementation

uses
  System.StrUtils,
  DM, pFIBQuery, A4onTypeUnit, AttributeEditForma, AtrStrUtils, AtrCommon;

{$R *.dfm}

procedure CorrectIP(EditCtrl: TDBEditEh);
begin
  EditCtrl.Text := ReplaceStr(EditCtrl.Text, ',', '.');
  EditCtrl.Text := ReplaceStr(AnsiUpperCase(EditCtrl.Text), 'Ю', '.');
end;

procedure TVlansForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsVlans.Close;
  VlansForm := nil;
end;

procedure TVlansForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    actCancel.Enabled := True;
    pgcInfo.Enabled := False;
    StartEdit(True);
  end;
end;

procedure TVlansForm.actViewInfoExecute(Sender: TObject);
begin
  inherited;
  actViewInfo.Checked := not actViewInfo.Checked;
  pgcInfo.Visible := actViewInfo.Checked;
  pgcInfoChange(Sender);
  spl1.Align := alTop;
  spl1.Align := alBottom;
end;

procedure TVlansForm.btnCancelLinkClick(Sender: TObject);
begin
  inherited;
  pgcInfo.Enabled := True;
end;

procedure TVlansForm.btnFindIPClick(Sender: TObject);
var
  s: string;
begin
  inherited;
  if dsVlans.FieldByName('V_ID').IsNull then
    Exit;

  s := '';
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select IP from GET_FREE_VLAN_IP(' + dsVlans.FieldByName('V_ID').AsString + ')';
      Transaction.StartTransaction;
      ExecQuery;
      if not EOF then
        s := FieldByName('IP').Value;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  ShowMessage('IP: ' + s);
end;

procedure TVlansForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;

  procedure CheckInputIP(EdtCtrl: TDBEditEh);
  begin
    if (not CheckIP(EdtCtrl.Text)) and (EdtCtrl.Text <> '') then
    begin
      errors := True;
      CnErrors.SetError(EdtCtrl, rsIPIncorrect, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(EdtCtrl);
  end;

begin
  errors := False;

  if (edtName.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  CheckInputIP(edtIP_BEGIN);
  CheckInputIP(edtIP_END);
  CheckInputIP(edtMASK);
  CheckInputIP(edtGATEWAY);
  CheckInputIP(edtDNS);

  if not errors then
  begin
    inherited;
    pgcInfo.Enabled := True;
    dsEnabled.CloseOpen(True);
  end;
end;

procedure TVlansForm.btnUGAddClick(Sender: TObject);
begin
  inherited;
  AddToCoverage;
end;

procedure TVlansForm.btnUGremoveClick(Sender: TObject);
begin
  inherited;
  DeleteFromCoverage;
end;

procedure TVlansForm.dbgEnabledDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Source = dbgExists then
    AddToCoverage;
end;

procedure TVlansForm.dbgEnabledDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := (Source = dbgExists);
end;

procedure TVlansForm.dbgExistsDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  if Source = dbgEnabled then
    DeleteFromCoverage;
end;

procedure TVlansForm.dbgExistsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := (Source = dbgEnabled);
end;

procedure TVlansForm.actAttrAddExecute(Sender: TObject);
var
  vAttribute: TAttribute;
begin
  inherited;
  if dsVlans.FieldByName('V_ID').IsNull then
    Exit;

  vAttribute.TYPE_ID := rsAttrID_vlan;
  vAttribute.OBJECT_ID := dsVlans['V_ID'];
  vAttribute.ATTR_ID := -1;
  vAttribute.Name := '';
  vAttribute.Value := '';
  vAttribute.Notice := '';
  if AttributeEdit(vAttribute) then
    dsAttributes.CloseOpen(True);
end;

procedure TVlansForm.actAttrDelExecute(Sender: TObject);
begin
  inherited;
  if (dsAttributes.RecordCount = 0) or (dsAttributes.FieldByName('OBJECT_ID').IsNull) then
    Exit;

  if myQuestion(rsDeleteCaption, Format(rsDeleteRecord, [dsAttributes['TA_NAME']])) then
  begin
    dsAttributes.Delete;
    dsAttributes.CloseOpen(True);
  end;
end;

procedure TVlansForm.actAttrEditExecute(Sender: TObject);
var
  vAttribute: TAttribute;
begin
  inherited;
  if (dsAttributes.RecordCount = 0) or (dsAttributes.FieldByName('OBJECT_ID').IsNull) then
    Exit;

  vAttribute.TYPE_ID := rsAttrID_vlan;
  vAttribute.OBJECT_ID := dsAttributes['OBJECT_ID'];
  vAttribute.ATTR_ID := dsAttributes['AID'];
  vAttribute.Name := dsAttributes['TA_NAME'];
  if not dsAttributes.FieldByName('AVALUE').IsNull then
    vAttribute.Value := dsAttributes['AVALUE'];
  if not dsAttributes.FieldByName('NOTICE').IsNull then
    vAttribute.Notice := dsAttributes['NOTICE'];
  if AttributeEdit(vAttribute) then
    dsAttributes.Refresh
end;

procedure TVlansForm.actCancelExecute(Sender: TObject);
begin
  if not FinEditMode then
    Exit;
  inherited;
  StopEdit(True);
  pgcInfo.Enabled := True;
  dsEnabled.CloseOpen(True);
  actCancel.Enabled := False;
end;

procedure TVlansForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteRecord, [srcDataSource.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
      srcDataSource.DataSet.Delete;
end;

procedure TVlansForm.actEditAdrExecute(Sender: TObject);
begin
  inherited;
  actEditAdr.Checked := not actEditAdr.Checked;
  dsEnabled.Filtered := False;
  dsEnabled.Filter := '';
  dsExists.Filtered := False;
  dsExists.Filter := '';
  dsExists.Active := actEditAdr.Checked;
  pnlAddAdres.Visible := actEditAdr.Checked;
  pnlAddAdres.Width := trunc(pnlCoverage.Width / 2);
  spl2.Align := alLeft;
  spl2.Align := alRight;
end;

procedure TVlansForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    if actEditAdr.Checked then
      actEditAdrExecute(Sender);
    actCancel.Enabled := True;
    pgcInfo.Enabled := False;
    StartEdit();
  end;
end;

procedure TVlansForm.FormShow(Sender: TObject);
begin
  inherited;
  fCanEdit := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Vlans)));
  fCanCreate := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Vlans)));

  // права пользователей
  actNew.Visible := fCanCreate;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;
  actEditAdr.Visible := fCanEdit or fCanCreate;
  dsVlans.Open;
  pgcInfoChange(Sender);
end;

procedure TVlansForm.pgcInfoChange(Sender: TObject);
begin
  inherited;
  dsEnabled.Active := (pgcInfo.ActivePage = tsCoverage) and pgcInfo.Visible;
  dsExists.Filtered := False;
  dsExists.Active := (pgcInfo.ActivePage = tsCoverage) and pgcInfo.Visible and pnlAddAdres.Visible and
    actEditAdr.Checked;
  dsUsed.Active := (pgcInfo.ActivePage = tsUsers) and pgcInfo.Visible;
  dsAttributes.Active := (pgcInfo.ActivePage = tsAttr) and pgcInfo.Visible;
end;

procedure TVlansForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TVlansForm.AddToCoverage;
var
  i: Integer;
  cr: TCursor;
begin
  if (dsVlans.FieldByName('v_id').IsNull) or (dbgExists.DataSource.DataSet.EOF) or
    (dbgExists.DataSource.DataSet.FieldByName('HOUSE_ID').IsNull) then
    Exit;

  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  dbgEnabled.DataSource.DataSet.DisableControls;
  dbgExists.DataSource.DataSet.DisableControls;
  dbgEnabled.SaveBookmark;
  if dbgExists.SelectedRows.Count > 0 then
  begin
    for i := 0 to dbgExists.SelectedRows.Count - 1 do
    begin
      dbgExists.DataSource.DataSet.Bookmark := dbgExists.SelectedRows[i];
      dsEnabled.Append;
      dsEnabled['HOUSE_ID'] := dbgExists.DataSource.DataSet['HOUSE_ID'];
      dsEnabled['O_ID'] := dsVlans['v_id'];
      dsEnabled.Post;
      // dbgEnabled.DataSource.DataSet.AppendRecord([dsVlans['v_id'], dbgExists.DataSource.DataSet['HOUSE_ID']]);
    end;
    dbgExists.Selection.Clear;
  end
  else
  begin
    dsEnabled.Append;
    dsEnabled['HOUSE_ID'] := dbgExists.DataSource.DataSet['HOUSE_ID'];
    dsEnabled['O_ID'] := dsVlans['v_id'];
    dsEnabled.Post;
    // dbgEnabled.DataSource.DataSet.AppendRecord([, ]);
  end;

  dbgEnabled.RestoreBookmark;
  dbgExists.DataSource.DataSet.Close;
  dbgExists.DataSource.DataSet.Open;
  dbgExists.DataSource.DataSet.EnableControls;
  dbgEnabled.DataSource.DataSet.Close;
  dbgEnabled.DataSource.DataSet.Open;
  dbgEnabled.DataSource.DataSet.EnableControls;
  Screen.Cursor := cr;
end;

procedure TVlansForm.DeleteFromCoverage;
var
  i: Integer;
  cr: TCursor;
begin
  if dbgEnabled.DataSource.DataSet.EOF then
    Exit;

  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  dbgExists.DataSource.DataSet.DisableControls;
  dbgEnabled.DataSource.DataSet.DisableControls;
  dbgEnabled.SaveBookmark;
  if dbgEnabled.SelectedRows.Count > 0 then
  begin
    for i := 0 to dbgEnabled.SelectedRows.Count - 1 do
    begin
      dbgEnabled.DataSource.DataSet.Bookmark := dbgEnabled.SelectedRows[i];
      dbgEnabled.DataSource.DataSet.Delete;
    end;
    dbgEnabled.Selection.Clear;
  end
  else
  begin
    dbgEnabled.DataSource.DataSet.Delete;
  end;

  dbgEnabled.RestoreBookmark;
  dbgExists.DataSource.DataSet.Close;
  dbgExists.DataSource.DataSet.Open;
  dbgExists.DataSource.DataSet.EnableControls;
  dbgEnabled.DataSource.DataSet.EnableControls;
  Screen.Cursor := cr;
end;

procedure TVlansForm.edtIP_BEGINExit(Sender: TObject);
var
  ip, Mask: String;
  m_bin: Integer;
  sa: TStringArray;
begin
  inherited;

  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
  if not(srcDataSource.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  ip := (Sender as TDBEditEh).Text;
  sa := Explode('/', ip);
  if length(sa) = 1 then
  begin
    CorrectIP((Sender as TDBEditEh));
  end
  else
  begin
    ip := sa[0];
    (Sender as TDBEditEh).Text := ip;
    CorrectIP((Sender as TDBEditEh));
    Mask := sa[1];
    if TryStrToInt(Mask, m_bin) then
    begin
      Mask := IntToMask(m_bin);
      if Mask <> '' then
        edtMASK.Text := Mask;
    end;
  end;
end;

procedure TVlansForm.edtDNSEnter(Sender: TObject);
begin
  inherited;
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

end.
