unit DVBEqGenForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, DBCtrlsEh, DB, FIBDataSet,
  pFIBDataSet, StdCtrls, Mask, DBLookupEh, System.UITypes, DBGridEh,
  Vcl.Buttons, CnErrorProvider;

type
  TDVBEqGenForm = class(TForm)
    lbl1: TLabel;
    lbl4: TLabel;
    edCount: TDBNumberEditEh;
    edtNumber: TDBEditEh;
    cbMAN: TDBLookupComboboxEh;
    lbl2: TLabel;
    lbl3: TLabel;
    mmoNotice: TDBMemoEh;
    srcMAN: TDataSource;
    dsMan: TpFIBDataSet;
    Label1: TLabel;
    cbType: TDBLookupComboboxEh;
    srcType: TDataSource;
    dsType: TpFIBDataSet;
    lbl5: TLabel;
    cbEncode: TDBComboBoxEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cnErrors: TCnErrorProvider;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    function GenEquipment: Boolean;
    function GenEquipmentAsNumber: Boolean;
    function GenEquipmentAsMAC: Boolean;
    function CheckData: Boolean;
  public
    { Public declarations }
  end;

function GenerateDecoders(): Boolean;

implementation

uses
  System.RegularExpressions, System.DateUtils, System.Math,
  StrUtils, pFIBQuery, DM, PrjConst, atrCommon, CnBigNumber;

{$R *.dfm}

function lpad(const s: string; const n: Integer): string;
begin
  Result := s;
  while Length(Result) < n do
    Result := '0' + Result;
end;

function rpad(const s: string; const n: Integer): string;
var
 l : Integer;
begin
  Result := s;
  l := Length(Result);
  if l < n then begin
    while Length(Result) < n do
      Result := Result + '0';
  end
  else Result := Result.Substring(l-n);
end;

function AddSum(const card: string): string;
var
  i, sum, j: Integer;
  s, r, p, o: string;
begin
  Result := card;
  if not card.ToUpper.Contains('[S') then
    Exit;

  i := Pos('[S', card.ToUpper);
  j := Pos(']', card, i + 2);
  r := Copy(card, i, j - i + 1);
  p := LeftStr(card, i - 1);
  o := RightStr(card, card.Length - j);
  sum := 0;
  for i := 1 to p.Length do begin
    if TryStrToInt(p[i], j) then
      sum := sum + j
  end;
  for i := 1 to o.Length do begin
    if TryStrToInt(o[i], j) then
      sum := sum + j
  end;
  s := r.ToUpper.Replace('[', '').Replace(']', '').Replace('S', '');
  if not TryStrToInt(s, i) then
    i := 0;

  Result := p + rpad(IntToStr(sum), i) + o;
end;

function formatAsMac(const Num: TCnBigNumber): String;
var
  hex: string;
begin
  hex := BigNumberToHex(Num);
  Result := Copy(hex, 1, 2) + ':' + Copy(hex, 3, 2) + ':' + Copy(hex, 5, 2) + ':' + Copy(hex, 7, 2) + ':' +
    Copy(hex, 9, 2) + ':' + Copy(hex, 11, 2);
end;

function GenerateDecoders(): Boolean;
begin
  with TDVBEqGenForm.Create(Application) do begin
    if ShowModal = mrOk then begin
      Result := GenEquipment;
    end
    else begin
      Result := False;
      // ShowMessage(rsERROR_NOT_CORRECT_NUMBER);
    end;
    free;
  end;
end;

procedure TDVBEqGenForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsType.Close;
  dsMan.Close;
end;

procedure TDVBEqGenForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TDVBEqGenForm.FormShow(Sender: TObject);
begin
  btnOk.Visible := (dmMain.AllowedAction(rght_Dictionary_DigitEQP) or dmMain.AllowedAction(rght_Dictionary_full));
  // Генерация карт декодеров
  dsMan.Open;
  dsType.Open;
end;

function TDVBEqGenForm.GenEquipment: Boolean;
begin
  if CheckMAC(edtNumber.Text.Trim) then
    Result := GenEquipmentAsMAC
  else
    Result := GenEquipmentAsNumber
end;

function TDVBEqGenForm.GenEquipmentAsNumber: Boolean;
var
  count, digits: Integer;
  s, pref, newN, e: string;
  t, m, i: Integer;
  StartN: int64;
  exitRepeat: Boolean;
  isMAC: Boolean;
  StartNum: TCnBigNumber;
begin
  digits := 0;
  count := 1;
  StartN := -1;
  pref := '';
  Result := False;

  StartNum := TCnBigNumber.Create;
  BigNumberClear(StartNum);

  screen.cursor := crSQLWait;
  try
    if not TryStrToInt(edCount.Value, count) then
      count := 1;

    if (edtNumber.Text.Trim <> '') and (not TryStrToInt64(edtNumber.Text, StartN)) then begin
      // попытка преобразовать номер в число
      // если не удалось, попытаемся вырезать часть кода и в число
      i := 0;
      repeat
        i := i + 1;
        digits := Trunc(Log10(count)) + i;
        newN := RightStr(edtNumber.Text, digits);
        pref := LeftStr(edtNumber.Text, Length(edtNumber.Text) - digits);
        if TryStrToInt64(newN, StartN) then
          exitRepeat := not(Length(IntToStr(StartN + count)) > digits)
        else begin
          StartN := -1;
          exitRepeat := true;
        end;
      until (exitRepeat);
    end;

    s := mmoNotice.Lines.Text.Trim;
    isMAC := CheckMAC(s);
    if isMAC then begin
      s := StringReplace(s, ':', '', [rfReplaceAll]);
      StartNum.SetHex(s);
      BigNumberSubWord(StartNum, 1);
    end;

    if ((StartN <> -1) or (count = 1)) and (MessageDlg(Format(rsCREATE_DIGIT_CARDS, [edCount.Value, edtNumber.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      with TpFIBQuery.Create(dmMain) do begin
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.Clear;
          SQL.Add('insert into EQUIPMENT_DVB (EQ_TYPE, EQ_N, EQ_STATE, EQ_MAN, NOTICE, TEXT_ENCODE)');
          SQL.Add('values (:EQ_TYPE, :EQ_N, :EQ_STATE, :EQ_MAN, :NOTICE, :TEXT_ENCODE)');
          t := cbType.Value;
          m := cbMAN.Value;

          e := cbEncode.Text.Trim;

          Transaction.StartTransaction;
          ParamByName('EQ_TYPE').AsInteger := t;
          ParamByName('EQ_STATE').AsInteger := 1;
          ParamByName('EQ_MAN').AsInteger := m;
          if not isMAC then
            ParamByName('NOTICE').AsString := s;

          if e <> '' then
            ParamByName('TEXT_ENCODE').AsString := e
          else
            ParamByName('TEXT_ENCODE').Clear;

          for i := 0 to count - 1 do begin
            if (count > 1) then begin
              newN := pref + lpad(IntToStr(StartN + i), digits);
              newN := AddSum(newN);
            end
            else begin
              newN := edtNumber.Text;
            end;
            ParamByName('EQ_N').AsString := newN;
            if isMAC and BigNumberAddWord(StartNum, 1) then begin
              ParamByName('NOTICE').AsString := formatAsMac(StartNum);
            end;
            ExecQuery;
          end;
          Transaction.Commit;
          Result := true;
        finally
          free;
        end;
      end;
    end;
  finally
    StartNum.free;
    screen.cursor := crDefault;
  end;
end;

function TDVBEqGenForm.CheckData: Boolean;
begin
  Result := true;

  if VarIsNull(edtNumber.Value) or (edtNumber.Text.Trim = '') then begin
    Result := False;
    cnErrors.SetError(edtNumber, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else begin
    cnErrors.Dispose(edtNumber);
  end;

  if VarIsNull(edCount.Value) then begin
    Result := False;
    cnErrors.SetError(edCount, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else begin
    cnErrors.Dispose(edCount);
  end;

  if VarIsNull(cbMAN.Value) then begin
    Result := False;
    cnErrors.SetError(cbMAN, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else begin
    cnErrors.Dispose(cbMAN);
  end;

  if VarIsNull(cbType.Value) then begin
    Result := False;
    cnErrors.SetError(cbType, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else begin
    cnErrors.Dispose(cbType);
  end;
end;

procedure TDVBEqGenForm.btnOkClick(Sender: TObject);
begin
  if CheckData then
    ModalResult := mrOk;
end;

function TDVBEqGenForm.GenEquipmentAsMAC: Boolean;
var
  count: Integer;
  t, m, i: Integer;
  mac, s, e: String;
  StartNum: TCnBigNumber;
begin
  count := 1;
  Result := False;

  StartNum := TCnBigNumber.Create;
  BigNumberClear(StartNum);

  screen.cursor := crSQLWait;
  try
    if not TryStrToInt(edCount.Value, count) then
      count := 1;

    mac := StringReplace(edtNumber.Text.Trim, ':', '', [rfReplaceAll]);
    StartNum.SetHex(mac);
    // для начала уменьшим на единицу. потом будем накидывать
    // избавляет от лишней логики
    if BigNumberSubWord(StartNum, 1) and (MessageDlg(Format(rsCREATE_DIGIT_CARDS, [edCount.Value, edtNumber.Text]),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      with TpFIBQuery.Create(dmMain) do begin
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.Text := 'insert into EQUIPMENT_DVB (EQ_TYPE, EQ_N, EQ_STATE, EQ_MAN, NOTICE, TEXT_ENCODE) ' +
            'values (:EQ_TYPE, :EQ_N, :EQ_STATE, :EQ_MAN, :NOTICE, :TEXT_ENCODE)';
          t := cbType.Value;
          m := cbMAN.Value;
          s := mmoNotice.Lines.Text.Trim;
          e := cbEncode.Text.Trim;

          Transaction.StartTransaction;
          ParamByName('EQ_TYPE').AsInteger := t;
          ParamByName('EQ_STATE').AsInteger := 1;
          ParamByName('EQ_MAN').AsInteger := m;
          ParamByName('NOTICE').AsString := s;
          if e <> '' then
            ParamByName('TEXT_ENCODE').AsString := e
          else
            ParamByName('TEXT_ENCODE').Clear;

          for i := 0 to count - 1 do begin
            if BigNumberAddWord(StartNum, 1) then begin
              ParamByName('EQ_N').AsString := formatAsMac(StartNum);
              ExecQuery;
            end;
          end;
          Transaction.Commit;
          Result := true;
        finally
          free;
        end;
      end;
    end;
  finally
    StartNum.free;
    screen.cursor := crDefault;
  end;

end;

end.
