unit EPGView;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.Mask, Vcl.Menus, Vcl.Buttons,
  ToolCtrlsEh, DBGridEhToolCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, GridsEh, DBAxisGridsEh, DBGridEh,
  EhLibFIB,
  FIBQuery, pFIBQuery, MemTableDataEh, MemTableEh, EhLibVCL, DBCtrlsEh, DBGridEhGrouping, DynVarsEh,
  PropFilerEh, PropStorageEh;

type
  TEPGViewForm = class(TForm)
    pnlChannels: TPanel;
    pnlEvents: TPanel;
    srcChennals: TDataSource;
    srcEPG: TDataSource;
    dbgChannels: TDBGridEh;
    dbgEPG: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    dsEPG: TpFIBDataSet;
    dsChennals: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    Splitter1: TSplitter;
    Query: TpFIBQuery;
    SaveDialog: TSaveDialog;
    trReadQ: TpFIBTransaction;
    ActionList1: TActionList;
    ActADDProgramm: TAction;
    ActEDITProgramm: TAction;
    actImport: TAction;
    actSaveEPG: TAction;
    dsTV: TMemTableEh;
    pnl1: TPanel;
    tlbActions: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    chk5: TCheckBox;
    chk6: TCheckBox;
    chk0: TCheckBox;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
    pnlEditEvent: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edStopTime: TDBDateTimeEditEh;
    edStopDate: TDBDateTimeEditEh;
    edtTITLE: TDBEditEh;
    edStartDate: TDBDateTimeEditEh;
    edStartTime: TDBDateTimeEditEh;
    dbmmoDesc: TDBMemoEh;
    DBEditEh2: TDBEditEh;
    edtDVBGENRES: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBEditEh6: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    btnCancel: TButton;
    btnSave: TButton;
    btnSaveAndNext: TButton;
    btnDeleteProgramm: TToolButton;
    actDeleteProgramm: TAction;
    mmEPG: TMainMenu;
    EPG1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    EPG2: TMenuItem;
    XMLTV1: TMenuItem;
    N5: TMenuItem;
    actUTCCurrent: TAction;
    actUTCAll: TAction;
    UTC1: TMenuItem;
    UTC2: TMenuItem;
    trWriteQ: TpFIBTransaction;
    actReloadEPG: TAction;
    btnReloadEPG: TToolButton;
    btn2: TToolButton;
    N6: TMenuItem;
    EPG3: TMenuItem;
    actGetEmptyEPG: TAction;
    btn1: TToolButton;
    btnGetEmptyEPG: TToolButton;
    PropStorageEh: TPropStorageEh;
    procedure FormShow(Sender: TObject);
    procedure dbgEPGGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actImportExecute(Sender: TObject);
    procedure actSaveEPGExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActADDProgrammExecute(Sender: TObject);
    procedure ActEDITProgrammExecute(Sender: TObject);
    procedure dbgEPGDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure edtDVBGENRESEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveAndNextClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dsEPGNewRecord(DataSet: TDataSet);
    procedure edStartDateChange(Sender: TObject);
    procedure actDeleteProgrammExecute(Sender: TObject);
    procedure actUTCCurrentExecute(Sender: TObject);
    procedure actUTCAllExecute(Sender: TObject);
    procedure actReloadEPGExecute(Sender: TObject);
    procedure actGetEmptyEPGExecute(Sender: TObject);
  private
    { Private declarations }
    FToUTCShift: Integer;
    procedure SaveXMLTV(const FileName: string);
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit;
    function SaveEpgEvent: Boolean;
    procedure ShiftUTCTime(const ch_id: Integer);
    function SetReloadFlag: Boolean;
  public
    { Public declarations }
  end;

var
  EPGViewForm: TEPGViewForm;

implementation

uses
  System.TimeSpan, System.DateUtils,
  StringListUnicodeSupport, Encoding, DM, EPGImport, MAIN, PrjConst, DVBGanresForma, AtrStrUtils, TextEditForma,
  TimeShiftForma;

{$R *.dfm}

procedure TEPGViewForm.ActADDProgrammExecute(Sender: TObject);
begin
  StartEdit(True);
  {
    if dsChennals.FieldByName('CH_ID').IsNull
    then
    Exit;

    if EditEPGEvent(dsChennals['CH_ID'], 0)
    then begin
    bm := dsEPG.GetBookmark;
    dsEPG.CloseOpen(True);
    dsEPG.GotoBookmark(bm);
    end;
  }
end;

procedure TEPGViewForm.ActEDITProgrammExecute(Sender: TObject);
begin
  if dsEPG.RecordCount = 0 then
    Exit;
  StartEdit(False);
  {
    if (dsEPG.FieldByName('CH_ID').IsNull or dsEPG.FieldByName('DATE_START').IsNull)
    then Exit;

    if EditEPGEvent(dsEPG['CH_ID'], dsEPG['DATE_START'])
    then dsEPG.Refresh;
  }
end;

procedure TEPGViewForm.actImportExecute(Sender: TObject);
begin
  with TEPGImportForm.Create(self) do
    try
      ShowModal;
      dsEPG.CloseOpen(True);
    finally
      Free;
    end;
end;

procedure TEPGViewForm.actSaveEPGExecute(Sender: TObject);
begin
  if not SaveDialog.Execute then
    Exit;
  SaveXMLTV(SaveDialog.FileName);
end;

procedure TEPGViewForm.SaveXMLTV(const FileName: string);
var
  XML: TStringList;
  UTF: TUTF8Encoding;
  dgList: TStringList;
  i, j: Integer;
  crsr: TCursor;
  S, l, strTimeZone: string;

  function XmlCorrect(const x: String): string;
  var
    o: string;
  begin
    o := StringReplace(x, '&', '&amp;', [rfReplaceAll]);
    o := StringReplace(o, '<', '&lt;', [rfReplaceAll]);
    o := StringReplace(o, '>', '&gt;', [rfReplaceAll]);
    o := StringReplace(o, '''', '&apos;', [rfReplaceAll]);
    o := StringReplace(o, '"', '&quot;', [rfReplaceAll]);
    Result := o;
  end;

  procedure addAtr(const atr: string; const fld: string; const lang: string);
  begin
    if Query.FN(fld).IsNull then
      Exit;
    if Query.FN(fld).AsString = '' then
      Exit;
    XML.Add('<' + atr + ' lang="' + lang + '">' + XmlCorrect(Query.FN(fld).AsString) + '</' + atr + '>');
  end;

begin
  crsr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  XML := TStringList.Create;
  UTF := TUTF8Encoding.Create;
  dgList := TStringList.Create;
  dgList.Delimiter := ',';

  i := TTimeZone.Local.UtcOffset.Hours;
  j := TTimeZone.Local.UtcOffset.Minutes;
  if i > 0 then
    strTimeZone := ' +' + leftPad(IntToStr(i), '0', 2)
  else
    strTimeZone := ' -' + leftPad(IntToStr(-1 * i), '0', 2);
  strTimeZone := strTimeZone + leftPad(IntToStr(j), '0', 2);

  try
    XML.Add('<?xml version="1.0" encoding="utf-8" ?>' + #13#10 +
      '<tv generator-info-name="A4on.TV.v1" generator-info-url="http://A4on.TV/">');
    Query.Transaction := trReadQ;
    Query.SQL.Text := 'select * from CHANNELS order by CH_NAME';
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    while not Query.eof do
    begin
      if not Query.FN('Ch_Number').IsNull then
        S := '<channel id="' + Query.FN('Ch_Number').AsString + '">' + #13#10
      else
        S := '<channel id="' + Query.FN('CH_ID').AsString + '">' + #13#10;

      if not Query.FN('LANG').IsNull then
      begin
        l := Query.FN('LANG').AsString;
        l := LangISO6391toISO6392TCode(l);
      end
      else
        l := 'ru';
      S := S + '  <display-name lang="' + l + '">';
      XML.Add(S + Query.FN('CH_NAME').AsString + '</display-name>' + #13#10 + '</channel>');
      Query.Next;
    end;
    Query.Transaction.Rollback;

    Query.SQL.Text := '';
    Query.SQL.Add('select E.Ch_Id, E.Date_Start, E.Date_Stop, E.Title, E.Description, E.Genres, E.Dvbgenres,');
    Query.SQL.Add('       E.Actors, E.Directed, E.Country, c.Ch_Number, c.Lang, E.Minage, E.Create_Year     ');
    // Query.SQL.Add('       , coalesce(lpad(datediff(HOUR, E.Utc_Start, e.Date_Start) ,2, ''0''),''00'') T_SHIFT');
    Query.SQL.Add('from EPG e inner join Channels c on (e.Ch_Id = c.Ch_Id) order by e.ch_id, e.date_start   ');
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    while not Query.eof do
    begin
      // ch_id, epg_date, title, Genres, date_start, date_stop, description, minage, create_year, actors, directed, country
      // нужно ли брать часовой пояс из БД ? S := '00 +' + Query.FN('T_SHIFT').AsString + '00';

      if not Query.FN('Ch_Number').IsNull then
        l := '" channel="' + Query.FN('Ch_Number').AsString + '">'
      else
        l := '" channel="' + Query.FN('CH_ID').AsString + '">';
      XML.Add('<programme start="' + FormatDateTime('yyyymmddhhnnss', Query.FN('date_start').AsDateTime) + strTimeZone +
        '"' + ' stop="' + FormatDateTime('yyyymmddhhnnss', Query.FN('date_stop').AsDateTime) + strTimeZone + l);

      if not Query.FN('LANG').IsNull then
      begin
        l := Query.FN('LANG').AsString;
        l := LangISO6391toISO6392TCode(l);
      end
      else
        l := 'ru';

      addAtr('title', 'title', l);
      addAtr('desc', 'description', l);
      addAtr('category', 'GENRES', l);
      if not Query.FN('dvbgenres').IsNull then
      begin
        dgList.Clear;
        dgList.CommaText := Query.FN('dvbgenres').AsString;
        for i := 0 to dgList.Count - 1 do
        begin
          if TryStrToInt(dgList[i], j) then
            XML.Add('<dvbgenre>0x' + IntToHex(j, 2) + '</dvbgenre>');
        end;
      end;
      if (not Query.FN('minage').IsNull) and (Query.FN('minage').AsString <> '') and (Query.FN('minage').AsString <> '0')
      then
      begin
        XML.Add('<rating system="RU"><value>' + Query.FN('minage').AsString + '+</value></rating>');
        XML.Add('<parentalRating>' + Query.FN('minage').AsString + '+</parentalRating>');
      end;
      XML.Add('</programme>');

      Query.Next;
    end;
    Query.Transaction.Rollback;

    XML.Add('</tv>');
    XML.SaveToFile(FileName, UTF);
  finally
    FreeAndNil(XML);
    FreeAndNil(dgList);
    FreeAndNil(UTF);
    Screen.Cursor := crsr;
  end;
end;

procedure TEPGViewForm.dbgEPGDblClick(Sender: TObject);
begin
  if not ActEDITProgramm.Enabled then
    Exit;

  if not dsEPG.FieldByName('DATE_START').IsNull then
    ActEDITProgramm.Execute
  else
    ActADDProgramm.Execute;
end;

procedure TEPGViewForm.dbgEPGGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  curTime: TDateTime;
begin
  if dsEPG.FieldByName('DATE_START').IsNull or dsEPG.FieldByName('DATE_STOP').IsNull then
    Exit;
  curTime := Now();
  if dsEPG.FieldByName('DATE_STOP').AsDateTime < curTime then
    AFont.Color := clGrayText
  else
  begin
    if (dsEPG.FieldByName('DATE_START').AsDateTime < curTime) and (dsEPG.FieldByName('DATE_STOP').AsDateTime > curTime)
    then
      AFont.Color := clRed;
  end;
end;

procedure TEPGViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgEPG.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'EPGGrid', False);
  dbgChannels.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'EPGChGrid', False);
  dsEPG.Close;
  dsChennals.Close;
  Action := caFree;
  EPGViewForm := nil;
end;

procedure TEPGViewForm.FormCreate(Sender: TObject);
begin
  dbgChannels.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'EPGChGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);
  dbgEPG.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'EPGGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);

  FToUTCShift := -1 * (TTimeZone.Local.UtcOffset.Hours * 60 + TTimeZone.Local.UtcOffset.Minutes);
end;

procedure TEPGViewForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  dsChennals.CloseOpen(True);
  dsEPG.Open;

  ActADDProgramm.Enabled := dmMain.AllowedAction(rght_EPG_EditEvent);
  actDeleteProgramm.Enabled := dmMain.AllowedAction(rght_EPG_EditEvent);
  ActEDITProgramm.Enabled := ActADDProgramm.Enabled;
  actImport.Enabled := ActADDProgramm.Enabled;
  actSaveEPG.Enabled := ActADDProgramm.Enabled;
  actUTCCurrent.Enabled := dmMain.AllowedAction(rght_EPG_EditEvent);
  actUTCAll.Enabled := dmMain.AllowedAction(rght_EPG_EditEvent);
  tlbActions.Visible := ActADDProgramm.Enabled;
end;

procedure TEPGViewForm.chk1Click(Sender: TObject);
var
  S: string;
begin
  // extract(weekday from e.Date_Start) in (0,1,2,3,4,5,6)
  dsEPG.Close;
  if chk0.Checked and chk1.Checked and chk2.Checked and chk3.Checked and chk4.Checked and chk5.Checked and chk6.Checked
  then
    dsEPG.ParamByName('param_weekday').SetDefMacroValue
  else
  begin
    S := '(';
    if chk0.Checked then
      S := S + '0,';
    if chk1.Checked then
      S := S + '1,';
    if chk2.Checked then
      S := S + '2,';
    if chk3.Checked then
      S := S + '3,';
    if chk4.Checked then
      S := S + '4,';
    if chk5.Checked then
      S := S + '5,';
    if chk6.Checked then
      S := S + '6';
    if S[Length(S)] = ',' then
      S := Copy(S, 1, Length(S) - 1);
    S := S + ')';
    if S <> '()' then
      dsEPG.ParamByName('param_weekday').Value := 'extract(weekday from e.Date_Start) in ' + S
    else
      dsEPG.ParamByName('param_weekday').Value := 'extract(weekday from e.Date_Start) = 8';
  end;

  dsEPG.Open;
end;

procedure TEPGViewForm.edtDVBGENRESEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edtDVBGENRES.Text := SelectDVBGanres(edtDVBGENRES.Text);
  Handled := True;
end;

procedure TEPGViewForm.StartEdit(const New: Boolean = False);
begin
  if dsChennals.RecordCount = 0 then
    Exit;

  pnlEditEvent.Visible := True;
  pnlEvents.Enabled := False;
  pnlChannels.Enabled := False;
  if (New) or (dsEPG.RecordCount = 0) then
    dsEPG.Append
  else
    dsEPG.Edit;
  edtTITLE.SetFocus;
end;

procedure TEPGViewForm.StopEdit;
begin
  pnlEditEvent.Visible := False;
  pnlEvents.Enabled := True;
  pnlChannels.Enabled := True;
end;

procedure TEPGViewForm.btnSaveClick(Sender: TObject);
begin
  if dsEPG.State in [dsInsert, dsEdit] then
    if SaveEpgEvent then
      StopEdit;
end;

procedure TEPGViewForm.btnCancelClick(Sender: TObject);
begin
  if dsEPG.State in [dsInsert, dsEdit] then
    dsEPG.Cancel;
  StopEdit;
end;

procedure TEPGViewForm.btnSaveAndNextClick(Sender: TObject);
var
  ed: TDateTime;
begin
  if dsEPG.State in [dsInsert, dsEdit] then
    if SaveEpgEvent then
    begin
      ed := dsEPG['DATE_STOP'];
      dsEPG.Next;
      if not dsEPG.eof then
        dsEPG.Edit
      else
        dsEPG.Append;

      dsEPG['DATE_START'] := ed;
      edtTITLE.SetFocus;
    end;
end;

procedure TEPGViewForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin

  if pnlEditEvent.Visible then
  begin
    if (Key = #13) then
    begin
      go := True;
      if (ActiveControl is TDBGridEh) then
        go := False;
      if go then
      begin
        Key := #0; // eat enter key
        PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    end;
  end;
end;

procedure TEPGViewForm.dsEPGNewRecord(DataSet: TDataSet);
begin
  dsEPG['CH_ID'] := dsChennals['CH_ID'];
end;

procedure TEPGViewForm.edStartDateChange(Sender: TObject);
begin
  if not pnlEditEvent.Visible then
    Exit;

  if dsEPG.State = dsInsert then
  begin
    if VarIsNullEh(edStopDate.Value) then
      edStopDate.Value := edStartDate.Value;
  end;
end;

function TEPGViewForm.SaveEpgEvent: Boolean;
begin
  Result := False;
  if dsEPG.State in [dsInsert, dsEdit] then
  begin
    if dsEPG.FieldByName('DATE_START').IsNull then
    begin
      edStartDate.SetFocus;
      Exit;
    end;

    if dsEPG.FieldByName('DATE_STOP').IsNull then
    begin
      edStopDate.SetFocus;
      Exit;
    end;

    dsEPG['UTC_START'] := IncMinute(dsEPG['DATE_START'], FToUTCShift);
    dsEPG['UTC_STOP'] := IncMinute(dsEPG['DATE_STOP'], FToUTCShift);
    dsEPG['EPG_DATE'] := dsEPG['DATE_START'];
    dsEPG['UTC_DATE'] := dsEPG['UTC_START'];
    dsEPG.Post;
    Result := True;
  end;
end;

procedure TEPGViewForm.actDeleteProgrammExecute(Sender: TObject);
var
  title: string;

begin
  if dsEPG.RecordCount = 0 then
    Exit;

  title := '';
  if (not dsEPG.FieldByName('TITLE').IsNull) then
    title := dsEPG['TITLE'];

  if Application.MessageBox(PChar(Format(rsDeleteRecord, [title])), PWideChar(rsDeleteProgram),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    dsEPG.Delete;
end;

procedure TEPGViewForm.actUTCCurrentExecute(Sender: TObject);
begin
  if dsChennals.FieldByName('ch_id').IsNull then
    Exit;
  ShiftUTCTime(dsChennals['ch_id']);
end;

procedure TEPGViewForm.actUTCAllExecute(Sender: TObject);
begin
  ShiftUTCTime(-1);
end;

procedure TEPGViewForm.ShiftUTCTime(const ch_id: Integer);
var
  crsr: TCursor;
begin
  with TTimeShiftForm.Create(Application) do
  begin
    try
      if ch_id > 0 then
        Caption := Caption + ' ' + dsChennals['CH_NAME']
      else
        Caption := Caption + ' всех каналов';
      if ShowModal = mrOk then
      begin
        if (ednMinutes.Text <> '') and (ednMinutes.Value <> 0) then
        begin
          crsr := Screen.Cursor;
          Screen.Cursor := crSQLWait;
          Query.Transaction := trWriteQ;
          Query.SQL.Clear;
          Query.SQL.Add('execute block (mns D_INTEGER = :mins) as begin');
          Query.SQL.Add('update Epg set');
          if chkUTC.Checked then
            Query.SQL.Add('Utc_Start = dateadd(minute, :mns, Utc_Start), Utc_Stop = dateadd(minute, :mns, Utc_Stop)');
          if chkUTC.Checked and chkLocal.Checked then
            Query.SQL.Add(',');
          if chkLocal.Checked then
            Query.SQL.Add
              ('Epg_Date = dateadd(minute, :mns, Epg_Date), Date_Start = dateadd(minute, :mns, Date_Start), Date_Stop = dateadd(minute, :mns, Date_Stop)');
          if ch_id > 0 then
            Query.SQL.Add('where Ch_Id = ' + ch_id.ToString);
          Query.SQL.Add(';');
          if chkUpdateDVB.Checked then
            Query.SQL.Add('update Dvb_Streams set EPG_UPDATED = CURRENT_TIMESTAMP;');
          Query.SQL.Add('end');
          Query.ParamByName('mins').AsInteger := ednMinutes.Value;
          Query.Transaction.StartTransaction;
          Query.ExecQuery;
          Query.Transaction.Commit;
          dsEPG.CloseOpen(True);
          Screen.Cursor := crsr;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TEPGViewForm.actReloadEPGExecute(Sender: TObject);
begin
  SetReloadFlag;
end;

function TEPGViewForm.SetReloadFlag: Boolean;
var
  crsr: TCursor;
begin
  crsr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    Query.Transaction := trWriteQ;
    Query.SQL.Text := 'update Dvb_Streams set EPG_UPDATED = CURRENT_TIMESTAMP';
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    Query.Transaction.Commit;
    Result := True;
  except
    Result := False;
  end;
  Screen.Cursor := crsr;
end;

procedure TEPGViewForm.actGetEmptyEPGExecute(Sender: TObject);
var
  cList: TStringList;
begin
  cList := TStringList.Create;
  try
    Query.Transaction := trWriteQ;
    Query.SQL.Clear;
    Query.SQL.Add('Select c.Ch_Name from Channels c ');
    Query.SQL.Add
      ('where not exists(select * from epg e where e.Ch_Id = c.Ch_Id and CURRENT_TIMESTAMP between e.Date_Start and e.Date_Stop)');
    Query.SQL.Add('order by 1');
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    while not Query.eof do
    begin
      cList.Add(Query.FN('Ch_Name').AsString);
      Query.Next;
    end;
    Query.Transaction.Commit;
    EditText(cList, 'Список каналов без EPG');
  finally
    cList.Free;
  end;
end;

end.
