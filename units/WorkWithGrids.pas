unit WorkWithGrids;

interface

uses Classes, Grids, Winapi.Windows;

// показать файл в стринггриде
// CodePage  - 0 = DOS866 1 - win1251
procedure ShowFileInStringGrid(sgFile: TStringGrid; const FileName: string; const CodePage: Integer;
  const SkeepEmpty: Boolean = False);

// Загрузка фадйа в StringList
// CodePage  0 =(DOS866) 1 = (WIN1251)
procedure FileToStrings(const FileName: string; sl: TStringList; const CodePage: Integer;
  const SkeepEmpty: Boolean = False);

implementation

uses RxStrUtils, SysUtils;

procedure FileToStrings(const FileName: string; sl: TStringList; const CodePage: Integer;
  const SkeepEmpty: Boolean = False);
var
  i, c: Integer;
begin
  sl.BeginUpdate;
  sl.Clear;
  sl.LoadFromFile(FileName);
  c := sl.Count - 1;
  i := 0;
  while i<=c do
  begin
    if (SkeepEmpty) and (Trim(sl[i]).IsEmpty) then
    begin
      sl.delete(i);
      c := c - 1;
    end
    else
    begin
      if CodePage = 0 then
        sl[i] := OemToAnsiStr(sl[i]);
      i := i + 1;
    end;
  end;
  sl.EndUpdate;
end;

// показать файл в стринггриде
procedure ShowFileInStringGrid(sgFile: TStringGrid; const FileName: string; const CodePage: Integer;
  const SkeepEmpty: Boolean = False);
var
  tmp: TStringList;
  i, w: Integer;
begin
  if Length(FileName) = 0 then
    Exit;
  if (not fileexists(FileName)) then
    Exit;

  tmp := TStringList.Create;
  try
    // tmp.LoadFromFile(FileName);
    FileToStrings(FileName, tmp, CodePage, SkeepEmpty);
    sgFile.ColCount := 3;
    sgFile.RowCount := tmp.Count;
    sgFile.FixedCols := 2;
    sgFile.FixedRows := 0;
    w := 30;
    for i := 0 to sgFile.RowCount - 1 do
    begin
      sgFile.RowHeights[i] := sgFile.Canvas.TextHeight('Ig') + 5;
      sgFile.Cells[0, i] := IntToStr(i + 1);
      sgFile.Cells[1, i] := IntToStr(i - sgFile.RowCount + 1);
      sgFile.Cells[2, i] := tmp[i];
      if (w < sgFile.Canvas.TextWidth(tmp[i])) then
        w := sgFile.Canvas.TextWidth(tmp[i]);
    end;
    sgFile.ColWidths[1] := sgFile.Canvas.TextWidth('-' + IntToStr(sgFile.RowCount - 1)) + 5;
    sgFile.ColWidths[0] := sgFile.Canvas.TextWidth(IntToStr(sgFile.RowCount - 1)) + 5;
    if sgFile.Width < (w + sgFile.ColWidths[0] + sgFile.ColWidths[1]) then
      sgFile.ColWidths[2] := w + 5
    else
      sgFile.ColWidths[2] := sgFile.Width - (sgFile.ColWidths[0] + sgFile.ColWidths[1]) - 20;
  finally
    FreeAndNil(tmp);
  end;
end;

end.
