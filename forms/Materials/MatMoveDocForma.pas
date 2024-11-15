﻿unit MatMoveDocForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Menus,
  Vcl.ActnList,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, DBLookupEh, DBCtrlsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, CnErrorProvider, FIBQuery, pFIBQuery, DBGridEhGrouping;

type
  TMatMoveDocForm = class(TForm)
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
    edtCost: TDBNumberEditEh;
    CnErrors: TCnErrorProvider;
    dsWH: TpFIBDataSet;
    srcWH: TDataSource;
    qCloseDoc: TpFIBQuery;
    Label4: TLabel;
    lcbFROM_WH: TDBLookupComboboxEh;
    srcFromWH: TDataSource;
    qOpenDoc: TpFIBQuery;
    btnOpen: TButton;
    qCheckCount: TpFIBQuery;
    btnDel: TBitBtn;
    actList: TActionList;
    actDelRecord: TAction;
    actDocOpen: TAction;
    actDocClose: TAction;
    actEditNote: TAction;
    pmGrid: TPopupMenu;
    miEditNote: TMenuItem;
    miN1: TMenuItem;
    miDelete: TMenuItem;
    trReadDS: TpFIBTransaction;
    trWrite: TpFIBTransaction;
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
    procedure actEditNoteExecute(Sender: TObject);
    procedure actDelRecordExecute(Sender: TObject);
  private
    { Private declarations }
    fMatDocID: Integer;
    fAddedMatID: Integer;
    fSerial: string;
    FFullAccess: Boolean;
    FAccessNew: Boolean;
    FAccessMove: Boolean;
    FAccessOut: Boolean;
    FAccessInv: Boolean;
    FReadOnly: Boolean;
    FEnterSecondPress: Boolean;
    procedure SetMatDocID(value: Integer);
    function CheckRowData: Boolean;
    function CheckData: Boolean;
    procedure AddRow;
    procedure SetReadOnlyMode(const readOnly: Boolean = true);
  public
    { Public declarations }
    property MatDocId: Integer read fMatDocID write SetMatDocID;
  end;

procedure MaterialMoveDocument(MatDocId: Integer);

implementation

uses
  DM, MAIN, DropDownFormEh, PrjConst, TextEditForma;

{$R *.dfm}

const
  DocumentType: Integer = 2;

type
  TDBEditEhCrack = class(TDBEditEh);

procedure MaterialMoveDocument(MatDocId: Integer);
var
  MDF: TMatMoveDocForm;
  i: Integer;
  f: Integer;
begin
  f := -1;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i].tag = MatDocId) and (A4MainForm.MDIChildren[i] is TMatMoveDocForm) then
      begin
        f := i;
        A4MainForm.MDIChildren[f].Show;
      end;

  if (f = -1) then
  begin
    MDF := TMatMoveDocForm.Create(Application);
    MDF.MatDocId := MatDocId;
    MDF.Show;
  end;
end;

procedure TMatMoveDocForm.SetReadOnlyMode(const readOnly: Boolean = true);
begin
  FReadOnly := readOnly;
  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Cancel;
  if dsDocMat.State in [dsEdit, dsInsert] then
    dsDocMat.Cancel;
  dbgDocMat.readOnly := readOnly;
  pnlMatAdd.Visible := not readOnly;
  dsMaterials.Active := not readOnly;
  srcDoc.AutoEdit := not readOnly;
  btnSave.Visible := not readOnly;
  btnClose.Enabled := dmMain.AllowedAction(rght_Dictionary_MatDoc_Close);
  btnClose.Visible := not readOnly;
  btnOpen.Visible := readOnly and dmMain.AllowedAction(rght_Dictionary_MatDoc_Edit);
end;

procedure TMatMoveDocForm.SetMatDocID(value: Integer);
begin
  dsDoc.ParamByName('DOC_ID').value := value;
  dsDoc.ParamByName('DocumentType').value := DocumentType;
  dsDoc.Open;

  if (value = -1) then
  begin
    ActiveControl := edtD_N;
    dsDoc.Insert;
    if (FAccessMove and (not FFullAccess)) then
    begin
      deD_DATE.value := Now();
      deD_DATE.readOnly := true;
    end;
  end
  else
  begin
    if (dsDoc.RecordCount = 0) then
    begin
      ActiveControl := edtD_N;
      dsDoc.Insert;
      if (FAccessMove and (not FFullAccess)) then
      begin
        deD_DATE.value := Now();
        deD_DATE.readOnly := true;
      end;
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
    Caption := rsMadDocMov
  else
    Caption := dsDoc['Doc_N'] + ' ' + rsMadDocMov;
end;

procedure TMatMoveDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TMatMoveDocForm.edtMaterialOpenDropDownForm(EditControl: TControl; Button: TEditButtonEh;
  var DropDownForm: TCustomForm; DynParams: TDynVarsEh);
begin
  fAddedMatID := -1;
  fSerial := '';
  DynParams['ID'].Clear;
  DynParams['NAME'].AsString := edtMaterial.Text;
  DynParams['DATASET'].AsRefObject := dsMaterials;
  DynParams['WIDTH'].AsInteger := edtMaterial.Width;
end;

procedure TMatMoveDocForm.edtMaterialCloseDropDownForm(EditControl: TControl; Button: TEditButtonEh; Accept: Boolean;
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
{$IFDEF IS_UNIT}
    if DynParams.FindDynVar('SERIAL') <> nil then
      fSerial := DynParams['SERIAL'].AsString;
    edtQuant.Enabled := fSerial.IsEmpty;
{$ENDIF}
    if edtQuant.Enabled then
      edtQuant.SetFocus
    else
    begin
      edtQuant.value := 1;
    end;
  end;
end;

procedure TMatMoveDocForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := false
      // else if (ActiveControl is TDBSynEdit) and not(Trim((ActiveControl as TDBSynEdit).Lines.Text) = '') then
      // go := False;
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := false;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := false;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := false;
  end;
end;

procedure TMatMoveDocForm.edtMaterialEnter(Sender: TObject);
var
  AutoRepeat: Boolean;
begin
  if lcbFROM_WH.Text = '' then
  begin
    lcbFROM_WH.SetFocus;
    Exit;
  end;

  if dsDoc.State in [dsEdit, dsInsert] then
    dsDoc.Post;

  if not dsMaterials.Active then
  begin
    dsMaterials.ParamByName('FROM_WH').AsInteger := lcbFROM_WH.value;
    dsMaterials.Open;
  end;

  if dsMaterials.Filtered then
  begin
    dsMaterials.Filter := '';
    dsMaterials.Filtered := false;
  end;

  TDBEditEhCrack(edtMaterial).FButtonsBox.BtnCtlList[1].EditButtonControl.EditButtonDown(1, AutoRepeat);
end;

procedure TMatMoveDocForm.FormShow(Sender: TObject);
var
  fVisibleCost: Boolean;
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;

  FFullAccess := dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full);
  FAccessNew := dmMain.AllowedAction(rght_Dictionary_MatDocNew);
  FAccessMove := dmMain.AllowedAction(rght_Dictionary_MatDocMove);
  FAccessOut := dmMain.AllowedAction(rght_Dictionary_MatDocOUT);
  FAccessInv := dmMain.AllowedAction(rght_Dictionary_MatDocInvent);

  dsDocMat.Open;
  dsWH.Open;
  fAddedMatID := -1;

  edtCost.readOnly := FAccessMove and not(FFullAccess or FAccessNew or FAccessOut or FAccessInv);
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
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemoEh) then
      begin
        (Components[i] as TDBMemoEh).Font.Name := Font_name;
        (Components[i] as TDBMemoEh).Font.Size := Font_size;
      end;
    end;
  end;
end;

procedure TMatMoveDocForm.btnSaveClick(Sender: TObject);
begin
  if dsDoc.FieldByName('DOC_DATE').IsNull then
  begin
    CnErrors.SetError(deD_DATE, rsSelectDate, iaTopCenter, bsNeverBlink);
    deD_DATE.SetFocus;
  end
  else
  begin
    CnErrors.Dispose(deD_DATE);
    dsDoc.Post;
  end;
end;

procedure TMatMoveDocForm.btnAddClick(Sender: TObject);
begin
  if CheckRowData then
  begin
    AddRow;
    dsMaterials.CloseOpen(true);
  end;
end;

function TMatMoveDocForm.CheckRowData: Boolean;
begin
  Result := (fAddedMatID <> -1) and (not edtQuant.Text.IsEmpty);
  if edtQuant.Text.IsEmpty then
    edtQuant.SetFocus;
end;

procedure TMatMoveDocForm.actDelRecordExecute(Sender: TObject);
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

procedure TMatMoveDocForm.actEditNoteExecute(Sender: TObject);
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

  if EditText(s, 'Примечание', 'Примечание для услуги') then
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

procedure TMatMoveDocForm.AddRow;
begin
  if not dsDocMat.Active then
    dsDocMat.Open;

  dsDocMat.Append;
  dsDocMat['DOC_ID'] := dsDoc['DOC_ID'];
  dsDocMat['M_Id'] := fAddedMatID;
  dsDocMat['NAME'] := edtMaterial.Text;
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

procedure TMatMoveDocForm.dsDocNewRecord(DataSet: TDataSet);
var
  i: Integer;
begin
  dsDoc['DT_ID'] := DocumentType; // приходный документ
  if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    dsDoc['DOC_DATE'] := Now;

  i := dmMain.dbTV.QueryValue('select count(*) cnt from MATERIAL_DOCS d' +
    ' where d.Doc_Date = current_date and d.Dt_Id = ' + DocumentType.ToString, 0, dmMain.trReadQ, false);
  dsDoc['DOC_N'] := (i+1).ToString.PadLeft(3, '0');
end;

procedure TMatMoveDocForm.btnCloseClick(Sender: TObject);
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

  if (dsDoc.FieldByName('DOC_CLOSED').IsNull) or (dsDoc.FieldByName('Doc_Id').IsNull) then
    Exit;

  if not CheckData then
    Exit;

  s := '';
  qCheckCount.ParamByName('doc').AsInteger := dsDoc['Doc_Id'];
  qCheckCount.ExecQuery;
  if not qCheckCount.FieldByName('MAT_LIST').IsNull then
    s := qCheckCount.FieldByName('MAT_LIST').AsString;
  qCheckCount.Close;

  if s <> '' then
  begin
    if (MessageBox(0, PWideChar(format(rsMatCountIncorrect, [s])), '', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2)
      = IDYES) then
      s := '';
  end;
  // если с колвом все хорошо или согласны закрыть - закрываем
  if s = '' then
  begin
    if (not dsDocMat.IsEmpty) and (dsDoc['DOC_CLOSED'] = 0) then
    begin
      qCloseDoc.ParamByName('DOC_ID').AsInteger := dsDoc['DOC_ID'];
      qCloseDoc.Transaction.StartTransaction;
      try
        qCloseDoc.ExecQuery;
        qCloseDoc.Transaction.Commit;
        dsDoc.Refresh;
        SetReadOnlyMode(true);
      except

        on E: Exception do
          if (E.Message.Contains('#8 Materials less then entered')) then
            ShowMessage(rsMatQuantLess);

      end;
    end;
  end;
end;

procedure TMatMoveDocForm.btnDelClick(Sender: TObject);
begin
  if (dsDocMat.RecordCount = 0) or (dsDocMat.FieldByName('NAME').IsNull) or (dsDoc['DOC_CLOSED'] = 1) then
    Exit;
  if Application.MessageBox(PWideChar(format(rsDeleteRecord, [dsDocMat.FieldByName('NAME').AsString])),
    PWideChar(rsDeleteFromDoc), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    dsDocMat.Delete;
  end;
end;

procedure TMatMoveDocForm.srcDocStateChange(Sender: TObject);
begin
  btnSave.Enabled := (dsDoc.State in [dsEdit, dsInsert]);
end;

procedure TMatMoveDocForm.btnOpenClick(Sender: TObject);
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

function TMatMoveDocForm.CheckData: Boolean;
begin
  Result := true;
  if lcbWH.Text = '' then
  begin
    CnErrors.SetError(lcbWH, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    lcbWH.SetFocus;
    Result := false;
  end
  else
    CnErrors.Dispose(lcbWH);

  if lcbFROM_WH.Text = '' then
  begin
    CnErrors.SetError(lcbFROM_WH, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    lcbFROM_WH.SetFocus;
    Result := false;
  end
  else
    CnErrors.Dispose(lcbFROM_WH);

  if deD_DATE.Text = '' then
  begin
    CnErrors.SetError(deD_DATE, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    deD_DATE.SetFocus;
    Result := false;
  end
  else
    CnErrors.Dispose(deD_DATE);

  if edtD_N.Text = '' then
  begin
    CnErrors.SetError(edtD_N, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    edtD_N.SetFocus;
    Result := false;
  end
  else
    CnErrors.Dispose(edtD_N);
end;

end.
