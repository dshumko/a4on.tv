unit LoaderReestrForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.ExtDlgs,
  GridsEh, DBGridEh, DBCtrlsEh, RxToolEdit, RxCurrEdit, DBLookupEh, FIBQuery, pFIBQuery, pFIBScripter, FIBDataSet,
  pFIBDataSet,
  FIBDatabase, pFIBDatabase, ToolCtrlsEh, DBGridEhToolCtrls, EhLibMTE, DBAxisGridsEh, MemTableDataEh, MemTableEh,
  EhLibVCL,
  RxPlacemnt, CnErrorProvider, VKDBFDataSet, DBGridEhGrouping, DynVarsEh;

type
  TLoaderReestrForm = class(TForm)
    pnl2: TPanel;
    srcReestr: TDataSource;
    qFindCustomer: TpFIBQuery;
    srcPaymentSrc: TDataSource;
    pnlTop: TPanel;
    srcErrors: TDataSource;
    srcProfile: TDataSource;
    btnProcess: TButton;
    cbbProfile: TDBLookupComboboxEh;
    edtProcessedFile: TFilenameEdit;
    Label6: TLabel;
    Label7: TLabel;
    btnNewProfile: TButton;
    btnEditProfile: TButton;
    FormStorage: TFormStorage;
    pnlErrors: TPanel;
    dbgehErrors: TDBGridEh;
    pcShowFile: TPageControl;
    tsTXT: TTabSheet;
    tsOTHER: TTabSheet;
    strngrdFile: TStringGrid;
    tsDBF: TTabSheet;
    srcDBF: TDataSource;
    DBGridEh1: TDBGridEh;
    pnlReestr: TPanel;
    pnl3: TPanel;
    dbgehReestr: TDBGridEh;
    pnl1: TPanel;
    Splitter2: TSplitter;
    mmoSQL: TDBMemoEh;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    mmoNotice: TDBMemoEh;
    Panel2: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl2: TLabel;
    edtDocSum: TRxCalcEdit;
    deDocDate: TDBDateTimeEditEh;
    cbbDocSrc: TDBLookupComboboxEh;
    edtDocNumber: TDBEditEh;
    SaveTextFileDialog: TSaveTextFileDialog;
    dsPaymentSource: TpFIBDataSet;
    Script: TpFIBScripter;
    SelectQuery: TpFIBQuery;
    trWriteQ: TpFIBTransaction;
    trReadQ: TpFIBTransaction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    qFindCustomerForAdres: TpFIBQuery;
    btnLoadIntoDB: TButton;
    mdsReestr: TMemTableEh;
    mdsErrors: TMemTableEh;
    mdsFileFormats: TMemTableEh;
    CnErrors: TCnErrorProvider;
    qFindByExtID: TpFIBQuery;
    spl1: TSplitter;
    procedure btn2Click(Sender: TObject);
    procedure btnEditProfileClick(Sender: TObject);
    procedure btnLoadIntoDBClick(Sender: TObject);
    procedure btnNewProfileClick(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbbProfileChange(Sender: TObject);
    procedure dbgehErrorsDblClick(Sender: TObject);
    procedure edtProcessedFileChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mdsFileFormatsNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ScriptExecuteError(Sender: TObject; StatementNo, Line: Integer; Statement: TStrings; SQLCode: Integer;
      const Msg: string; var doRollBack, Stop: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtProcessedFileEnter(Sender: TObject);
  private
    { Private declarations }
    fProfile: string;
    fFileName: string;
    FScriptExecError: Boolean;
    FDBF: TVKDBFNTX;
    procedure setProfile(const Value: string);
    procedure setFileName(const Value: string);
    procedure LoadAccountsFromDB(const delZerro: Boolean = False);
    procedure ClearHeader;
    procedure ShowDBF;
    procedure DBFFileProcess;
    procedure addError(const Fileline: Integer; const error: string; const Reestrline: Integer);
    function GetLineWithError(const Reestrline: Integer): string;
    procedure SaveProfiles;
  public
    { Public declarations }
    property Profile: string read fProfile write setProfile;
    property FileName: string read fFileName write setFileName;
    procedure TXTFileProcess;
  end;

var
  LoaderReestrForm: TLoaderReestrForm;

implementation

uses
  System.DateUtils, System.StrUtils,
  AtrCommon, WorkWithGrids, LoaderProfileForma, DM, AtrStrUtils, madZip, MAIN, PrjConst;

{$R *.dfm}

const
  ProfilesFile: String = 'A4ON_profiles';

procedure TLoaderReestrForm.btnProcessClick(Sender: TObject);
var
  Save_Cursor: TCursor;
Begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  fFileName := edtProcessedFile.Text;
  if mdsReestr.Active then
    mdsReestr.Close;
  if mdsErrors.Active then
    mdsErrors.Close;

  mdsReestr.Open;
  mdsReestr.EmptyTable;
  if mdsFileFormats['FileType'] = 0 then
  begin
    ClearHeader;
    TXTFileProcess;
  end
  else
  begin
    ClearHeader;
    DBFFileProcess;
  end;

  if mdsErrors.Active then
    mdsErrors.First;
  // btnProcess.Enabled := False;
  btnLoadIntoDB.Enabled := True;
  Screen.Cursor := Save_Cursor;
end;

procedure TLoaderReestrForm.setProfile(const Value: string);
begin
  fProfile := Value;
  btnProcess.Enabled := False;
  cbbProfile.Value := fProfile;
  if (not mdsFileFormats.Locate('Profile', Value, [])) or (Value = '') then
    ShowMessage(Format(rsProfNotFound, [Value]))
  else
    btnProcess.Enabled := True;
end;

procedure TLoaderReestrForm.setFileName(const Value: string);
begin
  btnProcess.Enabled := False;
  fFileName := '';
  if not FileExists(Value) then
  begin
    btnProcess.Enabled := False;
    ShowMessage(Format(rsFileNotFound, [Value]));
  end
  else
  begin
    btnProcess.Enabled := True;
    fFileName := Value;
  end;
  edtProcessedFile.FileName := fFileName;
end;

procedure TLoaderReestrForm.TXTFileProcess;
var
  tmp: TStringList;
  i: Integer;
  b, e: Integer;
  ds: TDataSet;
  sa: TStringArray;
  delZerro: Boolean;
  delChr: string;
  s: string;
  account_i, sum_i, dat_i, fio_i, adres_i, pay_n_i, n1_i, n2_i, ext_i, house_i, flat_i, korp_i: Integer;
  dat_format: string;
  sprt: Char;
  FormatSettings: TFormatSettings;
  kopeyki: Byte;
  nc, nl, sl, dc, sc, dl, rl, rc: Integer;
  Notice, srcCode: string;
  tmps: string;
  vPaySum: Double;
begin

  FormatSettings := TFormatSettings.Create;

  if not(strngrdFile.Visible and (strngrdFile.RowCount > 0)) then
    Exit;
  // if Length(fFileName) = 0 then Exit;
  // if (not fileexists(fFileName)) then Exit;

  if mdsFileFormats.RecordCount = 0 then
    Exit;

  ds := mdsFileFormats;
  srcCode := '';
  kopeyki := 1;
  if not ds.FieldByName('kopeyki').IsNull then
    if ds.FieldByName('kopeyki').AsBoolean then
      kopeyki := 100;

  if not ds.FieldByName('DecimalSprt').IsNull then
  begin
    s := ds['DecimalSprt'];
    FormatSettings.DecimalSeparator := s[1];
  end;

  tmp := TStringList.Create;
  for i := 0 to strngrdFile.RowCount - 1 do
  begin
    tmp.Add(strngrdFile.Cells[2, i]);
  end;

  // FileToStrings(edtProcessedFile.FileName, tmp,mdsFileFormats['CodePage']);
  // load head
  // load data
  if ds['HeaderExist'] then
  begin
    if ds['HeaderFrom'] <= 0 then
      b := tmp.Count + ds['HeaderFrom'] - 1
    else
      b := ds['HeaderFrom'] - 1;
    if ds['HeaderTo'] <= 0 then
      e := tmp.Count + ds['HeaderTo'] - 1
    else
      e := ds['HeaderTo'] - 1;

    s := ds['HeadSprt'];
    if (AnsiUpperCase(s) = '\T') then
      sprt := #09
    else if (AnsiUpperCase(s) = '\_') then
      sprt := ' '
    else
      sprt := s[1];

    if not ds.FieldByName('HeadRemCh').IsNull then
    begin
      delChr := ds.FieldByName('HeadRemCh').AsString;
      delChr := ReplaceStr(delChr, '\_', ' ');
    end
    else
      delChr := '';

    if not ds.FieldByName('headDateFmt').IsNull then
      dat_format := ds.FieldByName('headDateFmt').AsString
    else
      dat_format := '';

    nc := -1;
    nl := -1;
    sl := -1;
    dc := -1;
    sc := -1;
    dl := -1;
    rl := -1;
    rc := -1;
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
    if not ds.FieldByName('headSrcLine').IsNull then
      rl := ds.FieldByName('headSrcLine').AsInteger + b - 1;
    if not ds.FieldByName('headSrcCol').IsNull then
      rc := ds.FieldByName('headSrcCol').AsInteger - 1;

    for i := b to e do
    begin
      s := tmp[i];
      if delChr <> '' then
        s := RemoveChars(s, delChr);
      sa := Explode(sprt, s);

      try
        if i = nl then
          edtDocNumber.Text := sa[nc];
        if i = sl then
        begin
          vPaySum := 0;
          // strtofloat(sa[sc], FormatSettings)
          // попытка понять какой разделитель дроби
          if sa[sc] <> '' then
          begin
            if not TryStrToFloat(sa[sc], vPaySum, FormatSettings) then
            begin
              tmps := FormatSettings.DecimalSeparator;
              if tmps = '.' then
                FormatSettings.DecimalSeparator := ','
              else
                FormatSettings.DecimalSeparator := '.';
              if not TryStrToFloat(sa[sc], vPaySum, FormatSettings) then
                vPaySum := 0;
              FormatSettings.DecimalSeparator := tmps[1];
            end;
          end;
          edtDocSum.Value := vPaySum / kopeyki;
        end;
        if i = dl then
          deDocDate.Value := DateTimeStrEval(dat_format, sa[dc]);
        if i = rl then
          srcCode := sa[rc];
      except
        addError(i + b, rsErrorHeadFormatReestr, -1);
      end;
    end;
  end;

  b := -1;
  if srcCode <> '' then
  begin
    dsPaymentSource.DisableControls;
    dsPaymentSource.First;
    while not dsPaymentSource.EOF do
    begin
      if (not dsPaymentSource.FieldByName('CODE').IsNull) and (dsPaymentSource['CODE'] = srcCode) then
        b := dsPaymentSource['PAYSOURCE_ID'];

      dsPaymentSource.Next;
    end;
    dsPaymentSource.EnableControls;
    if b >= 0 then
      cbbDocSrc.KeyValue := b;
  end;

  if ((b = -1) and (not srcProfile.DataSet.FieldByName('PaymentSrc').IsNull)) then
    cbbDocSrc.KeyValue := srcProfile.DataSet['PaymentSrc'];

  // load data
  if ds['DataFrom'] <= 0 then
    b := tmp.Count + ds['DataFrom'] - 1
  else
    b := ds['DataFrom'] - 1;

  if ds['DataTo'] <= 0 then
    e := tmp.Count + ds['DataTo'] - 1
  else
    e := ds['DataTo'] - 1;

  if e >= tmp.Count then
    e := tmp.Count - 1;

  s := ds['DataSprt'];
  if (AnsiUpperCase(s) = '\T') then
    sprt := #09
  else if (AnsiUpperCase(s) = '\_') then
    sprt := ' '
  else
    sprt := s[1];

  if not ds.FieldByName('ACCOUNT').IsNull then
    account_i := ds.FieldByName('ACCOUNT').AsInteger - 1
  else
    account_i := -1;

  if not ds.FieldByName('ADRESS').IsNull then
    adres_i := ds.FieldByName('ADRESS').AsInteger - 1
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

  if not ds.FieldByName('PayDate').IsNull then
    dat_i := ds.FieldByName('PayDate').AsInteger - 1
  else
    dat_i := -1;

  if not ds.FieldByName('SUMMA').IsNull then
    sum_i := ds.FieldByName('SUMMA').AsInteger - 1
  else
    sum_i := -1;

  if not ds.FieldByName('PAYMENT_NO').IsNull then
    pay_n_i := ds.FieldByName('PAYMENT_NO').AsInteger - 1
  else
    pay_n_i := -1;

  if not ds.FieldByName('NOTICE1').IsNull then
    n1_i := ds.FieldByName('NOTICE1').AsInteger - 1
  else
    n1_i := -1;

  if not ds.FieldByName('NOTICE2').IsNull then
    n2_i := ds.FieldByName('NOTICE2').AsInteger - 1
  else
    n2_i := -1;

  if not ds.FieldByName('DATEfmt').IsNull then
    dat_format := ds.FieldByName('DATEfmt').AsString
  else
    dat_format := '';

  if not ds.FieldByName('DataRemZero').IsNull then
    delZerro := ds.FieldByName('DataRemZero').AsBoolean
  else
    delZerro := False;

  if not ds.FieldByName('DataRemCh').IsNull then
  begin
    delChr := ds.FieldByName('DataRemCh').AsString;
    delChr := ReplaceStr(delChr, '\_', ' ');
  end
  else
    delChr := '';

  if not ds.FieldByName('EXT_ID').IsNull then
  begin
    if TryStrToInt(ds.FieldByName('EXT_ID').AsString, ext_i) then
      ext_i := ext_i - 1
    else
      ext_i := -1;
  end
  else
    ext_i := -1;

  for i := b to e do
  begin
    s := tmp[i];
    if delChr <> '' then
      s := RemoveChars(s, delChr);
    sa := Explode(sprt, s);

    mdsReestr.append;
    mdsReestr['pLine'] := i - b;
    try
      if (dat_i >= 0) and (Trim(sa[dat_i]) <> '') and (sa[dat_i] <> '0') then
        mdsReestr['pDate'] := DateTimeStrEval(dat_format, sa[dat_i])
      else
        mdsReestr['pDate'] := deDocDate.Value;

      if sum_i >= 0 then
      begin
        tmps := sa[sum_i];
        vPaySum := 0;
        if tmps <> '' then
        begin
          // TryStrToFloat(const S: string; out Value: Extended; const AFormatSettings: TFormatSettings)
          if not TryStrToFloat(sa[sum_i], vPaySum, FormatSettings) then
          begin
            tmps := FormatSettings.DecimalSeparator;
            if tmps = '.' then
              FormatSettings.DecimalSeparator := ','
            else
              FormatSettings.DecimalSeparator := '.';
            if not TryStrToFloat(sa[sum_i], vPaySum, FormatSettings) then
              vPaySum := 0;
            FormatSettings.DecimalSeparator := tmps[1];
          end;
        end;
        mdsReestr['pSum'] := vPaySum / kopeyki;
      end;

      if adres_i >= 0 then
      begin
        if (flat_i > 0) or (house_i > 0) then
        begin
          if house_i > 0 then
            mdsReestr['House'] := AnsiUpperCase(Trim(sa[house_i]))
          else
            mdsReestr['House'] := '';
          if korp_i > 0 then
            mdsReestr['House'] := mdsReestr['House'] + AnsiUpperCase(Trim(sa[korp_i]));
          if flat_i > 0 then
            mdsReestr['Flat'] := AnsiUpperCase(Trim(sa[flat_i]))
          else
            mdsReestr['Flat'] := '';
          mdsReestr['Street'] := AnsiUpperCase(Trim(sa[adres_i]));
          mdsReestr['pAdress'] := Format(rsPrintCheckAdr, [mdsReestr['Street'], mdsReestr['House'], mdsReestr['Flat']]);
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
      if account_i >= 0 then
      begin
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

      Notice := '';
      if ext_i > 0 then
        Notice := sa[ext_i];
      mdsReestr['EXT_ID'] := Notice;

    except
      addError(i + b, Format(rsErrorBodyFormatReestr, [(i + 1)]), i - b);
    end;
    mdsReestr['pLine'] := i - b + 1;
    mdsReestr.post;
  end;

  if mdsReestr.RecordCount > 0 then
    LoadAccountsFromDB(delZerro);

end;

procedure TLoaderReestrForm.LoadAccountsFromDB(const delZerro: Boolean = False);
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
    r := False;
    if not mdsReestr.FieldByName('pAccount').IsNull then
      sas := Trim(mdsReestr.FieldByName('pAccount').AsString)
    else
      sas := '';
    qFindCustomer.SQL.Clear;
    qFindCustomer.SQL.Add('SELECT first 1');
    qFindCustomer.SQL.Add(' C.Customer_Id, C.Account_No, C.Cust_Code,');
    qFindCustomer.SQL.Add(' C.Debt_Sum, C.Surname||'' ''||coalesce(C.Initials,'''') as FIO,');
    qFindCustomer.SQL.Add(' s.Street_Name||'' ''||s.Street_Short||'' д.''||');
    qFindCustomer.SQL.Add(' h.House_No||Coalesce('' кв.''||C.Flat_No,'''') as ADRES');
    qFindCustomer.SQL.Add('FROM Customer C ');
    qFindCustomer.SQL.Add(' INNER JOIN HOUSE h ON (C.House_Id = h.House_Id) ');
    qFindCustomer.SQL.Add(' inner join street s  on (S.STREET_ID = h.STREET_ID) ');
    if delZerro then
      qFindCustomer.SQL.Add('where trim(leading ''0'' from c.Account_no) = :account')
    else
      qFindCustomer.SQL.Add('where c.Account_no = :account');

    qFindCustomer.Transaction.StartTransaction;
    qFindCustomer.ParamByName('account').AsString := Copy(sas, 1, 15);
    qFindCustomer.ExecQuery;
    if not qFindCustomer.EOF then
    begin
      mdsReestr.Edit;
      mdsReestr['pCustomer_ID'] := qFindCustomer.FieldValue('Customer_Id', False);
      mdsReestr['dbFIO'] := qFindCustomer.FieldValue('FIO', False);
      mdsReestr['dbADRESS'] := qFindCustomer.FieldValue('ADRES', False);
      mdsReestr.post;
      r := True;
    end;
    // qFindCustomer.Transaction.Commit;

    if (not mdsReestr.FieldByName('EXT_ID').IsNull) and (mdsReestr['EXT_ID'] <> '') then
    begin
      qFindByExtID.Transaction.StartTransaction;
      qFindByExtID.ParamByName('EXT_ID').AsString := mdsReestr['EXT_ID'];
      qFindByExtID.ExecQuery;
      qFindByExtID.ExecQuery;
      if not qFindByExtID.EOF then
      begin
        mdsReestr.Edit;
        mdsReestr['pAccount'] := qFindByExtID.FieldValue('Account_No', False);
        mdsReestr['pCustomer_ID'] := qFindByExtID.FieldValue('Customer_Id', False);
        mdsReestr['dbFIO'] := qFindByExtID.FieldValue('FIO', False);
        mdsReestr['dbADRESS'] := qFindByExtID.FieldValue('ADRES', False);
        mdsReestr.post;
        r := True;
      end;
      // qFindByExtID.Transaction.Commit;
    end;

    if not r then
    begin
      try
        qFindCustomerForAdres.Transaction.StartTransaction;
        if (not mdsReestr.FieldByName('STREET').IsNull) then
        begin
          s := AnsiUpperCase(Trim(mdsReestr.FieldByName('STREET').AsString));
          tmp := Copy(s, 1, 2);
          if (tmp = 'УЛ') or (tmp = 'УЛ') then
            s := Trim(Copy(s, 3, 255));
          if (s <> '') and (s[1] = '.') then
            s := Trim(Copy(s, 2, 255));
        end
        else
          s := '';
        qFindCustomerForAdres.ParamByName('STREET_N').AsString := s;
        if not mdsReestr.FieldByName('HOUSE').IsNull then
        begin
          s := AnsiUpperCase(Trim(mdsReestr.FieldByName('HOUSE').AsString));
          if (s <> '') and (s[1] = 'Д') then
            s := Trim(Copy(s, 2, 255));
          if (s <> '') and (s[1] = '.') then
            s := Trim(Copy(s, 2, 255));
        end
        else
          s := '';
        qFindCustomerForAdres.ParamByName('HOUSE_N').AsString := s;
        if not mdsReestr.FieldByName('FLAT').IsNull then
        begin
          s := AnsiUpperCase(Trim(mdsReestr.FieldByName('FLAT').AsString));
          tmp := Copy(s, 1, 2);
          if (tmp = 'КВ') then
            s := Trim(Copy(s, 4, 255));
          if (s <> '') and (s[1] = '.') then
            s := Trim(Copy(s, 2, 255));
        end
        else
          s := '';
        qFindCustomerForAdres.ParamByName('FLAT_N').AsString := s;
        qFindCustomerForAdres.ExecQuery;
        if not qFindCustomerForAdres.EOF then
        begin
          mdsReestr.Edit;
          mdsReestr['pCustomer_ID'] := qFindCustomerForAdres.FieldValue('Customer_Id', False);
          mdsReestr['dbFIO'] := qFindCustomerForAdres.FieldValue('FIO', False);
          mdsReestr['dbADRESS'] := qFindCustomerForAdres.FieldValue('ADRES', False);
          mdsReestr.post;
          r := True;
        end
      except
        r := False;
      end;
    end;
    result := r;
  end;

begin
  // qryFindCust_id
  // load data
  if mdsFileFormats['DataFrom'] >= 0 then
    b := mdsFileFormats['DataFrom'] - 1
  else
    b := 0;

  HasHeader := not mdsFileFormats['HeaderExist'];
  summa := 0;

  mdsReestr.DisableControls;
  mdsReestr.First;
  while not mdsReestr.EOF do
  begin
    if not mdsReestr.FieldByName('pSUM').IsNull then
      if HasHeader then
        summa := summa + mdsReestr['pSum'];

    if not findCustomer then
    begin

      s := Format(rsERROR_CUST_FIND, [sas]);
      s := s + '(' + Format(rsFIO + rsSEP, [Trim(mdsReestr.FieldByName('pFIO').AsString)]) +
        Format(' ' + rsAdres + rsSEP, [Trim(mdsReestr.FieldByName('pAdress').AsString)]) +
        Format(' ' + rsSUM + rsSEP, [Trim(mdsReestr.FieldByName('pSum').AsString)]) +
        Format(' ' + rsDATE + rsSEP, [Trim(mdsReestr.FieldByName('pDate').AsString)]) +
        Format(' ' + rsNOTICE + rsSEP, [Trim(mdsReestr.FieldByName('pNotice').AsString)]) + ')';
      addError(mdsReestr['pLine'] + b, s, mdsReestr['pLine']);
    end;
    qFindCustomer.Transaction.Commit;
    mdsReestr.Next;
  end;
  if HasHeader then
    edtDocSum.Value := summa;
  mdsReestr.First;
  mdsReestr.EnableControls;
end;

procedure TLoaderReestrForm.addError(const Fileline: Integer; const error: string; const Reestrline: Integer);
begin
  if not mdsErrors.Active then
  begin
    mdsErrors.Open;
    mdsErrors.EmptyTable;
    mdsErrors.Insert;
    mdsErrors['FileLine'] := -1;
    mdsErrors['ReestrLine'] := -1;
    mdsErrors['eText'] := Format(rsErrorLoadReestr, [edtDocNumber.Text, DateTimeToStr(deDocDate.Value),
      edtProcessedFile.Text]);
    mdsErrors.post;
  end;
  mdsErrors.append;
  mdsErrors['FileLine'] := Fileline;
  mdsErrors['ReestrLine'] := Reestrline;
  mdsErrors['eText'] := error;
  mdsErrors.post;
  pnlErrors.Visible := True;
end;

procedure TLoaderReestrForm.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TLoaderReestrForm.btnEditProfileClick(Sender: TObject);
begin
  if not mdsFileFormats.FieldByName('Profile').IsNull then
    EditProfile(mdsFileFormats['Profile'])
  else
    mdsFileFormats.Delete;
end;

procedure TLoaderReestrForm.btnLoadIntoDBClick(Sender: TObject);
var
  s: string;
  pd_id: Integer;
  fmt: TFormatSettings;
  errorMove: Boolean; // флаг ошибки при отправки файла в архив
  Save_Cursor: TCursor;
  vSF: string;
  InsertSQL: string;
  SplitPayment: Boolean;

  function fmtStr(const s: string): string;
  begin
    result := '''' + ReplaceStr(s, '''', '''''') + '''';
  end;

Begin
  if VarIsNullEh(cbbDocSrc.KeyValue) then
  begin
    ShowMessage(Format(rsPaySource, [rsInputIncorrect]));
    Exit;
  end;

  if (DaysBetween(deDocDate.Value, now()) > 40) and
    (Application.MessageBox(PWideChar(Format(rsSuspiciousDateQuest, [DateToStr(deDocDate.Value)])),
    PWideChar(rsSuspiciousDate), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO) then
    Exit;

  fmt := TFormatSettings.Create;

  if mdsErrors.Active and (mdsErrors.RecordCount > 0) then
    if Application.MessageBox(PWideChar(rsFileHaveErrors + rsEOL + rsLoadPaysWithError), PWideChar(rsErrorExist),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
      Exit;

  SelectQuery.SQL.Text := 'select count(*) from pay_doc p where p.paysource_id = ' + IntToStr(cbbDocSrc.Value) +
    ' and p.pay_doc_no = ' + fmtStr(edtDocNumber.Text) + ' and p.pay_doc_date = ' + DateTOFBdate(deDocDate.Value);
  SelectQuery.Transaction.StartTransaction;
  SelectQuery.ExecQuery;
  pd_id := SelectQuery.Fields[0].AsInteger;
  SelectQuery.Transaction.Commit;
  SelectQuery.Close;
  // если не нашли по номеру. проверим в описании имя файла
  if pd_id = 0 then
  begin
    s := ExtractFileName(edtProcessedFile.FileName);
    if not s.IsEmpty then
    begin
      SelectQuery.SQL.Text := 'select count(*) from pay_doc p where p.notice like ''%' + s + '%'' ';
      SelectQuery.Transaction.StartTransaction;
      SelectQuery.ExecQuery;
      pd_id := SelectQuery.Fields[0].AsInteger;
      SelectQuery.Transaction.Commit;
      SelectQuery.Close;
    end
  end;

  if pd_id > 0 then
  begin
    if Application.MessageBox(PWideChar(rsFileProcessed + rsEOL + rsQuestionSamePayment), PWideChar(rsWarning),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    begin
      if not mdsErrors.Active then
        mdsErrors.Open;
      mdsErrors.First;
      mdsErrors.Insert;
      mdsErrors['FileLine'] := -1;
      mdsErrors['ReestrLine'] := -1;
      mdsErrors['eText'] := Format(rsErrorSamePayment, [edtDocNumber.Text, DateTimeToStr(deDocDate.Value)]);
      mdsErrors.post;
      Exit;
    end;
  end;

  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Show hourglass cursor }

  pd_id := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
  mmoSQL.Lines.Clear;
  fmt.DecimalSeparator := '.';

  s := 'INSERT INTO Pay_Doc (Pay_Doc_Id, Paysource_Id, Pay_Doc_No, Pay_Doc_Date, Pay_Doc_Sum, Notice) VALUES (' +
    IntToStr(pd_id) + ', ' + IntToStr(cbbDocSrc.Value) + ' ,' + fmtStr(Copy(edtDocNumber.Text, 0, 49)) + ', ' +
    DateTOFBdate(deDocDate.Value) + ', ' + FloatToStr(edtDocSum.Value, fmt) + ', ' + fmtStr(mmoNotice.Text) + ');';
  mmoSQL.Lines.Add(s);
  mdsReestr.DisableControls;
  mdsReestr.First;
  vSF := dmMain.GetSettingsValue('PAYMENT_TYPE');
  SplitPayment := (vSF = '1');
  if SplitPayment then
    InsertSQL := 'execute procedure Payment_Insert(null, '
  else
    InsertSQL := 'INSERT INTO Payment (Pay_Doc_Id, Customer_Id, Pay_Date, Pay_Sum, Notice, EXT_PAY_ID) VALUES ( ';
  while not mdsReestr.EOF do
  begin
    if (not mdsReestr.FieldByName('pCustomer_ID').IsNull) and (mdsReestr['pSUM'] <> 0) then
    begin
      try
        s := InsertSQL;
        s := s + IntToStr(pd_id);
        s := s + ', ' + IntToStr(mdsReestr['pCustomer_ID']);
        s := s + ', ' + DateTOFBdate(mdsReestr['pDate']);
        s := s + ', ' + FloatToStr(mdsReestr['pSUM'], fmt);
        if SplitPayment then
          s := s + ', null, null';
        s := s + ', ' + fmtStr(mdsReestr.FieldByName('pNotice').AsString);
        if mdsReestr.FieldByName('pPayment_No').AsString <> '' then
          s := s + ', ' + fmtStr(mdsReestr.FieldByName('pPayment_No').AsString)
        else
          s := s + ', null';
        if SplitPayment then
          s := s + ', null, null, null, null';
        s := s + ');';
        mmoSQL.Lines.Add(s);
      except
      end;
    end;
    mdsReestr.Next;
  end;
  mdsReestr.First;
  if (mdsErrors.Active) and (mdsErrors.RecordCount > 0) then
  begin
    mdsErrors.First;
    while not mdsErrors.EOF do
    begin
      s := GetLineWithError(mdsErrors['FileLine']);
      if s <> '' then
      begin
        s := 'insert into PAY_ERRORS (PAY_DOC_ID, PAY_DATE, PAY_SUM, LINE, ERROR_TEXT) values (' + IntToStr(pd_id) +
          ', null, null,' + fmtStr(s) + ', ' + fmtStr(mdsErrors['eText']) + ');';
        mmoSQL.Lines.Add(s);
      end;
      mdsErrors.Next;
    end;
  end;
  mdsReestr.EnableControls;
  mmoSQL.Lines.Add('commit;');
  Script.Script.Clear;
  Script.Script.AddStrings(mmoSQL.Lines);
  Script.Transaction.StartTransaction;
  try
    FScriptExecError := False;
    Script.ExecuteScript(1);
    if not FScriptExecError then
    begin // Если нет ошибок при выполнении скрипта, то переместим файл
      if not mdsFileFormats.FieldByName('ArchDir').IsNull then
      begin
        if FDBF.Active then
          FDBF.Close;
        s := mdsFileFormats['ArchDir'];
        s := ReplaceStr(s, '[Y]', IntToStr(YearOf(now())));
        s := ReplaceStr(s, '[M]', IntToStr(MonthOf(now())));
        errorMove := DirectoryExists(s);
        if not errorMove then
          errorMove := ForceDirectories(s);

        if errorMove then
        begin
          errorMove := RenameFile(edtProcessedFile.FileName, s + '\' + ExtractFileName(edtProcessedFile.FileName))
        end;

        if not errorMove then
          ShowMessage(Format(rsErrorMoveToArchive, [edtProcessedFile.FileName, s]));
      end;

      ShowMessage(rsFileProcessed);
      btnLoadIntoDB.Enabled := False;
      btnProcess.Enabled := False;
    end;
  except
    Script.Transaction.Rollback;
  end;
  mmoSQL.Lines.Clear;
  Script.Script.Clear;
  if (mdsErrors.Active) and (mdsErrors.RecordCount > 0) and (not FScriptExecError) then
  begin
    mdsErrors.First;
    Script.Script.Clear;
    while not mdsErrors.EOF do
    begin
      Script.Script.Add('insert into JOURNAL (J_NOTICE) values (''' + ReplaceStr(mdsErrors['eText'], '''', '"') +
        rsPayDocN + ReplaceStr(edtDocNumber.Text, '''', '"') + ''');');
      mdsErrors.Next;
    end;
    Script.Script.Add('commit;');
    Script.Transaction.StartTransaction;
    Script.ExecuteScript(1);
  end;
  Screen.Cursor := Save_Cursor;
end;

procedure TLoaderReestrForm.btnNewProfileClick(Sender: TObject);
begin
  EditProfile('AUTONAMEFORINSERTNEWPROF');
  if mdsFileFormats.RecordCount > 0 then
    btnEditProfile.Enabled := True;
end;

procedure TLoaderReestrForm.Button1Click(Sender: TObject);
var
  s: string;
begin
  if (mdsErrors.Active) and (mdsErrors.RecordCount > 0) then
  begin
    if SaveTextFileDialog.Execute then
    begin
      s := SaveTextFileDialog.FileName;
      mmoSQL.Lines.Clear;
      mdsErrors.DisableControls;
      mdsErrors.First;
      while not mdsErrors.EOF do
      begin
        mmoSQL.Lines.Add(mdsErrors['eText']);
        mdsErrors.Next;
      end;
      mdsErrors.First;
      mdsErrors.EnableControls;
      mmoSQL.Lines.SaveToFile(SaveTextFileDialog.FileName);
      mmoSQL.Lines.Clear;
    end;
  end;
end;

procedure TLoaderReestrForm.cbbProfileChange(Sender: TObject);
var
  s: string;
begin
  s := rsAllFiles;
  if not mdsFileFormats.FieldByName('FileExt').IsNull then
    s := mdsFileFormats['FileExt'] + '|' + s;
  if not mdsFileFormats.FieldByName('Profile').IsNull then
    s := mdsFileFormats['Profile'] + '|' + s;
  edtProcessedFile.Filter := s;
  if not mdsFileFormats.FieldByName('FileDir').IsNull then
    edtProcessedFile.InitialDir := mdsFileFormats['FileDir'];
end;

procedure TLoaderReestrForm.dbgehErrorsDblClick(Sender: TObject);
var
  myRect: Vcl.Grids.TGridRect;
  i: Integer;
begin
  if (not mdsErrors.FieldByName('FileLine').IsNull) and (mdsErrors['FileLine'] >= 0) then
  begin
    if mdsFileFormats['FileType'] = 0 then
    begin
      myRect.Left := 0;
      i := mdsErrors['FileLine'];
      if i <= 0 then
        i := 0
      else
        i := i - 1;
      myRect.Top := i;
      myRect.Right := 2;
      myRect.Bottom := i;
      strngrdFile.Selection := myRect;
    end
    else
    begin
      FDBF.First;
      FDBF.DisableControls;
      i := 0;
      while i < mdsErrors['FileLine'] do
      begin
        FDBF.Next;
        Inc(i);
      end;
      FDBF.EnableControls;
    end;
    if mdsErrors['reestrLine'] > 0 then
    begin
      mdsReestr.DisableControls;
      mdsReestr.First;
      i := 1;
      while i < mdsErrors['reestrLine'] do
      begin
        mdsReestr.Next;
        Inc(i);
      end;
      mdsReestr.EnableControls;
    end;
  end;
end;

procedure TLoaderReestrForm.edtProcessedFileChange(Sender: TObject);
begin
  {
    if not CheckFileNotLock(edtProcessedFile.Text)
    then begin
    CnErrors.SetError(edtProcessedFile, rsFileLocked, iaMiddleLeft, bsNeverBlink);
    Exit;
    end
    else CnErrors.Dispose(edtProcessedFile);
  }
  pcShowFile.ActivePageIndex := mdsFileFormats.FieldByName('FileType').AsInteger;

  if mdsFileFormats['FileType'] = 0 then
  begin
    ShowFileInStringGrid(strngrdFile, edtProcessedFile.FileName, mdsFileFormats['CodePage'], True);
    strngrdFile.Visible := True;
    btnProcess.Enabled := True and strngrdFile.Visible;
  end
  else
  begin
    ShowDBF;
    if FDBF.Active then
      btnProcess.Enabled := (FDBF.RecordCount > 0)
    else
      btnProcess.Enabled := False;
  end;
  btnLoadIntoDB.Enabled := False;
end;

procedure TLoaderReestrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveProfiles;
  Action := caFree;
  LoaderReestrForm := nil;
end;

procedure TLoaderReestrForm.SaveProfiles;
var
  profFile: string;
begin
  if mdsFileFormats.RecordCount = 0 then
    Exit;

  mdsFileFormats.DisableControls;
  mdsFileFormats.First;
  while not mdsFileFormats.EOF do
  begin
    if mdsFileFormats.FieldByName('Profile').IsNull then
      mdsFileFormats.Delete
    else
      mdsFileFormats.Next;
  end;
  profFile := GetTempDir + ProfilesFile;
  DeleteFile(profFile + '.txt');
  DatasetToJson(mdsFileFormats, profFile + '.txt');
  // GZCompressFile(profFile + '.txt', profFile + '.gz');
  // Compress(profFile + '.txt', profFile + '.$$$');
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := trWriteQ;
      Transaction.StartTransaction;
      SQL.Text := 'UPDATE OR INSERT INTO BLOB_TBL (Bl_Id, BL_BODY, BL_NAME) ' +
        'Values(-2, :BLOB, ''PayLoader profiles'') MATCHING (BL_ID)';
      Prepare;
      Params[0].LoadFromFile(profFile + '.txt');
      ExecQuery;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  if FileExists(profFile + '.txt') then
    DeleteFile(profFile + '.txt');
end;

procedure TLoaderReestrForm.FormCreate(Sender: TObject);
begin
  FDBF := TVKDBFNTX.Create(Self);
  with FDBF do
  begin
    Name := 'FDBF';
    AccessMode.AccessMode := 18;
    AccessMode.OpenReadWrite := True;
    AccessMode.ShareExclusive := True;
    SetDeleted := False;
    FastPostRecord := False;
    LookupOptions := [];
    TrimInLocate := False;
    TrimCType := False;
    BufferSize := 4096;
    WaitBusyRes := 3000;
    CreateNow := False;
    DbfVersion := xBaseIII;
    LobBlockSize := 512;
    LockProtocol := lpClipperLock;
    LobLockProtocol := lpClipperLock;
  end;
  srcDBF.DataSet := FDBF;
  FormStorage.IniFileName := A4MainForm.GetIniFileName;
end;

procedure TLoaderReestrForm.FormDestroy(Sender: TObject);
begin
  FDBF.Free;
end;

procedure TLoaderReestrForm.ClearHeader;
var
  dt: TDateTime;
begin
  edtDocSum.Value := 0;
  edtDocNumber.Text := ExtractFileName(edtProcessedFile.FileName);

  FileAge(edtProcessedFile.FileName, dt);

  deDocDate.Value := dt;
  mmoNotice.Lines.Text := Format(rsLoadProfileResult, [DateToStr(now()), ExtractFileName(edtProcessedFile.FileName)]);
end;

procedure TLoaderReestrForm.FormShow(Sender: TObject);
const
  passprefix: string = 'tv';
var
  profFile: String;
  i: Integer;
begin

  if not(dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Pays_add)) then
  begin
    Application.MessageBox(PWideChar(rsPaysDenied), PWideChar(rsAccessDenied), MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);
    Close;
  end
  else
  begin
    dsPaymentSource.Open;
    edtDocSum.Value := 0;
    edtDocNumber.Text := '';
    deDocDate.Value := now();
    mmoNotice.Lines.Clear;

    profFile := GetTempDir + ProfilesFile;
    if FileExists(profFile + '.txt') then
      DeleteFile(profFile + '.txt');

    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;
        Transaction.StartTransaction;
        SQL.Text := 'select BL_BODY from BLOB_TBL b where b.Bl_Id = -2';
        ExecQuery;
        if not EOF then
          FN('BL_BODY').SaveToFile(profFile + '.txt');
        Transaction.Commit;
        Close;
      finally
        Free;
      end;

    mdsFileFormats.Open;
    mdsFileFormats.EmptyTable;

    if FileExists(profFile + '.txt') then
    begin
      try
        DatasetFromJson(mdsFileFormats, profFile + '.txt');
      except
        RenameFile(profFile + '.txt', profFile + '.gz');
        Uncompress(profFile + '.gz', profFile + '.txt');
        DatasetFromINI(mdsFileFormats, profFile + '.txt');
        if FileExists(profFile + '.gz') then
          DeleteFile(profFile + '.gz');
      end;
    end;
    if FileExists(profFile + '.txt') then
      DeleteFile(profFile + '.txt');

    if mdsFileFormats.RecordCount > 0 then
    begin
      for i := 0 to pcShowFile.PageCount - 1 do
        pcShowFile.Pages[i].TabVisible := False;
      if mdsFileFormats.FieldByName('FileType').IsNull then
        pcShowFile.ActivePageIndex := 0
      else
        pcShowFile.ActivePageIndex := mdsFileFormats.FieldByName('FileType').AsInteger;
    end
    else
    begin
      btnEditProfile.Enabled := False;
    end;
  end;
end;

procedure TLoaderReestrForm.ShowDBF;
begin
  FDBF.Close;
  FDBF.OEM := (mdsFileFormats['CodePage'] = 0);
  FDBF.DBFFileName := AnsiString(edtProcessedFile.FileName);
  try
    FDBF.Open;
  except
    ShowMessage(rsLoadProfileNotDBF);
  end;
end;

procedure TLoaderReestrForm.DBFFileProcess;
var
  CanParseFile: Boolean;
  i, cur_rec, total_rec: Integer;
  ds: TDataSet;
  delZerro: Boolean;
  s: string;
  account_i, sum_i, dat_i, fio_i, adres_i, pay_n_i, house_i, flat_i, fldNotice, Notice, korp, fldExtID: string;
  dat_format: string;
  FormatSettings: TFormatSettings;
  kopeyki: Byte;
  SkipEmptyDate: Boolean;
begin

  if (FDBF.RecordCount = 0) then
    Exit;

  if ((not srcProfile.DataSet.FieldByName('PaymentSrc').IsNull)) then
    cbbDocSrc.KeyValue := srcProfile.DataSet['PaymentSrc'];

  // if Length(fFileName) = 0 then Exit;
  // if (not fileexists(fFileName)) then Exit;
  CanParseFile := False;
  ds := mdsFileFormats;

  delZerro := False;
  fldNotice := '';
  fldExtID := '';
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
  SkipEmptyDate := False;
  try
    if not ds.FieldByName('kopeyki').IsNull then
      if ds.FieldByName('kopeyki').AsBoolean then
        kopeyki := 100;

    if not ds.FieldByName('DecimalSprt').IsNull then
    begin
      s := ds['DecimalSprt'];
      FormatSettings.DecimalSeparator := s[1];
    end;

    if not ds.FieldByName('DBF_ACCOUNT').IsNull then
      account_i := ds.FieldByName('DBF_ACCOUNT').AsString
    else
      account_i := '';

    if not ds.FieldByName('DBF_ADRES').IsNull then
      adres_i := ds.FieldByName('DBF_ADRES').AsString
    else
      adres_i := '';

    if not ds.FieldByName('DBF_FLAT').IsNull then
      flat_i := ds.FieldByName('DBF_FLAT').AsString
    else
      flat_i := '';

    if not ds.FieldByName('DBF_KORP').IsNull then
      korp := ds.FieldByName('DBF_KORP').AsString
    else
      korp := '';
    if not ds.FieldByName('DBF_HOUSE').IsNull then
      house_i := ds.FieldByName('DBF_HOUSE').AsString
    else
      house_i := '';
    if not ds.FieldByName('DBF_FIO').IsNull then
      fio_i := ds.FieldByName('DBF_FIO').AsString
    else
      fio_i := '';
    if not ds.FieldByName('DBF_Date').IsNull then
      dat_i := ds.FieldByName('DBF_Date').AsString
    else
      dat_i := '';
    if not ds.FieldByName('DBF_SUM').IsNull then
      sum_i := ds.FieldByName('DBF_SUM').AsString
    else
      sum_i := '';
    if not ds.FieldByName('DATEfmt').IsNull then
      dat_format := ds.FieldByName('DATEfmt').AsString
    else
      dat_format := '';
    if not ds.FieldByName('DBFPAYMENT_NO').IsNull then
      pay_n_i := ds.FieldByName('DBFPAYMENT_NO').AsString
    else
      pay_n_i := '';
    if not ds.FieldByName('DataRemZero').IsNull then
      delZerro := ds.FieldByName('DataRemZero').AsBoolean
    else
      delZerro := False;
    if not ds.FieldByName('DBF_NOTICE').IsNull then
      fldNotice := ds.FieldByName('DBF_NOTICE').AsString
    else
      fldNotice := '';
    if not ds.FieldByName('DBF_EXTERNAL').IsNull then
      fldExtID := ds.FieldByName('DBF_EXTERNAL').AsString
    else
      fldExtID := '';

    if not ds.FieldByName('SkipEmpDate').IsNull then
      SkipEmptyDate := ds.FieldByName('SkipEmpDate').AsBoolean;

    CanParseFile := True;
  except
    addError(-1, rsErrorReadProfile, -1);
  end;

  if not CanParseFile then
    Exit;

  mdsReestr.Close;
  mdsReestr.Open;
  if FDBF.State in dsEditModes then
    FDBF.Cancel;
  FDBF.First;
  FDBF.DisableControls;
  i := 1;
  total_rec := FDBF.RecordCount - 1;
  if (not ds.FieldByName('DBF_NotLast').IsNull) and (ds['DBF_NotLast']) then
    total_rec := total_rec - 1;

  for cur_rec := 0 to total_rec do
  // while not FDBF.eof do
  begin
    if not((SkipEmptyDate) and ((dat_i = '') or (FDBF.FieldByName(dat_i).IsNull) or
      ((not FDBF.FieldByName(dat_i).IsNull) and ((Trim(FDBF[dat_i]) = '') or (FDBF[dat_i] = '0'))))) then
    begin
      try
        mdsReestr.append;
        if (dat_i <> '') and (not FDBF.FieldByName(dat_i).IsNull) and (Trim(FDBF[dat_i]) <> '') and (FDBF[dat_i] <> '0')
        then
          mdsReestr['pDate'] := DateTimeStrEval(dat_format, FDBF[dat_i])
        else
          mdsReestr['pDate'] := deDocDate.Value;
        if sum_i <> '' then
        begin
          if not FDBF.FieldByName(sum_i).IsNull then
            mdsReestr['pSum'] := strtofloat(FDBF[sum_i], FormatSettings) / kopeyki
          else
            mdsReestr['pSum'] := 0;
        end;
        if adres_i <> '' then
        begin
          if (flat_i <> '') or (house_i <> '') then
          begin
            if house_i <> '' then
              mdsReestr['House'] := AnsiUpperCase(Trim(FDBF[house_i]))
            else
              mdsReestr['House'] := '';
            if korp <> '' then
              mdsReestr['House'] := mdsReestr['House'] + AnsiUpperCase(Trim(FDBF[korp]));
            if flat_i <> '' then
              mdsReestr['Flat'] := AnsiUpperCase(Trim(FDBF[flat_i]))
            else
              mdsReestr['Flat'] := '';
            mdsReestr['Street'] := AnsiUpperCase(Trim(FDBF[adres_i]));
            mdsReestr['pAdress'] := Format(rsPrintCheckAdr, [mdsReestr['Street'], mdsReestr['House'],
              mdsReestr['Flat']]);
          end
          else
            mdsReestr['pAdress'] := FDBF[adres_i];
        end;
        if fio_i <> '' then
          mdsReestr['pFIO'] := FDBF[fio_i];
        if account_i <> '' then
        begin
          if not delZerro then
            mdsReestr['pAccount'] := FDBF[account_i]
          else
            mdsReestr['pAccount'] := LeftTrimChar(FDBF[account_i], '0');
        end;
        if pay_n_i <> '' then
          mdsReestr['pPayment_No'] := FDBF[pay_n_i]
        else
          mdsReestr['pPayment_No'] := '';
        mdsReestr['pLine'] := i;

        Notice := '';
        if fldNotice <> '' then
        begin
          Notice := FDBF[fldNotice];
          mdsReestr['pNotice'] := Notice;
        end;
        if fldExtID <> '' then
        begin
          Notice := FDBF[fldExtID];
          mdsReestr['EXT_ID'] := Notice;
        end;
        mdsReestr.post;
        Inc(i);
      except
        addError(i + 1, Format(rsErrorBodyFormatReestr, [(i + 1)]), -1);
        mdsReestr.Cancel;
      end;
    end;
    FDBF.Next;
  end;
  FDBF.EnableControls;
  if mdsReestr.RecordCount > 0 then
    LoadAccountsFromDB(delZerro);

end;

procedure TLoaderReestrForm.mdsFileFormatsNewRecord(DataSet: TDataSet);
begin
  mdsFileFormats['FileType'] := 0; // 0 -txt; 1 - FDBF; дальше пока не придумал
  mdsFileFormats['FileExt'] := '*.*';
  mdsFileFormats['FileDir'] := '';
  mdsFileFormats['PaymentSrc'] := 0;
  mdsFileFormats['CodePage'] := 0;
  mdsFileFormats['DataFrom'] := 1;
  mdsFileFormats['DataTo'] := 0;
  mdsFileFormats['DataSprt'] := ';';
  mdsFileFormats['DataRemCh'] := '';
  mdsFileFormats['DataRemZero'] := True;
  mdsFileFormats['HeaderExist'] := False;
  mdsFileFormats['HeaderFrom'] := 1;
  mdsFileFormats['HeaderTo'] := 0;
  mdsFileFormats['HeadSprt'] := ';';
  mdsFileFormats['HeadRemCh'] := '';
  mdsFileFormats['kopeyki'] := False;
  mdsFileFormats['DecimalSprt'] := '.';
  // mdsFileFormats['ACCOUNT']     := 0;
  // mdsFileFormats['FIO']         := 0;
  // mdsFileFormats['ADRESS']      := 0;
  // mdsFileFormats['SUMMA']       := 0;
  // mdsFileFormats['PayDate']     := 0;
  mdsFileFormats['DATEfmt'] := 'DD/MM/YYYY';
  // mdsFileFormats['headNumCol']  := 0;
  // mdsFileFormats['HeadNumLine'] := 0;
  // mdsFileFormats['headSumCol']  := 0;
  // mdsFileFormats['headSumLine'] := 0;
  // mdsFileFormats['headDateCol'] := 0;
  // mdsFileFormats['headDateLine']:= 0;
  mdsFileFormats['headDateFmt'] := 'DD/MM/YYYY';
end;

procedure TLoaderReestrForm.ScriptExecuteError(Sender: TObject; StatementNo, Line: Integer; Statement: TStrings;
  SQLCode: Integer; const Msg: string; var doRollBack, Stop: Boolean);
begin
  addError(StatementNo - 1, Msg, StatementNo - 1);
  doRollBack := True;
  Stop := True;
  FScriptExecError := True;
end;

function TLoaderReestrForm.GetLineWithError(const Reestrline: Integer): string;
var
  s: string;
  i: Integer;
begin
  s := '';
  if Reestrline > -1 then
  begin
    if (mdsFileFormats['FileType'] = 0) then
    begin
      if Reestrline > 0 then
        s := strngrdFile.Cells[2, Reestrline - 1]
      else
        s := strngrdFile.Cells[2, 0];
      result := s;
    end
    else
    begin
      FDBF.First;
      FDBF.DisableControls;
      i := 0;
      while i < Reestrline do
      begin
        FDBF.Next;
        Inc(i);
      end;
      s := '';
      for i := 0 to FDBF.FieldCount - 1 do
      begin
        s := s + Trim(FDBF.Fields[i].AsString) + '; ';
      end;
      result := s;
      FDBF.EnableControls;
    end;

  end
  else
    result := '';

end;

procedure TLoaderReestrForm.edtProcessedFileEnter(Sender: TObject);
begin
  CnErrors.Dispose(edtProcessedFile);
end;

end.
