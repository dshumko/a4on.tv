unit CustomersFilter;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Mask,
  DBGridEh, DBCtrlsEh, DBLookupEh, GridsEh,
  FIBDataSet, pFIBDataSet, SynEditHighlighter, SynHighlighterSQL, SynEdit, SynDBEdit,
  pFIBQuery,
  PrjConst, PropFilerEh, PropStorageEh;

type
  TCustomersFilterForm = class(TForm)
    srcFilter: TDataSource;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    srcStreets: TDataSource;
    dsStreets: TpFIBDataSet;
    srcHomes: TDataSource;
    dsHomes: TpFIBDataSet;
    srcServices: TDataSource;
    dsServices: TpFIBDataSet;
    srcArea: TDataSource;
    dsArea: TpFIBDataSet;
    srcSubArea: TDataSource;
    dsSubArea: TpFIBDataSet;
    btnClear: TSpeedButton;
    srcLetterType: TDataSource;
    dsLetterType: TpFIBDataSet;
    OpenDialog1: TOpenDialog;
    srcSingleServ: TDataSource;
    dsSingleServ: TpFIBDataSet;
    srcAttributes: TDataSource;
    dsAttributes: TpFIBDataSet;
    dsOrg: TpFIBDataSet;
    srcOrg: TDataSource;
    pgcFilter: TPageControl;
    tsFilter: TTabSheet;
    tsList: TTabSheet;
    pnl1: TPanel;
    Label19: TLabel;
    grpSrvState: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lcbSERVICE: TDBLookupComboboxEh;
    DBComboBoxEh1: TDBComboBoxEh;
    grpDolg: TGroupBox;
    lblBalance: TLabel;
    lblto: TLabel;
    edtSumTo: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    cbDolgType: TDBComboBoxEh;
    chkNoCurrent: TDBCheckBoxEh;
    grpAddress: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblOgz: TLabel;
    cbbSTREET: TDBLookupComboboxEh;
    cbxHouseNo: TDBLookupComboboxEh;
    cbbAREA: TDBLookupComboboxEh;
    DBLookupComboBox2: TDBLookupComboboxEh;
    DBEditEh1: TDBEditEh;
    cbbOgz: TDBLookupComboboxEh;
    dbACCOUNT: TDBEditEh;
    dbmAcounts: TDBMemoEh;
    tsSQL: TTabSheet;
    memSQL: TDBSynEdit;
    lbl2: TLabel;
    synsqlsyn2: TSynSQLSyn;
    lbl4: TLabel;
    cbb1: TDBLookupComboboxEh;
    cbb2: TDBLookupComboboxEh;
    lbl5: TLabel;
    dsWORKGROUP: TpFIBDataSet;
    srcWORKGROUP: TDataSource;
    dsWORKAREA: TpFIBDataSet;
    srcWORKAREA: TDataSource;
    cbSF_TYPE: TDBComboBoxEh;
    lbl3: TLabel;
    chkDefaultFilter: TCheckBox;
    lbl7: TLabel;
    lbl8: TLabel;
    cbbMH: TDBLookupComboboxEh;
    dsMH: TpFIBDataSet;
    srcMH: TDataSource;
    actlst1: TActionList;
    actOk: TAction;
    actClear: TAction;
    cbbSrvTypes: TDBLookupComboboxEh;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    tsExtend: TTabSheet;
    EDTAttrValue: TDBEditEh;
    cbAttribute: TDBLookupComboboxEh;
    Label11: TLabel;
    DBCheckBoxEh1: TDBCheckBoxEh;
    JURCHEK: TDBCheckBoxEh;
    DBCheckBox21: TDBCheckBoxEh;
    DBCheckBox17: TDBCheckBoxEh;
    DBCheckBox7: TDBCheckBoxEh;
    grpDogovor: TGroupBox;
    DBCheckBox15: TDBCheckBoxEh;
    DBCheckBox16: TDBCheckBoxEh;
    grpAddon: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lbl6: TLabel;
    DBCheckBox19: TDBCheckBoxEh;
    DBCheckBox25: TDBCheckBoxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBCheckBox6: TDBCheckBoxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBComboBoxEh2: TDBComboBoxEh;
    DBComboBoxEh4: TDBComboBoxEh;
    cbb3: TDBLookupComboboxEh;
    chkbDogovor: TDBCheckBoxEh;
    chkAddon: TDBCheckBoxEh;
    cbAdress: TDBCheckBoxEh;
    cbDolg: TDBCheckBoxEh;
    lbl9: TLabel;
    Label3: TLabel;
    lbl10: TLabel;
    edtMonth: TDBNumberEditEh;
    lbl11: TLabel;
    chkPrepay: TDBCheckBoxEh;
    chkMESSGS_NOT_SEND: TDBCheckBoxEh;
    chkMESSGS_SEND: TDBCheckBoxEh;
    chkPERS_TARIF: TDBCheckBoxEh;
    edtDiscDate: TDBDateTimeEditEh;
    edtPersDate: TDBDateTimeEditEh;
    lbl12: TLabel;
    Label12: TLabel;
    pnlFilter: TPanel;
    lblFnew: TLabel;
    lblDelim: TLabel;
    lblOrAND: TLabel;
    dbnvgr: TDBNavigator;
    chkinversion: TDBCheckBoxEh;
    btnAND: TButton;
    btnOR: TButton;
    dbchkHiden: TDBCheckBox;
    edtOFFDAYS: TDBNumberEditEh;
    lbl1: TLabel;
    pnlTopList: TPanel;
    cbbListType: TDBComboBoxEh;
    lbl13: TLabel;
    chkBirthday: TDBCheckBoxEh;
    lbl14: TLabel;
    chkCUST_NOT_ATTRIBUTE: TDBCheckBoxEh;
    cbbFileType: TDBLookupComboboxEh;
    dsFileType: TpFIBDataSet;
    srcFileType: TDataSource;
    edtNOTPAY: TDBNumberEditEh;
    lbl15: TLabel;
    cbbATTRTYPE: TDBComboBoxEh;
    chkHandControl: TDBCheckBoxEh;
    chkBIRTHDAY10: TDBCheckBoxEh;
    PropStorageEh1: TPropStorageEh;
    cbFEE: TDBComboBoxEh;
    chkDebtLow: TDBCheckBoxEh;
    btnDBLoad: TSpeedButton;
    btnDBSave: TSpeedButton;
    actSaveToDb: TAction;
    actLoadFromDb: TAction;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JURCHEKExit(Sender: TObject);
    procedure btnANDClick(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure srcFilterDataChange(Sender: TObject; Field: TField);
    procedure cbDolgTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure checkAdressSign(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure cbAttributeChange(Sender: TObject);
    procedure DBNumberEditEh1Exit(Sender: TObject);
    procedure pgcFilterChange(Sender: TObject);
    procedure cbbSTREETEnter(Sender: TObject);
    procedure cbbAREAChange(Sender: TObject);
    procedure cbbATTRTYPEChange(Sender: TObject);
    procedure dbnvgrClick(Sender: TObject; Button: TNavigateBtn);
    procedure cbb2Enter(Sender: TObject);
    procedure lcbSERVICEEnter(Sender: TObject);
    procedure cbb3Enter(Sender: TObject);
    procedure DBLookupComboboxClick(Sender: TObject);
    procedure actSaveToDbExecute(Sender: TObject);
    procedure actLoadFromDbExecute(Sender: TObject);
    procedure cbxHouseNoChange(Sender: TObject);
    procedure cbxHouseNoDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    FEnterSecondPress: Boolean;
    procedure SaveFilter(const filename: string);
    procedure SetTab;
  public
    { Public declarations }
  end;

var
  CustomersFilterForm: TCustomersFilterForm;

implementation

uses
  DM, CF, MAIN, AtrCommon, MemTableEh, SelectFilterForma;

{$R *.dfm}

procedure TCustomersFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsStreets.Close;
  dsStreets.Close;
  dsHomes.Close;
  dsServices.Close;
  dsArea.Close;
  dsSubArea.Close;
  dsOrg.Close;
  dsWORKAREA.Close;
  dsWORKGROUP.Close;
  dsMH.Close;

  if (dsLetterType.Active) then
    dsLetterType.Close;
  if (dsLetterType.Active) then
    dsSingleServ.Close;
  if (dsLetterType.Active) then
    dsAttributes.Close;
  if (dsFileType.Active) then
    dsFileType.Close;
end;

procedure TCustomersFilterForm.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
  cbAdress.Top := grpAddress.Top - trunc(cbAdress.Height / 2);
  cbDolg.Top := grpDolg.Top - trunc(cbDolg.Height / 2);
  chkAddon.Top := grpAddon.Top - trunc(chkAddon.Height / 2);
  chkbDogovor.Top := grpDogovor.Top - trunc(chkbDogovor.Height / 2);
end;

procedure TCustomersFilterForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin
    case Ord(Key) of
      VK_RETURN:
        bbOkClick(Sender);
      Ord('1'):
        pgcFilter.ActivePageIndex := 0;
      Ord('2'):
        pgcFilter.ActivePageIndex := 1;
      Ord('3'):
        pgcFilter.ActivePageIndex := 2;
      Ord('4'):
        pgcFilter.ActivePageIndex := 3;
      // 66: btnANDClick(btnAND);
      // 75: btnORClick(btnOR);
      VK_LEFT:
        if (not srcFilter.DataSet.Bof) then
          srcFilter.DataSet.Prior;
      VK_RIGHT:
        if (not srcFilter.DataSet.EOF) then
          srcFilter.DataSet.Next;
      VK_HOME:
        if (not srcFilter.DataSet.Bof) then
          srcFilter.DataSet.First;
      VK_END:
        if (not srcFilter.DataSet.EOF) then
          srcFilter.DataSet.Last;
      // ELSE memSQL.Lines.Add( Key.ToString + ' ' + Chr(Key));
    end;

    if Ord(Key) in [Ord('1'), Ord('2'), Ord('3'), Ord('4')] then
      pgcFilterChange(Sender);

  end;
end;

procedure TCustomersFilterForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBSynEdit) and not(Trim((ActiveControl as TDBSynEdit).Lines.Text) = '') then
      go := False
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure TCustomersFilterForm.FormShow(Sender: TObject);
begin
  cbbListType.DropDownBox.Rows := cbbListType.Items.Count;

  dsStreets.Open;
  dsHomes.Open;
  dsServices.Open;
  dsArea.Open;
  dsSubArea.Open;
  dsWORKAREA.Open;
  dsOrg.Open;
  dsWORKGROUP.Open;
  dsMH.Open;

  dbchkHiden.Visible := dmMain.SuperMode = 1;

  {
    0
    1  Договор
    2  Лицевой
    3  Код
    4  Фамилия
    5  Примечание
    6  Телефон
    7  Список лицевых
    8  Улица
    9  IP
    10 MAC
    11 Декодер
    12 Тюнер
  }
{$IFDEF LAN}
  cbSF_TYPE.Items.Add(rsIPAagan);
  cbSF_TYPE.KeyItems.Add('9');
  cbSF_TYPE.Items.Add(rsMACAagan);
  cbSF_TYPE.KeyItems.Add('10');
{$ENDIF}
{$IFDEF DIGIT}
  cbSF_TYPE.Items.Add(rsAaeiaag);
  cbSF_TYPE.KeyItems.Add('11');
  cbSF_TYPE.Items.Add(rsOsiag);
  cbSF_TYPE.KeyItems.Add('12');
{$ENDIF}
  if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
    lblBalance.Caption := rsBALANCE
  else
    lblBalance.Caption := rsSALDO;

  SetTab;
end;

procedure TCustomersFilterForm.SetTab;
begin
  if (not srcFilter.DataSet.FieldByName('ListValues').IsNull) and (pgcFilter.ActivePage <> tsList) then
    pgcFilter.ActivePage := tsList
  else if (not srcFilter.DataSet.FieldByName('SQL_FLTR').IsNull) and (pgcFilter.ActivePage <> tsSQL) then
    pgcFilter.ActivePage := tsSQL
  else
    pgcFilter.ActivePage := tsFilter;
end;

procedure TCustomersFilterForm.SaveFilter(const filename: string);
var
  s: string;
begin
  if Length(filename) = 0 then
    exit;
  s := A4MainForm.GetUserFilterFolder + filename + '.JCF';
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  DatasetToJson(srcFilter.DataSet, s);
end;

procedure TCustomersFilterForm.SpeedButton1Click(Sender: TObject);
var
  filename: string;
begin
  filename := InputBox(rsInputFilterName, rsTitle, rsFilter);
  if Length(filename) = 0 then
    exit;
  SaveFilter(filename);
end;

procedure TCustomersFilterForm.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := A4MainForm.GetUserFilterFolder;
  if OpenDialog1.Execute then
  begin
    srcFilter.DataSet.DisableControls;
    if not srcFilter.DataSet.Active then
      srcFilter.DataSet.Open;
    (srcFilter.DataSet as TMemTableEh).EmptyTable;
    DatasetFromJson(srcFilter.DataSet, OpenDialog1.filename);
    SetTab;
    srcFilter.DataSet.EnableControls;
  end;
end;

procedure TCustomersFilterForm.JURCHEKExit(Sender: TObject);
begin
  if JURCHEK.State = cbGrayed then
  begin
    if (not(srcFilter.DataSet.State in [dsEdit])) then
      srcFilter.DataSet.Edit;
    srcFilter.DataSet['JURIDICAL'] := -1;
  end;
end;

procedure TCustomersFilterForm.pgcFilterChange(Sender: TObject);
begin
  pnlFilter.Visible := pgcFilter.ActivePageIndex <= 1;
  if (not dsLetterType.Active) and (pgcFilter.ActivePageIndex = 1) then
    dsLetterType.Open;
  if (not dsSingleServ.Active) and (pgcFilter.ActivePageIndex = 1) then
    dsSingleServ.Open;
  if (not dsAttributes.Active) and (pgcFilter.ActivePageIndex = 1) then
    dsAttributes.Open;
  if (not dsFileType.Active) and (pgcFilter.ActivePageIndex = 1) then
    dsFileType.Open;
end;

procedure TCustomersFilterForm.actClearExecute(Sender: TObject);
begin
  srcFilter.DataSet.DisableControls;
  if srcFilter.DataSet.Active then
    srcFilter.DataSet.Open;
  (srcFilter.DataSet as TMemTableEh).EmptyTable;
  srcFilter.DataSet.Insert;
  srcFilter.DataSet.EnableControls;
end;

procedure TCustomersFilterForm.actLoadFromDbExecute(Sender: TObject);
var
  JsonStr: string;
begin
  JsonStr := SelectFilter(67);
  if JsonStr.IsEmpty then
    exit;

  srcFilter.DataSet.DisableControls;
  if not srcFilter.DataSet.Active then
    srcFilter.DataSet.Open;
  (srcFilter.DataSet as TMemTableEh).EmptyTable;
  DatasetFromJsonStr(srcFilter.DataSet, JsonStr);
  SetTab;
  srcFilter.DataSet.EnableControls;
end;

procedure TCustomersFilterForm.actSaveToDbExecute(Sender: TObject);
var
  n: string;
  s: string;
  fq: TpFIBQuery;
begin
  if InputQuery('Введите название фильтра', 'Название', n) and (not n.IsEmpty) then
  begin
    if srcFilter.DataSet.State in [dsEdit, dsInsert] then
      srcFilter.DataSet.post;
    s := DatasetToJsonStr(srcFilter.DataSet);

    // ShowMessage(s);

    if s.IsEmpty then
      exit;

    fq := TpFIBQuery.Create(self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trWriteQ;
      fq.sql.Text := 'execute block (';
      fq.sql.Add('    NAME D_VARCHAR100 = :NAME,');
      fq.sql.Add('    JSON D_Blob1k = :JSON)');
      fq.sql.Add('as');
      fq.sql.Add('declare variable OID integer;');
      fq.sql.Add('begin');
      fq.sql.Add('  update or insert into Objects (O_Type, O_Name)');
      fq.sql.Add('  values (67, :Name)');
      fq.sql.Add('  matching (O_Name, O_Type)');
      fq.sql.Add('  returning O_ID');
      fq.sql.Add('  into :OID;');
      fq.sql.Add('  update or insert into Blob_Tbl (Bl_Type, Owner_Id, Bl_Name, Bl_Body)');
      fq.sql.Add('  values (5, :OID, :Name, :JSON)');
      fq.sql.Add('  matching (Bl_Type, Owner_Id);');
      fq.sql.Add('end');
      fq.ParamByName('Name').AsString := n;
      fq.ParamByName('json').AsString := s;
      fq.Transaction.StartTransaction;
      fq.ExecQuery;
      fq.Transaction.Commit;
      fq.Close;
    finally
      fq.Free;
    end;
  end;
end;

procedure TCustomersFilterForm.bbOkClick(Sender: TObject);
var
  v: Boolean;
  q: TpFIBQuery;
begin
  // проверим на какой закладке открыто окно.
  // для того чтоб понять по чем выставлять фильтр
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
  begin
    if srcFilter.DataSet.State = dsInsert then
      v := (srcFilter.DataSet.RecordCount = 0)
    else
      v := (srcFilter.DataSet.RecordCount = 1);
    if v then
      if (not srcFilter.DataSet.FieldByName('ListValues').IsNull) and (pgcFilter.ActivePage = tsList) then
      begin
        if (srcFilter.DataSet.FieldByName('ListType').IsNull) then
          srcFilter.DataSet['ListType'] := 0;
        srcFilter.DataSet['EXTENDED_FLTR'] := 1
      end
      else if (not srcFilter.DataSet.FieldByName('SQL_FLTR').IsNull) and (pgcFilter.ActivePage = tsSQL) then
      begin
        q := TpFIBQuery.Create(Nil);
        try
          try
            q.Database := dmMain.dbTV;
            q.Transaction := dmMain.trReadQ;
            q.sql.Text := memSQL.Lines.Text;
            q.Transaction.StartTransaction;
            q.ExecQuery;
            q.Close;
            q.Transaction.Commit;
            srcFilter.DataSet['EXTENDED_FLTR'] := 2;
          except
            ShowMessage(rsIncorrectSQL);
            srcFilter.DataSet['EXTENDED_FLTR'] := 0
          end;
        finally
          q.Free;
        end;
      end;
    srcFilter.DataSet.post;
  end;

  if chkDefaultFilter.Checked then
    SaveFilter('default');
  ModalResult := mrOk;
end;

procedure TCustomersFilterForm.btnANDClick(Sender: TObject);
var
  ti: Integer;
begin
  ti := pgcFilter.ActivePageIndex;
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 1;
  pgcFilter.ActivePageIndex := ti;
end;

procedure TCustomersFilterForm.btnORClick(Sender: TObject);
var
  ti: Integer;
begin
  ti := pgcFilter.ActivePageIndex;
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 0;
  pgcFilter.ActivePageIndex := ti;
end;

procedure TCustomersFilterForm.srcFilterDataChange(Sender: TObject; Field: TField);
begin
  if srcFilter.DataSet['next_condition'] = 0 then
    lblOrAND.Caption := rsOR
  else
    lblOrAND.Caption := rsAND;
  lblOrAND.Visible := srcFilter.DataSet.RecNo > 1;
end;

procedure TCustomersFilterForm.cbAttributeChange(Sender: TObject);
begin
  EDTAttrValue.Enabled := not VarIsNull(cbAttribute.value);
end;

procedure TCustomersFilterForm.cbDolgTypeChange(Sender: TObject);
var
  interval: Boolean;
begin
  try
    interval := cbDolgType.value = 6;
  except
    interval := False
  end;
  lblto.Visible := interval;
  edtSumTo.Visible := interval;
end;

procedure TCustomersFilterForm.cbxHouseNoChange(Sender: TObject);
begin
  if (dsHomes['inService'] <> '') then
    cbxHouseNo.Color := clYellow
  else
    cbxHouseNo.Color := clWindow;
end;

procedure TCustomersFilterForm.cbxHouseNoDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsHomes.Active) and (dsHomes['inService'] <> '') then
    Background := clYellow
  else
    Background := clWindow;
end;

procedure TCustomersFilterForm.checkAdressSign(Sender: TObject);
begin
  if (Sender is TDBLookupComboboxEh) then
    if not VarIsClear((Sender as TDBLookupComboboxEh).value) then
      if not cbAdress.Checked then
        cbAdress.Checked := true;
end;

procedure TCustomersFilterForm.cbb2Enter(Sender: TObject);
begin
  (Sender as TDBLookupComboboxEh).SelectAll;
end;

procedure TCustomersFilterForm.cbb3Enter(Sender: TObject);
begin
  (Sender as TDBLookupComboboxEh).SelectAll;
end;

procedure TCustomersFilterForm.cbbAREAChange(Sender: TObject);
begin
  if (VarIsNumeric(cbbAREA.value)) then
    dsStreets.ParamByName('area_id').AsInteger := cbbAREA.value
  else
    dsStreets.ParamByName('area_id').Clear;
  dsStreets.CloseOpen(true);
  dsHomes.Open;
end;

procedure TCustomersFilterForm.cbbATTRTYPEChange(Sender: TObject);
var
  a: Boolean;
  t: Integer;
begin
  a := dsAttributes.Active;
  if a then
    dsAttributes.Close;
  if (VarIsNull(cbbATTRTYPE.value)) or (not TryStrToInt(cbbATTRTYPE.value, t)) then
    t := 4;
  dsAttributes.ParamByName('ATTRTYPE').AsInteger := t;
  if a then
    dsAttributes.Open;
end;

procedure TCustomersFilterForm.cbbSTREETEnter(Sender: TObject);
begin
  if VarIsNumeric(cbbAREA.value) then
  begin
    dsStreets.Filter := 'AREA_ID = ' + VarAsType(cbbAREA.value, varString);
  end;
  dsStreets.Filtered := (VarIsNumeric(cbbAREA.value));
  cbbSTREET.SelectAll;
end;

procedure TCustomersFilterForm.lcbSERVICEEnter(Sender: TObject);
begin
  (Sender as TDBLookupComboboxEh).SelectAll;
end;

procedure TCustomersFilterForm.DBNumberEditEh1Exit(Sender: TObject);
begin
  if not VarIsClear((Sender as TDBNumberEditEh).value) then
    if not cbDolg.Checked then
      cbDolg.Checked := true;
end;

procedure TCustomersFilterForm.dbnvgrClick(Sender: TObject; Button: TNavigateBtn);
begin
  SetTab;
end;

procedure TCustomersFilterForm.DBLookupComboboxClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    exit;
  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
end;

end.
