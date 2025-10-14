unit CountersIndicationForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, MemTableDataEh, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, MemTableEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Mask, DBCtrlsEh, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  PropFilerEh, PropStorageEh;

type
  TCountersIndicationForm = class(TForm)
    srcCnt: TDataSource;
    dbgCnt: TDBGridEh;
    mtCnt: TMemTableEh;
    Panel1: TPanel;
    pnl1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    edDate: TDBDateTimeEditEh;
    btnGet: TButton;
    dsElectroPoint: TpFIBDataSet;
    btnSet: TButton;
    qrySet: TpFIBQuery;
    mtCntNAME: TStringField;
    mtCntNOTICE: TStringField;
    mtCntPID: TIntegerField;
    mtCntCNT: TStringField;
    mtCntPV: TFloatField;
    mtCntPCE: TFloatField;
    mtCntSCV: TFloatField;
    mtCntCV: TFloatField;
    mtCntDIF: TFloatField;
    PropStorageEh: TPropStorageEh;
    mtCntCDATE: TDateField;
    procedure btnGetClick(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure mtCntCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDateChange(Sender: TObject);
    procedure edDateExit(Sender: TObject);
  private
    FNeedWarning: Boolean;
  public
    procedure GetCntIndicators(const iDate: TDate);
  end;

implementation

uses
  DM, System.DateUtils, MAIN, PrjConst;

{$R *.dfm}

procedure TCountersIndicationForm.btnGetClick(Sender: TObject);
begin
  if not VarIsNull(edDate.Value) then
    GetCntIndicators(edDate.Value)
  else
    edDate.SetFocus;
end;

procedure TCountersIndicationForm.btnOkClick(Sender: TObject);
var
  d: Word;
begin
  if VarIsNull(edDate.Value) then
    Exit;
  if (not mtCnt.Active) or (mtCnt.RecordCount = 0) then
    Exit;

  if mtCnt.State = dsEdit then
    mtCnt.Post;

  if Application.MessageBox(PChar(Format('Ранее уже были внесены показания счетчиков.' + #13#10 +
    'Вы уверены, что хотите их заменить?', [])), 'Заменить показания', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO
  then
    Exit;

  mtCnt.First;
  while not mtCnt.Eof do
  begin
    if (not mtCnt.FieldByName('CV').IsNull) then
    begin
      if (mtCnt.FieldByName('SCV').IsNull) or (mtCnt['CV'] <> mtCnt['SCV']) then
      begin
        qrySet.ParamByName('O_Id').AsInteger := mtCnt['PID'];
        qrySet.ParamByName('Hdate').AsDate := edDate.Value;
        qrySet.ParamByName('Nvalue').AsFloat := mtCnt['CV'];
        if (not mtCnt.FieldByName('NOTICE').IsNull) then
          qrySet.ParamByName('NOTICE').AsString := mtCnt['NOTICE']
        else
          qrySet.ParamByName('NOTICE').Clear;
        if (not mtCnt.FieldByName('CDATE').IsNull) then
          qrySet.ParamByName('CDATE').AsDate := mtCnt['CDATE']
        else
          qrySet.ParamByName('CDATE').Clear;
        qrySet.ExecQuery;
      end;
    end;
    mtCnt.Next;
  end;

  ModalResult := mrOk;
end;

procedure TCountersIndicationForm.btnSetClick(Sender: TObject);
var
  d: Word;
begin
  d := DaysInMonth(edDate.Value);
  mtCnt.DisableControls;
  mtCnt.First;
  while not mtCnt.Eof do
  begin
    mtCnt.Edit;
    if (not mtCnt.FieldByName('PCE').IsNull) then
    begin
      mtCnt['CV'] := trunc(mtCnt['PV'] + 24 * d * mtCnt['PCE'] / 1000);
      if (not mtCnt.FieldByName('NOTICE').IsNull) then
        mtCnt.FieldByName('NOTICE').Clear;
      if (not mtCnt.FieldByName('CDATE').IsNull) then
        mtCnt.FieldByName('CDATE').Clear;
    end;
    mtCnt.Post;
    mtCnt.Next;
  end;
  mtCnt.First;
  mtCnt.EnableControls;
end;

procedure TCountersIndicationForm.edDateChange(Sender: TObject);
var
 d : TDate;
 fs : TFormatSettings;
begin
  if (dmMain.GetSettingsValue('PCE_START_DATE') = '')
  then Exit;

  if (VarIsNull(edDate.Value))
  then Exit;

  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-mm-dd';
  d := StrToDate(dmMain.GetSettingsValue('PCE_START_DATE'), fs);
  if (edDate.Value < d) then begin
    ShowMessage(rsWrongDate);
    edDate.SetFocus;
  end;
end;

procedure TCountersIndicationForm.edDateExit(Sender: TObject);
begin
  edDateChange(sender);
end;

procedure TCountersIndicationForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, False);
end;

procedure TCountersIndicationForm.FormCreate(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
    i := 0;
  Font_size := i;

  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  if (Font_size <> 0) or (Row_height <> 0) then
  begin
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
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
        (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
          Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      end
    end;
  end;
end;

procedure TCountersIndicationForm.GetCntIndicators(const iDate: TDate);
var
  d, m, y: Word;
begin
  DecodeDate(iDate, y, m, d);
  edDate.Value := EncodeDate(y, m, 1);
  // dbgCnt.Columns[4].Title.Caption := 'Показания, кВт|' + FormatDateTime('mmmm yy', edDate.Value);
  btnOk.Caption := 'Сохранить ' + FormatDateTime('mmmm yy', edDate.Value);
  FNeedWarning := False;
  mtCnt.Active := True;
  mtCnt.EmptyTable;
  dsElectroPoint.ParamByName('DT').AsDate := edDate.Value;
  dsElectroPoint.Open;
  try
    dsElectroPoint.DisableControls;
    dsElectroPoint.First;
    while not dsElectroPoint.Eof do
    begin
      if (not dsElectroPoint.FieldByName('ECOUNTER').IsNull) and (dsElectroPoint['ECOUNTER'] <> '') then
      begin
        mtCnt.Append;
        mtCnt['PID'] := dsElectroPoint['O_ID'];
        mtCnt['NAME'] := dsElectroPoint['O_NAME'];
        mtCnt['CNT'] := dsElectroPoint['ECOUNTER'];
        if (not dsElectroPoint.FieldByName('PV').IsNull) then
          mtCnt['PV'] := Trunc(dsElectroPoint['PV']);
        if (not dsElectroPoint.FieldByName('CV').IsNull) then
          mtCnt['CV'] := Trunc(dsElectroPoint['CV']);
        if (not dsElectroPoint.FieldByName('PCE').IsNull) then
          mtCnt['PCE'] := dsElectroPoint['PCE']
        else if (not dsElectroPoint.FieldByName('PCE_FACT').IsNull) then
          mtCnt['PCE'] := dsElectroPoint['PCE_FACT']
        else
          mtCnt['PCE'] := 0;
        if (not mtCnt.FieldByName('CV').IsNull) then
          mtCnt['SCV'] := mtCnt['CV'];
        if (not dsElectroPoint.FieldByName('NOTICE').IsNull) then
          mtCnt['NOTICE'] := dsElectroPoint['NOTICE'];
        if (not dsElectroPoint.FieldByName('CDATE').IsNull) then
          mtCnt['CDATE'] := dsElectroPoint['CDATE'];

        FNeedWarning := FNeedWarning or (mtCnt['CV'] <> 0);
        mtCnt.Post;
      end;
      dsElectroPoint.Next;
    end;
    dsElectroPoint.EnableControls;
  finally
    dsElectroPoint.Close;
  end;
  mtCnt.First;
end;

procedure TCountersIndicationForm.mtCntCalcFields(DataSet: TDataSet);
begin
  if not(DataSet.FieldByName('CV').IsNull or DataSet.FieldByName('PV').IsNull) then
    DataSet['DIF'] := Trunc(DataSet['CV']) - Trunc(DataSet['PV'])
  else
    DataSet['DIF'] := 0;
end;

end.
