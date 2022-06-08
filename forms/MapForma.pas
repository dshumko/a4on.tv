unit MapForma;

{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.CheckLst, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.OleCtrls, Vcl.Menus, Vcl.ActnList,
  GMMap, GMLinkedComponents, GMInfoWindow, GMClasses, GMMapVCL, GMConstants, GMMarker, GMMarkerVCL, GMPolyline, GMPolylineVCL,
  GMGeoCode, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  {$IFDEF EMBEDDEDWB}
  SHDocVw_EWB, EwbCore, EmbeddedWB,
  {$ELSE}
  SHDocVw,
  {$ENDIF}
  System.TimeSpan,
  PropFilerEh, PropStorageEh;

type
  TMapForm = class(TForm)
    pnlMain: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    GMMap: TGMMap;
    Label32: TLabel;
    lLatEvent: TLabel;
    lLngEvent: TLabel;
    Label34: TLabel;
    GMInfoWindow: TGMInfoWindow;
    gmMovements: TGMPolyline;
    mmMap: TMainMenu;
    GMGeoCode: TGMGeoCode;
    N1: TMenuItem;
    N2: TMenuItem;
    miGeoCode: TMenuItem;
    qWrite: TpFIBQuery;
    qRead: TpFIBQuery;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    miBid: TMenuItem;
    actlst: TActionList;
    actShowBid: TAction;
    actGeocoding: TAction;
    gmMrkrBids: TGMMarker;
    actLastPosition: TAction;
    miLastPosition: TMenuItem;
    gmMrkrLast: TGMMarker;
    SaveDialog1: TSaveDialog;
    miN3: TMenuItem;
    miSave: TMenuItem;
    actMovements: TAction;
    N3: TMenuItem;
    procedure gmMapAfterPageLoaded(Sender: TObject; First: Boolean);
    procedure gmMapMouseMove(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure actShowBidExecute(Sender: TObject);
    procedure actGeocodingExecute(Sender: TObject);
    procedure actLastPositionExecute(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actMovementsExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure DoMap;
    procedure ControlIEVersion;
    function GetGeo(const adres: string; var lat, lng: Real): integer;
    procedure ShowBids;
    procedure HideBids;
    procedure HideLastPosition;
    procedure ShowLastPosition;
    procedure ShowMovements;
    procedure HideMovements;
  public
{$IFDEF EMBEDDEDWB}
    wbWeb: TEmbeddedWB;
{$ELSE}
    wbWeb: TWebBrowser;
{$ENDIF}
    constructor Create(aOwner: TComponent); override;
  end;

var
  MapForm: TMapForm;

implementation

uses
  Winapi.ShellAPI,
  System.Win.Registry,
  System.IniFiles, System.Types,
  PrjConst, GMFunctionsVCL, DM, MAIN;

{$R *.dfm}

function GenerateRandomColor(const Mix: TColor = clWhite): TColor;
var
  Red, Green, Blue: integer;
begin
  Red := Random(256);
  Green := Random(256);
  Blue := Random(256);

  Red := (Red + GetRValue(ColorToRGB(Mix))) div 2;
  Green := (Green + GetGValue(ColorToRGB(Mix))) div 2;
  Blue := (Blue + GetBValue(ColorToRGB(Mix))) div 2;
  Result := RGB(Red, Green, Blue);
end;

procedure TMapForm.actGeocodingExecute(Sender: TObject);
var
  adres: string;
  lat, lng: Real;
  res: integer;
begin
  if qWrite.Open then
    qWrite.Close;
  qWrite.SQL.Text := 'update house set Latitude = :lat, Longitude = :lon where House_Id = :hid';

  if qRead.Open then
    qRead.Close;
  qRead.SQL.Clear;
  qRead.SQL.Add('select h.House_Id, s.Street_Short, s.Street_Name, h.House_No,');
  qRead.SQL.Add('(select first 1 C_VALUE from COMPANY where C_CODE = ''CITY'') as city');
  qRead.SQL.Add('from house h inner join street s on (h.Street_Id = s.Street_Id)');
  qRead.SQL.Add('where h.Latitude is null or h.Longitude is null');
  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  while not qRead.EOF do
  begin
    adres := '';
    if (not qRead.FN('city').IsNull) and (qRead.FN('city').AsString <> '') then
      adres := qRead.FN('city').AsString + ', ';
    adres := adres + qRead.FN('Street_Short').AsString + ' ' + qRead.FN('Street_Name').AsString;
    adres := adres + ', ' + qRead.FN('House_No').AsString;
    res := GetGeo(adres, lat, lng);
    if res > 0 then
    begin
      // пропишем в базу
      qWrite.ParamByName('hid').AsInteger := qRead.FN('House_Id').AsInteger;
      qWrite.ParamByName('lat').AsExtended := lat;
      qWrite.ParamByName('lon').AsExtended := lng;
      qWrite.Transaction.StartTransaction;
      qWrite.ExecQuery;
      qWrite.Transaction.Commit;
    end
    else
    begin
      if res = -1 then
      begin
        ShowMessage(rsMapLimit);
        Break;
      end;
    end;
    qRead.Next;
  end;
  qRead.Transaction.Commit;
  qRead.Close;
end;

procedure TMapForm.actLastPositionExecute(Sender: TObject);
begin
  actLastPosition.Checked := not actLastPosition.Checked;
  if actLastPosition.Checked then
    ShowLastPosition
  else
    HideLastPosition;
end;

procedure TMapForm.actMovementsExecute(Sender: TObject);
begin
  actMovements.Checked := not actMovements.Checked;
  if actMovements.Checked then
    ShowMovements
  else
    HideMovements;
end;

procedure TMapForm.actShowBidExecute(Sender: TObject);
begin
  actShowBid.Checked := not actShowBid.Checked;
  if actShowBid.Checked then
    ShowBids
  else
    HideBids;
end;

procedure TMapForm.ControlIEVersion;
{$IFNDEF EMBEDDEDWB}
var
  Tmp: string;
  L: TStringList;
  Ver: integer;
  Reg: TRegistry;
{$ENDIF}
begin
{$IFNDEF EMBEDDEDWB}
  Tmp := GMMap.GetIEVersion;
  if Tmp.IsEmpty then
  begin
    L := TStringList.Create;
    try
      L.Delimiter := '.';
      L.DelimitedText := Tmp;
      Ver := StrToInt(L[0]);
    finally
      FreeAndNil(L);
    end;
  end
  else
    Ver := 10;

  if Ver < 7 then
    Ver := 7
  else if Ver > 11 then
    Ver := 11;

  Ver := Ver * 1000;

  Tmp := ExtractFileName(ParamStr(0));
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', False) then
      try
        if not Reg.ValueExists(Tmp) then
          Reg.WriteInteger(Tmp, Ver);
      finally
        Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
{$ENDIF}
end;

constructor TMapForm.Create(aOwner: TComponent);
begin
  inherited;
  ControlIEVersion;
end;

function TMapForm.GetGeo(const adres: string; var lat, lng: Real): integer;
begin
  Result := 0;

  GMGeoCode.Geocode(adres);
  if GMGeoCode.GeoStatus = gsWithoutState then
    Exit;
  if GMGeoCode.GeoStatus = gsOVER_QUERY_LIMIT then
  begin
    Result := -1;
    Exit;
  end;
  if GMGeoCode.GeoStatus = gsOK then
  begin
    Result := 1;
    lat := GMGeoCode[0].Geometry.Location.lat;
    lng := GMGeoCode[0].Geometry.Location.lng;
  end;
end;

procedure TMapForm.DoMap;
var
  AppIni: TIniFile;
  s: string;
  lat, lng: Real;
  vz: integer;
begin
  if not GMMap.Active then
    Exit;

  lat := 52.1;
  lng := 23.7;
  vz := 14;
  s := 'mtOSM';

  AppIni := TIniFile.Create(A4MainForm.GetIniFileName);
  try
    lat := AppIni.ReadFloat('MAP', 'LAT', lat);
    lng := AppIni.ReadFloat('MAP', 'LNG', lng);
    vz := AppIni.ReadInteger('MAP', 'ZOOM', vz);
    s := AppIni.ReadString('MAP', 'TYPE', 'mtOSM');
  finally
    FreeAndNil(AppIni);
  end;

  GMMap.RequiredProp.Center.lat := lat;
  GMMap.RequiredProp.Center.lng := lng;
  GMMap.RequiredProp.Zoom := vz;
  GMMap.RequiredProp.MapType := TTransform.StrToMapTypeId(s);
  GMMap.Language := Russian;
  GMMap.DoMap;
end;

procedure TMapForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  AppIni: TIniFile;
  ll: TLatLng;
  s: string;
begin
  if GMMap.Active then
  begin
    AppIni := TIniFile.Create(A4MainForm.GetIniFileName);
    ll := TLatLng.Create();
    try
      GMMap.GetCenter(ll);
      AppIni.WriteFloat('MAP', 'LAT', ll.lat);
      AppIni.WriteFloat('MAP', 'LNG', ll.lng);
      AppIni.WriteInteger('MAP', 'ZOOM', GMMap.RequiredProp.Zoom);
      s := TTransform.MapTypeIdToStr(GMMap.RequiredProp.MapType);
      AppIni.WriteString('MAP', 'TYPE', s);
    finally
      FreeAndNil(AppIni);
      FreeAndNil(ll);
    end;
  end;
  MapForm := nil;
  Action := caFree;
end;

procedure TMapForm.FormCreate(Sender: TObject);
begin
{$IFDEF EMBEDDEDWB}
  wbWeb := TEmbeddedWB.Create(Self);
  wbWeb.Name := 'wbWeb';
  wbWeb.Parent := pnlMain;
  wbWeb.Align := alClient;
  wbWeb.TabOrder := 0;
  wbWeb.DisableCtrlShortcuts := 'N';
  wbWeb.UserInterfaceOptions := [EnablesFormsAutoComplete, EnableThemes];
  wbWeb.PrintOptions.HTMLHeader.Clear;
  wbWeb.PrintOptions.HTMLHeader.Add('<HTML></HTML>');
  GMMap.WebBrowser := wbWeb;
{$ELSE}
  wbWeb := TWebBrowser.Create(Self);
  TWinControl(wbWeb).Parent := pnlMain;
  wbWeb.Silent := true;
  wbWeb.Align := alClient;
  wbWeb.Align := alClient;
  wbWeb.TabOrder := 0;
  GMMap.WebBrowser := wbWeb;
{$ENDIF}
end;

procedure TMapForm.FormDestroy(Sender: TObject);
begin
  if assigned(wbWeb) then
    FreeAndNil(wbWeb);
end;

procedure TMapForm.FormShow(Sender: TObject);
begin
  GMMap.APIKey := dmMain.GetSettingsValue('GMAPI');
  if GMMap.APIKey <> '' then
    GMMap.Active := true
  else
  begin
    ShowMessage(rsERROR_GMAPI);
  end;
end;

procedure TMapForm.gmMapAfterPageLoaded(Sender: TObject; First: Boolean);
begin
  if First then
    DoMap;
end;

procedure TMapForm.gmMapMouseMove(Sender: TObject; LatLng: TLatLng; X, Y: Double);
begin
  // lLatEvent.Caption := LatLng.LatToStr(GMMap.Precision);
  // lLngEvent.Caption := LatLng.LngToStr(GMMap.Precision);
end;

procedure TMapForm.ShowBids;
var
  s: string;
  m: TMarker;
begin
  // покажем заявки
  if qRead.Open then
    qRead.Close;
  qRead.SQL.Text := 'select C.CUSTOMER_ID, R.RQ_ID, RT.Rt_Name,' + #13#10 +
    '    coalesce(TPL.RQ_CONTENT, '''') || coalesce(''.'' || R.ADD_INFO, '''') || iif(coalesce(R.RQ_CONTENT, '''') <> '''', coalesce('' ('' || R.RQ_CONTENT || '')'', ''''), '''') as CONTETNT,'
    + #13#10 +
    '    R.RQ_TIME_FROM, R.RQ_TIME_TO, C.ACCOUNT_NO, C.CUST_CODE, C.SURNAME || '' '' || C.INITIALS as FIO, coalesce(R.FLAT_NO, '''') as FLAT_NO,'
    + #13#10 + '    R.REQ_RESULT, h.Latitude, h.Longitude, coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR' + #13#10 +
    '  from REQUEST R' + #13#10 + '       inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)' + #13#10 +
    '       inner join STREET S on (S.STREET_ID = H.STREET_ID)' + #13#10 +
    '       left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_ID)' + #13#10 +
    '       left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOMER_ID)' + #13#10 +
    '       left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = R.RQTL_ID)' + #13#10 +
    '  where r.Rq_Plan_Date = current_date' + #13#10 + '  order by R.RQ_ID';
  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  while not qRead.EOF do
  begin
    if (not qRead.FN('Latitude').IsNull) and (not qRead.FN('Longitude').IsNull) then
    begin
      s := qRead.FN('Rt_Name').AsString;
      m := gmMrkrBids.Add(qRead.FN('Latitude').AsExtended, qRead.FN('Longitude').AsExtended, s);
      m.MarkerType := mtColored;
      m.ShowInfoWinMouseOver := true;
      s := '<h1>' + s + '</h1>';
      s := s + '<p>' + qRead.FN('CONTETNT').AsString + '</p>';
      m.InfoWindow.HTMLContent := s;
      if (not qRead.FN('RT_COLOR').IsNull) then
        s := qRead.FN('RT_COLOR').AsString
      else
        s := 'clWhite';
      m.ColoredMarker.PrimaryColor := StringToColor(s);
    end;
    qRead.Next;
  end;
  qRead.Transaction.Commit;
  qRead.Close;
end;

procedure TMapForm.HideBids;
begin
  while gmMrkrBids.Count > 0 do
    gmMrkrBids.Delete(gmMrkrBids.Count - 1);
end;

procedure TMapForm.ShowLastPosition;
var
  s: string;
  m: TMarker;
begin
  // покажем заявки
  if qRead.Open then
    qRead.Close;
  qRead.SQL.Clear;
  qRead.SQL.Add
    ('select coalesce(w.Surname, '''') Surname, coalesce(w.Firstname, '''') Firstname, l.Gps_Time, l.Lat, l.Lon');
  qRead.SQL.Add
    ('from worker w inner join(select distinct Worker from gps_log where Gps_Time >= current_date) u on (w.Ibname = u.worker)');
  qRead.SQL.Add('inner join(select Worker, Gps_Time, Lat, Lon from gps_log l');
  qRead.SQL.Add('where Gps_Time = (select max(Gps_Time) from gps_log where Gps_Time >= current_date');
  qRead.SQL.Add('and cast(Gps_Time as date) = current_date and l.Worker = Worker)) l on (w.Ibname = l.worker)');
  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  while not qRead.EOF do
  begin
    if (not qRead.FN('Lat').IsNull) and (not qRead.FN('Lon').IsNull) then
    begin
      s := qRead.FN('Surname').AsString + ' ' + qRead.FN('Firstname').AsString;
      m := gmMrkrLast.Add(qRead.FN('Lat').AsExtended, qRead.FN('Lon').AsExtended, s);
      m.MarkerType := mtStandard;
      m.Draggable := False;
      m.ShowInfoWinMouseOver := true;
      s := '<h1>' + qRead.FN('Surname').AsString + '</h1>';
      s := s + '<p>' + DateTimeToStr(qRead.FN('Gps_Time').AsDateTime) + '</p>';
      m.InfoWindow.HTMLContent := s;
    end;
    qRead.Next;
  end;
  qRead.Transaction.Commit;
  qRead.Close;
end;

procedure TMapForm.HideLastPosition;
begin
  while gmMrkrLast.Count > 0 do
    gmMrkrLast.Delete(gmMrkrLast.Count - 1);
end;

procedure TMapForm.miSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    GMMap.SaveToJPGFile(SaveDialog1.FileName);
end;

procedure TMapForm.ShowMovements;
var
  ul: string;
  pl: TPolyline;
begin
  // покажем заявки
  if qRead.Open then
    qRead.Close;
  qRead.SQL.Text := 'select ' + #13#10 + //
    'l.worker, l.Gps_Time, l.Lat, l.Lon, ' + #13#10 + //
    'coalesce(w.Surname|| '' '','''') || coalesce(w.Firstname|| '' '','''') FIO ' + #13#10 + //
    'from worker w inner join gps_log l on (w.Ibname = l.worker)' + #13#10 + //
    'where Gps_Time >= current_date and cast(Gps_Time as DATE) = current_date' + #13#10 + //
    'order by 1, 2';
  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  ul := '';
  Randomize;
  pl := nil;
  while not qRead.EOF do
  begin
    if (not qRead.FN('Lat').IsNull) and (not qRead.FN('Lon').IsNull) and (not qRead.FN('worker').IsNull) then
    begin
      if ul <> qRead.FN('worker').AsString then
      begin
        ul := qRead.FN('worker').AsString;
        pl := gmMovements.Add();
        pl.Text := qRead.FN('FIO').AsString;
        pl.Clickable := true;
        pl.Editable := False;
        pl.StrokeColor := GenerateRandomColor();
        pl.InfoWindow.HTMLContent := qRead.FN('FIO').AsString;
      end;
      if assigned(pl) then
        pl.AddLinePoint(qRead.FN('Lat').AsExtended, qRead.FN('Lon').AsExtended);
    end;
    qRead.Next;
  end;
  qRead.Transaction.Commit;
  qRead.Close;
end;

procedure TMapForm.HideMovements;
begin
  while gmMovements.Count > 0 do
    gmMovements.Delete(gmMovements.Count - 1);
end;

end.
