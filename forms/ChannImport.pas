unit ChannImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet,
  ExtCtrls, ToolCtrlsEh, DBGridEhToolCtrls,
  MemTableDataEh, MemTableEh, GridsEh, DBAxisGridsEh, DBGridEh, StdCtrls, EhLibMTE,
  DBCtrlsEh, Mask, FIBQuery, pFIBQuery,

  OXmlReadWrite, OXmlUtils, OXmlPDOM, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TChImportForm = class(TForm)
    pnlBottom: TPanel;
    Button1: TButton;
    btnSave: TButton;
    trRead: TpFIBTransaction;
    srcXMLChennals: TDataSource;
    dsXMLChennals: TMemTableEh;
    trWrite: TpFIBTransaction;
    Query: TpFIBQuery;
    OpenDialog: TOpenDialog;
    pnlChennals: TPanel;
    dbgChannels: TDBGridEh;
    Label1: TLabel;
    Label3: TLabel;
    cbType: TDBComboBoxEh;
    LabelXML: TLabel;
    edXMLFile: TDBEditEh;
    btnOpen: TButton;
    lblNoNew: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
  private
    function SaveSource: Boolean;
    procedure Load_xmltv_map;
    procedure Load_A4onTV_map;
    procedure DataSetStart;
    procedure DataSetFinish;
    procedure DeleteExisitingChannels;
  public

  end;

var
  EPGSourceForm: TChImportForm;

implementation

uses
  DM, AtrCommon, JsonDataObjects, PrjConst, OTextReadWrite;

{$R *.dfm}

function TChImportForm.SaveSource: Boolean;
begin
  if not dsXMLChennals.Active then
  begin
    Result := True;
    Exit;
  end;

  if dsXMLChennals.RecordCount = 0 then
  begin
    Result := True;
    Exit;
  end;

  if dsXMLChennals.State in [dsEdit] then
    dsXMLChennals.Post;

  dsXMLChennals.DisableControls;
  dsXMLChennals.First;
  Query.SQL.Text := 'insert into Channels (Ch_Number, Ch_Name, Ch_Notice) values (:Ch_Number, :Ch_Name, :Ch_Notice)';
  Query.Transaction.StartTransaction;
  while not dsXMLChennals.Eof do
  begin
    if not dsXMLChennals.FieldByName('NAME').IsNull then
      if dsXMLChennals.FieldByName('NAME').AsString <> '' then
      begin

        if not dsXMLChennals.FieldByName('ATR_ID').IsNull then
          Query.ParamByName('Ch_Number').AsInteger := dsXMLChennals['ATR_ID']
        else
          Query.ParamByName('Ch_Number').Clear;

        Query.ParamByName('Ch_Name').AsString := dsXMLChennals['NAME'];

        if not dsXMLChennals.FieldByName('Notice').IsNull then
          Query.ParamByName('Ch_Notice').AsString := dsXMLChennals['Notice']
        else
          Query.ParamByName('Ch_Notice').Clear;

        Query.ExecQuery;
      end;
    dsXMLChennals.Next;
  end;
  Query.Transaction.Commit;
  dsXMLChennals.First;
  dsXMLChennals.EnableControls;
  Result := True;
end;

procedure TChImportForm.DataSetStart;
begin
  if dsXMLChennals.Active then
    dsXMLChennals.Close;
  dsXMLChennals.DisableControls;
  dsXMLChennals.Open;
  dsXMLChennals.EmptyTable;
end;

procedure TChImportForm.DataSetFinish;
begin
  DeleteExisitingChannels;
  dsXMLChennals.First;
  dsXMLChennals.EnableControls;
  lblNoNew.Visible := (dsXMLChennals.RecordCount = 0);
  dbgChannels.Visible := (dsXMLChennals.RecordCount > 0);
end;

procedure TChImportForm.DeleteExisitingChannels;
var
  s: string;
begin
  Query.SQL.Text := 'select Ch_Name from Channels';
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  while not Query.Eof do
  begin
    s := Query.FN('Ch_Name').AsString;
    if dsXMLChennals.Locate('UNAME', UpperCase(s), [loCaseInsensitive]) then
      dsXMLChennals.Delete;
    Query.Next;
  end;
  Query.Transaction.Rollback;
  Query.Close;
end;

procedure TChImportForm.Load_xmltv_map;
var
  j: Integer;
  id: Integer;
  s: string;
  xXml: OXmlPDOM.IXMLDocument;
  nl: OXmlPDOM.IXMLNodeList;
  c: PXMLNode;
  v: Variant;
begin
  if (edXMLFile.Text.IsEmpty) or (not FileExists(edXMLFile.Text)) then
    Exit;

  xXml := OXmlPDOM.CreateXMLDoc;
  xXml.ReaderSettings.ErrorHandling := ehSilent;
  xXml.WhiteSpaceHandling := wsPreserveAll;
  xXml.LoadFromFile(edXMLFile.Text);
  if xXml.DocumentElement = nil then
  begin
    ShowMessage(rsXMLTVFormatError);
    xXml := nil;
    Exit;
  end;

  DataSetStart;

  c := xXml.DocumentElement;
  nl := c.SelectNodes('//channel');
  if nl <> nil then
  begin
    v := dmMain.GetSingleSqlResult('select max(CH_NUMBER) from CHANNELS');
    if VarIsNull(v) then
      id := 1
    else
      id := (v + 1);
    for j := 0 to nl.Count - 1 do
    begin
      dsXMLChennals.Append;
      // S := nl.Nodes[j].GetAttribute('id');
      // .GetAttribute('channel'); id
      // if not TryStrToInt(S, id)
      // then id := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
      dsXMLChennals['ATR_ID'] := id;
      c := nl.Nodes[j].SelectNode('display-name');
      s := c.Text;
      dsXMLChennals['NAME'] := s;
      dsXMLChennals['UNAME'] := UpperCase(s);
      dsXMLChennals.Post;
      Inc(id);
    end;
  end;
  DataSetFinish;
end;

procedure TChImportForm.Load_A4onTV_map;
var
  i: Integer;
  id: Integer;
  jsonName: string;
  B: TJsonBaseObject;
  O, c: TJsonObject;
  v: Variant;
begin
  jsonName := GetTempDir + 'tv.json';
  // dmMain.LoadWeekFromA4onTV(jsonName);
  dmMain.LoadChannelsFromA4onTV(jsonName);

  if not FileExists(jsonName) then
    Exit;

  DataSetStart;

  B := TJsonBaseObject.ParseFromFile(jsonName);
  try
    if B <> nil then
    begin
      O := B as TJsonObject;
      if O.Contains('schedule') then
      begin
        v := dmMain.GetSingleSqlResult('select max(CH_NUMBER) from CHANNELS');
        if VarIsNull(v) then
          id := 1
        else
          id := (v + 1);

        for i := 0 to O.A['schedule'].Count - 1 do
        begin
          c := O.A['schedule'][i];
          dsXMLChennals.Append;
          // id := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
          dsXMLChennals['ATR_ID'] := id;
          dsXMLChennals['NAME'] := c.s['channel'];
          dsXMLChennals['UNAME'] := UpperCase(c.s['channel']);
          dsXMLChennals.Post;
          Inc(id);
        end;
      end;
    end;
  finally
    B.Free;
  end;
  if System.SysUtils.FileExists(jsonName) then
    System.SysUtils.DeleteFile(jsonName);
  DataSetFinish;
end;

procedure TChImportForm.btnSaveClick(Sender: TObject);
begin
  if SaveSource then
    ModalResult := mrOk;;
end;

procedure TChImportForm.btnOpenClick(Sender: TObject);
var
  cr: TCursor;
begin
  if cbType.Text.Trim = '' then
  begin
    cbType.SetFocus;
    cbType.DropDown;
    Exit;
  end;

  cr := Screen.Cursor;
  case cbType.Value of
    1:
      begin;
        Screen.Cursor := crHourGlass;
        try
          Load_A4onTV_map
        finally
          Screen.Cursor := cr;
        end;
      end;
    0:
      begin;
        if edXMLFile.Text <> '' then
          OpenDialog.FileName := edXMLFile.Text;

        if OpenDialog.Execute then
        begin
          edXMLFile.Text := OpenDialog.FileName;
          if FileExists(edXMLFile.Text) then
          begin
            Screen.Cursor := crHourGlass;
            try
              Load_xmltv_map
            finally
              Screen.Cursor := cr;
            end;
          end
          else
            ShowMessage(Format(rsFileNotFound, [edXMLFile.Text]));
        end;
      end;
  end;

end;

procedure TChImportForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;

end;

procedure TChImportForm.FormShow(Sender: TObject);
begin
  if VarIsNull(cbType.Value) then
    cbType.Value := 1;
end;

procedure TChImportForm.cbTypeChange(Sender: TObject);
begin
  edXMLFile.Visible := (cbType.Value <> 1);
  LabelXML.Visible := edXMLFile.Visible;
end;

end.
