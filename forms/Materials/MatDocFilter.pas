unit MatDocFilter;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.ActnList,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, pFIBQuery,
  PrjConst;

type
  TMatDocFilterForm = class(TForm)
    srcFilter: TDataSource;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnClear: TSpeedButton;
    srcType: TDataSource;
    dsType: TpFIBDataSet;
    OpenDialog1: TOpenDialog;
    pgcFilter: TPageControl;
    tsFilter: TTabSheet;
    pnl1: TPanel;
    chkDefaultFilter: TCheckBox;
    actlst1: TActionList;
    actOk: TAction;
    actClear: TAction;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    lbl5: TLabel;
    cbbNODE_TYPE: TDBLookupComboboxEh;
    pnlFilter: TPanel;
    lblFnew: TLabel;
    lblDelim: TLabel;
    lblOrAND: TLabel;
    dbnvgr: TDBNavigator;
    chkinversion: TDBCheckBoxEh;
    btnAND: TButton;
    btnOR: TButton;
    edStart: TDBDateTimeEditEh;
    edEnd: TDBDateTimeEditEh;
    cbSate: TDBComboBoxEh;
    lblState: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblMat: TLabel;
    lcbMat: TDBLookupComboboxEh;
    dsMaterials: TpFIBDataSet;
    srcMat: TDataSource;
    lbl3: TLabel;
    lcbM_ID: TDBLookupComboboxEh;
    dsWHIN: TpFIBDataSet;
    srcWHIN: TDataSource;
    lbl4: TLabel;
    lcbWH_IN: TDBLookupComboboxEh;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
  MatDocFilterForm: TMatDocFilterForm;

implementation

uses
  DM, MAIN, AtrCommon, MatDocsForma;

{$R *.dfm}

procedure TMatDocFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsWHIN.Close;
  dsMaterials.Close;
  dsType.Close;
end;

procedure TMatDocFilterForm.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
end;

procedure TMatDocFilterForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TMatDocFilterForm.FormKeyPress(Sender: TObject; var Key: Char);
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
      PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TMatDocFilterForm.FormShow(Sender: TObject);
begin
  dsWHIN.Open;
  dsType.Open;
  dsMaterials.Open;
  pgcFilter.ActivePage := tsFilter;
end;

procedure TMatDocFilterForm.SaveFilter(const filename: string);
var
  s: string;
begin
  if Length(filename) = 0 then
    exit;
  s := A4MainForm.GetUserFilterFolder + filename + '.ftr';
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  DatasetToJson(srcFilter.DataSet, s);
end;

procedure TMatDocFilterForm.SpeedButton1Click(Sender: TObject);
var
  filename: string;
begin
  filename := InputBox(rsInputFilterName, rsTitle, rsFilter);
  if Length(filename) = 0 then
    exit;
  SaveFilter(filename);
end;

procedure TMatDocFilterForm.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := A4MainForm.GetUserFilterFolder;
  if OpenDialog1.Execute then
  begin
    srcFilter.DataSet.Close;
    srcFilter.DataSet.Open;
    DatasetFromINI(srcFilter.DataSet, OpenDialog1.filename);
  end;

end;

procedure TMatDocFilterForm.srcFilterDataChange(Sender: TObject; Field: TField);
begin
  if srcFilter.DataSet['next_condition'] = 0 then
    lblOrAND.Caption := rsOR
  else
    lblOrAND.Caption := rsAND;
  lblOrAND.Visible := srcFilter.DataSet.RecNo > 1;
end;

procedure TMatDocFilterForm.actClearExecute(Sender: TObject);
begin
  if not Assigned(MatDocsForm) then
    exit;

  with MatDocsForm.dsFilter do
  begin
    DisableControls;
    Close;
    Open;
    EmptyTable;
    Insert;
    EnableControls;
  end;
end;

procedure TMatDocFilterForm.bbOkClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
  begin
    srcFilter.DataSet.post;
  end;

  if chkDefaultFilter.Checked then
    SaveFilter('matdoc_default');
  ModalResult := mrOk;
end;

procedure TMatDocFilterForm.btnANDClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 1;
end;

procedure TMatDocFilterForm.btnORClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 0;
end;

end.
