unit amSplitter;
// -----------------------------------------------------------------------------
// TSplitter enhanced with grab bar
// The original author is Anders Melander, anders@melander.dk, http://melander.dk
// Copyright © 2008 Anders Melander
// -----------------------------------------------------------------------------
// License:
// Creative Commons Attribution-Share Alike 3.0 Unported
// http://creativecommons.org/licenses/by-sa/3.0/
// -----------------------------------------------------------------------------
 
interface
 
uses
  ExtCtrls;
 
//------------------------------------------------------------------------------
//
//      TSplitter enhanced with grab bar
//
//------------------------------------------------------------------------------
type
  TSplitter = class(ExtCtrls.TSplitter)
  protected
    procedure Paint; override;
  end;
 
implementation
 
uses
  Windows, Graphics, Controls, Classes;
 
//------------------------------------------------------------------------------
//
//      TSplitter enhanced with grab bar
//
//------------------------------------------------------------------------------
procedure TSplitter.Paint;
var
  R: TRect;
  X, Y: integer;
  DX, DY: integer;
  i: integer;
  Brush: TBitmap;
begin
  R := ClientRect;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(ClientRect);
 
  X := (R.Left+R.Right) div 2;
  Y := (R.Top+R.Bottom) div 2;
  if (Align in [alLeft, alRight]) then
  begin
    DX := 0;
    DY := 3;
  end else
  begin
    DX := 3;
    DY := 0;
  end;
  dec(X, DX*2);
  dec(Y, DY*2);
 
  Brush := TBitmap.Create;
  try
    Brush.SetSize(2, 2);
    Brush.Canvas.Brush.Color := clBtnHighlight;
    Brush.Canvas.FillRect(Rect(0,0,1,1));
    Brush.Canvas.Pixels[0, 0] := clBtnShadow;
    for i := 0 to 4 do
    begin
      Canvas.Draw(X, Y, Brush);
      inc(X, DX);
      inc(Y, DY);
    end;
  finally
    Brush.Free;
  end;
 
end;
 
end.