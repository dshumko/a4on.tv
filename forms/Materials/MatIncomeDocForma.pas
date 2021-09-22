unit MatIncomeDocForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, Vcl.StdCtrls,
  DBLookupEh, DBCtrlsEh, Vcl.Mask, EhLibVCL, GridsEh, DBAxisGridsEh,
  Data.DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  CnErrorProvider, FIBQuery, pFIBQuery, DBGridEhGrouping, Vcl.Buttons,
  Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TMatIncomeDocForm = class(TForm)
    pnlHead: TPanel;
    pnlMat: TPanel;
    dsDoc: TpFIBDataSet;
    dsDocMat: TpFIBDataSet;
    srcDoc: TDataSource;
    srcDocMat: TDataSource;
    dbgDocMat: TDBGridEh;
    pnlMatAdd: TPanel;
    edtD_N: TDBEditEh;
    deD_DATE: TDBDateTimeEditEh;
    dbmhD_NOTICE: TDBMemoEh;
    lcbWH: TDBLookupComboboxEh;
    lbl1: TLabel;
    Label1: TLabel;
    lbl2: TLabel;
    Label2: TLabel;
    dsFindMat: TpFIBDataSet;
    edtMaterial: TDBEditEh;
    edtQuant: TDBNumberEditEh;
    memNotice: TDBMemoEh;
    btnAdd: TButton;
    lbl3: TLabel;
    Label3: TLabel;
    lblDem: TLabel;
    btnSave: TButton;
    btnClose: TButton;
    dsMaterials: TpFIBDataSet;
    trRead: TpFIBTransaction;
    errors: TCnErrorProvider;
    dsWH: TpFIBDataSet;
    srcWH: TDataSource;
    qCloseDoc: TpFIBQuery;
    lbl5: TLabel;
    lcbShipper: TDBLookupComboboxEh;
    dsShippers: TpFIBDataSet;
    srcShippers: TDataSource;
    lbl6: TLabel;
    edtShipper: TDBNumberEditEh;
    btnOpen: TButton;
    qOpenDoc: TpFIBQuery;
    btnDel: TBitBtn;
    lbl4: TLabel;
    ednTTN: TDBNumberEditEh;
    lbl7: TLabel;
    ednItogo: TDBNumberEditEh;
    actList: TActionList;
    actDelRecord: TAction;
    actDocOpen: TAction;
    actDocClose: TAction;
    actEditNote: TAction;
    pmGrid: TPopupMenu;
    miEditNote: TMenuItem;
    N1: TMenuItem;
    miDelete: TMenuItem;
    pnlFile: TPanel;
    edtFILE: TDBEditEh;
    btnScaner: TButton;
    dlgOpen: TOpenDialog;
    btnOpenFile: TButton;
    qReqFile: TpFIBQuery;
    qSaveFile: TpFIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtMaterialOpenDropDownForm(EditControl: TControl; Button: TEditButtonEh; var DropDownForm: TCustomForm;
      DynParams: TDynVarsEh);
    procedure edtMaterialCloseDropDownForm(EditControl: TControl; Button: TEditButtonEh; Accept: Boolean;
      DropDownForm: TCustomForm; DynParams: TDynVarsEh);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaterialEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dsDocNewRecord(DataSet: TDataSet);
    procedure btnCloseClick(Sender: TObject);
    procedure srcDocStateChange(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure actDelRecordExecute(Sender: TObject);
    procedure actEditNoteExecute(Sender: TObject);
    procedure btnScanerClick(Sender: TObject);
    procedure edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
    procedure dsDocAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fMatDocID: Integer;
    fAddedMatID: Integer;
    FReadOnly: Boolean;
    FNeedDelete: Boolean;
    FFileForSave: String;
    procedure SetMatDocID(value: Integer);
    function CheckRowData: Boolean;
    procedure AddRow;
    procedure SetReadOnlyMode(const readOnly: Boolean = true);
    function GetFile: String;
    procedure SetFile(value: String);
    procedure ViewFile();
    procedure SaveFileToDB();
  public
    { Public declarations }
    property FileForSave: String read GetFile write SetFile;
    property MatDocId: Integer read fMatDocID write SetMatDocID;
  end;

procedure MaterialIncomeDocument(MatDocId: Integer);

implementation

uses
  DM, MAIN, DropDownFormEh, PrjConst, TextEditForma, ScanImageForma, AtrCommon,
  Winapi.ShellAPI;

{$R *.dfm}

const
  DocumentType: Integer = 1;

type
  TDBEditEhCrack = class(TDBEditEh);

procedure MaterialIncomeDocument(MatDocId: Integer);
var
  MDF: TMatIncomeDocForm;
  i: Integer;
  f: Integer;
begin
  f := -1;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i].tag = MatDocId) and (A4MainForm.MDIChildren[i] is TMatIncomeDocForm) then
      begin
        f := i;
        A4MainForm.MDIChildren[f].Show;
      end;

  if (f = -1) then
  begin
    MDF := TMatIncomeDocForm.Create(Application);
    MDF.MatDocId := MatDocId;
    MDF.Show;
  end;
end;

procedure TMatIncomeDocForm.SetReadOnlyMode(const readOnly: Boolean = true);
begin
  FReadOnly := readOnly;
  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Post;
  if dsDocMat.State in [dsEdit, dsInsert] then
    dsDocMat.Post;

  dbgDocMat.readOnly := readOnly;
  pnlMatAdd.Visible := not readOnly;
  dsMaterials.Active := not readOnly;
  srcDoc.AutoEdit := not readOnly;
  btnSave.Visible := not readOnly;
  btnClose.Enabled := dmMain.AllowedAction(rght_Dictionary_MatDoc_Close);
  btnClose.Visible := not readOnly;
  btnOpen.Visible := readOnly and dmMain.AllowedAction(rght_Dictionary_MatDoc_Edit);
  pnlFile.Enabled := not readOnly;
end;

procedure TMatIncomeDocForm.SetMatDocID(value: Integer);
begin
  dsDoc.ParamByName('DOC_ID').value := value;
  dsDoc.ParamByName('DocumentType').value := DocumentType;
  dsDoc.Open;
  if value = -1 then
  begin
    dsDoc.Insert;
  end
  else
  begin
    if dsDoc.RecordCount = 0 then
    begin
      ActiveControl := edtD_N;
      dsDoc.Insert;
    end
    else
    begin
      ActiveControl := edtMaterial;
      if dsDoc['Doc_Closed'] <> 0 then
        SetReadOnlyMode(true);
    end;
  end;
  dsDoc.tag := value;

  if dsDoc.FieldByName('Doc_N').IsNull then
    Caption := rsMadDocIn
  else
    Caption := dsDoc['Doc_N'] + ' ' + rsMadDocIn;
end;

procedure TMatIncomeDocForm.FormCreate(Sender: TObject);
begin
  FNeedDelete := False;
  FFileForSave := '';
  edtFILE.Hint := '';
end;

procedure TMatIncomeDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if not FFileForSave.IsEmpty then
  begin
    SaveFileToDB();
  end;

  if FNeedDelete and (not FFileForSave.IsEmpty) and FileExists(FFileForSave) then
    DeleteFile(FFileForSave);

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, true);
  // dbgPayDocPayment.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgPayDocPayment', true);
  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Cancel;
  if dsMaterials.Active then
    dsMaterials.Close;
  if dsWH.Active then
    dsWH.Close;
  if dsDocMat.Active then
    dsDocMat.Close;
  if dsDoc.Active then
    dsDoc.Close;
  if dsShippers.Active then
    dsShippers.Close;
  Action := caFree;
end;

procedure TMatIncomeDocForm.edtMaterialOpenDropDownForm(EditControl: TControl; Button: TEditButtonEh;
  var DropDownForm: TCustomForm; DynParams: TDynVarsEh);
begin
  fAddedMatID := -1;
  DynParams['ID'].Clear;
  DynParams['NAME'].AsString := edtMaterial.Text;
  DynParams['DATASET'].AsRefObject := dsMaterials;
end;

procedure TMatIncomeDocForm.edtMaterialCloseDropDownForm(EditControl: TControl; Button: TEditButtonEh; Accept: Boolean;
  DropDownForm: TCustomForm; DynParams: TDynVarsEh);
begin
  if DynParams.FindDynVar('Name') <> nil then
    edtMaterial.Text := DynParams['Name'].AsString;
  if DynParams.FindDynVar('dimension') <> nil then
    lblDem.Caption := rsQuant + ', ' + DynParams['dimension'].AsString;
  if DynParams.FindDynVar('ID') <> nil then
  begin
    fAddedMatID := DynParams['ID'].AsInteger;
    edtQuant.SetFocus;
  end;
  ednTTN.value := dsDocMat.RecordCount + 1;
end;

procedure TMatIncomeDocForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := False
    else if (ActiveControl is TDBMemoEh) then
      go := not((ActiveControl as TDBMemoEh).Lines.Text.Length > 20);

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TMatIncomeDocForm.edtMaterialEnter(Sender: TObject);
var
  AutoRepeat: Boolean;
begin
  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Post;

  if not dsMaterials.Active then
    dsMaterials.Open;

  if dsMaterials.Filtered then
  begin
    dsMaterials.Filter := '';
    dsMaterials.Filtered := False;
  end;

  if TDBEditEhCrack(edtMaterial).FButtonsBox.ControlCount > 0 then
    TDBEditEhCrack(edtMaterial).FButtonsBox.BtnCtlList[1].EditButtonControl.EditButtonDown(1, AutoRepeat);
end;

procedure TMatIncomeDocForm.FormShow(Sender: TObject);
var
  fVisibleCost: Boolean;
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  dsDocMat.Open;
  dsWH.Open;
  dsShippers.Open;
  fAddedMatID := -1;

  fVisibleCost := (dmMain.AllowedAction(rght_Material_Cost));
  for i := 0 to dbgDocMat.Columns.Count - 1 do
  begin
    if dbgDocMat.Columns[i].FieldName = 'SHIPPER_COST' then
      dbgDocMat.Columns[i].Visible := fVisibleCost
    else if dbgDocMat.Columns[i].FieldName = 'ITOGO' then
      dbgDocMat.Columns[i].Visible := fVisibleCost;
  end;

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
end;

procedure TMatIncomeDocForm.btnSaveClick(Sender: TObject);
begin
  dsDoc.Post;
end;

procedure TMatIncomeDocForm.btnAddClick(Sender: TObject);
begin
  if CheckRowData then
    AddRow;
end;

function TMatIncomeDocForm.CheckRowData: Boolean;
begin
  Result := fAddedMatID <> -1;
  if Result then
    Result := VarIsFloat(edtQuant.value)
end;

procedure TMatIncomeDocForm.actDelRecordExecute(Sender: TObject);
begin
  if (dsDocMat.RecordCount = 0) or (dsDocMat.FieldByName('NAME').IsNull) or (dsDoc['DOC_CLOSED'] = 1) then
    Exit;

  if Application.MessageBox(PWideChar(format(rsDeleteRecord, [dsDocMat.FieldByName('NAME').AsString])),
    PWideChar(rsDeleteFromDoc), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    dsDocMat.Delete;
  end;
end;

procedure TMatIncomeDocForm.actEditNoteExecute(Sender: TObject);
var
  s: string;
begin
  // TextEditForma
  if (FReadOnly) or (not dsDocMat.Active) or (dsDocMat.RecordCount = 0) or (dsDocMat.FieldByName('ID').IsNull) then
    Exit;

  if dsDocMat.FieldByName('M_Notice').IsNull then
    s := ''
  else
    s := dsDocMat.FieldByName('M_Notice').AsString;

  if EditText(s, '����������', '���������� ��� ������') then
  begin
    with TpFIBQuery.Create(Self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.Text := 'update Materials_In_Doc set M_Notice = :Notice where (Id = :Id)';
        ParamByName('NOTICE').value := s;
        ParamByName('ID').value := dsDocMat.FieldByName('ID').AsInteger;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
        dsDocMat.Refresh;
      finally
        free;
      end;
  end;
end;

procedure TMatIncomeDocForm.AddRow;
begin
  if not dsDocMat.Active then
    dsDocMat.Open;

  dsDocMat.Append;
  dsDocMat['DOC_ID'] := dsDoc['DOC_ID'];
  dsDocMat['NAME'] := edtMaterial.Text;
  dsDocMat['M_Id'] := fAddedMatID;
  dsDocMat['M_QUANT'] := edtQuant.value;
  if VarIsFloat(edtShipper.value) then
    dsDocMat['shipper_Cost'] := edtShipper.value
  else
  begin
    if VarIsFloat(ednItogo.value) then
      dsDocMat['shipper_Cost'] := ednItogo.value / edtQuant.value;
  end;
  dsDocMat['M_Notice'] := memNotice.Lines.Text;
  dsDocMat['TTN'] := ednTTN.Text;
  dsDocMat.Post;
  dsDocMat.CloseOpen(true);
  edtQuant.Text := '';
  edtShipper.Text := '';
  memNotice.Lines.Text := '';
  fAddedMatID := -1;
  edtMaterial.SetFocus;
end;

procedure TMatIncomeDocForm.dsDocAfterOpen(DataSet: TDataSet);
begin
  if not dsDoc.FieldByName('Bl_Name').IsNull then
  begin
    edtFILE.Text := dsDoc.FieldByName('Bl_Name').AsString;
    FFileForSave := '';
  end;
end;

procedure TMatIncomeDocForm.dsDocNewRecord(DataSet: TDataSet);
begin
  dsDoc['DT_ID'] := DocumentType; // ��������� ��������
  if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    dsDoc['DOC_DATE'] := Now;
  if dsWH.RecordCount = 1 then
    dsDoc['Wh_Id'] := dsWH['O_ID'];
end;

procedure TMatIncomeDocForm.btnCloseClick(Sender: TObject);
begin
  if dsDoc.State in [dsEdit, dsEdit] then
  begin
    dsDoc.Post;
    dsDoc.Refresh;
  end;
  if dsDocMat.State in [dsEdit, dsEdit] then
    dsDocMat.Post;

  if (lcbWH.Text = '') then
  begin
    lcbWH.SetFocus;
    Exit;
  end;

  if (not dsDocMat.IsEmpty) and (dsDoc['DOC_CLOSED'] = 0) then
  begin
    qCloseDoc.ParamByName('DOC_ID').AsInteger := dsDoc['DOC_ID'];
    qCloseDoc.Transaction.StartTransaction;
    qCloseDoc.ExecQuery;
    qCloseDoc.Transaction.Commit;
    dsDoc.Refresh;
    SetReadOnlyMode(true);
  end;
end;

procedure TMatIncomeDocForm.btnDelClick(Sender: TObject);
begin
  actDelRecord.Execute;
end;

procedure TMatIncomeDocForm.srcDocStateChange(Sender: TObject);
begin
  btnSave.Enabled := (dsDoc.State in [dsEdit, dsInsert]);
end;

procedure TMatIncomeDocForm.btnOpenClick(Sender: TObject);
begin
  if (not dsDocMat.IsEmpty) and (dsDoc['DOC_CLOSED'] = 1) then
  begin
    qOpenDoc.ParamByName('DOC_ID').AsInteger := dsDoc['DOC_ID'];
    qOpenDoc.Transaction.StartTransaction;
    qOpenDoc.ExecQuery;
    qOpenDoc.Transaction.Commit;
    dsDoc.Refresh;
    SetReadOnlyMode(False);
  end;
end;

procedure TMatIncomeDocForm.btnOpenFileClick(Sender: TObject);
begin
  ViewFile();
end;

function TMatIncomeDocForm.GetFile: String;
begin
  Result := FFileForSave;
end;

procedure TMatIncomeDocForm.SetFile(value: String);
var
  s: String;
begin
  FFileForSave := value;
  if not value.IsEmpty then
  begin
    s := ExtractFileExt(FFileForSave);
    if UpperCase(s) = '.TMP' then
    begin
      s := ExtractFileName(value);
      s := ChangeFileExt(s, '.JPG');
    end
    else
      s := ExtractFileName(value);
    edtFILE.Text := s;
    edtFILE.Hint := value;
    edtFILE.tag := 1;
  end;
end;

procedure TMatIncomeDocForm.edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if dlgOpen.Execute then
  begin
    FileForSave := dlgOpen.FileName;
  end;

  Handled := true;
end;

procedure TMatIncomeDocForm.btnScanerClick(Sender: TObject);
var
  FileName: String;
  NeedSave: Boolean;
begin
  FileName := ScanDocument(False, NeedSave);
  FileForSave := FileName;
  edtFILE.Text := ExtractFileName(ChangeFileExt(FileName, '.jpg'));
  edtFILE.Enabled := False;
  FNeedDelete := true;
end;

procedure TMatIncomeDocForm.ViewFile();
var
  FileName: string;
begin
  if dsDoc.RecordCount = 0 then
    Exit;

  if dsDoc.FieldByName('BL_ID').IsNull then
  begin
    if edtFILE.Hint.IsEmpty then
      Exit;

    ShellExecute(Handle, 'open', PWideChar(edtFILE.Hint), nil, nil, SW_SHOWNORMAL);
  end;

  if dsDoc.FieldByName('Bl_Name').IsNull then
    Exit;

  FileName := GetTempDir + 'A4on\';
  if not DirectoryExists(FileName) then
    CreateDir(FileName);
  FileName := FileName + dsDoc['Bl_Name'];
  qReqFile.ParamByName('BL_ID').AsInteger := dsDoc['BL_ID'];
  qReqFile.Transaction.StartTransaction;
  qReqFile.ExecQuery;
  qReqFile.FieldByName('Bl_Body').SaveToFile(FileName);
  qReqFile.Close;
  qReqFile.Transaction.Rollback;
  ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TMatIncomeDocForm.SaveFileToDB();
var
  fs: TFileStream;
begin
  qSaveFile.ParamByName('Bl_Type').AsInteger := 3;
  qSaveFile.ParamByName('OWNER_ID').AsInteger := dsDoc['Doc_Id'];
  qSaveFile.ParamByName('Bl_Name').AsString := edtFILE.Text;
  fs := TFileStream.Create(FFileForSave, fmShareDenyNone);
  try
    qSaveFile.ParamByName('Bl_Body').LoadFromStream(fs);
  finally
    fs.free;
  end;
  qSaveFile.Transaction.StartTransaction;
  qSaveFile.ExecQuery;
  qSaveFile.Transaction.Commit;
end;

end.
