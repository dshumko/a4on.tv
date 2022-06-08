unit LoaderNewForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB, Data.Win.ADODB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ButtonGroup, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtDlgs, Vcl.ActnList,
  DBGridEh, DBCtrlsEh, DBLookupEh, RxPlacemnt, FIBDataSet, pFIBDataSet, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, GridsEh, DBAxisGridsEh, MemTableDataEh, MemTableEh, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, pFIBScripter,
  VKDBFDataSet, RxToolEdit, EhLibVCL;

type
  TLoaderForm = class(TForm)
    fmStorage: TFormStorage;
    dsFileFormats: TpFIBDataSet;
    srcFileFormats: TDataSource;
    pcShowFile: TPageControl;
    tsTXT: TTabSheet;
    strngrdFile: TStringGrid;
    TabSheet1: TTabSheet;
    dbgehDBF: TDBGridEh;
    tsDBF: TTabSheet;
    Splitter1: TSplitter;
    pnlErrors: TPanel;
    dbgehErrors: TDBGridEh;
    mmoSQL: TDBMemoEh;
    mdsReestr: TMemTableEh;
    srcReestr: TDataSource;
    mdsErrors: TMemTableEh;
    srcErrors: TDataSource;
    srcPaymentSrc: TDataSource;
    dsPaymentSource: TpFIBDataSet;
    qFindCustomer: TpFIBQuery;
    qFindCustomerForAdres: TpFIBQuery;
    trReadQ: TpFIBTransaction;
    trWriteQ: TpFIBTransaction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcDBF: TDataSource;
    SelectQuery: TpFIBQuery;
    Script: TpFIBScripter;
    pnlReestr: TPanel;
    pnl3: TPanel;
    dbgehReestr: TDBGridEh;
    grpHead: TGroupBox;
    pnl2: TPanel;
    lbl5: TLabel;
    mmoNotice: TDBMemoEh;
    pnl4: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl2: TLabel;
    deDocDate: TDBDateTimeEditEh;
    edtDocNumber: TDBEditEh;
    cbbDocSrc: TDBLookupComboboxEh;
    qFindServices: TpFIBQuery;
    SaveTextFileDialog: TSaveTextFileDialog;
    dsServices: TpFIBDataSet;
    srcServices: TDataSource;
    grp2: TGroupBox;
    lbl6: TLabel;
    cbbServices: TDBLookupComboboxEh;
    edtDocSum: TDBNumberEditEh;
    btnErrors: TButton;
    pnlTop: TPanel;
    lcbPROFILE: TDBLookupComboboxEh;
    btnEditProfile: TButton;
    btnNewProfile: TButton;
    lbl7: TLabel;
    actlst: TActionList;
    actSelectFile: TAction;
    edtFile: TDBEditEh;
    btnZagr: TButton;
    btnObrab: TButton;
    lbl8: TLabel;
    dlgOpen: TOpenDialog;
    procedure btnObrabClick(Sender: TObject);
    procedure btnZagrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditProfileClick(Sender: TObject);
    procedure btnNewProfileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnErrorsClick(Sender: TObject);
    procedure cbbServicesChange(Sender: TObject);
    procedure cbb_ProfileChange(Sender: TObject);
    procedure actSelectFileExecute(Sender: TObject);
  private
    { Private declarations }
    fFileName: string;
    fProfileType : Integer;
    ScriptExecError: Boolean;
    DBF: TVKDBFNTX;
    procedure SetProfileType;
    procedure addError(const Fileline: Integer; const error: string; const Reestrline: Integer);
    procedure ClearHeader;
    procedure ShowDBF;
    procedure LoadAccountsFromDB;
    procedure TXTFileProcess;
    procedure DBFFileProcess;
    function GetLineWithError(const Reestrline: Integer): string;
  public
    { Public declarations }
    constructor CreateA(aOwner: TComponent; const aTypeLoader: Integer = 0);
  end;

  // TCell = record
  // Val: string; // Содержимое
  // Cl, Rw: Integer; // Координаты
  // end;

var
  LoaderForm: TLoaderForm;
  // CN: TCell;

procedure ShowLoader(const LoaderType: Integer = 0);

implementation

uses
  System.DateUtils, System.StrUtils,
  MAIN, DM, WorkWithGrids, PrjConst, AtrStrUtils, AtrCommon, LoaderNewProfile;

{$R *.dfm}
// Добавление ошибки в протокол

procedure ShowLoader(const LoaderType: Integer = 0);
var
  i: Integer;
  b: Boolean;
begin
  b := false;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i] is TLoaderForm) then
        if (A4MainForm.MDIChildren[i].tag = LoaderType) then begin
          b := true;
          A4MainForm.MDIChildren[i].Show;
          Exit;
        end;

  if not b then
    TLoaderForm.CreateA(Application, LoaderType);
end;

constructor TLoaderForm.CreateA(aOwner: TComponent; const aTypeLoader: Integer = 0);
begin
  inherited Create(aOwner);
  fProfileType := aTypeLoader;
end;

procedure TLoaderForm.SetProfileType;
begin
  if dsFileFormats.Active then
    dsFileFormats.Close;

  dsFileFormats.ParamByName('PROFTYPE').Value := fProfileType;
  dsFileFormats.Open;

  dsPaymentSource.Active := (Self.tag = 0);
  {
  if Self.tag = 0 then
    Self.Caption := rsLoaderService
  else
    Self.Caption := rsLoaderPayment;
  }
end;

procedure TLoaderForm.addError(const Fileline: Integer; const error: string; const Reestrline: Integer);
begin
  if not mdsErrors.Active then begin
    mdsErrors.Open;
    while (not mdsErrors.Eof) do
      mdsErrors.Delete;
    mdsErrors.Insert;
    mdsErrors['FileLine'] := -1;
    mdsErrors['ReestrLine'] := -1;
    mdsErrors['eText'] := Format(rsLoadProfileError, [edtDocNumber.Text, DateTimeToStr(deDocDate.Value), edtFile.Text]);
    mdsErrors.Post;
  end;
  mdsErrors.Append;
  mdsErrors['FileLine'] := Fileline;
  mdsErrors['ReestrLine'] := Reestrline;
  mdsErrors['eText'] := error;
  mdsErrors.Post;
  pnlErrors.Visible := true;
end;

// Очистка заголовка

procedure TLoaderForm.ClearHeader;
var
  dt: TDateTime;
begin
  edtDocSum.Value := 0;
  edtDocNumber.Text := ExtractFileName(edtFile.Text);
{$IFDEF UTF}
  FileAge(edtFile.Text, dt);
{$ELSE}
  dt := FileDateToDateTime(FileAge(edtFile.Text));
{$ENDIF}
  deDocDate.Value := dt;
  mmoNotice.Lines.Text := Format(rsLoadProfileResult, [DateToStr(Now()), ExtractFileName(edtFile.Text)]);
end;

// Открытие DBF файла

procedure TLoaderForm.ShowDBF;
begin
  DBF.Close;
  DBF.OEM := (dsFileFormats['CodePage'] = 0);
  DBF.DBFFileName := AnsiString(edtFile.Text);
  try
    DBF.Open;
  except
    ShowMessage(rsLoadProfileNotDBF);
  end;
end;

function TLoaderForm.GetLineWithError(const Reestrline: Integer): string;
var
  s: string;
  i: Integer;
begin
  if Reestrline > -1 then begin
    if dsFileFormats['FileType'] = 0 then begin
      s := strngrdFile.Cells[2, Reestrline - 1];
      Result := s;
    end
    else begin
      DBF.First;
      DBF.DisableControls;
      for i := 0 to mdsErrors['FileLine'] - 1 do
        DBF.NEXT;
      s := '';
      for i := 0 to DBF.FieldCount - 1 do begin
        s := DBF.Fields[i].AsString + ' , ';
      end;
      Result := s;
      DBF.EnableControls;
    end;
  end
  else
    Result := '';
end;

// Обработка текстового файла

procedure TLoaderForm.TXTFileProcess;
var
  tmp: TStringList;
  i: Integer;
  b, e: Integer;
  ds: TDataSet;
  sa: TStringArray;
  delZerro: Boolean;
  delChr: string;
  s: string;
  account_i, sum_i, dat_i, fio_i, adres_i, pay_n_i, n1_i, n2_i, house_i, flat_i, korp_i: Integer;
  dat_format: string;
  sprt: Char;
  FormatSettings: TFormatSettings;
  kopeyki: Byte;
  nc, nl, sl, dc, sc, dl: Integer;
  Notice: string;
  tmps: string;
begin
{$IFDEF UTF}
  FormatSettings := TFormatSettings.Create;
{$ENDIF}
  if not(strngrdFile.Visible and (strngrdFile.RowCount > 0)) then
    Exit;

  ds := dsFileFormats;

  kopeyki := 1;
  if not ds.FieldByName('kopeyki').IsNull then
    if ds.FieldByName('kopeyki').AsBoolean then
      kopeyki := 100;

  if not ds.FieldByName('DecimalSprt').IsNull then begin
    s := ds['DecimalSprt'];
    FormatSettings.DecimalSeparator := s[1];
  end;

  tmp := TStringList.Create;
  for i := 0 to strngrdFile.RowCount - 1 do begin
    tmp.Add(strngrdFile.Cells[2, i]);
  end;

  if (ds.FieldByName('HeaderExist').AsInteger = 1) and (Self.tag = 0) then begin
    if ds.FieldByName('HeaderFrom').AsInteger <= 0 then
      b := tmp.Count + ds.FieldByName('HeaderFrom').AsInteger - 1
    else
      b := ds.FieldByName('HeaderFrom').AsInteger - 1;
    if ds.FieldByName('HeaderTo').AsInteger <= 0 then
      e := tmp.Count + ds.FieldByName('HeaderTo').AsInteger - 1
    else
      e := ds.FieldByName('HeaderTo').AsInteger - 1;

    s := ds['HeadSprt'];
    if (UpperCase(s) = '\T') then
      sprt := #09
    else
      sprt := s[1];

    if not ds.FieldByName('HeadRemCh').IsNull then
      delChr := ds.FieldByName('HeadRemCh').AsString
    else
      delChr := '';

    if not ds.FieldByName('headDateFmt').IsNull then
      dat_format := ds.FieldByName('headDateFmt').AsString
    else
      dat_format := '';

    nc := 0;
    nl := 0;
    sl := 0;
    dc := 0;
    sc := 0;
    dl := 0;
    if not ds.FieldByName('headNumCol').IsNull then
      nc := ds.FieldByName('headNumCol').AsInteger - 1;
    if not ds.FieldByName('HeadNumLine').IsNull then
      nl := ds.FieldByName('HeadNumLine').AsInteger + b - 1;
    if not ds.FieldByName('headSumCol').IsNull then
      sc := ds.FieldByName('headSumCol').AsInteger - 1;
    if not ds.FieldByName('headSumLine').IsNull then
      sl := ds.FieldByName('headSumLine').AsInteger + b - 1;
    if not ds.FieldByName('headDateCol').IsNull then
      dc := ds.FieldByName('headDateCol').AsInteger - 1;
    if not ds.FieldByName('headDateLine').IsNull then
      dl := ds.FieldByName('headDateLine').AsInteger + b - 1;

    for i := b to e do begin
      s := tmp[i];
      if delChr <> '' then
        s := RemoveChars(s, delChr);
      sa := Explode(sprt, s);

      try
        if i = nl then
          edtDocNumber.Text := sa[nc];
        if i = sl then
          edtDocSum.Value := strtofloat(sa[sc], FormatSettings) / kopeyki;
        if i = dl then
          deDocDate.Value := DateTimeStrEval(dat_format, sa[dc]);
      except
        addError(i + b + 1, rsIeaeaEiiaagoaoeeIaNiioaaono, -1);
      end;
    end;
  end;

  // load data
  if ds['DataFrom'] <= 0 then
    b := tmp.Count + ds['DataFrom'] - 1
  else
    b := ds['DataFrom'] - 1;

  if ds['DataTo'] <= 0 then
    e := tmp.Count + ds['DataTo'] - 1
  else
    e := ds['DataTo'] - 1;
  s := ds['DataSprt'];
  if (UpperCase(s) = '\T') then
    sprt := #09
  else
    sprt := s[1];

  if not ds.FieldByName('ACCOUNT').IsNull then
    account_i := ds.FieldByName('ACCOUNT').AsInteger - 1
  else
    account_i := -1;

  if not ds.FieldByName('ADRES').IsNull then
    adres_i := ds.FieldByName('ADRES').AsInteger - 1
  else
    adres_i := -1;

  if not ds.FieldByName('HOUSE').IsNull then
    house_i := ds.FieldByName('HOUSE').AsInteger - 1
  else
    house_i := -1;

  if not ds.FieldByName('FLAT').IsNull then
    flat_i := ds.FieldByName('FLAT').AsInteger - 1
  else
    flat_i := -1;

  if not ds.FieldByName('KORP').IsNull then
    korp_i := ds.FieldByName('KORP').AsInteger - 1
  else
    korp_i := -1;

  if not ds.FieldByName('FIO').IsNull then
    fio_i := ds.FieldByName('FIO').AsInteger - 1
  else
    fio_i := -1;

  if not ds.FieldByName('DATADATE').IsNull then
    dat_i := ds.FieldByName('DATADATE').AsInteger - 1
  else
    dat_i := -1;

  if not ds.FieldByName('DATASUM').IsNull then
    sum_i := ds.FieldByName('DATASUM').AsInteger - 1
  else
    sum_i := -1;

  if not ds.FieldByName('EXTID').IsNull then
    pay_n_i := ds.FieldByName('EXTID').AsInteger - 1
  else
    pay_n_i := -1;

  if not ds.FieldByName('NOTICE').IsNull then
    n1_i := ds.FieldByName('NOTICE').AsInteger - 1
  else
    n1_i := -1;

  if not ds.FieldByName('NOTICE1').IsNull then
    n2_i := ds.FieldByName('NOTICE1').AsInteger - 1
  else
    n2_i := -1;

  if not ds.FieldByName('DATEfmt').IsNull then
    dat_format := ds.FieldByName('DATEfmt').AsString
  else
    dat_format := '';

  if not ds.FieldByName('DataRemZero').IsNull then
    delZerro := ds.FieldByName('DataRemZero').AsBoolean
  else
    delZerro := false;

  if not ds.FieldByName('DataRemCh').IsNull then
    delChr := ds.FieldByName('DataRemCh').AsString
  else
    delChr := '';

  if (mdsReestr.Active) then
    mdsReestr.EmptyTable;
  if (not mdsReestr.Active) then
    mdsReestr.Open;

  for i := b to e do begin
    s := tmp[i];
    if delChr <> '' then
      s := RemoveChars(s, delChr);
    sa := Explode(sprt, s);

    mdsReestr.Append;
    mdsReestr['pLine'] := i - b;
    try
      if dat_i >= 0 then
        mdsReestr['pDate'] := DateTimeStrEval(dat_format, sa[dat_i])
      else
        mdsReestr['pDate'] := deDocDate.Value;
      if sum_i >= 0 then begin
        tmps := sa[sum_i];
        if tmps <> '' then
          mdsReestr['pSum'] := strtofloat(tmps, FormatSettings) / kopeyki
        else
          mdsReestr['pSum'] := 0;
      end;

      if adres_i >= 0 then begin
        if (flat_i > 0) or (house_i > 0) then begin
          if house_i > 0 then
            mdsReestr['House'] := UpperCase(Trim(sa[house_i]))
          else
            mdsReestr['House'] := '';
          if korp_i > 0 then
            mdsReestr['House'] := mdsReestr['House'] + UpperCase(Trim(sa[korp_i]));
          if flat_i > 0 then
            mdsReestr['Flat'] := UpperCase(Trim(sa[flat_i]))
          else
            mdsReestr['Flat'] := '';
          mdsReestr['Street'] := UpperCase(Trim(sa[adres_i]));
          mdsReestr['pAdress'] := mdsReestr['Street'] + rsA + mdsReestr['House'] + rsEa1 + mdsReestr['Flat'];
        end
        else
          mdsReestr['pAdress'] := sa[adres_i]
      end
      else
        mdsReestr['pAdress'] := '';

      if fio_i >= 0 then
        mdsReestr['pFIO'] := sa[fio_i]
      else
        mdsReestr['pFIO'] := '';
      if account_i >= 0 then begin
        if not delZerro then
          mdsReestr['pAccount'] := sa[account_i]
        else
          mdsReestr['pAccount'] := LeftTrimChar(sa[account_i], '0');
      end
      else
        mdsReestr['pAccount'] := '';
      if pay_n_i >= 0 then
        mdsReestr['pPayment_No'] := sa[pay_n_i]
      else
        mdsReestr['pPayment_No'] := '';

      Notice := '';
      if n1_i >= 0 then
        Notice := Notice + sa[n1_i];
      if n2_i >= 0 then
        Notice := Notice + ' ' + sa[n2_i];
      mdsReestr['pNotice'] := Notice;
    except
      addError(i + b + 1, rsLoaderFormatError + IntToStr(i + 1), i - b);
    end;
    mdsReestr['pLine'] := i - b + 1;
    mdsReestr.Post;
  end;

  if mdsReestr.RecordCount > 0 then
    LoadAccountsFromDB;
end;

// Обработка DBF файла

procedure TLoaderForm.DBFFileProcess;
var
  CanParseFile: Boolean;
  i: Integer;
  ds: TDataSet;
  delZerro: Boolean;
  s: string;
  account_i, sum_i, dat_i, fio_i, adres_i, pay_n_i, house_i, flat_i, fldNotice, Notice, korp: string;
  dat_format: string;
  FormatSettings: TFormatSettings;
  kopeyki: Byte;

begin

  if (DBF.RecordCount = 0) then
    Exit;
  CanParseFile := false;
  ds := dsFileFormats;

  delZerro := false;
  fldNotice := '';
  pay_n_i := '';
  dat_format := '';
  kopeyki := 1;
  account_i := '';
  adres_i := '';
  flat_i := '';
  korp := '';
  house_i := '';
  dat_i := '';
  fio_i := '';
  sum_i := '';

  try

    if not ds.FieldByName('kopeyki').IsNull then
      if ds.FieldByName('kopeyki').AsBoolean then
        kopeyki := 100;

    if not ds.FieldByName('DecimalSprt').IsNull then begin
      s := ds['DecimalSprt'];
      FormatSettings.DecimalSeparator := s[1];
    end;

    if not ds.FieldByName('ACCOUNT').IsNull then
      account_i := ds.FieldByName('ACCOUNT').AsString
    else
      account_i := '';

    if not ds.FieldByName('ADRES').IsNull then
      adres_i := ds.FieldByName('ADRES').AsString
    else
      adres_i := '';

    if not ds.FieldByName('FLAT').IsNull then
      flat_i := ds.FieldByName('FLAT').AsString
    else
      flat_i := '';

    if not ds.FieldByName('KORP').IsNull then
      korp := ds.FieldByName('KORP').AsString
    else
      korp := '';
    if not ds.FieldByName('HOUSE').IsNull then
      house_i := ds.FieldByName('HOUSE').AsString
    else
      house_i := '';
    if not ds.FieldByName('FIO').IsNull then
      fio_i := ds.FieldByName('FIO').AsString
    else
      fio_i := '';
    if not ds.FieldByName('DataDate').IsNull then
      dat_i := ds.FieldByName('DataDate').AsString
    else
      dat_i := '';
    if not ds.FieldByName('DataSUM').IsNull then
      sum_i := ds.FieldByName('DataSUM').AsString
    else
      sum_i := '';
    if not ds.FieldByName('DATEfmt').IsNull then
      dat_format := ds.FieldByName('DATEfmt').AsString
    else
      dat_format := '';
    if not ds.FieldByName('EXTID').IsNull then
      pay_n_i := ds.FieldByName('EXTID').AsString
    else
      pay_n_i := '';
    if not ds.FieldByName('DataRemZero').IsNull then
      delZerro := ds.FieldByName('DataRemZero').AsBoolean
    else
      delZerro := false;
    if not ds.FieldByName('NOTICE').IsNull then
      fldNotice := ds.FieldByName('NOTICE').AsString
    else
      fldNotice := '';

    CanParseFile := true;
  except
    addError(-1, rsIeaeaEiiaagoaoeeIaIiaoIgi, -1);
  end;

  if not CanParseFile then
    Exit;

  if (mdsReestr.Active) then
    mdsReestr.EmptyTable;
  if (not mdsReestr.Active) then
    mdsReestr.Open;

  DBF.First;
  DBF.DisableControls;
  i := 1;
  while not DBF.Eof do begin
    try
      mdsReestr.Append;
      if dat_i <> '' then
        mdsReestr['pDate'] := DateTimeStrEval(dat_format, DBF[dat_i])
      else
        mdsReestr['pDate'] := deDocDate.Value;
      if sum_i <> '' then begin
        if not DBF.FieldByName(sum_i).IsNull then
          mdsReestr['pSum'] := strtofloat(DBF[sum_i], FormatSettings) / kopeyki
        else
          mdsReestr['pSum'] := 0;
      end;
      if adres_i <> '' then begin
        if (flat_i <> '') or (house_i <> '') then begin
          if house_i <> '' then
            mdsReestr['House'] := UpperCase(Trim(DBF[house_i]))
          else
            mdsReestr['House'] := '';
          if korp <> '' then
            mdsReestr['House'] := mdsReestr['House'] + UpperCase(Trim(DBF[korp]));
          if flat_i <> '' then
            mdsReestr['Flat'] := UpperCase(Trim(DBF[flat_i]))
          else
            mdsReestr['Flat'] := '';
          mdsReestr['Street'] := UpperCase(Trim(DBF[adres_i]));
          mdsReestr['pAdress'] := mdsReestr['Street'] + rsA + mdsReestr['House'] + rsEa1 + mdsReestr['Flat'];
        end
        else
          mdsReestr['pAdress'] := DBF[adres_i];
      end;
      if fio_i <> '' then
        mdsReestr['pFIO'] := DBF[fio_i];
      if account_i <> '' then begin
        if not delZerro then
          mdsReestr['pAccount'] := DBF[account_i]
        else
          mdsReestr['pAccount'] := LeftTrimChar(DBF[account_i], '0');
      end;
      if pay_n_i <> '' then
        mdsReestr['pPayment_No'] := DBF[pay_n_i]
      else
        mdsReestr['pPayment_No'] := '';
      mdsReestr['pLine'] := i;

      Notice := '';
      if fldNotice <> '' then
        Notice := DBF[fldNotice];
      mdsReestr['pNotice'] := Notice;

      mdsReestr.Post;
      Inc(i);
    except
      addError(i + 1, rsLoaderFormatError + IntToStr(i + 1), -1);
      mdsReestr.Cancel;
    end;
    DBF.NEXT;
  end;
  DBF.EnableControls;
  if mdsReestr.RecordCount > 0 then
    LoadAccountsFromDB;
end;

// Выбор информации из базы

procedure TLoaderForm.LoadAccountsFromDB;
var
  b: Integer;
  s, sas: string;
  summa: Currency;
  HasHeader: Boolean;
  tmp: string;

  function findCustomer: Boolean;
  var
    r: Boolean;
  begin
    r := false;
    if not mdsReestr.FieldByName('pAccount').IsNull then
      sas := Trim(mdsReestr.FieldByName('pAccount').AsString)
    else
      sas := '';
    qFindCustomer.Transaction.StartTransaction;
    qFindCustomer.ParamByName('account').AsString := Copy(sas, 1, 15);
    qFindCustomer.ExecQuery;
    if not qFindCustomer.Eof then begin
      mdsReestr.Edit;
      mdsReestr['pCustomer_ID'] := qFindCustomer.FieldValue('Customer_Id', false);
      mdsReestr['dbFIO'] := qFindCustomer.FieldValue('FIO', false);
      mdsReestr['dbADRESS'] := qFindCustomer.FieldValue('ADRES', false);
      mdsReestr.Post;
      r := true;
    end;

    if not r then begin

      try
        qFindCustomerForAdres.Transaction.StartTransaction;
        if not mdsReestr.FieldByName('STREET').IsNull
        then begin
          s := AnsiUpperCase(Trim(mdsReestr.FieldByName('STREET').AsString));
          tmp := Copy(s, 1, 2);
          if (tmp = 'УЛ') or (tmp = 'УЛ')
          then
            s := Trim(Copy(s, 3, 255));
          if s[1] = '.'
          then
            s := Trim(Copy(s, 2, 255));
        end
        else
          s := '';
        qFindCustomerForAdres.ParamByName('STREET_N').AsString := s;
        if not mdsReestr.FieldByName('HOUSE').IsNull
        then begin
          s := AnsiUpperCase(Trim(mdsReestr.FieldByName('HOUSE').AsString));
          if s[1] = 'Д'
          then
            s := Trim(Copy(s, 2, 255));
          if s[1] = '.'
          then
            s := Trim(Copy(s, 2, 255));
        end
        else
          s := '';
        qFindCustomerForAdres.ParamByName('HOUSE_N').AsString := s;
        if not mdsReestr.FieldByName('FLAT').IsNull
        then begin
          s := AnsiUpperCase(Trim(mdsReestr.FieldByName('FLAT').AsString));
          tmp := Copy(s, 1, 2);
          if (tmp = 'КВ')
          then
            s := Trim(Copy(s, 4, 255));
          if s[1] = '.'
          then
            s := Trim(Copy(s, 2, 255));
        end
        else
          s := '';
        qFindCustomerForAdres.ParamByName('FLAT_N').AsString := s;
        qFindCustomerForAdres.ExecQuery;
        if not qFindCustomerForAdres.Eof then begin
          mdsReestr.Edit;
          mdsReestr['pCustomer_ID'] := qFindCustomerForAdres.FieldValue('Customer_Id', false);
          mdsReestr['dbFIO'] := qFindCustomerForAdres.FieldValue('FIO', false);
          mdsReestr['dbADRESS'] := qFindCustomerForAdres.FieldValue('ADRES', false);
          mdsReestr.Post;
          r := true;
        end
      except
        r := false;
      end;
    end;
    Result := r;
  end;

  function findService: Boolean;
  var
    r: Boolean;
  begin
    r := false;
    if (grp2.Visible) then begin
      if (cbbServices.Text <> '') then begin
        mdsReestr.Edit;
        mdsReestr['pNotice'] := dsServices.FieldByName('name').AsString;
        mdsReestr['pPayment_No'] := dsServices.FieldByName('service_id').AsString;
        mdsReestr.Post;
        r := true;
      end;
    end
    else begin
      qFindServices.SQL.Text := 'select s.service_id from services s where upper(s.name) = ''' +
        AnsiUpperCase(mdsReestr.FieldByName('pNotice').AsString) + '''';
      qFindServices.ExecQuery;
      if not qFindServices.Eof then begin
        mdsReestr.Edit;
        mdsReestr['pPayment_No'] := qFindServices.Fields[0].AsString;
        mdsReestr.Post;
        r := true;
      end;
      qFindServices.Close;
      Result := r;
    end;
  end;

begin
  // qryFindCust_id
  // load data
  if dsFileFormats['DataFrom'] >= 0 then
    b := dsFileFormats['DataFrom'] - 1
  else
    b := 0;

  HasHeader := not dsFileFormats['HeaderExist'];
  summa := 0;

  mdsReestr.DisableControls;
  mdsReestr.First;
  while not mdsReestr.Eof do begin
    if not mdsReestr.FieldByName('pSUM').IsNull then
      if HasHeader then
        summa := summa + mdsReestr['pSum'];

    if not findCustomer then begin
      s := Format(rsERROR_CUST_FIND, [sas]);
      s := s + '(' + Format(rsFIO + rsSEP, [Trim(mdsReestr.FieldByName('pFIO').AsString)]) +
        Format(' ' + rsAdres + rsSEP, [Trim(mdsReestr.FieldByName('pAdress').AsString)]) +
        Format(' ' + rsSUM + rsSEP, [Trim(mdsReestr.FieldByName('pSum').AsString)]) +
        Format(' ' + rsDATE + rsSEP, [Trim(mdsReestr.FieldByName('pDate').AsString)]) +
        Format(' ' + rsNOTICE + rsSEP, [Trim(mdsReestr.FieldByName('pNotice').AsString)]) + ')';
      addError(mdsReestr['pLine'] + b, s, mdsReestr['pLine']);
    end;

    if (not findService) and (Self.tag = 1) and (not grp2.Visible) then begin
      s := 'Нет сервиса: ' + Trim(mdsReestr.FieldByName('pNotice').AsString);
      addError(mdsReestr['pLine'] + b, s, mdsReestr['pLine']);
    end;
    qFindCustomer.Transaction.Commit;
    mdsReestr.NEXT;
  end;
  if HasHeader then
    edtDocSum.Value := summa;
  mdsReestr.First;
  mdsReestr.EnableControls;
end;

procedure TLoaderForm.btnEditProfileClick(Sender: TObject);
begin
  EditProfile(dsFileFormats['Profile'], Self.tag);
  dsFileFormats.Close;
  dsFileFormats.Open;
end;

procedure TLoaderForm.btnErrorsClick(Sender: TObject);
var
  s: string;
begin
  if SaveTextFileDialog.Execute then begin
    s := SaveTextFileDialog.FileName;
    mmoSQL.Lines.Clear;
    mdsErrors.DisableControls;
    mdsErrors.First;
    while not mdsErrors.Eof do begin
      mmoSQL.Lines.Add(mdsErrors['eText']);
      mdsErrors.NEXT;
    end;
    mdsErrors.First;
    mdsErrors.EnableControls;
    mmoSQL.Lines.SaveToFile(SaveTextFileDialog.FileName);
    mmoSQL.Lines.Clear;
  end;
end;

procedure TLoaderForm.btnNewProfileClick(Sender: TObject);
begin
  EditProfile('', Self.tag);
  dsFileFormats.Close;
  dsFileFormats.Open;
end;

procedure TLoaderForm.btnObrabClick(Sender: TObject);
var
  Save_Cursor: TCursor;
Begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Show hourglass cursor }

  fFileName := edtFile.Text;
  if mdsReestr.Active then begin
    mdsReestr.EmptyTable;
    mdsReestr.Close;
  end;
  if mdsErrors.Active then begin
    mdsErrors.EmptyTable;
    mdsErrors.Close;
  end;

  mdsReestr.Open;
  if dsFileFormats['FileType'] = 0 then begin
    ClearHeader;
    TXTFileProcess;
  end
  else begin
    ClearHeader;
    DBFFileProcess;
  end;

  btnZagr.Enabled := true;
  pnlErrors.Visible := (dbgehErrors.RowCount > 2);
  Screen.Cursor := Save_Cursor;
end;

procedure TLoaderForm.btnZagrClick(Sender: TObject);
var
  s: string;
  pd_id: Integer;
  fmt: TFormatSettings;
  errorMove: Boolean; // флаг ошибки при отправки файла в архив
  Save_Cursor: TCursor;
  vSF: string;
  InsertSQL: string;
  SplitPayment: Boolean;

Begin
{$IFDEF UTF}
  fmt := TFormatSettings.Create;
{$ENDIF}
  if mdsErrors.RecordCount > 0 then
    if Application.MessageBox(PWideChar(rsAOaeeaIaiagoaeaiuIeaee + rsEOL + rsAuAEaeaaoaCaagoceouIeaoaaeeEa),
      PWideChar(rsIaeaaiuIeaee), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
      Exit;

  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Show hourglass cursor }

  if (Self.tag = 0) then // Загрузка платежей
  begin
    SelectQuery.SQL.Text := 'select count(*) from pay_doc p where p.paysource_id = ' + IntToStr(cbbDocSrc.Value) +
      ' and p.pay_doc_no = ''' + edtDocNumber.Text + ''' and p.pay_doc_date = ' + DateTOFBdate(deDocDate.Value);
    SelectQuery.ExecQuery;
    pd_id := SelectQuery.Fields[0].AsInteger;
    SelectQuery.Close;

    if pd_id > 0 then
      if Application.MessageBox(PWideChar(rsOaeeOaeaIagaaioai + rsEOL + rsIioiaeeeIeaoaaeiueAieoiaioOaeaA),
        PWideChar(rsAieiaiea), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then begin
        mdsErrors.First;
        mdsErrors.Insert;
        mdsErrors['FileLine'] := -1;
        mdsErrors['ReestrLine'] := -1;
        mdsErrors['eText'] := rsIioiaeeeIeaoaaeiueAieoiaioOaeaA1 + edtDocNumber.Text + rsIo1 +
          DateTimeToStr(deDocDate.Value);
        mdsErrors.Post;
        Exit;
      end;

    pd_id := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
    mmoSQL.Lines.Clear;
    fmt.DecimalSeparator := '.';

    s := 'INSERT INTO Pay_Doc (Pay_Doc_Id, Paysource_Id, Pay_Doc_No, Pay_Doc_Date, Pay_Doc_Sum, Notice) VALUES (' +
      IntToStr(pd_id) + ', ' + IntToStr(cbbDocSrc.Value) + ' ,''' + Copy(edtDocNumber.Text, 0, 14) + '''' + ', ' +
      DateTOFBdate(deDocDate.Value) + ', ' + FloatToStr(edtDocSum.Value, fmt) + ', ''' + mmoNotice.Text + ''');';
    mmoSQL.Lines.Add(s);
    mdsReestr.DisableControls;
    mdsReestr.First;
    vSF := dmMain.GetSettingsValue('PAYMENT_TYPE');
    SplitPayment := (vSF = '1');
    if SplitPayment then
      InsertSQL := 'execute procedure Payment_Insert(null, '
    else
      InsertSQL := 'INSERT INTO Payment (Pay_Doc_Id, Customer_Id, Pay_Date, Pay_Sum, Notice, EXT_PAY_ID) VALUES ( ';
    while not mdsReestr.Eof do begin
      if not mdsReestr.FieldByName('pCustomer_ID').IsNull then begin
        try
          s := InsertSQL;
          s := s + IntToStr(pd_id);
          s := s + ', ' + IntToStr(mdsReestr['pCustomer_ID']);
          s := s + ', ' + DateTOFBdate(mdsReestr['pDate']);
          s := s + ', ' + FloatToStr(mdsReestr['pSUM'], fmt);
          if SplitPayment then
            s := s + ', null, null';
          s := s + ', ''' + mdsReestr.FieldByName('pNotice').AsString + '''';
          if mdsReestr.FieldByName('pPayment_No').AsString <> '' then
            s := s + ', ''' + mdsReestr.FieldByName('pPayment_No').AsString + ''''
          else
            s := s + ', null';
          if SplitPayment then
            s := s + ', null, null, null, null';
          s := s + ');';
          mmoSQL.Lines.Add(s);
        except
        end;
      end;
      mdsReestr.NEXT;
    end;
    mdsReestr.First;
    if mdsErrors.RecordCount > 0 then begin
      mdsErrors.First;
      while not mdsErrors.Eof do begin
        s := GetLineWithError(mdsErrors['FileLine']);
        if s <> '' then begin
          s := 'insert into PAY_ERRORS (PAY_DOC_ID, PAY_DATE, PAY_SUM, LINE, ERROR_TEXT) values (' + IntToStr(pd_id) +
            ', null, null,' + '''' + s + ''', ''' + Replacestr(mdsErrors['eText'], '''', '"') + ''');';
          mmoSQL.Lines.Add(s);
        end;
        mdsErrors.NEXT;
      end;
    end;
    mdsReestr.EnableControls;
    mmoSQL.Lines.Add('commit;');
    Script.Script.Clear;
    Script.Script.AddStrings(mmoSQL.Lines);
    Script.Transaction.StartTransaction;
    try
      ScriptExecError := false;
      Script.ExecuteScript(1);
      if not ScriptExecError then begin // Если нет ошибок при выполнении скрипта, то переместим файл
        if not dsFileFormats.FieldByName('ArchDir').IsNull then begin
          if DBF.Active then
            DBF.Close;
          s := dsFileFormats['ArchDir'];
          s := Replacestr(s, '[Y]', IntToStr(YearOf(Now())));
          s := Replacestr(s, '[M]', IntToStr(MonthOf(Now())));
          errorMove := DirectoryExists(s);
          if not errorMove then
            errorMove := ForceDirectories(s);

          if errorMove then begin
            errorMove := RenameFile(edtFile.Text, s + '\' + ExtractFileName(edtFile.Text))
          end;

          if not errorMove then
            ShowMessage(rsIaOaaeinuIagaianoeOaee + edtFile.Text + rsEOL + rsAAgoea + s + rsEOL +
              rsNaaeaeoaYoiNaiinoiyoaeuii);
        end;

        ShowMessage(rsOaeeIagaaioai);
        btnZagr.Enabled := false;
        btnObrab.Enabled := false;
        edtFile.Text := '';
        edtDocSum.Value := 0;
        edtDocNumber.Text := '';
        deDocDate.Value := Now();
        mmoNotice.Lines.Clear;
        mdsReestr.EmptyTable;
        mdsReestr.Close;
        DBF.Close;
        strngrdFile.Visible := false;
      end;
    except
      Script.Transaction.Rollback;
    end;

    if (mdsErrors.RecordCount > 0) and (not ScriptExecError) then begin
      mdsErrors.First;
      Script.Script.Clear;
      while not mdsErrors.Eof do begin
        Script.Script.Add('insert into JOURNAL (J_NOTICE) values (''' + Replacestr(mdsErrors['eText'], '''', '"') +
          rsAieoiaio + edtDocNumber.Text + ''');');
        mdsErrors.NEXT;
      end;
      Script.Script.Add('commit;');
      Script.Transaction.StartTransaction;
      Script.ExecuteScript(1);
    end;

    mdsErrors.EmptyTable;
    mdsErrors.Close;
    pnlErrors.Visible := false;
  end
  else if (Self.tag = 1) then // Загрузка начислений
  begin
    fmt.DecimalSeparator := '.';
    mmoSQL.Lines.Clear;
    mdsReestr.DisableControls;
    mdsReestr.First;
    while not mdsReestr.Eof do begin
      try
        pd_id := mdsReestr.FieldByName('pPayment_No').AsInteger;
      except
        pd_id := 0;
      end;
      if (mdsReestr.FieldByName('pCustomer_ID').AsInteger <> 0) and (pd_id <> 0) then begin
        s := 'execute procedure ADD_SINGLE_SERVICE(' + mdsReestr.FieldByName('pCustomer_ID').AsString + ',' +
          mdsReestr.FieldByName('pPayment_No').AsString + ',' + FloatToStr(mdsReestr['pSUM'], fmt) + ',' +
          DateTOFBdate(mdsReestr['pDate']) + ','''',null);';
        mmoSQL.Lines.Add(s);
      end;
      mdsReestr.NEXT;
    end;
    mdsReestr.EnableControls;
    mmoSQL.Lines.Add('commit;');
    Script.Script.Clear;
    Script.Script.AddStrings(mmoSQL.Lines);
    Script.Transaction.StartTransaction;
    try
      ScriptExecError := false;
      Script.ExecuteScript(1);
      if not ScriptExecError then begin // Если нет ошибок при выполнении скрипта, то переместим файл
        if not dsFileFormats.FieldByName('ArchDir').IsNull then begin
          if DBF.Active then
            DBF.Close;
          s := dsFileFormats['ArchDir'];
          s := Replacestr(s, '[Y]', IntToStr(YearOf(Now())));
          s := Replacestr(s, '[M]', IntToStr(MonthOf(Now())));
          errorMove := DirectoryExists(s);
          if not errorMove then
            errorMove := ForceDirectories(s);

          if errorMove then begin
            errorMove := RenameFile(edtFile.Text, s + '\' + ExtractFileName(edtFile.Text))
          end;

          if not errorMove then
            ShowMessage(rsIaOaaeinuIagaianoeOaee + edtFile.Text + rsEOL + rsAAgoea + s + rsEOL +
              rsNaaeaeoaYoiNaiinoiyoaeuii);
        end;
        ShowMessage(rsOaeeIagaaioai);
        btnZagr.Enabled := false;
        btnObrab.Enabled := false;
        edtFile.Text := '';
        edtDocSum.Value := 0;
        edtDocNumber.Text := '';
        deDocDate.Value := Now();
        mmoNotice.Lines.Clear;
        mdsReestr.EmptyTable;
        mdsReestr.Close;
        mdsErrors.EmptyTable;
        mdsErrors.Close;
        pnlErrors.Visible := false;
      end;
    except
      Script.Transaction.Rollback;
    end;
  end;

  Screen.Cursor := Save_Cursor;
end;

procedure TLoaderForm.cbbServicesChange(Sender: TObject);
begin
  if (btnObrab.Enabled) and (dsFileFormats.Active) then
    btnObrab.Click;
end;

procedure TLoaderForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DBF.Active) then
    DBF.Close;
  DBF.Free;
  dsFileFormats.Close;
  if dsPaymentSource.Active then
    dsPaymentSource.Close;
  dsServices.Close;
  Action := caFree;
  LoaderForm := nil;
end;

procedure TLoaderForm.FormCreate(Sender: TObject);
begin
  fmStorage.IniFileName := A4MainForm.GetIniFileName;
  fProfileType := 0;

  DBF := TVKDBFNTX.Create(Self);
  with DBF do begin
    Name := 'DBF';
    SetDeleted := false;
    FastPostRecord := false;
    LookupOptions := [];
    TrimInLocate := false;
    TrimCType := false;
    BufferSize := 4096;
    WaitBusyRes := 3000;
    CreateNow := false;
    DbfVersion := xBaseIII;
    LobBlockSize := 512;
    LockProtocol := lpClipperLock;
    LobLockProtocol := lpClipperLock;
  end;
  srcDBF.DataSet := DBF;
end;

procedure TLoaderForm.FormShow(Sender: TObject);
begin
  SetProfileType;
  edtDocSum.Value := 0;
  edtDocNumber.Text := '';
  deDocDate.Value := Now();
  mmoNotice.Lines.Clear;

  {
    grpHead.Visible := (Self.tag = 0);
    dbgehReestr.Columns[8].AutoFitColWidth := (Self.tag = 0);
    if (Self.tag = 0) then begin
    dbgehReestr.Columns[8].Title.Caption := 'Примечание';
    dbgehReestr.Columns[9].Title.Caption := 'N платежа';
    end
    else begin
    dbgehReestr.Columns[8].Title.Caption := 'Сервис|из файла';
    dbgehReestr.Columns[9].Title.Caption := 'Сервис|из БД';
    end;
  }
end;

procedure TLoaderForm.cbb_ProfileChange(Sender: TObject);
begin
  btnZagr.Enabled := false;
  btnObrab.Enabled := false;
  edtDocSum.Value := 0;
  edtDocNumber.Text := '';
  deDocDate.Value := Now();
  mmoNotice.Lines.Clear;
  if DBF.Active then
    DBF.Close;
  pcShowFile.ActivePageIndex := 1;
  if mdsReestr.Active then begin
    mdsReestr.EmptyTable;
    mdsReestr.Close;
  end;
  if mdsErrors.Active then begin
    mdsErrors.EmptyTable;
    mdsErrors.Close;
    pnlErrors.Visible := false;
  end;

  dlgOpen.Filter := dsFileFormats['Profile'] + '|' + dsFileFormats['FileExt'] + rsAnaOaeeu;
  if (not dsFileFormats.FieldByName('FileDir').IsNull) then
    dlgOpen.InitialDir := dsFileFormats['FileDir'];

  btnEditProfile.Enabled := (lcbPROFILE.Text <> '');
  grp2.Visible := ((Self.tag = 1) and (dsFileFormats.FieldByName('headerexist').AsInteger = 1));
  // TODO: что-то тут нето
  // dsServices.Active := ((self.tag = 1) and (dsFileFormats.FieldByName('headerexist').AsInteger = 1));
end;

procedure TLoaderForm.actSelectFileExecute(Sender: TObject);
begin
  if (edtFile.Text <> '') then
    Exit;

  if not FileExists(edtFile.Text) then
    Exit;

  pcShowFile.ActivePageIndex := dsFileFormats.FieldByName('FileType').AsInteger;
  if dsFileFormats['FileType'] = 0 then begin
    ShowFileInStringGrid(strngrdFile, edtFile.Text, dsFileFormats['CodePage']);
    strngrdFile.Visible := true;
    btnObrab.Enabled := (strngrdFile.RowCount > 0);
  end
  else begin
    ShowDBF;
    btnObrab.Enabled := (dbgehDBF.RowCount > 0);
  end;
end;

end.
