unit RatesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider,
  PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBQuery, pFIBQuery,
  VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.Series, VclTee.TeeProcs,
  VclTee.Chart, amSplitter, PrnDbgeh;

type
  TRatesForm = class(TGridForm)
    dsRates: TpFIBDataSet;
    btnGet: TToolButton;
    qInsert: TpFIBQuery;
    chtRates: TChart;
    lsUSD: TLineSeries;
    lsEURO: TLineSeries;
    spl1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsRatesAfterOpen(DataSet: TDataSet);
  private
    function DownloadFile(const url: String): String;
    procedure LoadFromNBRB;
    procedure LoadFromCBR;
    procedure DrawChart;
  public
    { Public declarations }
  end;

var
  RatesForm: TRatesForm;

implementation

uses
  DM, httpsend, ssl_openssl3, JsonDataObjects, OXmlReadWrite, OXmlUtils, OXmlPDOM;

{$R *.dfm}

procedure TRatesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsRates.Close;
  RatesForm := nil;
end;

procedure TRatesForm.FormShow(Sender: TObject);
begin
  inherited;
  dsRates.Open;
end;

function TRatesForm.DownloadFile(const url: string): String;
var
  HTTPClient: THTTPSend;
  strStream: TStringStream;
begin
  Result := '';
  HTTPClient := THTTPSend.Create;
  HTTPClient.Timeout := 1000000;
  strStream := TStringStream.Create;
  try
    if HTTPClient.HTTPMethod('GET', url) then
    begin
      if Pos('200 OK', HTTPClient.Headers.Text) <> 0 then
      begin
        HTTPClient.Document.SaveToStream(strStream);
        Result := strStream.DataString;
      end;
    end
    else
      ShowMessage(rsDownloadError);
  finally
    strStream.Free;
    HTTPClient.Free;
  end;
end;

procedure TRatesForm.btnGetClick(Sender: TObject);
var
  bank: string;
begin
  inherited;
  bank := dmMain.GetSettingsValue('RATES_BANK');
  if bank = 'NBRB' then
    LoadFromNBRB
  else if bank = 'CBR' then
    LoadFromCBR
  else
    ShowMessage(rsNotSetRatesBank);
end;

procedure TRatesForm.LoadFromNBRB;
const
  CURR: String = 'BYN';

var
  s: string;
  y, m, d: Word;
  dsd, sd, ed: TDate;

  function StrToDT(const d: string): TDate;
  var
    a: System.Tarray<System.String>;
  begin
    // 2016-07-27T00:00:00
    a := d.Split(['T', '-']);
    // a := a[0].Split('-');
    Result := EncodeDate(StrToInt(a[0]), StrToInt(a[1]), StrToInt(a[2]));
  end;

  procedure GetRate(const v: string; const c: Integer; const b, e: string);
  var
    i, cnt: Integer;
    Obj: TJsonObject;
    O: TJsonObject;
  begin
    // ://www.nbrb.by/apihelp/exrates
    s := Format('https://api.nbrb.by/ExRates/Rates/Dynamics/%d?startDate=%s&endDate=%s', [c, b, e]);

    qInsert.SQL.Text := 'update or insert into Rates (Rdate, Cur, ' + v +
      ') values (:Rdate, :Cur, :val) matching (Rdate, Cur)';
    s := DownloadFile(s);
    // если вернуло ответ в вида [{..}..{..}], то считаем верным
    if s.EndsWith(']') then
    begin
      s := '{"' + v + '":' + s + '}';
      Obj := TJsonObject.Parse(s) as TJsonObject;
      try
        cnt := Obj[v].Count - 1;

        for i := 0 to cnt do
        begin
          o := Obj[v].Items[i].ObjectValue;
          if (not o.IsNull('Cur_OfficialRate')) and (not o.IsNull('Date')) then begin
            qInsert.ParamByName('val').AsFloat := O.F['Cur_OfficialRate'];
            qInsert.ParamByName('Rdate').AsDate := StrToDT(O.s['Date']);
            qInsert.ParamByName('Cur').AsString := CURR;
            qInsert.Transaction.StartTransaction;
            qInsert.ExecQuery;
            qInsert.Transaction.Commit;
          end;
        end;
      finally
        Obj.Free;
      end;

      qInsert.SQL.Text := 'delete from Rates where '+v+' is null';
      qInsert.Transaction.StartTransaction;
      qInsert.ExecQuery;
      qInsert.Transaction.Commit;

    end;
  end;

begin
  inherited;
  sd := Date() - 360;
  ed := Date() + 1;

  qInsert.Transaction := dmMain.trReadQ;
  qInsert.sql.Text := 'select max(Rdate) md from rates';
  qInsert.Transaction.StartTransaction;
  qInsert.ExecQuery;
  if (not qInsert.Eof) then begin
    if not qInsert.FieldByName('md').IsNull then
      dsd := qInsert.FieldByName('md').AsDate;
  end;
  qInsert.Close;
  qInsert.Transaction.Commit;
  qInsert.Transaction := dmMain.trWriteQ;

  DecodeDate(Date(), y, m, d);

  {
  if dsRates.Active then
  begin
    dsRates.DisableControls;
    bm := dsRates.GetBookmark;
    dsRates.First;
    while not dsRates.Eof do
    begin
      if (dsRates['CUR'] = CURR) and (dsRates['Rdate'] > sd) then
        sd := dsRates['Rdate'];
      dsRates.Next;
    end;
    dsRates.GotoBookmark(bm);
    dsRates.EnableControls;
  end;
  }

  while dsd < Date() do begin
    sd := dsd;
    ed := dsd+360;
    if ed > Date() then
      ed := Date();
    GetRate('USD', 431, FormatDateTime('yyyy-m-d', sd), FormatDateTime('yyyy-m-d', ed));
    GetRate('EUR', 451, FormatDateTime('yyyy-m-d', sd), FormatDateTime('yyyy-m-d', ed));
    dsd := ed+1;
  end;

  dsRates.CloseOpen(True);
end;

procedure TRatesForm.LoadFromCBR;
var
  s: string;
  i: Integer;
  y, m, d: Word;

  xXml: OXmlPDOM.IXMLDocument;
  nl: OXmlPDOM.IXMLNodeList;
  c: PXMLNode;
  function StrToDT(const d: string): TDate;
  var
    a: System.Tarray<System.String>;
  begin
    // 11.01.2017
    a := d.Split(['.']);
    Result := EncodeDate(StrToInt(a[2]), StrToInt(a[1]), StrToInt(a[0]));
  end;

begin
  inherited;
  DecodeDate(Date(), y, m, d);

  s := Format('http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=01/01/%d&date_req2=%.2d/%.2d/%d&VAL_NM_RQ=%s',
    [y, d, m, y, 'R01235']);
  qInsert.SQL.Text := 'update or insert into Rates (Rdate, Cur, Usd) values (:Rdate, :Cur, :Usd) matching (Rdate, Cur)';
  s := DownloadFile(s);
  if s <> '' then
  begin

    xXml := OXmlPDOM.CreateXMLDoc;
    xXml.WhiteSpaceHandling := wsPreserveAll;
    xXml.LoadFromXML(s);
    c := xXml.DocumentElement;
    nl := c.SelectNodes('//Record');
    if nl <> nil then
    begin
      for i := 0 to nl.Count - 1 do
      begin
        s := nl.Nodes[i].GetAttribute('Date');
        qInsert.ParamByName('Rdate').AsDate := StrToDT(s);
        c := nl.Nodes[i].SelectNode('Value');
        s := c.Text;
        qInsert.ParamByName('Usd').AsFloat := StrToFloat(s);
        qInsert.ParamByName('Cur').AsString := 'RUB';
        qInsert.Transaction.StartTransaction;
        qInsert.ExecQuery;
        qInsert.Transaction.Commit;
      end;
    end;
  end;

  s := Format('http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=01/01/%d&date_req2=%.2d/%.2d/%d&VAL_NM_RQ=%s',
    [y, d, m, y, 'R01239']);
  qInsert.SQL.Text := 'update or insert into Rates (Rdate, Cur, Eur) values (:Rdate, :Cur, :Eur) matching (Rdate, Cur)';
  s := DownloadFile(s);
  if s <> '' then
  begin

    xXml := OXmlPDOM.CreateXMLDoc;
    xXml.WhiteSpaceHandling := wsPreserveAll;
    xXml.LoadFromXML(s);
    c := xXml.DocumentElement;
    nl := c.SelectNodes('//Record');
    if nl <> nil then
    begin
      for i := 0 to nl.Count - 1 do
      begin
        s := nl.Nodes[i].GetAttribute('Date');
        qInsert.ParamByName('Rdate').AsDate := StrToDT(s);
        c := nl.Nodes[i].SelectNode('Value');
        s := c.Text;
        qInsert.ParamByName('EUR').AsFloat := StrToFloat(s);
        qInsert.ParamByName('Cur').AsString := 'RUB';
        qInsert.Transaction.StartTransaction;
        qInsert.ExecQuery;
        qInsert.Transaction.Commit;
      end;
    end;
  end;

  dsRates.CloseOpen(True);
end;

procedure TRatesForm.DrawChart;
begin
  chtRates.Series[0].XValues.DateTime := True;
  chtRates.Series[1].XValues.DateTime := True;

  dsRates.DisableControls;
  dsRates.Last;
  while not dsRates.Bof do
  begin
    chtRates.Series[0].AddXY(dsRates['Rdate'], dsRates['Usd']);
    chtRates.Series[1].AddXY(dsRates['Rdate'], dsRates['Eur']);
    dsRates.Prior;
  end;
  dsRates.EnableControls;

  chtRates.Axes.Bottom.Increment := DateTimeStep[dtOneMonth];
  chtRates.Axes.Bottom.DateTimeFormat := 'dd.mm.yy';
end;

procedure TRatesForm.dsRatesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DrawChart;
end;

end.
