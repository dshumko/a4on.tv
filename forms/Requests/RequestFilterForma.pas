unit RequestFilterForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ActnList,
  Vcl.DBCtrls, Vcl.ComCtrls,
  DBGridEh, GridsEh, DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, PrjConst, MemTableEh, PropFilerEh, PropStorageEh;

type
  TRequestFilterForm = class(TForm)
    pnlOKCancel: TPanel;
    SpeedButton3: TSpeedButton;
    dsStreets: TpFIBDataSet;
    srcStreets: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHomes: TDataSource;
    dsArea: TpFIBDataSet;
    srcArea: TDataSource;
    dsSubArea: TpFIBDataSet;
    srcSubArea: TDataSource;
    dsRequestType: TpFIBDataSet;
    srcRequestType: TDataSource;
    dsExecutor: TpFIBDataSet;
    srcExecutor: TDataSource;
    srcWORKAREA: TDataSource;
    dsWORKAREA: TpFIBDataSet;
    dsWORKGROUP: TpFIBDataSet;
    srcWORKGROUP: TDataSource;
    srcANALYS: TDataSource;
    dsANALYS: TpFIBDataSet;
    chkDefaultFilter: TCheckBox;
    pnlBtns: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbnvgr1: TDBNavigator;
    chk1: TDBCheckBoxEh;
    btnAnd: TButton;
    btnOR: TButton;
    btnLoad: TSpeedButton;
    btnSave: TSpeedButton;
    dlgOpen: TOpenDialog;
    dsOrg: TpFIBDataSet;
    srcOrg: TDataSource;
    srcMH: TDataSource;
    dsMH: TpFIBDataSet;
    dsWorks: TpFIBDataSet;
    srcWorks: TDataSource;
    dsResult: TpFIBDataSet;
    srcResult: TDataSource;
    dsErrors: TpFIBDataSet;
    srcErrors: TDataSource;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    pgcFilter: TPageControl;
    tsMain: TTabSheet;
    srcFilter: TDataSource;
    actlst: TActionList;
    actOk: TAction;
    tsList: TTabSheet;
    mmoListBids: TDBMemoEh;
    lblOrAND: TLabel;
    cbbWhose: TDBComboBoxEh;
    luDBLookupComboBox1: TDBLookupComboboxEh;
    luResult: TDBLookupComboboxEh;
    luAnalysGrp: TDBLookupComboboxEh;
    luType: TDBLookupComboboxEh;
    Label2: TLabel;
    edExpired: TDBNumberEditEh;
    dePLANTO: TDBDateTimeEditEh;
    dePLANFROM: TDBDateTimeEditEh;
    luUpCuststreetFilter: TDBLookupComboboxEh;
    lucbb1: TDBLookupComboboxEh;
    lbl1: TLabel;
    lbl8: TLabel;
    lbl12: TLabel;
    lbl11: TLabel;
    lbl3: TLabel;
    lblResult: TLabel;
    lbl10: TLabel;
    lbl17: TLabel;
    cbbSUBAREA: TDBLookupComboboxEh;
    lbl9: TLabel;
    lblHE: TLabel;
    luHE: TDBLookupComboboxEh;
    luOgz: TDBLookupComboboxEh;
    lblOgz: TLabel;
    lblWork: TLabel;
    luWork: TDBLookupComboboxEh;
    luTemplate: TDBLookupComboboxEh;
    Label1: TLabel;
    lbl16: TLabel;
    deTimeFrom: TDBDateTimeEditEh;
    lbl15: TLabel;
    deTimeTo: TDBDateTimeEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    edAfter: TDBNumberEditEh;
    lbl14: TLabel;
    edTo: TDBNumberEditEh;
    lbl13: TLabel;
    lbl7: TLabel;
    luHouseNo: TDBLookupComboboxEh;
    lbl6: TLabel;
    ed1: TDBEditEh;
    lucbb2: TDBLookupComboboxEh;
    lbl2: TLabel;
    PropStorageEh1: TPropStorageEh;
    actSaveToDb: TAction;
    actLoadFromDb: TAction;
    btnDBSave: TSpeedButton;
    btnDBLoad: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAndClick(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure srcFilterDataChange(Sender: TObject; Field: TField);
    procedure luWorkEnter(Sender: TObject);
    procedure luTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure luTypeClick(Sender: TObject);
    procedure actSaveToDbExecute(Sender: TObject);
    procedure actLoadFromDbExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SaveFilter(const filename: string);
    procedure CheckDateAndCorrect();
  public
    { Public declarations }
  end;

var
  RequestFilterForm: TRequestFilterForm;

implementation

uses
  DM, RequestsForma, MAIN, AtrCommon, SelectFilterForma, pFIBQuery;

{$R *.dfm}

procedure TRequestFilterForm.SaveFilter(const filename: string);
var
  s: string;
begin
  if Length(filename) = 0 then
    exit;
  s := A4MainForm.GetUserFilterFolder + filename + '.JRF';
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  DatasetToJson(srcFilter.DataSet, s);
end;

procedure TRequestFilterForm.actSaveToDbExecute(Sender: TObject);
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
    if s.IsEmpty then Exit;

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
      fq.sql.Add('  values (68, :Name)');
      fq.sql.Add('  matching (O_Name, O_Type)');
      fq.sql.Add('  returning O_ID');
      fq.sql.Add('  into :OID;');
      fq.sql.Add('  update or insert into Blob_Tbl (Bl_Type, Owner_Id, Bl_Name, Bl_Body)');
      fq.sql.Add('  values (6, :OID, :Name, :JSON)');
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

procedure TRequestFilterForm.btnAndClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 1;
end;

procedure TRequestFilterForm.btnORClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 0;
end;

procedure TRequestFilterForm.btnLoadClick(Sender: TObject);
begin
  dlgOpen.InitialDir := A4MainForm.GetUserFilterFolder;
  if dlgOpen.Execute then
  begin
    srcFilter.DataSet.DisableControls;
    if not srcFilter.DataSet.Active then
      srcFilter.DataSet.Open;
    (srcFilter.DataSet as TMemTableEh).EmptyTable;
    DatasetFromJson(srcFilter.DataSet, dlgOpen.filename);
    srcFilter.DataSet.EnableControls;
  end;
end;

procedure TRequestFilterForm.btnSaveClick(Sender: TObject);
var
  filename: string;
begin
  filename := InputBox(rsInputFilterName, rsTitle, rsFilter);
  if Length(filename) = 0 then
    exit;
  SaveFilter(rsRequests + filename);
end;

procedure TRequestFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsStreets.Active then
    dsStreets.Close;
  if dsHomes.Active then
    dsHomes.Close;
  if dsArea.Active then
    dsArea.Close;
  if dsSubArea.Active then
    dsSubArea.Close;
  if dsRequestType.Active then
    dsRequestType.Close;
  if dsExecutor.Active then
    dsExecutor.Close;
  if dsWORKAREA.Active then
    dsWORKAREA.Close;
  if dsWORKGROUP.Active then
    dsWORKGROUP.Close;
  if dsANALYS.Active then
    dsANALYS.Close;
  if dsOrg.Active then
    dsOrg.Close;
  if dsMH.Active then
    dsMH.Close;
  if dsWorks.Active then
    dsWorks.Close;
  if dsErrors.Active then
    dsErrors.Open;
end;

procedure TRequestFilterForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    actOkExecute(Sender);
end;

procedure TRequestFilterForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: boolean;
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

procedure TRequestFilterForm.FormShow(Sender: TObject);
begin

  dsStreets.Open;
  dsHomes.Open;
  dsArea.Open;
  dsSubArea.Open;
  dsRequestType.Open;
  dsExecutor.Open;
  dsWORKAREA.Open;
  dsWORKGROUP.Open;
  dsANALYS.Open;
  dsOrg.Open;
  dsMH.Open;
  dsWorks.Open;
  dsResult.Open;
  dsErrors.Open;
  if srcFilter.DataSet.RecordCount > 1 then
    srcFilter.DataSet.First;
  if ((not srcFilter.DataSet.FieldByName('ListBids').IsNull) and (srcFilter.DataSet.FieldByName('ListBids').AsString
    <> '')) then
    pgcFilter.ActivePage := tsList;

end;

procedure TRequestFilterForm.luTypeClick(Sender: TObject);
begin
  if (Sender is TDBLookupComboboxEh) then begin
  if not (Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
  end;
end;

procedure TRequestFilterForm.luTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsRequestType.Active) and (not dsRequestType.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsRequestType['COLOR'])
  else
    Background := clWindow;
end;

procedure TRequestFilterForm.luWorkEnter(Sender: TObject);
begin
  if (Sender is TDBLookupComboboxEh) then
  begin
    if not(Sender as TDBLookupComboboxEh).ListSource.DataSet.Active then
      (Sender as TDBLookupComboboxEh).ListSource.DataSet.Open;
  end;
end;

procedure TRequestFilterForm.SpeedButton3Click(Sender: TObject);
begin
  with srcFilter.DataSet do
  begin
    DisableControls;
    if not Active then
      Open;
    (srcFilter.DataSet as TMemTableEh).EmptyTable;
    EnableControls;
  end;
end;

procedure TRequestFilterForm.srcFilterDataChange(Sender: TObject; Field: TField);
begin
  if srcFilter.DataSet['next_condition'] = 0 then
    lblOrAND.Caption := rsOR
  else
    lblOrAND.Caption := rsAND;
  lblOrAND.Visible := srcFilter.DataSet.RecNo > 1;
end;

procedure TRequestFilterForm.CheckDateAndCorrect();
var
  d1, d2: TDate;
begin
  if (not srcFilter.DataSet.FieldByName('DATE_FROM').IsNull and not srcFilter.DataSet.FieldByName('DATE_TO').IsNull)
  then
  begin
    if (srcFilter.DataSet['DATE_FROM'] > srcFilter.DataSet['DATE_TO']) then
    begin
      d1 := srcFilter.DataSet['DATE_FROM'];
      d2 := srcFilter.DataSet['DATE_TO'];
      srcFilter.DataSet.Edit;
      srcFilter.DataSet['DATE_TO'] := d1;
      srcFilter.DataSet['DATE_FROM'] := d2;
      srcFilter.DataSet.post;
    end;
  end;
end;

procedure TRequestFilterForm.actLoadFromDbExecute(Sender: TObject);
var
  JsonStr: string;
begin
  JsonStr := SelectFilter(68);
  if JsonStr.IsEmpty then
    exit;

  srcFilter.DataSet.DisableControls;
  if not srcFilter.DataSet.Active then
    srcFilter.DataSet.Open;
  (srcFilter.DataSet as TMemTableEh).EmptyTable;
  DatasetFromJsonStr(srcFilter.DataSet, JsonStr);
  srcFilter.DataSet.EnableControls;
end;

procedure TRequestFilterForm.actOkExecute(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;

  CheckDateAndCorrect();

  if chkDefaultFilter.Checked then
    SaveFilter('RDefault');
  ModalResult := mrOk;
end;

end.
