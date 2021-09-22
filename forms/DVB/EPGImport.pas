unit EPGImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ToolCtrlsEh, DBGridEhToolCtrls,
  DB, GridsEh, System.UITypes,
  DBAxisGridsEh, DBGridEh, MemTableDataEh, MemTableEh, FIBQuery,
  pFIBQuery, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, DBCtrlsEh,
  Mask, DBLookupEh, ComCtrls, OXmlPDOM, OTextReadWrite, EhLibVCL,
  httpsend, synacode, blcksock, ftpsend, synsock,
  System.TimeSpan, DBGridEhGrouping, DynVarsEh;

type
  TEPGImportForm = class(TForm)
    memLog: TDBMemoEh;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    srcSources: TDataSource;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    cbSource: TDBLookupComboboxEh;
    Label1: TLabel;
    Label7: TLabel;
    edtXMLFile: TDBEditEh;
    btnOpenAndLoad: TButton;
    btnCreate: TButton;
    dsSources: TpFIBDataSet;
    OpenDialog: TOpenDialog;
    dsSrcChennals: TpFIBDataSet;
    srcSrcChennals: TDataSource;
    Label2: TLabel;
    btnLoad: TButton;
    Splitter1: TSplitter;
    ProgressBar: TProgressBar;
    Query: TpFIBQuery;
    mpg: TMemTableEh;
    btnOpen: TButton;
    mtAssoc: TMemTableEh;
    btnEdit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOpenAndLoadClick(Sender: TObject);
    procedure cbSourceChange(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    FGenreAssoc: TStrings;
    fFileToLoad: string;
    FDownload: Integer;
    procedure UpdateEPGLoadTime;
    procedure Status(Sender: TObject; Reason: THookSocketReason; const Value: String);
    function DownloadFile: Boolean;
    function DownloadHTTP: Boolean;
    function DownloadFTP: Boolean;
    procedure OnHeartBeat(Sender: TObject);
    procedure OnMonitor(Sender: TObject; Writing: Boolean; const Buffer: TMemory; Len: Integer);
    procedure SetFileToLoad(const Value: string);
    function Load_xmltv: Boolean;
    function Load_A4onTV: Boolean;
    procedure CreateAssocList;
    procedure ClearEPGinDB(const DatesList: TStringList);
    procedure ClearEPGinDBUTC(const DatesList: TStringList);
    function OpenFile: Boolean;
    function LoadFile: Boolean;
    function GetFileFormat(const aFileName: String): string;
    procedure CreateOrEditSource(const New: Boolean = true);
  public
    { Public declarations }
    property FileToLoad: string write SetFileToLoad;
  end;

var
  EPGImportForm: TEPGImportForm;

implementation

uses
  DM, EPGSource, StrUtils, OXmlUtils, PrjConst, AtrCommon, System.DateUtils, JsonDataObjects, sevenzip;

resourcestring
  srUnknownFormat = 'Не верный формат файла, настройте пожалуйста источник EPG';

{$R *.dfm}

function GetTimeFromString(const str: string; const FormatSettings: TFormatSettings): TDateTime;
var
  t: String;
  s: string;
  i: Integer;
  y, m, d, h, mi: string;
begin
  // 20140922235959 +0300
  i := Pos(' ', str);
  if i > 0 then begin
    t := Copy(str, 1, i);
    s := Copy(str, i + 1, 255);
  end
  else begin
    t := str;
    s := '';
  end;
  y := Copy(t, 1, 4);
  m := Copy(t, 5, 2);
  d := Copy(t, 7, 2);
  h := Copy(t, 9, 2);
  mi := Copy(t, 11, 2);
  // Result := EncodeDateTime(y,m,d,h,mi,0,0);
  Result := StrToDateTime(y + '-' + m + '-' + d + ' ' + h + ':' + mi, FormatSettings); // '23/02/2075 12:34:56'
end;

function GetDateAndUTC(const str: string; var RTime: TDateTime; var UTCTime: TDateTime;
  const src_time_shift: Integer = 0; const NewTimeZone: Integer = 0): Boolean;
var
  t: String;
  s: string;
  i: Integer;
  UTCshift: Integer;
  y, m, d, h, mi: Integer;
begin
  Result := False;
  i := Pos(' ', str);
  if i > 0 then begin
    t := Copy(str, 1, i);
    s := Copy(str, i + 1, 255);
    if TryStrToInt(s, UTCshift) then begin
      UTCshift := -1 * Trunc((UTCshift div 100) * 60 + (UTCshift mod 100));
    end
    else
      UTCshift := 0;
  end
  else begin
    t := str;
    s := '';
    UTCshift := 0;
  end;

  if (Not TryStrToInt(Copy(t, 1, 4), y)) then
    Exit;
  if (Not TryStrToInt(Copy(t, 5, 2), m)) then
    Exit;
  if (Not TryStrToInt(Copy(t, 7, 2), d)) then
    Exit;
  if (Not TryStrToInt(Copy(t, 9, 2), h)) then
    Exit;
  if (Not TryStrToInt(Copy(t, 11, 2), mi)) then
    Exit;

  // Result := EncodeDateTime(y,m,d,h,mi,0,0);
  RTime := EncodeDate(y, m, d) + EncodeTime(h, mi, 0, 0);

  // приведем к UTC с учетом сдвига источника
  // сдвиг в минутах
  if (NewTimeZone = 0) then
    UTCTime := IncMinute(RTime, UTCshift + src_time_shift)
  else
    UTCTime := IncMinute(RTime, NewTimeZone + src_time_shift);
  if (UTCshift <> 0) then
    RTime := IncMinute(RTime, src_time_shift)
  else
    RTime := IncMinute(RTime, src_time_shift + (TTimeZone.Local.UtcOffset.Hours * 60 +
      TTimeZone.Local.UtcOffset.Minutes));

  Result := true;
end;

procedure TEPGImportForm.SetFileToLoad(const Value: string);
begin
  fFileToLoad := Value;
  edtXMLFile.Text := Value;
  btnLoad.Enabled := (not VarIsNull(cbSource.Value)) and FileExists(edtXMLFile.Text);
end;

procedure TEPGImportForm.btnLoadClick(Sender: TObject);
begin
  LoadFile;
end;

procedure TEPGImportForm.btnOpenAndLoadClick(Sender: TObject);
begin
  if OpenFile then
    LoadFile;
end;

procedure TEPGImportForm.Button3Click(Sender: TObject);
begin
  CreateOrEditSource(true);
end;

procedure TEPGImportForm.FormCreate(Sender: TObject);
begin
  FGenreAssoc := TStringList.Create;
end;

procedure TEPGImportForm.FormDestroy(Sender: TObject);
begin
  FGenreAssoc.Free;
end;

procedure TEPGImportForm.FormShow(Sender: TObject);
begin
  dsSources.Open;
  if not dsSources.FieldByName('ID').IsNull then
    cbSource.Value := dsSources['ID'];
end;

procedure TEPGImportForm.CreateAssocList;
begin
  if not mtAssoc.Active then
    mtAssoc.Open;
  mtAssoc.EmptyTable;
  if not dsSrcChennals.Active then
    dsSrcChennals.Open;
  dsSrcChennals.DisableControls;
  dsSrcChennals.First;
  while not dsSrcChennals.Eof do begin
    mtAssoc.Append;
    mtAssoc['epg_code'] := dsSrcChennals['epg_code'];
    mtAssoc['ch_id'] := dsSrcChennals['ch_id'];
    mtAssoc.Post;
    dsSrcChennals.Next;
  end;
  mtAssoc.First;
  dsSrcChennals.First;
  dsSrcChennals.EnableControls;

  FGenreAssoc.Clear;
  Query.SQL.Text := 'select genre_id, source_genre from epg_mapping_genre where epg_id = :EID order by source_genre';
  Query.ParamByName('EID').AsInteger := dsSources.FieldByName('ID').AsInteger;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  while not Query.Eof do begin
    FGenreAssoc.Values[Query.FN('source_genre').AsString] := Query.FN('genre_id').AsString;
    Query.Next;
  end;
  Query.Transaction.StartTransaction;
  Query.Transaction.Rollback;
end;

function TEPGImportForm.Load_A4onTV: Boolean;
var
  i, j: Integer;
  id: Integer;
  jsonName: string;
  B: TJsonBaseObject;
  O, c, r: TJsonObject;
  DatesInFile: TStringList;
  Source_id: Integer;
  Epg_Code: String;
  dstr: TDateTime;
  dstp: TDateTime;
  ustr: TDateTime;
  ustp: TDateTime;

  cr: TCursor;
  DT: Cardinal;
  // COUNTRY: string;
  // DIRECTED: string;

  m: Integer;
  AFormatSettings: TFormatSettings;
  TimeZoneShiftMinutes: Integer;
begin
  Result := False;
  DT := GetTickCount;
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  jsonName := GetTempDir + 'tv.json';
  dmMain.LoadWeekFromA4onTV(jsonName);

  if not FileExists(jsonName) then begin
    Screen.Cursor := cr;
    Exit;
  end;

  try
    AFormatSettings := TFormatSettings.Create;
    AFormatSettings.DateSeparator := '-';
    AFormatSettings.ShortDateFormat := 'yyyy-mm-dd hh:nn:ss';
    AFormatSettings.ShortTimeFormat := 'yyyy-mm-dd hh:nn:ss';
    TimeZoneShiftMinutes := -1 * (TTimeZone.Local.UtcOffset.Hours * 60 + TTimeZone.Local.UtcOffset.Minutes);

    B := TJsonBaseObject.ParseFromFile(jsonName);
    try
      if B <> nil then begin
        O := B as TJsonObject;
        // проверим. есть ли в файле смещение. если есть. сипользуем его
        if O.Contains('tz') then begin
          TimeZoneShiftMinutes := Trunc(-1 * O.F['tz'] * 60);
        end;
        // Удалим только те данные которые имеются в файле
        if O.Contains('schedule') then begin
          id := 0;
          DatesInFile := TStringList.Create;
          try
            DatesInFile.Sorted := true;
            DatesInFile.Duplicates := dupIgnore;
            for i := 0 to O.A['schedule'].Count - 1 do begin
              c := O.A['schedule'][i];
              for j := 0 to c.A['tv'].Count - 1 do begin
                r := c.A['tv'][j];
                DatesInFile.Add(r.s['date']);
                Inc(id);
              end;
            end;
            ClearEPGinDB(DatesInFile);
          finally
            DatesInFile.Free;
          end;
          ProgressBar.Visible := true;
          ProgressBar.Max := id;
          Query.SQL.Clear;
          Query.SQL.Add
            ('execute procedure Epg_Add_By_Sc(:Source_Id, :Epg_Code, :Title, :Utc_Start, :Utc_Stop, :Date_Start, :Date_Stop, ');
          Query.SQL.Add(':Description, :Genres, :Dvbgenres, :Minage, :Create_Year, :Actors, :Directed, :Country)');
          Query.Transaction.StartTransaction;
          for i := 0 to O.A['schedule'].Count - 1 do begin
            c := O.A['schedule'][i];
            Source_id := dsSources['ID'];
            Epg_Code := c.s['channel'];
            If (Epg_Code <> '') then begin
              for j := 0 to c.A['tv'].Count - 1 do begin
                r := c.A['tv'][j];
                m := StrToInt(r.s['duration']);
                dstr := StrToDateTime(r.s['start_on'], AFormatSettings);
                dstp := IncMinute(dstr, m);
                ustr := IncMinute(dstr, TimeZoneShiftMinutes);
                ustp := IncMinute(dstp, TimeZoneShiftMinutes);

                Query.ParamByName('Source_Id').AsInteger := Source_id;
                Query.ParamByName('Epg_Code').AsString := Epg_Code;
                Query.ParamByName('TITLE').AsString := Copy(r.s['title'], 1, 255);

                if ((r.Contains('description')) and (r.Types['description'] = jdtString)) then
                  Query.ParamByName('DESCRIPTION').AsString := Copy(r.s['description'], 1, 4096)
                else
                  Query.ParamByName('DESCRIPTION').Clear;

                Query.ParamByName('DATE_START').AsDateTime := dstr;
                Query.ParamByName('DATE_STOP').AsDateTime := dstp;
                Query.ParamByName('UTC_START').AsDateTime := ustr;
                Query.ParamByName('UTC_STOP').AsDateTime := ustp;

                if ((r.Contains('ganres')) and (r.Types['ganres'] = jdtString)) then
                  Query.ParamByName('GenreS').AsString := Copy(r.s['ganres'], 1, 255)
                else
                  Query.ParamByName('GenreS').Clear;

                if ((r.Contains('minage')) and (r.Types['minage'] = jdtString)) then
                  Query.ParamByName('MINAGE').AsInteger := StrToInt(r.s['minage'])
                else
                  Query.ParamByName('MINAGE').Clear;

                // if dvbgenre <> ''
                // then Query.ParamByName('DVBGENRES').AsString := Copy(dvbgenre, 1, 255)
                // else Query.ParamByName('DVBGENRES').Clear;

                if ((r.Contains('actors')) and (r.Types['actors'] = jdtString)) then
                  Query.ParamByName('ACTORS').AsString := Copy(r.s['actors'], 1, 255)
                else
                  Query.ParamByName('ACTORS').Clear;

                Query.ParamByName('CREATE_YEAR').Clear;
                if ((r.Contains('year')) and (r.Types['year'] = jdtString) and (r.s['year'] <> '0')) then
                  Query.ParamByName('CREATE_YEAR').AsString := Copy(r.s['year'], 1, 255)
                else
                  Query.ParamByName('CREATE_YEAR').Clear;

                if ((r.Contains('country')) and (r.Types['country'] = jdtString)) then
                  Query.ParamByName('COUNTRY').AsString := Copy(r.s['country'], 1, 255)
                else
                  Query.ParamByName('COUNTRY').Clear;

                if ((r.Contains('directed')) and (r.Types['directed'] = jdtString)) then
                  Query.ParamByName('DIRECTED').AsString := Copy(r.s['directed'], 1, 255)
                else
                  Query.ParamByName('DIRECTED').Clear;

                Query.ExecQuery;
                ProgressBar.StepIt;
              end;
            end;
          end;
          Query.Transaction.Commit;
          ProgressBar.Visible := False;
          Result := true;
        end;
      end;
    finally
      B.Free;
    end;
  finally
    Screen.Cursor := cr;
  end;

  if System.SysUtils.FileExists(jsonName) then
    System.SysUtils.DeleteFile(jsonName);

  memLog.Lines.Add(Format(rsLoadTime, [(GetTickCount - DT) / 1000]));
end;

function TEPGImportForm.Load_xmltv: Boolean;
var
  oXml: OXmlPDOM.IXMLDocument;
  xNodeRoot: PXMLNode;
  xNode: PXMLNode;
  xNodeList: OXmlPDOM.IXMLNodeList;
  FormatSettings: TFormatSettings;
  vDateTime: TDateTime;
  vUTCTime: TDateTime;
  i, iCh_id: Integer;
  s: string;
  title, Genre, start_date, stop_date, desc: string;
  minage: Integer;
  dvbgenre: string;
  ch_id: string;
  cr: TCursor;
  DT: Cardinal;
  ACTORS: string;
  CREATE_YEAR: string;
  COUNTRY: string;
  DIRECTED: string;
  NewTimeZone: Integer;
  DatesInFile: TStringList;
  XmlTVFileNAme: string;
  NoError : Boolean;

  procedure parseNode();
  var
    e: Integer;
    A: string;
    xN: PXMLNode;
    xL: OXmlPDOM.IXMLNodeList;
  begin
    {
      <programme start="20130728235500" stop="20130729004500" channel="484">
      <title>Полиция Майами: отдел по защите животных: Спасение ламантина.</title>
      <date>20130728</date>
      <Genre lang="ru">другое</Genre>
      <desc lang="ru">Во время операции по спасению ламантина следователям неожиданно открывается тайна! Тем временем инспектор Касадевалл охотится за браконьерами, уничтожившими несколько голов скота.</desc>
      <parental>12+</parental>
      </programme>
    }
    minage := -1;
    dvbgenre := '';
    ACTORS := '';
    CREATE_YEAR := '';
    COUNTRY := '';
    DIRECTED := '';
    start_date := xNode.GetAttribute('start');
    stop_date := xNode.GetAttribute('stop');

    xN := xNode.SelectNode('title');
    if xN <> nil then
      title := xN.Text
    else
      title := '';

    xN := xNode.SelectNode('parental');
    if xN <> nil then begin
      A := xN.Text;
      A := ReplaceStr(A, '+', '');
      if TryStrToInt(A, e) then
        minage := e;
    end
    else begin
      // проверим возраст в названии (??+)
      e := Pos('+)', title);
      if e > 0 then begin
        A := Copy(title, e - 2, 2);
        e := Pos('(', A);
        if e > 0 then
          A := Copy(A, e + 1, 2);
        if TryStrToInt(A, e) then
          minage := e;
      end
    end;

    xN := xNode.SelectNode('Genre');
    if xN <> nil then begin
      Genre := xN.Text;
      if FGenreAssoc.Values[Genre] <> '' then
        dvbgenre := FGenreAssoc.Values[Genre];
    end
    else
      Genre := '';

    xN := xNode.SelectNode('desc');
    if xN <> nil then
      desc := xN.Text
    else
      desc := '';

    xN := xNode.SelectNode('date');
    if xN <> nil then
      CREATE_YEAR := xN.Text;

    xN := xNode.SelectNode('credits');
    if xN <> nil then begin
      xL := xN.SelectNodes('actor');
      for e := 0 to xL.Count - 1 do begin
        ACTORS := ACTORS + ', ' + xL.Nodes[e].Text;
      end;
      xL := xN.SelectNodes('director');
      for e := 0 to xL.Count - 1 do begin
        DIRECTED := DIRECTED + ', ' + xL.Nodes[e].Text;
      end;
    end;
  end;

begin
  Result := False;
  if not FileExists(edtXMLFile.Text) then
    Exit;

  DT := GetTickCount;
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  ProgressBar.Visible := true;
  DatesInFile := TStringList.Create;
  try
    DatesInFile.Sorted := true;
    DatesInFile.Duplicates := dupIgnore;

    NewTimeZone := 0;
    // if (Assigned(dsSources.FindField('ignore_tzone')))
    // then
    if not dsSources.FieldByName('LOCAL_TZONE').IsNull then
      if (dsSources['LOCAL_TZONE'] = 1) then
        NewTimeZone := -1 * (TTimeZone.Local.UtcOffset.Hours * 60 + TTimeZone.Local.UtcOffset.Minutes);

    // FormatSettings := TFormatSettings.Create(GetThreadLocale);
    FormatSettings.DateSeparator := '-';
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    oXml := OXmlPDOM.CreateXMLDoc;
    oXml.WhiteSpaceHandling := wsPreserveAll;
    oXml.ReaderSettings.ErrorHandling := ehSilent;
    XmlTVFileNAme := GetFileFormat(edtXMLFile.Text);
    oXml.LoadFromFile(XmlTVFileNAme);
    if oXml.DocumentElement = nil then begin
      ShowMessage(rsXMLTVFormatError);
      oXml := nil;
      Exit;
    end;

    xNodeRoot := oXml.DocumentElement;
    xNodeList := xNodeRoot.SelectNodes('//programme');
    if xNodeList <> nil then begin
      ProgressBar.Max := xNodeList.Count;
      // Удалим только те данные которые имеются в файле
      NoError := true;
      for i := 0 to xNodeList.Count - 1 do begin
        start_date := xNodeList.Nodes[i].GetAttribute('start');
        if start_date <> '' then begin
          if GetDateAndUTC(start_date, vDateTime, vUTCTime, dsSources['time_shift'], NewTimeZone) then
            DatesInFile.Add(FormatDateTime('yyyy-mm-dd', vUTCTime))
          else begin
            NoError := False;
            Break;
          end;
        end
        else begin
          NoError := False;
          Break;
        end;
      end;

      if NoError then begin
        ClearEPGinDBUTC(DatesInFile);

        Query.SQL.Clear;
        Query.SQL.Add('execute procedure Epg_Add(:Ch_Id, :Title, :Utc_Start, :Utc_Stop, :Date_Start, :Date_Stop, ');
        Query.SQL.Add(':Description, :Genres, :Dvbgenres, :Minage, :Create_Year, :Actors, :Directed, :Country)');
        Query.Transaction.StartTransaction;

        for i := 0 to xNodeList.Count - 1 do begin
          xNode := xNodeList.Nodes[i];
          s := xNode.GetAttribute('channel');
          if not mtAssoc.Locate('epg_code', s, []) then
            Continue;
          ch_id := mtAssoc['ch_id'];
          if TryStrToInt(ch_id, iCh_id) then begin
            parseNode();
            if Length(desc) > 1000 then
              desc := Copy(desc, 1, 996) + '...';

            Query.ParamByName('CH_ID').AsInteger := iCh_id;
            Query.ParamByName('TITLE').AsString := Copy(title, 1, 255);
            Query.ParamByName('DESCRIPTION').AsString := desc;
            GetDateAndUTC(start_date, vDateTime, vUTCTime, dsSources['time_shift'], NewTimeZone);
            Query.ParamByName('DATE_START').AsDateTime := vDateTime;
            Query.ParamByName('UTC_START').AsDateTime := vUTCTime;
            GetDateAndUTC(stop_date, vDateTime, vUTCTime, dsSources['time_shift'], NewTimeZone);
            Query.ParamByName('DATE_STOP').AsDateTime := vDateTime;
            Query.ParamByName('UTC_STOP').AsDateTime := vUTCTime;
            Query.ParamByName('GenreS').AsString := Copy(Genre, 1, 255);

            if minage > 0 then
              Query.ParamByName('MINAGE').AsInteger := minage
            else
              Query.ParamByName('MINAGE').Clear;

            if dvbgenre <> '' then
              Query.ParamByName('DVBGENRES').AsString := Copy(dvbgenre, 1, 255)
            else
              Query.ParamByName('DVBGENRES').Clear;

            if ACTORS <> '' then begin
              ACTORS := Copy(ACTORS, 3, 255);
              Query.ParamByName('ACTORS').AsString := ACTORS;
            end
            else
              Query.ParamByName('ACTORS').Clear;

            if CREATE_YEAR <> '' then
              Query.ParamByName('CREATE_YEAR').AsString := Copy(CREATE_YEAR, 1, 255)
            else
              Query.ParamByName('CREATE_YEAR').Clear;

            if COUNTRY <> '' then
              Query.ParamByName('COUNTRY').AsString := Copy(COUNTRY, 1, 255)
            else
              Query.ParamByName('COUNTRY').Clear;

            if DIRECTED <> '' then begin
              DIRECTED := Copy(DIRECTED, 3, 255);
              Query.ParamByName('DIRECTED').AsString := DIRECTED;
            end
            else
              Query.ParamByName('DIRECTED').Clear;

            Query.ExecQuery;
          end;
          if (ProgressBar.Position mod 100) = 0 then
            Application.ProcessMessages;
        end;
        Query.Transaction.Commit;
        Result := true;
      end
      else
        ShowMessage(rsXMLTVFormatError);
    end;

    if (XmlTVFileNAme <> edtXMLFile.Text) then
      DeleteFile(XmlTVFileNAme);
    Screen.Cursor := cr;
    oXml := nil;
  finally
    DatesInFile.Free;
  end;
  ProgressBar.Visible := False;
  memLog.Lines.Add(Format(rsLoadTime, [(GetTickCount - DT) / 1000]));
end;

function TEPGImportForm.DownloadFile: Boolean;
begin
  if UpperCase(dsSources['URL']).StartsWith('FTP') then
    Result := DownloadFTP()
  else
    Result := DownloadHTTP();
end;

function TEPGImportForm.DownloadHTTP: Boolean;
var
  HTTPClient: THTTPSend;
  strStream: TStringStream;
  s: AnsiString;
  i: Integer;
  Size: Integer;
  ch: Char;
begin
  Size := 1;
  Result := False;
  HTTPClient := THTTPSend.Create;
  HTTPClient.Sock.OnStatus := Status;
  strStream := TStringStream.Create;
  ProgressBar.Visible := true;
  try
    ProgressBar.Position := 0;
    ProgressBar.Max := 0;
    FDownload := 0;
    if ((not dsSources.FieldByName('urlLOGIN').IsNull) and (not dsSources.FieldByName('urlPASSWORD').IsNull) and
      (dsSources['urlLOGIN'] <> '') and (dsSources['urlPASSWORD'] <> '')) then begin
      s := dsSources.FieldByName('urlLOGIN').AsAnsiString + ':' + dsSources.FieldByName('urlPASSWORD').AsAnsiString;
      s := EncodeBase64(s);
      HTTPClient.Headers.Add('Authorization: Basic ' + string(s));
    end;
    if HTTPClient.HTTPMethod('HEAD', dsSources['URL']) then begin
      for i := 0 to HTTPClient.Headers.Count - 1 do begin
        if Pos('content-length', lowercase(HTTPClient.Headers[i])) > 0 then begin
          s := '';
          for ch in HTTPClient.Headers[i] do
            if CharInSet(ch, ['0' .. '9']) then
              s := s + AnsiChar(ch);
          Size := StrToIntDef(string(s), -1) + Length(HTTPClient.Headers.Text);
          Break;
        end;
      end;
    end;
    ProgressBar.Max := Size;
    HTTPClient.Headers.Clear;
    HTTPClient.Clear;
    if ((not dsSources.FieldByName('urlLOGIN').IsNull) and (not dsSources.FieldByName('urlPASSWORD').IsNull) and
      (dsSources['urlLOGIN'] <> '') and (dsSources['urlPASSWORD'] <> '')) then begin
      s := dsSources.FieldByName('urlLOGIN').AsAnsiString + ':' + dsSources.FieldByName('urlPASSWORD').AsAnsiString;
      s := EncodeBase64(s);
      HTTPClient.Headers.Add('Authorization: Basic ' + string(s));
    end;

    if HTTPClient.HTTPMethod('GET', dsSources['URL']) then begin
      if Pos('200 OK', HTTPClient.Headers.Text) <> 0 then begin
        HTTPClient.Document.SaveToFile(edtXMLFile.Text);
        Result := true;
      end;
    end
    else
      ShowMessage(rsDownloadError);
  finally
    strStream.Free;
    HTTPClient.Free;
  end;
  ProgressBar.Visible := False;
end;

procedure TEPGImportForm.OnHeartBeat(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TEPGImportForm.OnMonitor(Sender: TObject; Writing: Boolean; const Buffer: TMemory; Len: Integer);
begin
  if ProgressBar.Visible then
    ProgressBar.Position := ProgressBar.Position + Len;
end;

function TEPGImportForm.DownloadFTP: Boolean;
var
  ftp: TFTPSend;
  eHost, eFile: string;
  arr: TStringArray;
  i: Integer;
  URL, user, pass: string;
begin
  Result := False;
  eHost := '';
  eFile := '';
  URL := dsSources['URL'];
  if (not dsSources.FieldByName('urlLOGIN').IsNull) then
    user := dsSources['urlLOGIN']
  else
    user := '';

  if (not dsSources.FieldByName('urlPASSWORD').IsNull) then
    pass := dsSources['urlPASSWORD']
  else
    pass := '';

  // ftp://31.177.95.170/UMMC/xmltv.xml
  arr := Explode('/', URL);

  if Length(arr) > 0 then begin
    eHost := arr[2];
    for i := 3 to Length(arr) - 2 do begin
      if arr[i] <> '' then
        eFile := eFile + '/' + arr[i];
    end;
    eFile := arr[Length(arr) - 1];
    // eFile := eFile.TrimLeft(['/']);
  end;

  ftp := TFTPSend.Create;
  try
    ftp.TargetHost := eHost;
    ftp.BinaryMode := true;
    ftp.DSock.OnMonitor := OnMonitor;
    ftp.Sock.OnHeartBeat := OnHeartBeat;
    ftp.DSock.OnHeartBeat := OnHeartBeat;
    ftp.DSock.HeartbeatRate := 150; // lets make our GUI still feel responsive
    ftp.Sock.HeartbeatRate := 150;

    if ((user <> '') or (pass <> '')) then begin
      ftp.UserName := user;
      ftp.Password := pass;
    end;

    ftp.DirectFile := False;

    if ftp.Login then begin

      for i := 3 to Length(arr) - 2 do begin
        if arr[i] <> '' then
          ftp.ChangeWorkingDir(arr[i]);
      end;

      i := ftp.FileSize(eFile);
      if i > 0 then begin
        ProgressBar.Max := i;
        ProgressBar.Visible := true;
      end;
      if not ftp.RetrieveFile(eFile, False) then
        ShowMessage(rsDownloadError)
      else begin
        ftp.DataStream.SaveToFile(edtXMLFile.Text);
        Result := true;
      end;
      ftp.Logout;
    end
    else
      ShowMessage(rsDownloadError);

    if ProgressBar.Visible then
      ProgressBar.Visible := False;
  finally
    ftp.Free;
  end;
end;

procedure TEPGImportForm.Status(Sender: TObject; Reason: THookSocketReason; const Value: String);
begin
  if Reason = HR_ReadCount then begin
    FDownload := FDownload + StrToInt(Value);
    if ProgressBar.Max > 0 then
      ProgressBar.Position := FDownload;
  end
end;

procedure TEPGImportForm.ClearEPGinDB(const DatesList: TStringList);
var
  i: Integer;
begin
  Query.SQL.Text := 'delete from EPG where CH_ID = :CH_ID and EPG_DATE = :EPG_DATE';
  Query.Transaction.StartTransaction;
  dsSrcChennals.DisableControls;
  mtAssoc.First;
  while not mtAssoc.Eof do begin
    for i := 0 to DatesList.Count - 1 do begin
      Query.ParamByName('CH_ID').AsInteger := mtAssoc['ch_id'];
      Query.ParamByName('EPG_DATE').AsString := DatesList[i];
      Query.ExecQuery;
    end;
    mtAssoc.Next;
  end;
  Query.Transaction.Commit;
  mtAssoc.First;

  // почистим устаревшие данные
  Query.SQL.Text := 'delete from Epg where Epg_Date < dateadd(day,  -8, current_date)';
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
end;

procedure TEPGImportForm.ClearEPGinDBUTC(const DatesList: TStringList);
var
  i: Integer;
begin
  Query.SQL.Text := 'delete from EPG where CH_ID = :CH_ID and UTC_DATE = :UTC_DATE';
  Query.Transaction.StartTransaction;
  dsSrcChennals.DisableControls;
  mtAssoc.First;
  while not mtAssoc.Eof do begin
    for i := 0 to DatesList.Count - 1 do begin
      Query.ParamByName('CH_ID').AsInteger := mtAssoc['ch_id'];
      Query.ParamByName('UTC_DATE').AsString := DatesList[i];
      Query.ExecQuery;
    end;
    mtAssoc.Next;
  end;
  Query.Transaction.Commit;
  mtAssoc.First;

  // почистим устаревшие данные
  Query.SQL.Text := 'delete from Epg where Epg_Date < dateadd(day,  -8, current_date)';
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
end;

function TEPGImportForm.OpenFile: Boolean;
var
  canOpen: Boolean;
begin
  Result := False;
  canOpen := False;

  if VarIsClear(cbSource.Value) then begin
    cbSource.SetFocus;
    Exit;
  end;

  if dsSources.FieldByName('parseas').IsNull then begin
    cbSource.SetFocus;
    Exit;
  end;

  if dsSources['parseas'] = 1 then begin
    Result := true;
    Exit;
  end;

  edtXMLFile.Text := dsSources['LOCAL_FILE'];
  if not dsSources.FieldByName('URL').IsNull then begin
    if (dsSources['LOCAL_FILE'] <> '') then
      edtXMLFile.Text := dsSources['LOCAL_FILE']
    else
      edtXMLFile.Text := GetTempDir + GetFileNameFromURL(dsSources['URL']);
    canOpen := DownloadFile();
  end;

  if not canOpen then begin
    if (not FileExists(edtXMLFile.Text)) then begin
      if edtXMLFile.Text <> '' then
        OpenDialog.FileName := edtXMLFile.Text;

      if OpenDialog.Execute then begin
        edtXMLFile.Text := OpenDialog.FileName;
        canOpen := true;
      end;
    end
    else
      canOpen := true;
  end;

  if canOpen then begin
    FileToLoad := edtXMLFile.Text;
    Result := true;
  end;

end;

function TEPGImportForm.LoadFile: Boolean;
begin
  Result := False;
  CreateAssocList;
  case dsSources['parseas'] of
    0: begin
        Result := Load_xmltv;
      end;
    1: begin
        Result := Load_A4onTV;
      end;
  else
    ShowMessage(srUnknownFormat);
  end;
  dsSrcChennals.First;
  if Result then
    UpdateEPGLoadTime;
end;

procedure TEPGImportForm.btnOpenClick(Sender: TObject);
begin
  OpenFile;
end;

procedure TEPGImportForm.UpdateEPGLoadTime;
  procedure UpdStreams(ids: string);
  begin
    ids := Trim(Copy(ids, 1, Length(ids) - 1));
    Query.SQL.Clear;
    Query.SQL.Add(' update Dvb_Streams set Epg_Updated = CURRENT_TIMESTAMP where Dvbs_Id in ( ');
    Query.SQL.Add(' select distinct Dvbs_Id from Dvb_Stream_Channels where Ch_Id in (');
    Query.SQL.Add(ids);
    Query.SQL.Add('))');
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    Query.Transaction.Commit;
  end;

var
  s: string;
  i: Integer;
begin
  // поставим отметку что рассписание изменеилось тем потокам для которых эти каналы
  if mtAssoc.RecordCount > 0 then begin
    mtAssoc.First;
    i := 0;
    while not mtAssoc.Eof do begin
      s := s + mtAssoc.FieldByName('ch_id').AsString + ',';
      mtAssoc.Next;
      Inc(i);
      if i > 500 then begin
        UpdStreams(s);
        s := '';
        i := 0;
      end;
    end;
    if s <> '' then
      UpdStreams(s);
  end;
end;

procedure TEPGImportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if mtAssoc.Active then
    mtAssoc.Close;
end;

function TEPGImportForm.GetFileFormat(const aFileName: String): string;
var
  s: string;
  i: Integer;
  Finded: Boolean;
  z: I7zInArchive;
begin
  s := aFileName;
  // проверим, есть ли в папке длл для распакрвки
  if FileExists('7z.dll') then
    try
      i := Length(aFileName);
      Finded := False;
      while (i > 0) and (not Finded) do begin
        Finded := ('.' = aFileName[i]);
        Dec(i);
      end;
      s := Copy(aFileName, i + 2, Length(aFileName) - i - 1);
      s := UpperCase(s);
      Finded := False;
      if (s = 'ZIP') or (s = 'JAR') or (s = 'XPI') then begin
        z := CreateInArchive(CLSID_CFormatZip);
        Finded := true;
      end
      else if (s = '7Z') then begin
        z := CreateInArchive(CLSID_CFormat7z);
        Finded := true;
      end
      else if (s = 'RAR') then begin
        z := CreateInArchive(CLSID_CFormatRar);
        Finded := true;
      end
      else if (s = 'GZ') or (s = 'GZIP') or (s = 'TGZ') or (s = 'TPZ') then begin
        z := CreateInArchive(CLSID_CFormatGZip);
        Finded := true;
      end
      else if (s = 'ARJ') then begin
        z := CreateInArchive(CLSID_CFormatArj);
        Finded := true;
      end
      else if (s = 'BZ2') or (s = 'BZIP2') or (s = 'TBZ2') or (s = 'TBZ') then begin
        z := CreateInArchive(CLSID_CFormatBZ2);
        Finded := true;
      end
      else
        s := aFileName;

      if Finded then begin
        z.OpenFile(aFileName);
        s := z.ItemPath[0];
        s := GetTempDir + s;
        z.ExtractTo(GetTempDir);
      end;
    except
      s := aFileName;
    end;
  Result := s;
end;

procedure TEPGImportForm.cbSourceChange(Sender: TObject);
begin
  dsSrcChennals.Close;
  dsSrcChennals.Open;

  btnEdit.Visible := not VarIsNull(cbSource.Value);
  if VarIsNull(cbSource.Value) then
    btnCreate.Width := btnOpenAndLoad.Width
  Else begin
    btnCreate.Width := round(btnOpenAndLoad.Width / 2) - 2;

    if (not dsSources.FieldByName('LOCAL_FILE').IsNull) and (dsSources['LOCAL_FILE'] <> '') then
      edtXMLFile.Text := dsSources['LOCAL_FILE']
    else
      edtXMLFile.Text := '';
  end;

  btnOpen.Enabled := (not VarIsNull(cbSource.Value));
  btnLoad.Enabled := (not VarIsNull(cbSource.Value)) and FileExists(edtXMLFile.Text);
  btnOpenAndLoad.Enabled := cbSource.Text <> '';
end;

procedure TEPGImportForm.btnEditClick(Sender: TObject);
begin
  CreateOrEditSource(VarIsNull(cbSource.Value));
end;

procedure TEPGImportForm.CreateOrEditSource(const New: Boolean = true);
begin
  with TEPGSourceForm.Create(self) do begin
    if New or VarIsNull(cbSource.Value) then
      SourceId := -1
    else
      SourceId := cbSource.Value;
    if ShowModal = mrOk then begin
      dsSources.CloseOpen(true);
    end;
    Free;
  end;
end;

end.
