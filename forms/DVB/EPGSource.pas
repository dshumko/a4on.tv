unit EPGSource;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Menus, Vcl.ComCtrls,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, ToolCtrlsEh, DBGridEhToolCtrls, MemTableDataEh, MemTableEh,
  GridsEh,
  DBAxisGridsEh, DBGridEh, EhLibMTE, DBCtrlsEh, FIBQuery, pFIBQuery, OXmlReadWrite, OXmlUtils, OXmlPDOM, OTextReadWrite,
  PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, httpsend, synacode, blcksock, ftpsend, synsock, amSplitter;

type
  TEPGSourceForm = class(TForm)
    pnlBottom: TPanel;
    pnlHead: TPanel;
    Button1: TButton;
    btnSave: TButton;
    edName: TDBEditEh;
    cbType: TDBComboBoxEh;
    Label2: TLabel;
    Label3: TLabel;
    dsChennals: TpFIBDataSet;
    trRead: TpFIBTransaction;
    srcChennals: TDataSource;
    srcMAPChennals: TDataSource;
    dsMAPChennals: TMemTableEh;
    dsMAPChennalsATR_NAME: TStringField;
    dsSource: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    srcSource: TDataSource;
    edNotice: TDBEditEh;
    Query: TpFIBQuery;
    OpenDialog: TOpenDialog;
    btnDel: TButton;
    pnlChennals: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    pnlGenre: TPanel;
    DBGridEh2: TDBGridEh;
    Label8: TLabel;
    Splitter1: TSplitter;
    dsGenre: TpFIBDataSet;
    srcGenre: TDataSource;
    dsMAPGenre: TMemTableEh;
    srcMAPGenre: TDataSource;
    pmGrid: TPopupMenu;
    miClear: TMenuItem;
    pb: TProgressBar;
    Label6: TLabel;
    pnlSettings: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtURL: TDBEditEh;
    edtLOGIN: TDBEditEh;
    edtPASSWORD: TDBEditEh;
    edTimeShift: TDBNumberEditEh;
    cbIgnoreTimeZone: TDBCheckBoxEh;
    edtXMLFile: TDBEditEh;
    btnLoad: TButton;
    chkHand: TDBCheckBoxEh;
    trWriteQ: TpFIBTransaction;
    dsMAPChennalsID: TWideStringField;
    dsMAPChennalsNAME: TWideStringField;
    dsMAPChennalsICON: TWideStringField;
    dsMAPChennalsATR_ID: TIntegerField;
    dsMAPGenreXML_NAME: TWideStringField;
    dsMAPGenreCAT_ID: TIntegerField;
    dsChFromSRC: TMemTableEh;
    srcChFromSrc: TDataSource;
    smlntfldMAPChennalsSM: TSmallintField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnLoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure miClearClick(Sender: TObject);
    procedure dsSourceNewRecord(DataSet: TDataSet);
    procedure cbTypeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fSourceId: Integer;
    procedure SetSource(const Value: Integer);
    function SaveSource: Boolean;
    function SaveChennalsMap: Boolean;
    function SaveGenreMap: Boolean;
    procedure LoadChennalsMap;
    procedure LoadGenreMap;
    procedure Load_A4onTV_map;
    procedure Load_xmltv_map;
    procedure Load_xml_TimeTable;
    procedure loadGenreFromSource(const xXml: OXmlPDOM.IXMLDocument);
    procedure DataSetStart;
    procedure DataSetFinish;
    procedure TrySetMap;
  private
    FDownload: Integer;
    fTmpFilename: String;
    procedure Status(Sender: TObject; Reason: THookSocketReason; const Value: String);
    function DownloadFile: Boolean;
    function DownloadHTTP: Boolean;
    function DownloadFTP: Boolean;
    procedure OnHeartBeat(Sender: TObject);
    procedure OnMonitor(Sender: TObject; Writing: Boolean; const Buffer: TMemory; Len: Integer);
    procedure LoadMapFromDB;
    procedure LoadGenreMapFromDB;
    function GetFileFormat(const aFileName: String): string;
  public
    property SourceId: Integer read fSourceId write SetSource default -1;
  end;

var
  EPGSourceForm: TEPGSourceForm;

implementation

uses
{$IFNDEF VER300}
  EConsts, ETypes, EClasses, EHash, ESysInfo, ESend, ESendAPIMantis,
{$ENDIF}
  DM, AtrCommon, JsonDataObjects, sevenzip;

{$R *.dfm}

procedure TEPGSourceForm.LoadGenreMap;
begin
  if not pnlGenre.Visible then
    Exit;

  dsMAPGenre.DisableControls;
  dsMAPGenre.First;
  Query.SQL.Text := 'select Genre_ID, SOURCE_GENRE from EPG_MAPPING_Genre m where m.epg_id = :sid';
  Query.ParamByName('SID').AsInteger := fSourceId;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  while not Query.Eof do
  begin
    if dsMAPGenre.Locate('XML_NAME', Query.FN('SOURCE_GENRE').AsString, [loCaseInsensitive]) then
    begin
      dsMAPGenre.Edit;
      dsMAPGenre['CAT_ID'] := Query.FN('Genre_ID').AsInteger;
      dsMAPGenre.Post;
    end;
    Query.Next;
  end;
  Query.Transaction.Rollback;
  dsMAPGenre.First;
  dsMAPGenre.EnableControls;
end;

procedure TEPGSourceForm.TrySetMap;
begin
  if fSourceId <> -1 then
    Exit;

  if not dsChennals.Active then
    dsChennals.Open;
  dsChennals.DisableControls;
  dsMAPChennals.DisableControls;
  dsMAPChennals.First;
  while not dsMAPChennals.Eof do
  begin
    if (dsMAPChennals.FieldByName('ATR_ID').IsNull) and
      (dsChennals.Locate('ch_name', dsMAPChennals['NAME'], [loCaseInsensitive])) then
    begin
      dsMAPChennals.Edit;
      dsMAPChennals['ATR_ID'] := dsChennals['CH_ID'];
      dsMAPChennals['ATR_NAME'] := dsChennals['CH_NAME'];
      dsMAPChennals.Post;
    end;
    dsMAPChennals.Next;
  end;
  dsMAPChennals.First;
  dsMAPChennals.EnableControls;
  dsChennals.EnableControls;
end;

procedure TEPGSourceForm.LoadChennalsMap;
begin
  dsMAPChennals.DisableControls;
  dsMAPChennals.First;
  Query.SQL.Text := 'Select m.ch_id, m.epg_code, m.SHIFT_M from EPG_MAPPING m where m.epg_id = :sid';
  Query.ParamByName('SID').AsInteger := fSourceId;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  while not Query.Eof do
  begin
    if (dsMAPChennals.FieldByName('ATR_ID').IsNull) and
      (dsMAPChennals.Locate('ID', Query.FN('epg_code').AsString, [loCaseInsensitive])) then
    begin
      dsMAPChennals.Edit;
      dsMAPChennals['ATR_ID'] := Query.FN('ch_id').AsInteger;
      if not Query.FN('SHIFT_M').IsNull then
        dsMAPChennals['SM'] := Query.FN('SHIFT_M').AsInteger;
      dsMAPChennals.Post;
    end;
    Query.Next;
  end;
  Query.Transaction.Rollback;
  dsMAPChennals.First;
  dsMAPChennals.EnableControls;
end;

procedure TEPGSourceForm.SetSource(const Value: Integer);
begin
  fSourceId := Value;
  dsSource.Close;
  dsSource.ParamByName('sid').AsInteger := fSourceId;
  dsSource.Open;
  btnDel.Visible := (fSourceId > 0);
  if fSourceId = -1 then
    dsSource.Insert
  else
  begin
    LoadMapFromDB;
    if dsSource['PARSEAS'] <> 1 then
      LoadGenreMapFromDB;
  end;
end;

function TEPGSourceForm.SaveSource: Boolean;
begin
  if edName.Text = '' then
  begin
    edName.SetFocus;
    Result := False;
    Exit;
  end;

  if (dsSource.State in [dsEdit, dsInsert]) then
  begin
    if fSourceId = -1 then
      fSourceId := dsSource.Database.Gen_Id('GEN_EPG', 1);
    dsSource['ID'] := fSourceId;
    dsSource.Post;
  end;
  SaveGenreMap;
  Result := SaveChennalsMap;
end;

function TEPGSourceForm.SaveChennalsMap: Boolean;
var
  id: string;

  function FindID(const n: String): String;
  var
    bm: TBookmark;
  begin
    Result := '';
    bm := dsMAPChennals.GetBookmark;
    dsMAPChennals.First;
    while not dsMAPChennals.Eof do
    begin
      if (not dsMAPChennals.FieldByName('ID').IsNull) and (not dsMAPChennals.FieldByName('NAME').IsNull) then
        if UpperCase(dsMAPChennals['NAME']) = UpperCase(n) then
          Result := dsMAPChennals['NAME'];
      dsMAPChennals.Next;
    end;
    dsMAPChennals.GotoBookmark(bm);
  end;

begin
  if not dsMAPChennals.Active then
  begin
    Result := True;
    Exit;
  end;

  if dsMAPChennals.State in [dsEdit] then
    dsMAPChennals.Post;

  if dsMAPChennals.Filtered then
    dsMAPChennals.Filtered := False;

  Query.SQL.Text := 'delete from EPG_MAPPING where epg_id = :sid';
  Query.ParamByName('SID').AsInteger := fSourceId;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;

  if dsMAPChennals.RecordCount = 0 then
  begin
    Result := True;
    Exit;
  end;

  dsMAPChennals.DisableControls;
  dsMAPChennals.First;
  while not dsMAPChennals.Eof do
  begin
    if (dsMAPChennals.FieldByName('ID').IsNull) and (not dsMAPChennals.FieldByName('NAME').IsNull) then
    begin
      id := FindID(dsMAPChennals['NAME']);
      if not id.IsEmpty then
      begin
        dsMAPChennals.Edit;
        dsMAPChennals['ID'] := id;
        dsMAPChennals.Post;
      end;
    end;
    dsMAPChennals.Next;
  end;

  Query.SQL.Clear;
  Query.SQL.Add('UPDATE OR INSERT into EPG_MAPPING (EPG_ID, CH_ID, EPG_CODE, SHIFT_M) ');
  Query.SQL.Add('values (:EPG_ID, :CH_ID, :EPG_CODE, :SHIFT_M) MATCHING (EPG_ID, CH_ID) ');
  Query.Transaction.StartTransaction;
  dsMAPChennals.First;
  while not dsMAPChennals.Eof do
  begin
    if (not dsMAPChennals.FieldByName('ATR_ID').IsNull) and (not dsMAPChennals.FieldByName('ID').IsNull) then
    begin
      Query.ParamByName('EPG_ID').AsInteger := fSourceId;
      Query.ParamByName('CH_ID').AsInteger := dsMAPChennals['ATR_ID'];
      Query.ParamByName('EPG_CODE').AsString := dsMAPChennals['ID'];
      if not dsMAPChennals.FieldByName('SM').IsNull then
        Query.ParamByName('SHIFT_M').AsInteger := dsMAPChennals['SM']
      else
        Query.ParamByName('SHIFT_M').Clear;

      Query.ExecQuery;
    end;
    dsMAPChennals.Next;
  end;
  Query.Transaction.Commit;
  dsMAPChennals.First;
  dsMAPChennals.EnableControls;
  Result := True;
end;

function TEPGSourceForm.SaveGenreMap: Boolean;
begin
  Result := True;

  if dsMAPGenre.Filtered then
    dsMAPGenre.Filtered := False;

  Query.SQL.Text := 'delete from EPG_MAPPING_Genre where epg_id = :sid';
  Query.ParamByName('SID').AsInteger := fSourceId;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;

  if not dsMAPGenre.Active then
    Exit;

  if dsMAPGenre.State in [dsEdit] then
    dsMAPGenre.Post;

  if dsMAPGenre.RecordCount = 0 then
    Exit;

  if not dsMAPChennals.Active then
    Exit;

  if dsMAPChennals.RecordCount = 0 then
    Exit;

  if not dsMAPGenre.Active then
    Exit;

  dsMAPGenre.DisableControls;
  dsMAPGenre.First;
  Query.SQL.Clear;
  Query.SQL.Add
    ('UPDATE OR INSERT into EPG_MAPPING_Genre (EPG_ID, Genre_ID, SOURCE_GENRE) values (:EPG_ID, :Genre_ID, :SOURCE_GENRE) MATCHING (EPG_ID, Genre_ID)');
  Query.Transaction.StartTransaction;
  while not dsMAPGenre.Eof do
  begin
    if not dsMAPGenre.FieldByName('CAT_ID').IsNull then
    begin
      Query.ParamByName('EPG_ID').AsInteger := fSourceId;
      Query.ParamByName('Genre_ID').AsInteger := dsMAPGenre['CAT_ID'];
      Query.ParamByName('SOURCE_GENRE').AsString := dsMAPGenre['XML_NAME'];
      Query.ExecQuery;
    end;
    dsMAPGenre.Next;
  end;
  Query.Transaction.Commit;
  dsMAPGenre.First;
  dsMAPGenre.EnableControls;
  Result := True;
end;

procedure TEPGSourceForm.loadGenreFromSource(const xXml: OXmlPDOM.IXMLDocument);
var
  s: string;
  i: Integer;
  Clist: TStringList;
  nl: OXmlPDOM.IXMLNodeList;
begin
  Clist := TStringList.Create;
  Clist.Duplicates := dupIgnore;
  try
    if dsMAPGenre.Active then
    begin
      dsMAPGenre.DisableControls;
      dsMAPGenre.First;
      while not dsMAPGenre.Eof do
      begin
        Clist.Add(dsMAPGenre['XML_NAME']);
        dsMAPGenre.Next;
      end;
    end
    else
    begin
      dsMAPGenre.Open;
      dsMAPGenre.DisableControls;
    end;
    nl := xXml.DocumentElement.SelectNodes('//programme/category');
    if nl <> nil then
    begin
      for i := 0 to nl.Count - 1 do
      begin
        s := nl.Nodes[i].Text;
        if Clist.IndexOf(s) = -1 then
        begin
          Clist.Add(s);
          dsMAPGenre.Append;
          dsMAPGenre['XML_NAME'] := s;
          dsMAPGenre.Post;
        end;
      end;
    end;
    dsMAPGenre.SortOrder := 'XML_NAME';
    dsMAPGenre.First;
    dsMAPGenre.EnableControls;
  finally
    Clist.Free;
  end;
end;

procedure TEPGSourceForm.DataSetStart;
begin
  dsMAPChennals.DisableControls;
  if fSourceId = -1 then
  begin
    if dsMAPChennals.Active then
      dsMAPChennals.Close;
    dsMAPChennals.Open;
    dsMAPChennals.EmptyTable;
  end;

  if dsChFromSRC.Active then
    dsChFromSRC.Close;
  dsChFromSRC.DisableControls;
  dsChFromSRC.Open;
  dsChFromSRC.EmptyTable;
end;

procedure TEPGSourceForm.DataSetFinish;
begin
  dsMAPChennals.First;
  dsMAPChennals.EnableControls;
  dsChFromSRC.First;
  dsChFromSRC.EnableControls;
end;

procedure TEPGSourceForm.Load_xml_TimeTable;
var
  j: Integer;
  s: string;
  xXml: OXmlPDOM.IXMLDocument;
  nl: OXmlPDOM.IXMLNodeList;
  c: PXMLNode;
  loaded: Boolean;
begin
  if not FileExists(fTmpFilename) then
    Exit;

  xXml := OXmlPDOM.CreateXMLDoc;
  xXml.WhiteSpaceHandling := wsPreserveAll;
  xXml.ReaderSettings.ErrorHandling := ehSilent;
  loaded := True;
  if not xXml.LoadFromFile(fTmpFilename) then
  begin
    s := 'Error open XMLTV file' + #13#10 + Format('Error code: %d', [xXml.ParseError.ErrorCode]) + #13#10 +
      Format('FilePos: %d', [xXml.ParseError.FilePos]) + #13#10 + Format('Line: %d', [xXml.ParseError.Line]) + #13#10 +
      Format('LinePos: %d', [xXml.ParseError.LinePos]) + #13#10 + Format('Reason: %s', [xXml.ParseError.Reason]) +
      #13#10 + Format('URL: %s', [xXml.ParseError.URL]) + #13#10 + Format('SrcText: %s', [xXml.ParseError.SrcText]);
    loaded := False;
    xXml := nil;
    ShowMessage(s);
  end;

  if not loaded then
    Exit;

  DataSetStart;

  c := xXml.DocumentElement;
  nl := c.SelectNodes('//TimeTable');
  if nl <> nil then
  begin
    for j := 0 to nl.Count - 1 do
    begin
      dsMAPChennals.Append;
      s := nl.Nodes[j].Attributes['Name'];
      dsMAPChennals['ID'] := s;
      dsMAPChennals['NAME'] := s;
      dsMAPChennals.Post;
      dsChFromSRC.Append;
      dsChFromSRC['ID'] := s;
      dsChFromSRC['NAME'] := s;
      dsChFromSRC.Post;
    end;
  end;
  DataSetFinish;

  // loadGenreFromSource(xXml);

  if fSourceId <> -1 then
  begin
    LoadChennalsMap;
    // LoadGenreMap;
  end;
  xXml := nil;
end;

procedure TEPGSourceForm.miClearClick(Sender: TObject);
begin
  if not dsMAPChennals.Active then
    Exit;
  if dsMAPChennals.RecordCount = 0 then
    Exit;
  dsMAPChennals.Edit;
  dsMAPChennals.FieldByName('ATR_ID').Clear;
  dsMAPChennals.FieldByName('ATR_NAME').Clear;
  dsMAPChennals.Post;
end;

procedure TEPGSourceForm.Load_A4onTV_map;
var
  i: Integer;
  jsonName, s: string;
  B: TJsonBaseObject;
  O, c: TJsonObject;
begin
  jsonName := GetTempDir + 'tv.json';
  // dmMain.LoadWeekFromA4onTV(jsonName);
  dmMain.LoadChannelsFromA4onTV(jsonName);

  if not FileExists(jsonName) then
    Exit;

  DataSetStart;

  try
    B := TJsonBaseObject.ParseFromFile(jsonName);
    try
      if B <> nil then
      begin
        O := B as TJsonObject;
        if O.Contains('schedule') then
        begin
          for i := 0 to O.A['schedule'].Count - 1 do
          begin
            c := O.A['schedule'][i];
            s := c.s['channel'];
            dsChFromSRC.Append;
            dsChFromSRC['ID'] := c.s['channel'];
            dsChFromSRC['NAME'] := c.s['channel'];
            dsChFromSRC.Post;
            // если новый источник то уже загружена ассоцация
            if (fSourceId = -1) or (not dsMAPChennals.Locate('ID', s, [loCaseInsensitive])) then
            begin
              dsMAPChennals.Append;
              dsMAPChennals['ID'] := s;
              dsMAPChennals['NAME'] := s;
              dsMAPChennals.Post;
            end;
          end;
        end;
      end;
    finally
      B.Free;
    end;
  finally
    if System.SysUtils.FileExists(jsonName) then
      System.SysUtils.DeleteFile(jsonName);
  end;

  DataSetFinish;

  // loadGenreFromSource(xXml);

  if fSourceId <> -1 then
  begin
    // Удалим из ассоциации удаленные файлы
    while not dsMAPChennals.Eof do
    begin
      if (not dsChFromSRC.Locate('ID', dsMAPChennals['ID'], [loCaseInsensitive])) then
        dsMAPChennals.Delete
      else
        dsMAPChennals.Next;
    end;
    // постороми ассоциацию
    LoadChennalsMap;
  end
  else
  begin
    // постороми ассоциацию
    TrySetMap;
  end;
end;

procedure TEPGSourceForm.Load_xmltv_map;
var
  j: Integer;
  s: string;
  xXml: OXmlPDOM.IXMLDocument;
  nl: OXmlPDOM.IXMLNodeList;
  c: PXMLNode;
begin
  if not FileExists(fTmpFilename) then
    Exit;

  xXml := OXmlPDOM.CreateXMLDoc;
  xXml.WhiteSpaceHandling := wsPreserveAll;
  xXml.ReaderSettings.ErrorHandling := ehSilent;
  xXml.LoadFromFile(fTmpFilename);
  if xXml.DocumentElement = nil then
  begin
    ShowMessage(rsXMLTVFormatError);
    xXml := nil;
    Exit;
  end;

  DataSetStart;

  c := xXml.DocumentElement;

  nl := c.SelectNodes('//channel');
  if (nl <> nil) then
  begin
    for j := 0 to nl.Count - 1 do
    begin
      dsMAPChennals.Append;
      dsChFromSRC.Append;
      s := nl.Nodes[j].Attributes['id'];
      dsMAPChennals['ID'] := s;
      dsChFromSRC['ID'] := s;
      c := nl.Nodes[j].SelectNode('display-name');
      s := c.Text;
      dsMAPChennals['NAME'] := s;
      dsChFromSRC['NAME'] := s;
      dsMAPChennals.Post;
      dsChFromSRC.Post;
    end;
  end;
  DataSetFinish;

  loadGenreFromSource(xXml);

  if fSourceId <> -1 then
  begin
    LoadChennalsMap;
    LoadGenreMap;
  end
  else
  begin
    TrySetMap;
  end;
  xXml := nil;
end;

procedure TEPGSourceForm.btnDelClick(Sender: TObject);
begin
  if Application.MessageBox(PWideChar(rsDeleteProfile), 'Caption', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    if dsSource.State in [dsEdit, dsInsert] then
      dsSource.Cancel;
    Query.SQL.Text := 'delete from EPG_MAPPING where epg_id = :sid';
    Query.ParamByName('SID').AsInteger := fSourceId;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    Query.Transaction.Commit;

    Query.SQL.Text := 'DELETE FROM EPG_SOURCES WHERE ID = :sid';
    Query.ParamByName('SID').AsInteger := fSourceId;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    Query.Transaction.Commit;
  end;

end;

procedure TEPGSourceForm.btnSaveClick(Sender: TObject);
begin
  if SaveSource then
    ModalResult := mrOk;
end;

procedure TEPGSourceForm.btnLoadClick(Sender: TObject);
var
  cr: TCursor;
  canOpen: Boolean;
begin
  canOpen := False;
  if cbType.Text = '' then
  begin
    cbType.SetFocus;
    cbType.DropDown;
    Exit;
  end;

  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  if cbType.Value = 1 then
  begin
    Load_A4onTV_map;
  end
  else
  begin
    if not FileExists(edtXMLFile.Text) then
    begin
      if edtURL.Text <> '' then
        if MessageDlg(rsDownloadFile, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          fTmpFilename := GetTempDir + GetFileNameFromURL(edtURL.Text);
          canOpen := DownloadFile();
        end
    end;

    if not canOpen then
    begin
      if edtXMLFile.Text <> '' then
        OpenDialog.FileName := edtXMLFile.Text;

      if OpenDialog.Execute then
      begin
        fTmpFilename := OpenDialog.FileName;
        if edtURL.Text.IsEmpty then
          edtXMLFile.Text := fTmpFilename;
        canOpen := True;
      end;
    end;

    if canOpen then
    begin
      try
        fTmpFilename := GetFileFormat(fTmpFilename);
        case cbType.Value of
          0:
            Load_xmltv_map;
          2:
            Load_xml_TimeTable;
        end;
      finally
      end;
    end;
  end;

  Screen.Cursor := cr;
end;

procedure TEPGSourceForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if dsChFromSRC.Active then
    dsChFromSRC.Close;
  if dsMAPChennals.Active then
    dsMAPChennals.Close;
  if dsMAPGenre.Active then
    dsMAPGenre.Close;
  if dsGenre.Active then
    dsGenre.Close;
  if dsSource.Active then
    dsSource.Close;
  if dsChennals.Active then
    dsChennals.Close;
end;

procedure TEPGSourceForm.FormCreate(Sender: TObject);
begin
  fSourceId := -1;
end;

procedure TEPGSourceForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TEPGSourceForm.FormShow(Sender: TObject);
begin
  dsChennals.Open;
  dsSource.Open;
  dsGenre.Open;
end;

function TEPGSourceForm.DownloadHTTP: Boolean;
var
  HTTPClient: THTTPSend;
  strStream: TStringStream;
  s: String;
  i: Integer;
  Size: Integer;
  ch: char;
begin
  Size := 1;
  Result := False;
  HTTPClient := THTTPSend.Create;
  HTTPClient.Sock.OnStatus := Status;
  strStream := TStringStream.Create;
  pb.Visible := True;
  try
    pb.Position := 0;
    pb.Max := 0;
    if ((edtLOGIN.Text <> '') and (edtPASSWORD.Text <> '')) then
    begin
      s := edtLOGIN.Text + ':' + edtPASSWORD.Text;
      s := string(EncodeBase64(AnsiString(s)));
      HTTPClient.Headers.Add('Authorization: Basic ' + s);
    end;
    if HTTPClient.HTTPMethod('HEAD', edtURL.Text) then
    begin
      for i := 0 to HTTPClient.Headers.Count - 1 do
      begin
        if pos('content-length', lowercase(HTTPClient.Headers[i])) > 0 then
        begin
          s := '';
          for ch in HTTPClient.Headers[i] do
            if CharInSet(ch, ['0' .. '9']) then
              s := s + ch;
          Size := StrToIntDef(s, -1) + Length(HTTPClient.Headers.Text);
          break;
        end;
      end;
    end;
    pb.Max := Size;
    HTTPClient.Headers.Clear;
    HTTPClient.Clear;
    if ((edtLOGIN.Text <> '') and (edtPASSWORD.Text <> '')) then
    begin
      s := edtLOGIN.Text + ':' + edtPASSWORD.Text;
      s := string(EncodeBase64(AnsiString(s)));
      HTTPClient.Headers.Add('Authorization: Basic ' + s);
    end;
    if HTTPClient.HTTPMethod('GET', edtURL.Text) then
    begin
      if pos('200 OK', HTTPClient.Headers.Text) <> 0 then
      begin
        HTTPClient.Document.SaveToFile(fTmpFilename);
        Result := True;
      end;
    end
    else
      ShowMessage(rsDownloadError);
  finally
    strStream.Free;
    HTTPClient.Free;
  end;
  pb.Visible := False;
end;

procedure TEPGSourceForm.OnHeartBeat(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TEPGSourceForm.OnMonitor(Sender: TObject; Writing: Boolean; const Buffer: TMemory; Len: Integer);
begin
  if pb.Visible then
    pb.Position := pb.Position + Len;
end;

function TEPGSourceForm.DownloadFTP: Boolean;
var
  ftp: TFTPSend;
  eHost, eFile: string;
  arr: TStringArray;
  i: Integer;
begin
  Result := False;
  eHost := '';
  eFile := '';
  // ftp://31.177.95.170/UMMC/xmltv.xml
  arr := Explode('/', edtURL.Text);

  if Length(arr) > 0 then
  begin
    eHost := arr[2];
    for i := 3 to Length(arr) - 2 do
    begin
      if arr[i] <> '' then
        eFile := eFile + '/' + arr[i];
    end;
    eFile := arr[Length(arr) - 1];
    // eFile := eFile.TrimLeft(['/']);
  end;

  ftp := TFTPSend.Create;
  try
    ftp.TargetHost := eHost;
    ftp.BinaryMode := True;
    ftp.DSock.OnMonitor := OnMonitor;
    ftp.Sock.OnHeartBeat := OnHeartBeat;
    ftp.DSock.OnHeartBeat := OnHeartBeat;
    ftp.DSock.HeartbeatRate := 150;
    // lets make our GUI still feel responsive
    ftp.Sock.HeartbeatRate := 150;

    if ((edtLOGIN.Text <> '') and (edtPASSWORD.Text <> '')) then
    begin
      ftp.UserName := edtLOGIN.Text;
      ftp.Password := edtPASSWORD.Text;
    end;

    ftp.DirectFile := False;

    if ftp.Login then
    begin

      for i := 3 to Length(arr) - 2 do
      begin
        if arr[i] <> '' then
          ftp.ChangeWorkingDir(arr[i]);
      end;

      i := ftp.FileSize(eFile);
      if i > 0 then
      begin
        pb.Max := i;
        pb.Visible := True;
      end;
      if not ftp.RetrieveFile(eFile, False) then
        ShowMessage(rsDownloadError)
      else
      begin
        ftp.DataStream.SaveToFile(fTmpFilename);
        Result := True;
      end;
      ftp.Logout;
    end
    else
      ShowMessage(rsDownloadError);

    if pb.Visible then
      pb.Visible := False;
  finally
    ftp.Free;
  end;
end;

function TEPGSourceForm.DownloadFile: Boolean;
begin
  if UpperCase(edtURL.Text).StartsWith('FTP') then
    Result := DownloadFTP()
  else
    Result := DownloadHTTP();
end;

procedure TEPGSourceForm.Status(Sender: TObject; Reason: THookSocketReason; const Value: String);
begin
  if Reason = HR_ReadCount then
  begin
    FDownload := FDownload + StrToInt(Value);
    if pb.Max > 0 then
      pb.Position := FDownload;
  end
end;

procedure TEPGSourceForm.dsSourceNewRecord(DataSet: TDataSet);
begin
  dsSource['LOCAL_TZONE'] := 0;
  dsSource['PARSEAS'] := 1;
  dsSource['HAND_ONLY'] := 0;
end;

procedure TEPGSourceForm.cbTypeChange(Sender: TObject);
begin
  if cbType.Value = '' then
    Exit;
  pnlSettings.Visible := (cbType.Value <> 1);
  pnlGenre.Visible := (cbType.Value <> 1);
end;

procedure TEPGSourceForm.LoadMapFromDB;
begin
  dsMAPChennals.DisableControls;
  dsMAPChennals.Open;
  // dsMAPChennals.First;
  Query.SQL.Text := 'select m.Epg_Id, m.Ch_Id, m.Epg_Code, c.Ch_Name, m.SHIFT_M';
  Query.SQL.Add('from Epg_Mapping m left outer join Channels c on (m.Ch_Id = c.Ch_Id)');
  Query.SQL.Add('where m.Epg_Id = :id');
  Query.SQL.Add('order by c.Ch_Name');
  Query.ParamByName('ID').AsInteger := fSourceId;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  while not Query.Eof do
  begin
    dsMAPChennals.Append;
    dsMAPChennals['ID'] := Query.FN('Epg_Code').AsString;
    dsMAPChennals['NAME'] := Query.FN('Epg_Code').AsString;
    dsMAPChennals['ATR_ID'] := Query.FN('Ch_Id').AsInteger;
    dsMAPChennals['ATR_NAME'] := Query.FN('Ch_Name').AsString;
    if not Query.FN('SHIFT_M').IsNull then
      dsMAPChennals['SM'] := Query.FN('SHIFT_M').AsInteger;
    dsMAPChennals.Post;

    Query.Next;
  end;
  Query.Transaction.Rollback;

  // перенесем каналы источника из БД в таблицу каналов источника
  dsChFromSRC.DisableControls;
  if not dsChFromSRC.Active then
  begin
    if dsChFromSRC.Active then
      dsChFromSRC.Close;
    dsChFromSRC.Open;
    dsChFromSRC.EmptyTable;
  end;
  dsMAPChennals.First;
  while not dsMAPChennals.Eof do
  begin
    if not dsChFromSRC.Locate('ID', dsMAPChennals['ID'], []) then
    begin
      dsChFromSRC.Append;
      dsChFromSRC['ID'] := dsMAPChennals['ID'];
      dsChFromSRC['NAME'] := dsMAPChennals['NAME'];
      dsChFromSRC.Post;
    end;
    dsMAPChennals.Next;
  end;
  dsChFromSRC.First;
  dsChFromSRC.EnableControls;

  dsMAPChennals.First;
  dsMAPChennals.EnableControls;
end;

procedure TEPGSourceForm.LoadGenreMapFromDB;
begin
  if not pnlGenre.Visible then
    Exit;
  if not dsMAPGenre.Active then
    dsMAPGenre.Open;
  dsMAPGenre.DisableControls;
  dsMAPGenre.First;
  Query.SQL.Text := 'select Genre_ID, SOURCE_GENRE from EPG_MAPPING_Genre m where m.epg_id = :sid';
  Query.ParamByName('SID').AsInteger := fSourceId;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  while not Query.Eof do
  begin
    dsMAPGenre.Append;
    dsMAPGenre['XML_NAME'] := Query.FN('SOURCE_GENRE').AsString;
    dsMAPGenre['CAT_ID'] := Query.FN('Genre_ID').AsInteger;
    dsMAPGenre.Post;
    Query.Next;
  end;
  Query.Transaction.Rollback;
  dsMAPGenre.First;
  dsMAPGenre.EnableControls;
end;

function TEPGSourceForm.GetFileFormat(const aFileName: String): string;
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
      while (i > 0) and (not Finded) do
      begin
        Finded := ('.' = aFileName[i]);
        Dec(i);
      end;
      s := Copy(aFileName, i + 2, Length(aFileName) - i - 1);
      s := UpperCase(s);
      Finded := False;
      if (s = 'ZIP') or (s = 'JAR') or (s = 'XPI') then
      begin
        z := CreateInArchive(CLSID_CFormatZip);
        Finded := True;
      end
      else if (s = '7Z') then
      begin
        z := CreateInArchive(CLSID_CFormat7z);
        Finded := True;
      end
      else if (s = 'RAR') then
      begin
        z := CreateInArchive(CLSID_CFormatRar);
        Finded := True;
      end
      else if (s = 'GZ') or (s = 'GZIP') or (s = 'TGZ') or (s = 'TPZ') then
      begin
        z := CreateInArchive(CLSID_CFormatGZip);
        Finded := True;
      end
      else if (s = 'ARJ') then
      begin
        z := CreateInArchive(CLSID_CFormatArj);
        Finded := True;
      end
      else if (s = 'BZ2') or (s = 'BZIP2') or (s = 'TBZ2') or (s = 'TBZ') then
      begin
        z := CreateInArchive(CLSID_CFormatBZ2);
        Finded := True;
      end
      else
        s := aFileName;

      if Finded then
      begin
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

end.
