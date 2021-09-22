unit HouseMapForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DB, FIBDataSet, pFIBDataSet, PrjConst;

type

  TFlat = record
    flat_no: string;
    flat_id: integer;
    customer_id: integer;
    Debt_SUM: Currency;
    customer_info: string;
  end;

  TFloor = record
    floor_id: integer;
    floor_n: string;
    // porch_id  : Integer;
    // porch_n   : string;
    flats_n: string;
    flats_cnt: integer;
    flats: array of TFlat;
  end;

  TPorch = record
    porch_id: integer;
    porch_n: string;
    floor_cnt: integer;
    garret: boolean;
    cellar: boolean;
    floors: array of TFloor;
  end;

  THouseMapForm = class(TForm)
    pnlSettings: TPanel;
    btnBuild: TButton;
    edtFC: TDBNumberEditEh;
    lbl1: TLabel;
    dsHouse: TpFIBDataSet;
    dsPORCH: TpFIBDataSet;
    dsCustomers: TpFIBDataSet;
    pnlMap: TScrollBox;
    procedure pnlFloorClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuildClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fHouseId: integer;
    maxPorch: integer;
    maxFloor: integer;
    HasInfo: boolean;
    Porchs: array of TPorch;
    procedure SetHouseId(value: integer);
    procedure BuildMapInfo;
    procedure BuildMapGui;
  public
    { Public declarations }
    property HouseID: integer write SetHouseId;
  end;

var
  HouseMapForm: THouseMapForm;

implementation

uses
  DM, AtrStrUtils, TextEditForma, pFIBQuery;

{$R *.dfm}

procedure THouseMapForm.SetHouseId(value: integer);
begin
  fHouseId := value;
  BuildMapInfo;
  BuildMapGui;
end;

procedure THouseMapForm.BuildMapInfo;

  function GetFlatsArray(const flats: string): TStringArray;
  var
    i, b, e: integer;
    f, g: TStringArray;
    Count: integer;
  begin
    if flats = '' then
    begin
      Result := nil;
      Exit;
    end; // if
    Count := 0;

    f := Explode(',', flats);
    for i := 0 to Length(f) - 1 do
    begin
      if Pos('-', f[i]) > 0 then
      begin
        g := Explode('-', f[i]);
        b := 0;
        e := 0;
        TryStrToInt(g[0], b);
        TryStrToInt(g[1], e);
        while b <= e do
        begin
          SetLength(Result, Count + 1);
          Result[Count] := IntToStr(b);
          Inc(Count);
          Inc(b);
        end

      end
      else
      begin
        SetLength(Result, Count + 1);
        Result[Count] := f[i];
        Inc(Count);
      end
    end;
  end;

var
  cp, cf: integer;
  pp: integer;
  i: integer;
  s: string;
  af: TStringArray;

begin
  dsHouse.Close;
  dsPORCH.Close;
  dsCustomers.Close;

  dsHouse.ParamByName('HOUSE_ID').AsInteger := fHouseId;
  dsPORCH.ParamByName('HOUSE_ID').AsInteger := fHouseId;
  dsCustomers.ParamByName('HOUSE_ID').AsInteger := fHouseId;
  dsHouse.Open;

  Height := dsHouse['map_height'];
  Width := dsHouse['map_width'];
  edtFC.value := dsHouse['map_flats'];
  dsPORCH.Open;
  dsCustomers.Open;
  dsHouse.DisableControls;
  dsPORCH.DisableControls;
  dsCustomers.DisableControls;

  maxPorch := 1;
  maxFloor := 1;

  cp := -1;
  pp := -1;
  cf := 0;
  while not dsPORCH.Eof do
  begin
    if (not dsPORCH.FieldByName('floor_n').IsNull) and (not dsPORCH.FieldByName('porch_n').IsNull) then
    begin
      if pp <> dsPORCH['porch_id'] then
      begin
        Inc(cp);
        SetLength(Porchs, cp + 1); // увеличение длины массива на 1
        Porchs[cp].porch_id := dsPORCH['porch_id'];
        Porchs[cp].porch_n := dsPORCH['porch_n'];
        Porchs[cp].floor_cnt := 0;
        pp := dsPORCH['porch_id'];
        if cf > maxFloor then
          maxFloor := cf;
        cf := 0;
      end;
      // if pf <> dsPorch['floor_id']
      // then begin
      SetLength(Porchs[cp].floors, cf + 1); // увеличение длины массива на 1
      Porchs[cp].floor_cnt := cf + 1;
      Porchs[cp].floors[cf].floor_id := dsPORCH['floor_id'];
      Porchs[cp].floors[cf].floor_n := dsPORCH['floor_n'];
      if not dsPORCH.FieldByName('flats').IsNull then
      begin
        Porchs[cp].floors[cf].flats_n := dsPORCH['flats'];
        af := GetFlatsArray(dsPORCH['flats']);
        Porchs[cp].floors[cf].flats_cnt := Length(af);
        for i := 0 to Length(af) - 1 do
        begin
          SetLength(Porchs[cp].floors[cf].flats, i + 1);
          Porchs[cp].floors[cf].flats[i].flat_no := af[i];
          s := '';
          if dsCustomers.Locate('FLAT_NO', af[i], [loCaseInsensitive]) then
          begin
            Porchs[cp].floors[cf].flats[i].customer_id := dsCustomers['CUSTOMER_ID'];
            if not dsCustomers.FieldByName('ACCOUNT_NO').IsNull then
              s := s + format(rsAccountWT, [dsCustomers['ACCOUNT_NO']]) + rsEOL;
            if not dsCustomers.FieldByName('dogovor_no').IsNull then
              s := s + format(rsContractWT, [dsCustomers['dogovor_no']]) + rsEOL;
            s := s + format(rsFIOWT, [dsCustomers.FieldByName('surname').AsString + ' ' +
              dsCustomers.FieldByName('initials').AsString]) + rsEOL;
            if not dsCustomers.FieldByName('debt_sum').IsNull then
              s := s + format(rsSaldoWT, [dsCustomers.FieldByName('debt_sum').AsString]) + rsEOL;
            if (not dsCustomers.FieldByName('phone_no').IsNull) or (not dsCustomers.FieldByName('mobile_phone').IsNull)
            then
              s := s + format(rsPhone, [dsCustomers.FieldByName('phone_no').AsString,
                dsCustomers.FieldByName('mobile_phone').AsString]) + rsEOL;
            if not dsCustomers.FieldByName('cust_state_descr').IsNull then
              s := s + format(rsStateWT, [dsCustomers['cust_state_descr']]) + rsEOL;
            if not dsCustomers.FieldByName('notice').IsNull then
              s := s + format(rsNoticeWT, [dsCustomers['notice']]);
            Porchs[cp].floors[cf].flats[i].Debt_SUM := dsCustomers.FieldByName('debt_sum').AsCurrency;
          end
          else
          begin
            Porchs[cp].floors[cf].flats[i].customer_id := -1;
            Porchs[cp].floors[cf].flats[i].Debt_SUM := 0;
            s := rsNotCustomer
          end;
          Porchs[cp].floors[cf].flats[i].customer_info := s;

        end;
      end;
      Inc(cf);
    end;

    dsPORCH.Next;
  end;
  maxPorch := cp + 1;
  HasInfo := True;
end;

procedure THouseMapForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fHouseId <> -1 then
  begin
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text :=
          'update HOUSE set MAP_FLATS = :MAP_FLATS, MAP_WIDTH = :MAP_WIDTH, MAP_HEIGHT = :MAP_HEIGHT where (HOUSE_ID = :HOUSE_ID)';
        ParamByName('MAP_FLATS').value := edtFC.value;
        ParamByName('MAP_WIDTH').value := Width;
        ParamByName('MAP_HEIGHT').value := Height;
        ParamByName('HOUSE_ID').value := fHouseId;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
      finally
        Free;
      end;
  end;
end;

procedure THouseMapForm.FormCreate(Sender: TObject);
begin
  HasInfo := False;
  fHouseId := -1;
end;

procedure THouseMapForm.FormResize(Sender: TObject);
begin
  if HasInfo then
    BuildMapGui;
end;

procedure THouseMapForm.btnBuildClick(Sender: TObject);
begin
  BuildMapInfo;
  BuildMapGui;
end;

procedure THouseMapForm.BuildMapGui;
var
  Porch_width: integer;
  floor_height: integer;
  i, j, k: integer;
  pnl, fpnl: TPanel;
  flats_on_row: integer;
  flats_on_row_l: integer;
  flats_on_floor: integer;
  vRED_SUMM: Currency;
  gCustActiveDebt: TColor;
  fpnlw, fpnlh: integer;
  cr: TCursor;
begin
  if (maxPorch = 0) or (maxFloor = 0) then
    Exit;

  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  vRED_SUMM := dmMain.GetSettingsValue('DOLG');
  try
    gCustActiveDebt := StringToColor(dmMain.GetSettingsValue('COLOR_DOLG'));
  except
    gCustActiveDebt := clRed;
  end;

  flats_on_row := Trunc(edtFC.value);
  Porch_width := Trunc((pnlMap.Width - 5) / maxPorch);
  if Porch_width < 80 then
    Porch_width := 80;
  floor_height := Trunc((pnlMap.Height - 5) / maxFloor);
  if floor_height < 40 then
    floor_height := 40;
  while pnlMap.ControlCount > 0 do
    pnlMap.Controls[0].Free;
  for i := 0 to maxPorch - 1 do
  begin
    for j := 0 to Porchs[i].floor_cnt - 1 do
    begin
      pnl := TPanel.Create(pnlMap);
      pnl.Parent := pnlMap;
      pnl.Height := floor_height;
      pnl.Width := Porch_width - 1;
      pnl.Left := (i * Porch_width);
      pnl.BevelInner := bvRaised;
      pnl.BevelOuter := bvLowered;
      pnl.Top := pnlMap.Height - 5 - (j * floor_height) - pnl.Height;

      flats_on_floor := Porchs[i].floors[j].flats_cnt;
      if flats_on_floor = 0 then
        continue;
      if flats_on_floor < flats_on_row then
        flats_on_row_l := flats_on_floor
      else
        flats_on_row_l := flats_on_row;

      if (flats_on_floor mod flats_on_row_l) = 0 then
        fpnlh := Trunc((pnl.Height - 2) / (flats_on_floor div flats_on_row_l))
      else
        fpnlh := Trunc((pnl.Height - 2) / ((flats_on_floor div flats_on_row_l) + 1));
      fpnlh := fpnlh - 2;
      fpnlw := Trunc(pnl.Width / flats_on_row_l) - 2;
      for k := 0 to flats_on_floor - 1 do
      begin
        fpnl := TPanel.Create(pnlMap);
        fpnl.Parent := pnl;
        fpnl.Height := fpnlh;
        fpnl.Width := fpnlw;
        fpnl.Left := (k mod flats_on_row_l) * fpnl.Width + 2;
        fpnl.Top := pnl.Height - Trunc(k / flats_on_row_l) * fpnl.Height - fpnl.Height - 2;
        fpnl.Caption := Porchs[i].floors[j].flats[k].flat_no;
        fpnl.Hint := Porchs[i].floors[j].flats[k].customer_info;
        fpnl.ShowHint := True;
        fpnl.Tag := Porchs[i].floors[j].flats[k].customer_id;
        if Porchs[i].floors[j].flats[k].customer_id > -1 then
          fpnl.Font.Style := [fsBold];
        if Porchs[i].floors[j].flats[k].Debt_SUM > vRED_SUMM then
          fpnl.Font.Color := gCustActiveDebt;
        fpnl.OnClick := pnlFloorClick;
      end;
    end
  end;

  Screen.Cursor := cr;
end;

procedure THouseMapForm.pnlFloorClick(Sender: TObject);
var
  str: TStrings;
begin
  str := TStringList.Create;
  try
    str.Text := (Sender as TPanel).Hint;
    EditText(str, rsFlat + ' ' + (Sender as TPanel).Caption);
  finally
    str.Free
  end;
end;

end.
