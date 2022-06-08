unit OrdersTPFilter;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.ActnList,
  DBGridEh, DBCtrlsEh, MemTableEh, DBLookupEh, FIBDataSet, pFIBDataSet, pFIBQuery, PrjConst, frxDesgnCtrls;

type
  TOrdersTPFilterForm = class(TForm)
    srcFilter: TDataSource;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnClear: TSpeedButton;
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
    lcbTYPE: TDBLookupComboboxEh;
    pnlFilter: TPanel;
    lblFnew: TLabel;
    lblDelim: TLabel;
    lblOrAND: TLabel;
    dbnvgr: TDBNavigator;
    chkinversion: TDBCheckBoxEh;
    btnAND: TButton;
    btnOR: TButton;
    dsOTPTypes: TpFIBDataSet;
    srcOTPTypes: TDataSource;
    lbl1: TLabel;
    cbDT: TDBComboBoxEh;
    edDS: TDBDateTimeEditEh;
    edDE: TDBDateTimeEditEh;
    edtText: TDBEditEh;
    lbl2: TLabel;
    Label1: TLabel;
    lbl3: TLabel;
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

implementation

uses
  DM, MAIN, AtrCommon, OrdersTPForma;

{$R *.dfm}

procedure TOrdersTPFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsOTPTypes.Close;
end;

procedure TOrdersTPFilterForm.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
end;

procedure TOrdersTPFilterForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TOrdersTPFilterForm.FormKeyPress(Sender: TObject; var Key: Char);
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
      go := False;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TOrdersTPFilterForm.FormShow(Sender: TObject);
begin
  dsOTPTypes.Open;

  pgcFilter.ActivePage := tsFilter;
end;

procedure TOrdersTPFilterForm.SaveFilter(const filename: string);
var
  s: string;
begin
  if Length(filename) = 0 then
    exit;
  s := A4MainForm.GetUserFilterFolder + filename + '.JOF';
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
    srcFilter.DataSet.post;
  DatasetToJson(srcFilter.DataSet, s);
end;

procedure TOrdersTPFilterForm.SpeedButton1Click(Sender: TObject);
var
  filename: string;
begin
  filename := InputBox(rsInputFilterName, rsTitle, rsFilter);
  if Length(filename) = 0 then
    exit;
  SaveFilter(filename);
end;

procedure TOrdersTPFilterForm.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := A4MainForm.GetUserFilterFolder;
  if OpenDialog1.Execute then begin
    srcFilter.DataSet.DisableControls;
    if not srcFilter.DataSet.Active then
      srcFilter.DataSet.Open;
    (srcFilter.DataSet as TMemTableEh).EmptyTable;
    DatasetFromJson(srcFilter.DataSet, OpenDialog1.filename);
    srcFilter.DataSet.EnableControls;
  end;
end;

procedure TOrdersTPFilterForm.srcFilterDataChange(Sender: TObject; Field: TField);
begin
  if srcFilter.DataSet['next_condition'] = 0 then
    lblOrAND.Caption := rsOR
  else
    lblOrAND.Caption := rsAND;
  lblOrAND.Visible := srcFilter.DataSet.RecNo > 1;
end;

procedure TOrdersTPFilterForm.actClearExecute(Sender: TObject);
begin
  if not Assigned(OrdersTPForm) then
    exit;

  with OrdersTPForm.dsFilter do
  begin
    DisableControls;
    Close;
    Open;
    EmptyTable;
    Insert;
    EnableControls;
  end;
end;

procedure TOrdersTPFilterForm.bbOkClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert] then
  begin
    srcFilter.DataSet.post;
  end;

  if chkDefaultFilter.Checked then
    SaveFilter('OrdersTP_default');
  ModalResult := mrOk;
end;

procedure TOrdersTPFilterForm.btnANDClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 1;
end;

procedure TOrdersTPFilterForm.btnORClick(Sender: TObject);
begin
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 0;
end;

end.
