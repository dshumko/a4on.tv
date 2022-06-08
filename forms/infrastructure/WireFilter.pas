unit WireFilter;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.ActnList,
  DBGridEh, DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, SynEditHighlighter, SynHighlighterSQL, SynEdit, SynDBEdit,
  pFIBQuery,
  PrjConst;

type
  TWireFilterForm = class(TForm)
    srcFilter: TDataSource;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    srcStreets: TDataSource;
    dsStreets: TpFIBDataSet;
    srcHomes: TDataSource;
    dsHomes: TpFIBDataSet;
    srcSubArea: TDataSource;
    dsSubArea: TpFIBDataSet;
    btnClear: TSpeedButton;
    OpenDialog1: TOpenDialog;
    pgcFilter: TPageControl;
    tsFilter: TTabSheet;
    pnl1: TPanel;
    grpAddress: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dblStreet: TDBLookupComboboxEh;
    dblHouseNo: TDBLookupComboboxEh;
    dblArea: TDBLookupComboboxEh;
    dblSubArea: TDBLookupComboboxEh;
    chkDefaultFilter: TCheckBox;
    actlst1: TActionList;
    actOk: TAction;
    actClear: TAction;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    dsArea: TpFIBDataSet;
    srcArea: TDataSource;
    chkAddress: TDBCheckBoxEh;
    lbl3: TLabel;
    edtPORCH: TDBEditEh;
    edtFloor: TDBEditEh;
    lbl1: TLabel;
    pnlFilter: TPanel;
    lblFnew: TLabel;
    lblDelim: TLabel;
    lblOrAND: TLabel;
    dbnvgr: TDBNavigator;
    chkinversion: TDBCheckBoxEh;
    btnAND: TButton;
    btnOR: TButton;
    DBEditEh1: TDBEditEh;
    Label3: TLabel;
    cbProblem: TDBComboBoxEh;
    dsType: TpFIBDataSet;
    dsMat: TpFIBDataSet;
    srcMat: TDataSource;
    srcType: TDataSource;
    Label5: TLabel;
    Label8: TLabel;
    lcbMaterial: TDBLookupComboboxEh;
    lcbWTYPE: TDBLookupComboboxEh;
    Label9: TLabel;
    lbl4: TLabel;
    edtLABEL: TDBEditEh;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure checkAdressSign(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure btnANDClick(Sender: TObject);
    procedure srcFilterDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure SaveFilter(const filename: string);
  public
    { Public declarations }
  end;

var
  WireFilterForm: TWireFilterForm;

implementation

uses
  DM, MAIN, AtrCommon, WireForma;

{$R *.dfm}

procedure TWireFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsStreets.Close;
  dsHomes.Close;
  dsArea.Close;
  dsSubArea.Close;
  dsType.Close;
  dsMat.Close;
end;

procedure TWireFilterForm.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
  chkAddress.Top := grpAddress.Top - trunc(chkAddress.Height / 2);
end;

procedure TWireFilterForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TWireFilterForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: boolean;
begin
  if (Key = #13) then
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := False
    else if (ActiveControl is TDBMemoEh) then
      go := False
    else if (ActiveControl is TDBSynEdit) then
      go := False;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TWireFilterForm.FormShow(Sender: TObject);
begin
  dsStreets.Open;
  dsHomes.Open;
  dsArea.Open;
  dsSubArea.Open;
  dsType.Open;
  dsMat.Open;

  pgcFilter.ActivePage := tsFilter;
end;

procedure TWireFilterForm.SaveFilter(const filename: string);
var
  s: string;
begin
  if Length(filename) = 0 then
    exit;
  s := A4MainForm.GetUserFilterFolder + filename + '.jwf';
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  DatasetToJson(srcFilter.DataSet, s);
end;

procedure TWireFilterForm.SpeedButton1Click(Sender: TObject);
var
  filename: string;
begin
  filename := InputBox(rsInputFilterName, rsTitle, rsFilter);
  if Length(filename) = 0 then
    exit;
  SaveFilter(filename);
end;

procedure TWireFilterForm.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := A4MainForm.GetUserFilterFolder;
  if OpenDialog1.Execute then
  begin
    srcFilter.DataSet.Close;
    srcFilter.DataSet.Open;
    DatasetFromJson(srcFilter.DataSet, OpenDialog1.filename);
  end;
end;

procedure TWireFilterForm.srcFilterDataChange(Sender: TObject; Field: TField);
begin
  if srcFilter.DataSet['next_condition'] = 0 then
    lblOrAND.Caption := rsOR
  else
    lblOrAND.Caption := rsAND;
  lblOrAND.Visible := srcFilter.DataSet.RecNo > 1;
end;

procedure TWireFilterForm.actClearExecute(Sender: TObject);
begin
  if not Assigned(WireForm) then
    exit;

  with WireForm.dsFilter do
  begin
    DisableControls;
    Close;
    Open;
    EmptyTable;
    Insert;
    EnableControls;
  end;
end;

procedure TWireFilterForm.bbOkClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
  begin
    srcFilter.DataSet.post;
  end;

  if chkDefaultFilter.Checked then
    SaveFilter('wire_default');
  ModalResult := mrOk;
end;

procedure TWireFilterForm.btnANDClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 1;
end;

procedure TWireFilterForm.btnORClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 0;
end;

procedure TWireFilterForm.checkAdressSign(Sender: TObject);
begin
  if (Sender is TDBLookupComboboxEh) then
    if not VarIsClear((Sender as TDBLookupComboboxEh).Value) then
      if not chkAddress.Checked then
        chkAddress.Checked := true;
end;

end.
