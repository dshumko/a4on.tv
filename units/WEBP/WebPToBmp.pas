program WebPToBmp;

{$mode delphi}

uses
  Interfaces,
  SysUtils,
  Classes,
  Graphics,
  IntfGraphics,
  GraphType, WebpImageX;

const
  SrcDir = 'SAMPLES';     //webp files
  DstDir = 'SAMPLES_BMP'; //here will land incorrectly decoded images
  XnDir = 'SAMPLES_XN';   //webp files converted to bmp by a PROPER tool


type
  PRGB32 = ^TRGB32;
  TRGB32 = packed record
    B: Byte;
    G: Byte;
    R: Byte;
    A: Byte;
  end;

  PRGB24 = ^TRGB24;
  TRGB24 = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;

function ByteDiff(A, B: Byte): Integer;
begin
  Result := Abs(Integer(A) - Integer(B));
end;

function SameBitmapRGBTolerance(Bmp1, Bmp2: TBitmap; Tolerance: Integer = 5): Boolean;
var
  X, Y: Integer;
  Row1, Row2: PRGB32;
  P1, P2: PRGB32;
begin
  Result := False;

  for Y := 0 to Bmp1.Height - 1 do
  begin
    Row1 := PRGB32(Bmp1.ScanLine[Y]);
    Row2 := PRGB32(Bmp2.ScanLine[Y]);

    for X := 0 to Bmp1.Width - 1 do
    begin
      P1 := Row1;
      P2 := Row2;

      if (ByteDiff(P1^.R, P2^.R) > Tolerance) or
         (ByteDiff(P1^.G, P2^.G) > Tolerance) or
         (ByteDiff(P1^.B, P2^.B) > Tolerance) or
         (ByteDiff(P1^.A, P2^.A) > Tolerance) then
        Exit(False);

      Inc(Row1);
      Inc(Row2);
    end;
  end;

  Result := True;
end;

function SameBitmapRGBTolerance24(Bmp1, Bmp2: TBitmap; Tolerance: Integer = 5): Boolean;
var
  X, Y: Integer;
  Row1: PRGB32;
  Row2: PRGB24;
  P1: PRGB32;
  P2: PRGB24;
begin
  Result := False;

  for Y := 0 to Bmp1.Height - 1 do
  begin
    Row1 := PRGB32(Bmp1.ScanLine[Y]);
    Row2 := PRGB24(Bmp2.ScanLine[Y]);

    for X := 0 to Bmp1.Width - 1 do
    begin
      P1 := Row1;
      P2 := Row2;

      if (ByteDiff(P1^.R, P2^.R) > Tolerance) or
         (ByteDiff(P1^.G, P2^.G) > Tolerance) or
         (ByteDiff(P1^.B, P2^.B) > Tolerance) then
        Exit(False);

      Inc(Row1);
      Inc(Row2);
    end;
  end;

  Result := True;
end;

procedure ConvertWebPToBmp(const SrcFile, XnFile, DstFile: string);
var
  Webp: TwebpImage;
  Bmp: TBitmap;
  Bmp2: TBitmap;
begin
  Webp := TwebpImage.Create;

  try
    Webp.LoadFromFile(SrcFile);
    Bmp := Webp.ToBitmap;

    Bmp2 := TBitmap.Create;
    Bmp2.LoadFromFile(XnFile);

    //compare
    if Bmp2.PixelFormat = pf24bit then begin
      if not SameBitmapRGBTolerance24(Bmp, Bmp2, 5) then Bmp.SaveToFile(DstFile);
    end
    else begin
      if not SameBitmapRGBTolerance(Bmp, Bmp2, 1) then Bmp.SaveToFile(DstFile);
    end;

  finally
    Bmp2.Free;
    Webp.Free;
  end;
end;

var
  SR: TSearchRec;
  SrcPath: string;
  DstPath: string;
  XnPath: String;
begin
  if not DirectoryExists(SrcDir) then
  begin
    Writeln('No such dir: ', SrcDir);
    Halt(1);
  end;

  ForceDirectories(DstDir);

  if FindFirst(IncludeTrailingPathDelimiter(SrcDir) + '*.webp', faAnyFile, SR) = 0 then
  begin
    try
      repeat
        if (SR.Attr and faDirectory) = 0 then
        begin
          SrcPath := IncludeTrailingPathDelimiter(SrcDir) + SR.Name;
          DstPath := IncludeTrailingPathDelimiter(DstDir) + ChangeFileExt(SR.Name, '.bmp');
          XnPath := IncludeTrailingPathDelimiter(XnDir) + ChangeFileExt(SR.Name, '.bmp');

          try
            ConvertWebPToBmp(SrcPath, XnPath, DstPath);
          except
            on E: Exception do
              Writeln('ERROR: ', SrcPath, ' : ', E.Message);
          end;
        end;
      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end
  else
    Writeln('No webp files inside ', SrcDir);
end.