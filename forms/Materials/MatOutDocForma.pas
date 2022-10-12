unit MatOutDocForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, DBLookupEh, DBCtrlsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, CnErrorProvider, FIBQuery, pFIBQuery, DBGridEhGrouping;

type
  TMatOutDocForm = class(TForm)
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
    edtCost: TDBNumberEditEh;
    CnErrors: TCnErrorProvider;
    dsWH: TpFIBDataSet;
    srcWH: TDataSource;
    qCloseDoc: TpFIBQuery;
    dbmhD_NOTICE: TDBMemoEh;
    btnOpen: TButton;
    qOpenDoc: TpFIBQuery;
    trWrite: TpFIBTransaction;
    qCheckCount: TpFIBQuery;
    btnDel: TBitBtn;
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
  private
    { Private declarations }
    fMatDocID: Integer;
    fAddedMatID: Integer;
    fSerial: string;
    procedure SetMatDocID(value: Integer);
    function CheckRowData: Boolean;
    procedure AddRow;
    procedure SetReadOnlyMode(const readOnly: Boolean = true);
  public
    { Public declarations }
    property MatDocId: Integer read fMatDocID write SetMatDocID;
  end;

procedure MaterialOutDocument(MatDocId: Integer);

implementation

uses
  DM, MAIN, DropDownFormEh, PrjConst;

{$R *.dfm}

const
  DocumentType: Integer = 3;

type
  TDBEditEhCrack = class(TDBEditEh);

procedure MaterialOutDocument(MatDocId: Integer);
var
  MDF: TMatOutDocForm;
  i: Integer;
  f: Integer;
begin
  f := -1;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i].tag = MatDocId) and (A4MainForm.MDIChildren[i] is TMatOutDocForm) then
      begin
        f := i;
        A4MainForm.MDIChildren[f].Show;
      end;

  if (f = -1) then
  begin
    MDF := TMatOutDocForm.Create(Application);
    MDF.MatDocId := MatDocId;
    MDF.Show;
  end;
end;

procedure TMatOutDocForm.SetReadOnlyMode(const readOnly: Boolean = true);
begin
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
end;

procedure TMatOutDocForm.SetMatDocID(value: Integer);
begin
  dsDoc.ParamByName('DOC_ID').value := value;
  dsDoc.ParamByName('DocumentType').value := DocumentType;

  dsDoc.Open;
  if value = -1 then
  begin
    ActiveControl := edtD_N;
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
    Caption := rsMadDocOut
  else
    Caption := dsDoc['Doc_N'] + ' ' + rsMadDocOut;
end;

procedure TMatOutDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
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

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);
  Action := caFree;
end;

procedure TMatOutDocForm.edtMaterialOpenDropDownForm(EditControl: TControl; Button: TEditButtonEh;
  var DropDownForm: TCustomForm; DynParams: TDynVarsEh);
begin
  fAddedMatID := -1;
  fSerial := '';
  DynParams['ID'].Clear;
  DynParams['NAME'].AsString := edtMaterial.Text;
  DynParams['DATASET'].AsRefObject := dsMaterials;
  DynParams['WIDTH'].AsInteger := edtMaterial.Width;
end;

procedure TMatOutDocForm.edtMaterialCloseDropDownForm(EditControl: TControl; Button: TEditButtonEh; Accept: Boolean;
  DropDownForm: TCustomForm; DynParams: TDynVarsEh);
begin
  if DynParams.FindDynVar('Name') <> nil then
    edtMaterial.Text := DynParams['Name'].AsString;

  if DynParams.FindDynVar('dimension') <> nil then
    lblDem.Caption := rsQuant + ', ' + DynParams['dimension'].AsString;

  if DynParams.FindDynVar('Cost') <> nil then
    edtCost.value := DynParams['Cost'].AsFloat
  else
    edtCost.value := 0;

  if DynParams.FindDynVar('ID') <> nil then
  begin
    fAddedMatID := DynParams['ID'].AsInteger;

    if DynParams.FindDynVar('SERIAL') <> nil then
      fSerial := DynParams['SERIAL'].AsString;
    edtQuant.Enabled := fSerial.IsEmpty;

    if edtQuant.Enabled then
      edtQuant.SetFocus
    else
    begin
      edtQuant.value := 1;
    end;
  end;
end;

procedure TMatOutDocForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TMatOutDocForm.edtMaterialEnter(Sender: TObject);
var
  AutoRepeat: Boolean;
begin
  if lcbWH.Text = '' then
  begin
    lcbWH.SetFocus;
    Exit;
  end;

  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Post;

  if not dsMaterials.Active then
  begin
    dsMaterials.ParamByName('WH').AsInteger := lcbWH.value;
    dsMaterials.Open;
  end;

  if dsMaterials.Filtered then
  begin
    dsMaterials.Filter := '';
    dsMaterials.Filtered := false;
  end;
  if TDBEditEhCrack(edtMaterial).FButtonsBox.ControlCount > 0 then
    TDBEditEhCrack(edtMaterial).FButtonsBox.BtnCtlList[1].EditButtonControl.EditButtonDown(1, AutoRepeat);
end;

procedure TMatOutDocForm.FormShow(Sender: TObject);
var
  fVisibleCost: Boolean;
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  dsDocMat.Open;
  dsWH.Open;
  fAddedMatID := -1;

  fVisibleCost := (dmMain.AllowedAction(rght_Material_Cost));
  for i := 0 to dbgDocMat.Columns.Count - 1 do
  begin
    if dbgDocMat.Columns[i].FieldName = 'M_COST' then
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

procedure TMatOutDocForm.btnSaveClick(Sender: TObject);
begin
  if dsDoc.FieldByName('DOC_DATE').IsNull then begin
    CnErrors.SetError(deD_DATE, rsSelectDate, iaTopCenter, bsNeverBlink);
    deD_DATE.SetFocus;
  end
  else begin
    CnErrors.Dispose(deD_DATE);
    dsDoc.Post;
  end;
end;

procedure TMatOutDocForm.btnAddClick(Sender: TObject);
begin
  if CheckRowData then
    AddRow;
end;

function TMatOutDocForm.CheckRowData: Boolean;
begin
  Result := fAddedMatID <> -1;
end;

procedure TMatOutDocForm.AddRow;
begin
  if not dsDocMat.Active then
    dsDocMat.Open;

  dsDocMat.Append;
  dsDocMat['DOC_ID'] := dsDoc['DOC_ID'];
  dsDocMat['M_Id'] := fAddedMatID;
  dsDocMat['M_QUANT'] := edtQuant.value;
  dsDocMat['M_Cost'] := edtCost.value;
  dsDocMat['M_Notice'] := memNotice.Lines.Text;
  dsDocMat['SERIAL'] := fSerial;
  dsDocMat.Post;

  edtQuant.Text := '';
  edtCost.Text := '';
  memNotice.Lines.Text := '';
  fAddedMatID := -1;
  fSerial := '';
  edtMaterial.SetFocus;
end;

procedure TMatOutDocForm.dsDocNewRecord(DataSet: TDataSet);
begin
  dsDoc['DT_ID'] := DocumentType; // приходный документ
  if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    dsDoc['DOC_DATE'] := Now;
  if dsWH.RecordCount = 1 then
    dsDoc['Wh_Id'] := dsWH['O_ID'];
end;

procedure TMatOutDocForm.btnCloseClick(Sender: TObject);
var
  s: string;
begin
  if dsDoc.State in [dsEdit, dsEdit] then
  begin
    dsDoc.Post;
    dsDoc.Refresh;
  end;
  if dsDocMat.State in [dsEdit, dsEdit] then
    dsDocMat.Post;

  s := '';
  qCheckCount.ParamByName('doc').AsInteger := dsDoc['Doc_Id'];
  qCheckCount.ExecQuery;
  if not qCheckCount.FieldByName('MAT_LIST').IsNull then
    s := qCheckCount.FieldByName('MAT_LIST').AsString;
  qCheckCount.Close;

  if s <> '' then
  begin
    if (MessageBox(0, PWideChar(format(rsMatCountIncorrect, [s])), '', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2)
      = idYes) then
      s := '';
  end;
  // если с колвом все хорошо или согласны закрыть - закрываем
  if s = '' then
  begin
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
end;

procedure TMatOutDocForm.btnDelClick(Sender: TObject);
begin
  if (dsDocMat.RecordCount = 0) or (dsDocMat.FieldByName('NAME').IsNull) or (dsDoc['DOC_CLOSED'] = 1) then
    Exit;
  if Application.MessageBox(PWideChar(format(rsDeleteRecord, [dsDocMat.FieldByName('NAME').AsString])),
    PWideChar(rsDeleteFromDoc), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    dsDocMat.Delete;
  end;
end;

procedure TMatOutDocForm.srcDocStateChange(Sender: TObject);
begin
  btnSave.Enabled := (dsDoc.State in [dsEdit, dsInsert]);
end;

procedure TMatOutDocForm.btnOpenClick(Sender: TObject);
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

end.
