unit PortFilter;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.ActnList,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, pFIBQuery,
  PrjConst, DBGridEh;

type
  TPortFilterForm = class(TForm)
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
    Label9: TLabel;
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
    procedure SaveFilter(const filename: string);
  public
    { Public declarations }
  end;

var
  PortFilterForm: TPortFilterForm;

implementation

uses
  DM, MAIN, AtrCommon, PortListForma;

{$R *.dfm}

procedure TPortFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsStreets.Close;
  dsHomes.Close;
  dsArea.Close;
  dsSubArea.Close;
end;

procedure TPortFilterForm.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
  chkAddress.Top := grpAddress.Top - trunc(chkAddress.Height / 2);
end;

procedure TPortFilterForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TPortFilterForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
end;

procedure TPortFilterForm.FormShow(Sender: TObject);
begin
  dsStreets.Open;
  dsHomes.Open;
  dsArea.Open;
  dsSubArea.Open;

  pgcFilter.ActivePage := tsFilter;
end;

procedure TPortFilterForm.SaveFilter(const filename: string);
var
  s: string;
begin
  if Length(filename) = 0 then
    exit;
  s := A4MainForm.GetUserFilterFolder + filename + '.jpf';
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  DatasetToJson(srcFilter.DataSet, s);
end;

procedure TPortFilterForm.SpeedButton1Click(Sender: TObject);
var
  filename: string;
begin
  filename := InputBox(rsInputFilterName, rsTitle, rsFilter);
  if Length(filename) = 0 then
    exit;
  SaveFilter(filename);
end;

procedure TPortFilterForm.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := A4MainForm.GetUserFilterFolder;
  if OpenDialog1.Execute then
  begin
    srcFilter.DataSet.Close;
    srcFilter.DataSet.Open;
    DatasetFromJson(srcFilter.DataSet, OpenDialog1.filename);
  end;
end;

procedure TPortFilterForm.srcFilterDataChange(Sender: TObject; Field: TField);
begin
  if srcFilter.DataSet['next_condition'] = 0 then
    lblOrAND.Caption := rsOR
  else
    lblOrAND.Caption := rsAND;
  lblOrAND.Visible := srcFilter.DataSet.RecNo > 1;
end;

procedure TPortFilterForm.actClearExecute(Sender: TObject);
begin
  if not Assigned(PortListForm) then
    exit;

  with PortListForm.dsFilter do
  begin
    DisableControls;
    Close;
    Open;
    EmptyTable;
    Insert;
    EnableControls;
  end;
end;

procedure TPortFilterForm.bbOkClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
  begin
    srcFilter.DataSet.post;
  end;

  if chkDefaultFilter.Checked then
    SaveFilter('port_default');
  ModalResult := mrOk;
end;

procedure TPortFilterForm.btnANDClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 1;
end;

procedure TPortFilterForm.btnORClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 0;
end;

procedure TPortFilterForm.checkAdressSign(Sender: TObject);
begin
  if (Sender is TDBLookupComboboxEh) then
    if not VarIsClear((Sender as TDBLookupComboboxEh).Value) then
      if not chkAddress.Checked then
        chkAddress.Checked := true;
end;

end.
