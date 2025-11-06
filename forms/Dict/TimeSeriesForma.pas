unit TimeSeriesForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GridForma, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, CnErrorProvider, Vcl.Menus,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.Mask, DBCtrlsEh, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet;

type
  TTimeSeriesForm = class(TGridForm)
    dsSeries: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    lbl2: TLabel;
    edtName: TDBEditEh;
    mmoO_DESCRIPTION: TDBMemoEh;
    pnlValues: TPanel;
    spl1: TSplitter;
    pnlVTop: TPanel;
    dbgValues: TDBGridEh;
    dsValues: TpFIBDataSet;
    srcValues: TDataSource;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    btnDel1: TSpeedButton;
    actVAdd: TAction;
    actVEdit: TAction;
    actVdel: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actVAddExecute(Sender: TObject);
    procedure actVEditExecute(Sender: TObject);
    procedure actVdelExecute(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    procedure StartEdt(const New: Boolean = False);
  public
    { Public declarations }
  end;

var
  TimeSeriesForm: TTimeSeriesForm;

implementation

uses
  DM, MAIN, PrjConst, AtrCommon;

{$R *.dfm}

procedure TTimeSeriesForm.StartEdt(const New: Boolean = False);
var
  i: Integer;
begin
  StartEdit(New);

  edtName.Enabled := True;
end;

procedure TTimeSeriesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if FCanEdit then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
        srcDataSource.DataSet.Delete;
  end;
end;

procedure TTimeSeriesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit then
    StartEdt();
end;

procedure TTimeSeriesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit then
    StartEdt(True);
end;

procedure TTimeSeriesForm.actVAddExecute(Sender: TObject);
var
  pce: String;
  d: TDateTime;
  fs: TFormatSettings;
  AValues: array of string;
begin
  inherited;
  if (not dsSeries.Active) or (dsSeries.RecordCount = 0) then
    Exit;

  SetLength(AValues, 5);
  AValues[0] := DateToStr(Now());
  AValues[1] := '';
  AValues[2] := '';
  AValues[3] := '';
  AValues[4] := '';
  if InputQuery('Тариф', ['Дата', 'Тариф', 'Примечание'], AValues,
    function(const Values: array of string): Boolean
    var
      v: Double;
      d: TDateTime;
    begin
      Result := TryStrToDate(Values[0], d) and TryStrToFloat(Values[1], v);
    end) then
  begin
    fs.ShortDateFormat := 'dd.mm.yyyy';
    d := StrToDate(AValues[0]);

    with dmMain.Query do
    begin;
      sql.Clear;
      sql.Text := dsValues.InsertSQL.Text;

      ParamByName('O_ID').AsInteger := dsSeries['O_ID'];
      ParamByName('HDATE').AsDate := d;

      ParamByName('NVALUE').AsFloat := StrToFloat(AValues[1]);
      ParamByName('NOTICE').AsString := AValues[2];

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsValues.CloseOpen(True);
      dsValues.Locate('HDATE', d, []);
    end;
  end;
end;

procedure TTimeSeriesForm.actVdelExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if dsValues.RecordCount = 0 then
    Exit;

  if fCanEdit then
  begin
      if (MessageDlg(Format(rsDeleteWithName, [dsValues.FieldByName('HDATE').AsString]), mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
        dsValues.Delete;
  end;
end;

procedure TTimeSeriesForm.actVEditExecute(Sender: TObject);
var
  pce: String;
  AValues: array of string;
  d: TDateTime;
begin
  inherited;
  if (not dsValues.Active) or (dsValues.RecordCount = 0) then
    Exit;

  SetLength(AValues, 2);
  if not dsValues.FieldByName('NVALUE').IsNull then
    AValues[0] := dsValues.FieldByName('NVALUE').AsString
  else
    AValues[0] := '0';

  if not dsValues.FieldByName('NOTICE').IsNull then
    AValues[3] := dsValues.FieldByName('NOTICE').AsString
  else
    AValues[3] := '';

  if InputQuery('Тариф', ['Тариф', 'Примечание'], AValues,
    function(const Values: array of string): Boolean
    var
      v: Double;
    begin
      Result := TryStrToFloat(Values[0], v);
    end) then
  begin
    with dmMain.Query do
    begin;
      sql.Clear;
      sql.Text := dsValues.UpdateSQL.Text;

      ParamByName('OLD_HID').AsInteger := dsValues['HID'];
      ParamByName('HID').AsInteger := dsValues['HID'];
      ParamByName('O_ID').AsInteger := dsValues['O_ID'];
      ParamByName('HDATE').AsDate := dsValues['HDATE'];

      ParamByName('NVALUE').AsFloat := StrToFloat(AValues[0]);
      ParamByName('NOTICE').AsString := AValues[1];

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsValues.Refresh;
    end;
  end;
end;

procedure TTimeSeriesForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

  if (edtName.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  if not errors then
    inherited;
end;

procedure TTimeSeriesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  dsValues.Close;
  dsSeries.Close;

  TimeSeriesForm := nil;
end;

procedure TTimeSeriesForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_TimeSeries);
  fCanEdit := vFull;

  fCanCreate := fCanEdit;

  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  actVAdd.Visible := fCanEdit;
  actVDel.Visible := fCanEdit;
  actVEdit.Visible := fCanEdit;


  dsSeries.Open;
  dsValues.Open;
end;

end.
