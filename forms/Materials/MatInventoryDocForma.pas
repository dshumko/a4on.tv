unit MatInventoryDocForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, Vcl.StdCtrls,
  DBLookupEh, DBCtrlsEh, Vcl.Mask, EhLibVCL, GridsEh, DBAxisGridsEh,
  Data.DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  CnErrorProvider, FIBQuery, pFIBQuery, DBGridEhGrouping, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TMatInventoryDocForm = class(TForm)
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
    lbl4: TLabel;
    errors: TCnErrorProvider;
    dsWH: TpFIBDataSet;
    srcWH: TDataSource;
    qCloseDoc: TpFIBQuery;
    btnOpen: TButton;
    qOpenDoc: TpFIBQuery;
    pmGrid: TPopupMenu;
    miDelete: TMenuItem;
    actList: TActionList;
    actDelRecord: TAction;
    actDocOpen: TAction;
    actDocClose: TAction;
    lbl5: TLabel;
    edtBefore: TDBNumberEditEh;
    btnDel: TBitBtn;
    trWriteQ: TpFIBTransaction;
    N1: TMenuItem;
    actEditNote: TAction;
    miEditNote: TMenuItem;
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
    procedure srcDocStateChange(Sender: TObject);
    procedure actDelRecordExecute(Sender: TObject);
    procedure actDocOpenExecute(Sender: TObject);
    procedure actDocCloseExecute(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure actEditNoteExecute(Sender: TObject);
  private
    { Private declarations }
    fMatDocID: Integer;
    fAddedMatID: Integer;
    FReadOnly: Boolean;
    procedure SetMatDocID(value: Integer);
    function CheckRowData: Boolean;
    procedure AddRow;
    procedure SetReadOnlyMode(const readOnly: Boolean = true);
  public
    { Public declarations }
    property MatDocId: Integer read fMatDocID write SetMatDocID;
  end;

procedure MaterialInventoryDocument(MatDocId: Integer);

implementation

uses
  DM, MAIN, DropDownFormEh, PrjConst, TextEditForma;

{$R *.dfm}

const
  DocumentType: Integer = 5;

type
  TDBEditEhCrack = class(TDBEditEh);

procedure MaterialInventoryDocument(MatDocId: Integer);
var
  MDF: TMatInventoryDocForm;
  i: Integer;
  f: Integer;
begin
  f := -1;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i].tag = MatDocId) and (A4MainForm.MDIChildren[i] is TMatInventoryDocForm) then
      begin
        f := i;
        A4MainForm.MDIChildren[f].Show;
      end;

  if (f = -1) then
  begin
    MDF := TMatInventoryDocForm.Create(Application);
    MDF.MatDocId := MatDocId;
    if MatDocId = -1 then
      MDF.Caption := rsMadDocInv
    else
      MDF.Caption := rsMadDocInv + ' ' + IntToStr(MatDocId);
    MDF.Show;
  end;
end;

procedure TMatInventoryDocForm.SetReadOnlyMode(const readOnly: Boolean = true);
begin
  FReadOnly := readOnly;
  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Cancel;

  if dsDocMat.State in [dsEdit, dsInsert] then
    dsDocMat.Cancel;

  dbgDocMat.readOnly := readOnly;
  pnlMatAdd.Visible := not readOnly;
  // dsMaterials.Active := not readOnly;
  srcDoc.AutoEdit := not readOnly;
  btnSave.Visible := not readOnly;
  actDocClose.Enabled := dmMain.AllowedAction(rght_Dictionary_MatDoc_Close);
  actDocClose.Visible := not readOnly;
  actDocOpen.Visible := readOnly and (dmMain.AllowedAction(rght_Dictionary_MatDoc_Edit));
  actDelRecord.Enabled := not ReadOnly;
end;

procedure TMatInventoryDocForm.SetMatDocID(value: Integer);
begin
  dsDoc.ParamByName('DOC_ID').value := value;
  dsDoc.ParamByName('DocumentType').value := DocumentType;
  dsDoc.Open;
  if value = -1 then
  begin
    // dsDoc.Insert;
    SetReadOnlyMode(false);
  end
  else
  begin
    if dsDoc.RecordCount = 0 then
    begin
      ActiveControl := edtD_N;
      // dsDoc.Insert;
      SetReadOnlyMode(false);
    end
    else
    begin
      ActiveControl := edtMaterial;
      if dsDoc['Doc_Closed'] <> 0 then
        SetReadOnlyMode(true)
      else
        SetReadOnlyMode(false);
    end;
  end;

  dsDoc.tag := value;
  if dsDoc.FieldByName('Doc_N').IsNull then
    Caption := rsMadDocInv
  else
    Caption := dsDoc['Doc_N'] + ' ' + rsMadDocInv;

end;

procedure TMatInventoryDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);

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

  Action := caFree;
end;

procedure TMatInventoryDocForm.edtMaterialOpenDropDownForm(EditControl: TControl; Button: TEditButtonEh;
  var DropDownForm: TCustomForm; DynParams: TDynVarsEh);
begin
  fAddedMatID := -1;
  DynParams['ID'].Clear;
  DynParams['NAME'].AsString := edtMaterial.Text;
  DynParams['DATASET'].AsRefObject := dsMaterials;
end;

procedure TMatInventoryDocForm.edtMaterialCloseDropDownForm(EditControl: TControl; Button: TEditButtonEh;
  Accept: Boolean; DropDownForm: TCustomForm; DynParams: TDynVarsEh);
begin
  if DynParams.FindDynVar('Name') <> nil then
    edtMaterial.Text := DynParams['Name'].AsString;
  if DynParams.FindDynVar('B_QUANT') <> nil then
    edtBefore.value := DynParams['B_QUANT'].AsFloat;
  if DynParams.FindDynVar('dimension') <> nil then
    lblDem.Caption := rsQuant + ', ' + DynParams['dimension'].AsString;
  if DynParams.FindDynVar('ID') <> nil then
  begin
    fAddedMatID := DynParams['ID'].AsInteger;
    edtQuant.SetFocus;
  end;
end;

procedure TMatInventoryDocForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := false
    else if (ActiveControl is TDBMemoEh) then
      go := not((ActiveControl as TDBMemoEh).Lines.Text.Length > 20);

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TMatInventoryDocForm.edtMaterialEnter(Sender: TObject);
var
  AutoRepeat: Boolean;
begin
  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Post;
  {
    if not dsMaterials.Active then
    dsMaterials.Open;

    if dsMaterials.Filtered then
    begin
    dsMaterials.Filter := '';
    dsMaterials.Filtered := false;
    end;
  }

  TDBEditEhCrack(edtMaterial).FButtonsBox.BtnCtlList[1].EditButtonControl.EditButtonDown(1, AutoRepeat);
end;

procedure TMatInventoryDocForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
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

  dsDocMat.Open;
  dsWH.Open;
  fAddedMatID := -1;
end;

procedure TMatInventoryDocForm.btnSaveClick(Sender: TObject);
begin
  dsDoc.Post;
end;

procedure TMatInventoryDocForm.btnAddClick(Sender: TObject);
begin
  if CheckRowData then
    AddRow;
end;

procedure TMatInventoryDocForm.btnDelClick(Sender: TObject);
begin
  if (dsDocMat.RecordCount = 0) or (dsDocMat.FieldByName('NAME').IsNull) or (dsDoc['DOC_CLOSED'] = 1) then
    Exit;
  if Application.MessageBox(PWideChar(format(rsDeleteRecord, [dsDocMat.FieldByName('NAME').AsString])),
    PWideChar(rsDeleteFromDoc), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    dsDocMat.Delete;
  end;
end;

function TMatInventoryDocForm.CheckRowData: Boolean;
begin
  Result := (fAddedMatID <> -1) and (not edtQuant.Text.IsEmpty);
  if edtQuant.Text.IsEmpty then
    edtQuant.SetFocus;
end;

procedure TMatInventoryDocForm.actDelRecordExecute(Sender: TObject);
begin
  if (dsDocMat.RecordCount > 0) and (dsDoc['DOC_CLOSED'] = 0) then
  begin
    if Application.MessageBox(PWideChar(format(rsDeleteRecord, [dsDocMat['NAME']])), PWideChar(Application.Title),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      dsDocMat.Delete;
    end;
  end;
end;

procedure TMatInventoryDocForm.actDocOpenExecute(Sender: TObject);
begin
  if (not dsDocMat.IsEmpty) and (dsDoc['DOC_CLOSED'] = 1) then
  begin
    qOpenDoc.ParamByName('DOC_ID').AsInteger := dsDoc['DOC_ID'];
    qOpenDoc.Transaction.StartTransaction;
    qOpenDoc.ExecQuery;
    qOpenDoc.Transaction.Commit;
    dsDoc.Refresh;
    SetReadOnlyMode(false);
  end;
end;

procedure TMatInventoryDocForm.actEditNoteExecute(Sender: TObject);
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

procedure TMatInventoryDocForm.actDocCloseExecute(Sender: TObject);
begin
  if dsDoc.State in [dsEdit, dsEdit] then
  begin
    dsDoc.Post;
    dsDoc.Refresh;
  end;
  if dsDocMat.State in [dsEdit, dsEdit] then
    dsDocMat.Post;

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

procedure TMatInventoryDocForm.AddRow;
begin
  if not dsDocMat.Active then
    dsDocMat.Open;

  dsDocMat.Append;
  dsDocMat['DOC_ID'] := dsDoc['DOC_ID'];
  dsDocMat['NAME'] := edtMaterial.Text;
  dsDocMat['M_Id'] := fAddedMatID;
  dsDocMat['B_QUANT'] := edtBefore.value;
  dsDocMat['M_QUANT'] := edtQuant.value;
  // dsDocMat['M_Cost'] := edtCost.value;
  dsDocMat['M_Notice'] := memNotice.Lines.Text;
  dsDocMat.Post;

  edtBefore.Text := '';
  edtQuant.Text := '';
  // edtCost.Text := '';
  memNotice.Lines.Text := '';
  fAddedMatID := -1;
  edtMaterial.SetFocus;
end;

procedure TMatInventoryDocForm.dsDocNewRecord(DataSet: TDataSet);
begin
  dsDoc['DT_ID'] := DocumentType; // ��������� ��������
  if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    dsDoc['DOC_DATE'] := Now;
end;

procedure TMatInventoryDocForm.srcDocStateChange(Sender: TObject);
begin
  btnSave.Enabled := (dsDoc.State in [dsEdit, dsInsert]);
end;

end.
