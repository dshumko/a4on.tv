unit CallCenterForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh,
  DBAxisGridsEh, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, FIBDatabase, pFIBDatabase,
  Data.DB, FIBDataSet, pFIBDataSet, Vcl.ComCtrls, Vcl.ToolWin, Vcl.DBCtrls,
  Vcl.Buttons, MemTableDataEh, MemTableEh, PropFilerEh, PropStorageEh;

type
  TCallCenterForm = class(TForm)
    pnlTop: TPanel;
    pnlButtom: TPanel;
    pnlClient: TPanel;
    spl1: TSplitter;
    pnlSearchAdres: TPanel;
    lbl1: TLabel;
    cbbStreets: TDBLookupComboboxEh;
    cbbHOUSE: TDBLookupComboboxEh;
    cbbAREA: TDBLookupComboboxEh;
    dbgFlats: TDBGridEh;
    actlstFlats: TActionList;
    actAdresFilter: TAction;
    dsArea: TpFIBDataSet;
    srcArea: TDataSource;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsFlats: TpFIBDataSet;
    srcFlats: TDataSource;
    tlbFlats: TToolBar;
    btnQuickFilter: TToolButton;
    btnFilter: TButton;
    lbl5: TLabel;
    actCall: TAction;
    mdsFilter: TMemTableEh;
    PropStorage: TPropStorageEh;
    actQuickFilter: TAction;
    srcContacts: TDataSource;
    dsContacts: TpFIBDataSet;
    actCallCustomer: TAction;
    actRecourse: TAction;
    btn1: TToolButton;
    btnRecourse: TToolButton;
    pnlContacts: TPanel;
    Panel1: TPanel;
    dbgrdhContacts: TDBGridEh;
    pnlBtns: TPanel;
    Label2: TLabel;
    btnCall: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnCallP: TSpeedButton;
    edtPHONE: TDBEditEh;
    edtMOBILE: TDBEditEh;
    Label1: TLabel;
    edtPORCH_N: TDBEditEh;
    lbl2: TLabel;
    lbl3: TLabel;
    edtFLOOR_N: TDBEditEh;
    edtPHONE2: TDBEditEh;
    lbl6: TLabel;
    lbl4: TLabel;
    spl2: TSplitter;
    pnlNotice: TPanel;
    dbmNOTICE: TDBMemoEh;
    lbl7: TLabel;
    pnlAdd: TPanel;
    dbtxtSTATE: TDBText;
    dbgRec: TDBGridEh;
    spl3: TSplitter;
    srcRecourses: TDataSource;
    dsRecourses: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actAdresFilterExecute(Sender: TObject);
    procedure cbbAREAChange(Sender: TObject);
    procedure cbbStreetsChange(Sender: TObject);
    procedure btnCallPClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure actCallExecute(Sender: TObject);
    procedure btnQuickFilterClick(Sender: TObject);
    procedure actCallCustomerExecute(Sender: TObject);
    procedure dbgrdhContactsDblClick(Sender: TObject);
    procedure actRecourseExecute(Sender: TObject);
  private
    procedure InitSecurity;
    procedure SetAdresFilter;
    procedure MakeCall(const itsMobile: Boolean = False);
  public
    { Public declarations }
  end;

var
  CallCenterForm: TCallCenterForm;

implementation

uses
  DM, MAIN, pFIBProps, EhLibFIB, RecourseForma, RecoursesForma;

{$R *.dfm}

procedure TCallCenterForm.actAdresFilterExecute(Sender: TObject);
begin
  if VarIsNumeric(cbbHOUSE.KeyValue) then
  begin
    SetAdresFilter();
  end
end;

procedure TCallCenterForm.actCallCustomerExecute(Sender: TObject);
begin
  if (dsContacts.RecordCount = 0) or (dsContacts.FieldByName('CC_TYPE').IsNull) or
    (dsContacts.FieldByName('CC_VALUE').IsNull) then
    exit;

  A4MainForm.MakeCall(dsContacts['CC_TYPE'], dsContacts['CC_VALUE']);
end;

procedure TCallCenterForm.actCallExecute(Sender: TObject);
begin
  MakeCall(False);
end;

procedure TCallCenterForm.actRecourseExecute(Sender: TObject);
var
  s, h: Integer;
  f: String;
begin
  if not dsFlats.FieldByName('STREET_ID').IsNull then
    s := dsFlats['STREET_ID']
  else
    s := -1;
  if not dsFlats.FieldByName('House_ID').IsNull then
    h := dsFlats['House_id']
  else
    h := -1;
  if not dsFlats.FieldByName('FLAT_NO').IsNull then
    f := dsFlats['FLAT_NO']
  else
    f := '';

  EditRecourseByAdres(s, h, f);
  dsRecourses.CloseOpen(True);
end;

procedure TCallCenterForm.btnCallPClick(Sender: TObject);
begin
  MakeCall(False);
end;

procedure TCallCenterForm.btnQuickFilterClick(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgFlats.STFilter.Visible := actQuickFilter.Checked;
  if not actQuickFilter.Checked then
    dbgFlats.DataSource.DataSet.Filtered := False;
end;

procedure TCallCenterForm.cbbAREAChange(Sender: TObject);
begin
  if (VarIsNumeric(cbbAREA.KeyValue)) then
    dsStreets.ParamByName('area_id').AsInteger := cbbAREA.KeyValue
  else
    dsStreets.ParamByName('area_id').Clear;

  if dsHomes.Active then
  begin
    cbbHOUSE.Clear;
    dsHomes.Close;
  end;
  if dsStreets.Active then
  begin
    cbbStreets.Clear;
    dsStreets.Close;
  end;
  dsStreets.Open;
end;

procedure TCallCenterForm.cbbStreetsChange(Sender: TObject);
begin
  if dsHomes.Active then
  begin
    cbbHOUSE.Clear;
    dsHomes.Close;
  end;
  cbbHOUSE.value := NULL;
  dsHomes.Open;
end;

procedure TCallCenterForm.dbgrdhContactsDblClick(Sender: TObject);
begin
  actCallCustomer.Execute;
end;

procedure TCallCenterForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, True);
  if dsRecourses.Active then
    dsRecourses.Close;
  if dsContacts.Active then
    dsContacts.Close;
  if dsFlats.Active then
    dsFlats.Close;
  if dsFlats.Active then
    dsFlats.Close;

  CallCenterForm := nil;
  Action := caFree;
end;

procedure TCallCenterForm.FormShow(Sender: TObject);
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
  dbtxtSTATE.Font.Name := Font_name;
  dbtxtSTATE.Font.Size := Font_size;

  if not TryStrToInt(dmMain.GetIniValue('FETCHALL'), i) then
    i := 0;

  if (i = 0) then
    dsFlats.Options := dsFlats.Options - [poFetchAll];

  InitSecurity;

  dsArea.Open;
  dsStreets.Open;

  cbbStreets.SetFocus;
end;

procedure TCallCenterForm.InitSecurity;
begin
  //
end;

procedure TCallCenterForm.SetAdresFilter();
var
  filter: string;
  id: Integer;
begin
  filter := '';
  if VarIsNumeric(cbbHOUSE.KeyValue) then
  begin
    id := cbbHOUSE.KeyValue;
    filter := Format(' f.HOUSE_ID = %d ', [id]);
  end
  else
    exit;

  dsFlats.DisableControls;
  dsFlats.Close;
  dsFlats.ParamByName('where_clause').value := filter;
  dsFlats.filter := '';
  dsFlats.Filtered := False;
  dsFlats.Open;
  dsFlats.EnableControls;
  if dsContacts.Active then
    dsContacts.Close;
  dsContacts.Open;
  if dsRecourses.Active then
    dsRecourses.Close;
  dsRecourses.Open;
end;

procedure TCallCenterForm.SpeedButton1Click(Sender: TObject);
begin
  MakeCall(True);
end;

procedure TCallCenterForm.MakeCall(const itsMobile: Boolean = False);
var
  s, h: Integer;
  f: String;
begin
  if (dsFlats.RecordCount = 0) then
    exit;

  f := '';
  if itsMobile then
  begin
    if (not dsFlats.FieldByName('MOBILE').IsNull) then
      f := dsFlats['MOBILE'];
  end
  else
  begin
    if (not dsFlats.FieldByName('PHONE').IsNull) then
      f := dsFlats['PHONE'];
  end;

  if f <> '' then
    A4MainForm.MakeCall(0, f);

  if not dsFlats.FieldByName('STREET_ID').IsNull then
    s := dsFlats['STREET_ID']
  else
    s := -1;
  if not dsFlats.FieldByName('House_ID').IsNull then
    h := dsFlats['House_id']
  else
    h := -1;
  if not dsFlats.FieldByName('FLAT_NO').IsNull then
    f := dsFlats['FLAT_NO']
  else
    f := '';

  EditRecourseByAdres(s, h, f);
  dsRecourses.CloseOpen(True);
end;

end.
