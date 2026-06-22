unit CountersIndicationForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, MemTableDataEh, Data.DB,
  MemTableEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  DBCtrlsEh, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
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
    intgrfldCntA_INC: TIntegerField;
    intgrfldCntA_TO: TIntegerField;
    fltfldCntPCM: TFloatField;
    fltfldCntPC30: TFloatField;
    procedure btnGetClick(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure mtCntCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDateChange(Sender: TObject);
    procedure edDateExit(Sender: TObject);
    procedure dbgCntColumns9CellButtons0Click(Sender: TObject; var Handled: Boolean);
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
  s: string;
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
      // if (mtCnt.FieldByName('SCV').IsNull) or (mtCnt['CV'] <> mtCnt['SCV']) then
      // сохраняем в любом случае
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

        s := '';
        if (not mtCnt.FieldByName('A_TO').IsNull) then
          s := '"TO":' + mtCnt.FieldByName('A_TO').AsString;
        if (not mtCnt.FieldByName('A_INC').IsNull) then
        begin
          if s <> '' then
            s := s + ',';
          s := s + '"INC":' + mtCnt.FieldByName('A_INC').AsString;
        end;
        if s <> '' then
          qrySet.ParamByName('Cvalue').AsString := '{' + s + '}'
        else
          qrySet.ParamByName('Cvalue').Clear;

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

    if (not mtCnt.FieldByName('A_INC').IsNull) then
    begin
      if (mtCnt.FieldByName('A_TO').IsNull) //
        or ((not mtCnt.FieldByName('PV').IsNull) and (mtCnt['A_TO'] > mtCnt['PV'])) //
      then
        mtCnt['CV'] := trunc(mtCnt['PV'] + mtCnt['A_INC']);
    end;

    if (mtCnt.FieldByName('CV').IsNull) and (not mtCnt.FieldByName('PCE').IsNull) and
      (not mtCnt.FieldByName('PV').IsNull) then
      mtCnt['CV'] := trunc(mtCnt['PV'] + 24 * d * mtCnt['PCE'] / 1000);

    {
      if (not mtCnt.FieldByName('NOTICE').IsNull) then
      mtCnt.FieldByName('NOTICE').Clear;
      if (not mtCnt.FieldByName('CDATE').IsNull) then
      mtCnt.FieldByName('CDATE').Clear;
    }
    mtCnt.Post;
    mtCnt.Next;
  end;
  mtCnt.First;
  mtCnt.EnableControls;
end;

procedure TCountersIndicationForm.dbgCntColumns9CellButtons0Click(Sender: TObject; var Handled: Boolean);
var
  AValues: array of string;
  s: string;
  o, f, p, k, m: Integer;
begin
  Handled := True;

  SetLength(AValues, 4);
  AValues[0] := '';
  if (not mtCnt.FieldByName('PV').IsNull) then
    AValues[1] := mtCnt.FieldByName('PV').AsString; // прошлые показания
  if (not mtCnt.FieldByName('A_INC').IsNull) then
    AValues[2] := mtCnt.FieldByName('A_INC').AsString; // Увеличивать на
  s := '';
  if (not mtCnt.FieldByName('PCE').IsNull) then
  begin
    AValues[3] := Round(mtCnt['PCE'] * 24 * 30 / 1000).ToString; // потреб мощность
    s := ' (' + mtCnt.FieldByName('PCE').AsString + '*24*30/1000)';
  end;

  if InputQuery('Рассчет показаний ДО', ['Факт показ. счетчика, кВт', 'Опл. показания, кВт', 'Увеличивать на, кВт',
    'Потр. мощность в месяц, кВт' + s], AValues,
    function(const Values: array of string): Boolean
    var
      v: Integer;
    begin
      Result := TryStrToInt(Values[0], v) and TryStrToInt(Values[1], v) and TryStrToInt(Values[2], v) and
        TryStrToInt(Values[3], v);
    end) then
  begin
    if (not(mtCnt.State in [dsEdit])) then
      mtCnt.Edit;
    k := StrToInt(AValues[2]);
    o := StrToInt(AValues[1]);
    f := StrToInt(AValues[0]);
    p := StrToInt(AValues[3]);
    // vTO
    m := Ceil((o - f) / (p - k));
    p := o + m * k;
    mtCnt['A_INC'] := k;
    mtCnt['A_TO'] := p;
    mtCnt.Post;
  end;
end;

procedure TCountersIndicationForm.edDateChange(Sender: TObject);
var
  d: TDate;
  fs: TFormatSettings;
  t, m, y: Word;
begin
  if (VarIsNull(edDate.Value)) then
    Exit;

  edDate.OnChange := nil;
  DecodeDate(edDate.Value, y, m, t);
  edDate.Value := EncodeDate(y, m, 1);
  edDate.OnChange := edDateChange;

  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-mm-dd';
  d := StrToDate(dmMain.GetSettingsValue('PCE_START_DATE'), fs);
  if (edDate.Value <= d) then
  begin
    ShowMessage(rsSuspiciousDate);
    edDate.SetFocus;
  end;
end;

procedure TCountersIndicationForm.edDateExit(Sender: TObject);
begin
  edDateChange(Sender);
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
  c: Integer;
  ShowToolTips: Boolean;
begin
  ShowToolTips := (dmMain.GetIniValue('SHOW_TOOLTIPS') = '1');
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

        if ShowToolTips then
        begin
          if (not Assigned((Components[i] as TDBGridEh).OnDataHintShow)) then
            (Components[i] as TDBGridEh).OnDataHintShow := A4MainForm.dbGridEhDataHintShow;
          (Components[i] as TDBGridEh).ShowHint := True;
          for c := 0 to (Components[i] as TDBGridEh).Columns.Count - 1 do
            (Components[i] as TDBGridEh).Columns[c].ToolTips := True;
        end;
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
  mtCnt.DisableControls;
  mtCnt.EmptyTable;
  d := DaysInMonth(edDate.Value);
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
          mtCnt['PV'] := trunc(dsElectroPoint['PV']);
        if (not dsElectroPoint.FieldByName('CV').IsNull) then
          mtCnt['CV'] := trunc(dsElectroPoint['CV']);
        if (not dsElectroPoint.FieldByName('PCE').IsNull) then
          mtCnt['PCE'] := dsElectroPoint['PCE']
        else if (not dsElectroPoint.FieldByName('PCE_FACT').IsNull) then
          mtCnt['PCE'] := dsElectroPoint['PCE_FACT']
        else
          mtCnt['PCE'] := 0;

        mtCnt['PCM'] := Ceil(mtCnt['PCE'] * 24 * d / 1000);
        mtCnt['PC30'] := Ceil(mtCnt['PCE'] * 24 * 30 / 1000);

        if (not mtCnt.FieldByName('CV').IsNull) then
          mtCnt['SCV'] := mtCnt['CV'];
        if (not dsElectroPoint.FieldByName('NOTICE').IsNull) then
          mtCnt['NOTICE'] := dsElectroPoint['NOTICE'];
        if (not dsElectroPoint.FieldByName('CDATE').IsNull) then
          mtCnt['CDATE'] := dsElectroPoint['CDATE'];

        if (not dsElectroPoint.FieldByName('A_INC').IsNull) then
          mtCnt['A_INC'] := dsElectroPoint['A_INC'];
        if (not dsElectroPoint.FieldByName('A_TO').IsNull) then
          mtCnt['A_TO'] := dsElectroPoint['A_TO'];

        FNeedWarning := FNeedWarning or (mtCnt['CV'] <> 0);
        mtCnt.Post;
      end;
      dsElectroPoint.Next;
    end;
    dsElectroPoint.EnableControls;
  finally
    dsElectroPoint.Close;
  end;
  mtCnt.EnableControls;
  mtCnt.First;
end;

procedure TCountersIndicationForm.mtCntCalcFields(DataSet: TDataSet);
begin
  if not(DataSet.FieldByName('CV').IsNull or DataSet.FieldByName('PV').IsNull) then
    DataSet['DIF'] := trunc(DataSet['CV']) - trunc(DataSet['PV'])
  else
    DataSet['DIF'] := 0;
end;

end.
