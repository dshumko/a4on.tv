unit TetrisForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type

  TBig = array [0 .. 0] of Integer;

  TPanelColor = Record // ������ ������
    R1, G1, B1, R2, G2, B2: Byte; //���� ������
  end;

  TPixelToClear = Record // ������� ������
    mX, mY: ShortInt; // ����������� �������
    R1, G1, B1: Byte; // ���� �������
    cTop, cLeft: Word; // ��������� ������
  end;

  TObjectColor = Record // ������
    Top, Left:     ShortInt; // ��������� ������
    Height, Width: Byte; // ����������� ������
    PanelColor:    TPanelColor; // ���������� � ���������� � �����
    PanelArray: array of array of Boolean;
    Visible:       Boolean;
  end;

  TFormPanelColor = Record // ������ �� �����
    Visible:    Boolean; // ��������� (���� ���, ������ ������ ������������)
    PanelColor: TPanelColor; // ���������� � ���������� � �����
  end;

  TFormTetris = class(TForm)
    TimerFPS: TTimer;
    TimerGravity: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerFPSTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerGravityTimer(Sender: TObject);
  private
    { Private declarations }
    Scr: Pointer; // ���������
    ScrBitmap: TBitmap; // BitMap ��� ������� ����������
    CanvaGamePanel: array of array of TColor; // ������ �������� �������
    // ���������� ������� ����
    GameOver: Boolean; // ���� ���������?
    CurrGamePause: Boolean; // �����?
    CurScore, CurLevel, CurLines: String;
    // ������� (������)
    ObjectColorCurr, // ������� �������� ������
    ObjectColorBuff, // ���������� ��� ��������� ������� � ����� ������
    ObjectColorCapt, // ������ � �������
    ObjectColorShad, // ���� �������� ������ (����������, ���� ������ �������� ������ ���� � �������)
    ObjectColorNext: TObjectColor; // ��������� ������
    // ������ ������������� �������
    FormPanelColor: array of array of TFormPanelColor;
    // ������ ��������� ����� (�����������)
    PixelToClear: array of array of array of array of TPixelToClear;
    yNumLines: Byte; // ���-�� ��������� �����
  public
    { Public declarations }
    function IncScore(const n: Word; const InScore: String): String; // �����������/���������� �����
    procedure CreateScrBitMap(BitMapH, BitMapW: Integer); // ��������� ������ ��� BitMap
    procedure RefreshBackGround; // ����������� ����
    procedure PaintGrid; // ��������� �����
    procedure FillBackGround; // ������� ������� �����
    procedure SetLengthCanvaGamePanel; // ��������� ������� ������� �������� �������
    Procedure PaintingAllPanels; // ����������� �������
    procedure CreateNextObjectColor(NumObj: Byte); // ������� ����� "��������� �������"
    procedure PaintClockFace(const sNumber: string; const cLeft, cHeight: Word; R, G, B: Byte; const VisibleZero: Boolean); // ������ ���������
    procedure WriteText; // ������� �������
    procedure SetLengthFormPanelColor; // ������� ������ ������� �� ������� ������
    procedure MoweObjectColor(mw: Byte); // ����� �������� ��� ����������� �������
    procedure ReStartGame; // ������� ����
    procedure ChangeObjectColor; //����������� "�������� ������" � "����������� ������"
    procedure TurnObjectColor(angle: ShortInt); //������� ������ �� �������� ����
    procedure EraseLinePanel; // ��������� �������� ����������� ����� �� �������
    function DropObject(MyObjectColor: TObjectColor): TObjectColor; // ��������� ��������� ������ ��� ����� ����
    procedure ReShowScore; // ������� ���������� � �� ��������
    procedure CalculateLevel(SumLines: Word);
  end;

//var
  //FormTetris: TFormTetris;

implementation

const
  PanelColorH = 24; // ������ ������
  PanelColorW = 24; // ������ ������
  PanelColorSummH = 20; // ���-�� ������� � ������
  PanelColorSummW = 10; // ���-�� ������� � ������
  FrameDepth = 20; // ������� �����
  PanelGameH = PanelColorH * PanelColorSummH + PanelColorSummH; // ������ �������� ����
  PanelGameW = PanelColorW * PanelColorSummW + PanelColorSummW; // ������ �������� ����
  PanelInfoH = PanelGameH; // ������ ���� ����
  PanelInfoW = (PanelColorW + 1) * 6; // ������ ���� ����
  FormH = PanelGameH + FrameDepth * 2; // ������ ����� (�������� �����)
  FormW = PanelGameW + FrameDepth * 4 + PanelInfoW; // ������ ����� (�������� �����)
  StepSplashingH = 3; // �����/������� ��������� ����� (������ ������)
  StepSplashingW = StepSplashingH;

{$R *.dfm}

function TFormTetris.IncScore(const n: Word; const InScore: String): String;
var
  MyScore: Word;
  OutScore: string;
begin
  MyScore := StrToInt(InScore);
  Inc(MyScore, n);
  OutScore := IntToStr(MyScore);
  while Length(OutScore) < 8 do
    OutScore := '0' + OutScore;
  result := OutScore;
end;

function TFormTetris.DropObject(MyObjectColor: TObjectColor): TObjectColor;
var
  x, y: Byte;
  cX, cY: ShortInt;
  CanMowe: Boolean;
  Label NextMoweObjectColor;
begin
  NextMoweObjectColor: // ���� �� ����������, ���������� !!! =D
  CanMowe := true; // �����������, ��� ������ ����� ������������ ����
  with MyObjectColor do
    // ���� ������ �����
    if Visible then begin
      for x := 0 to Width - 1 do begin
        // ���� ��� �������� ��� ������ �� ����� ��������� ����, ������ �� �����
        if not CanMowe then
          Break;
        // �����, ���������� ���������
        for y := 0 to Height - 1 do begin
          // �������� ���������� �� 1-� ���� �������
          cX := Left + x;
          cY := Top + y + 1;
          // ���� � ������ ������ ������� ������ ���� ������
          if PanelArray[x, y] = true then begin
            if cY < 0 then
              cY := 0;
            if (cX < 0) or (cX > PanelColorSummW - 1) then
              cX := 0;
            if (cY > PanelColorSummH - 1) or
               (FormPanelColor[cX, cY].Visible) then
            begin
              CanMowe := false;
              Break;
            end;
          end;
        end;
      end;
    end;
  // ���� ��� ������� ������ �� ���������
  if CanMowe then
  begin
    with MyObjectColor do
      if Visible then
        // ������� � ����
        inc(Top);
    // � �������� ������, ���� �� ������ ��� ��� ���-������?
    goto NextMoweObjectColor;
  end;

  result := MyObjectColor;
end;

procedure TFormTetris.CalculateLevel(SumLines: Word);
var
  SumLinesToNextLVL: Word;
  i: Byte;
begin
  SumLinesToNextLVL := 10;
  CurLevel := '00000001';
  i := 1;
  while SumLinesToNextLVL < SumLines do
  begin
    inc(i);
    SumLinesToNextLVL := SumLinesToNextLVL + i * 10;
    CurLevel := IncScore(1, CurLevel);
  end;
end;

procedure TFormTetris.EraseLinePanel;
var
  x, y, Ymy: Byte;
  iW, iH, pixelR, pixelG, pixelB: Byte;
  cLeft, cTop: Word;
  yErase: array of Byte;
  FindLine: Boolean;
  StepH, StepW: ShortInt;
begin

  yNumLines := 0;
  // ���������� �� ������� ������ � ���
  for y := 0 to PanelColorSummH - 1 do
  begin
    // ���������� ������ ����� ������� �� �������������
    FindLine := true;
    for x := 0 to PanelColorSummW - 1 do
    begin
      if not FormPanelColor[x,y].Visible then
      begin
        FindLine := false;
        Break;
      end;
    end;
    // ���������, ��� �����?
    if FindLine = true then
    begin
      inc(yNumLines); // ���-�� ����� �� ��������
      CurScore := IncScore(200, CurScore); // ����� �� �������� ����, ����������� ����
      SetLength(yErase, yNumLines);
      yErase[yNumLines - 1] := y; // ��������� ����� �� ��������
    end;
  end;
  //���� ����������� ����� ���, ������� �� ���������
  if yNumLines = 0 then
    Exit;

  CurLines := IncScore(yNumLines, CurLines); //�������� ���� �� 1

  // ��������� ������� ������� ����
  CalculateLevel(StrToInt(CurLines));
  TimerGravity.Interval := 800 - (StrToInt(CurLevel) - 1) * 40;

  // ��������� ����� �� �������� � ������ � ������� �� ����
  for x := 0 to PanelColorSummW - 1 do
  begin
    cLeft := FrameDepth + PanelColorW * x + x + 1;
    for y := yNumLines - 1 downto 0 do
    begin
      yMy := yErase[y];
      cTop  := FrameDepth + PanelColorH * yMy + yMy + 1;
      for iW := 0 to PanelColorW - 1 do begin
        //
        StepW := ((iW + 1) - (PanelColorW div 2)) div StepSplashingW;
        //
        for iH := 0 to PanelColorH - 1 do
        begin
          //
          StepH := (iH + 1 - (PanelColorH div 2)) div StepSplashingH;
          //������� ���� �������
          PixelR := GetRValue(ScrBitmap.Canvas.Pixels[cLeft + iW + 1, cTop + iH + 1]);
          PixelG := GetGValue(ScrBitmap.Canvas.Pixels[cLeft + iW + 1, cTop + iH + 1]);
          PixelB := GetBValue(ScrBitmap.Canvas.Pixels[cLeft + iW + 1, cTop + iH + 1]);
          // ������� �������� � ������

          { ������ � 1 "�������" }
          {PixelToClear[x, y, iW, iH].mX := ((PanelColorW div 2) - iW) div 3;
          PixelToClear[x, y, iW, iH].mY := (PanelColorH div 2) - iH; }

          { ������ � 2 "��������������" }
          PixelToClear[x, y, iW, iH].mX := StepW * 2;
          PixelToClear[x, y, iW, iH].mY := StepH - 6;

          PixelToClear[x, y, iW, iH].R1 := PixelR;
          PixelToClear[x, y, iW, iH].G1 := PixelG;
          PixelToClear[x, y, iW, iH].B1 := PixelB;
          PixelToClear[x, y, iW, iH].cTop  := cTop + iH;
          PixelToClear[x, y, iW, iH].cLeft := cLeft + iW;
        end;
      end;
      // ������� ������ (������ ���������)
      FormPanelColor[x,yMy].Visible := false;
    end;
  end;

  //�������� ������ ������ ����
  for x := 0 to PanelColorSummW - 1 do
  begin
    for y := yErase[yNumLines - 1] downto yNumLines - 1 do
    begin
      if FormPanelColor[x,y - yNumLines].Visible then begin
        FormPanelColor[x,y] := FormPanelColor[x,y - yNumLines];
        FormPanelColor[x,y - yNumLines].Visible := false;
      end;
    end;
  end;

end;

procedure TFormTetris.TurnObjectColor(angle: ShortInt);

  procedure TurnObject(b: Boolean);
  var
    x, y: Byte;
    cX, cY: ShortInt;
    CanMowe: Boolean;
  begin
    if not ObjectColorCurr.Visible then // ���� ������ �� �����, ������� �� ���������
      Exit;
    // �����������, ��� ������ ����� ������������
    CanMowe := true;
    // �������� ������ � ����� �������
    ObjectColorBuff := ObjectColorCurr;
    // ������ �������� ������ �� ������ � ��������
    ObjectColorBuff.Height := ObjectColorCurr.Width;
    ObjectColorBuff.Width  := ObjectColorCurr.Height;
    SetLength(ObjectColorBuff.PanelArray, ObjectColorBuff.Width, ObjectColorBuff.Height);
    // �������� ������������ ������ � ������ ������, ���� ����������� Left � Top
    ObjectColorBuff.Top  := ObjectColorCurr.Top  + ObjectColorCurr.Height - ObjectColorBuff.Height;
    ObjectColorBuff.Left := ObjectColorCurr.Left + ObjectColorCurr.Width  - ObjectColorBuff.Width;

    // ����������� ���������� ������
    with ObjectColorCurr do
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if b then // ������������ ������ ������ ������� �������
            ObjectColorBuff.PanelArray[y, (Width - 1) - x] :=  ObjectColorCurr.PanelArray[x,y]
            else // ������������ ������ �� ������� �������
              ObjectColorBuff.PanelArray[(Height - 1) - y, x] :=  ObjectColorCurr.PanelArray[x,y];

    // �������������� ������, ��������, ��������-�� ����� ��������� ������?
    with ObjectColorBuff do
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          // ���� � ������ ������ ������� ���� ������
          if PanelArray[x, y] = true then begin
            cX := Left + x;
            cY := Top  + y;
            // ���� ������ ���� �������, ���� ��������� ���������� ������
            if cY < 0 then
              cY := 0;
            // ��������� �� ����������� ���������������
            if (cX < 0) or (cX > PanelColorSummW - 1) then
            begin
              CanMowe := false;
              break;
            end;
            if FormPanelColor[cX, cY].Visible then
            begin
              CanMowe := false;
              break;
            end;
          end;

    // ���� ����� ��������� ������� ��������
    if CanMowe then // ��������� ����������������� ������ �� ������ ������� � "�������� ������"
      ObjectColorCurr := ObjectColorBuff;
  end;

begin
  case angle of
     90: TurnObject(false);
    -90: TurnObject(true);
  end;
  MoweObjectColor(5); // ����������� ����
end;

procedure TFormTetris.MoweObjectColor(mw: Byte);

  procedure FreezeObject;  // ������������ ������
  var
    x, y: Byte;
  begin
    for x := 0 to ObjectColorCurr.Width - 1 do
      for y := 0 to ObjectColorCurr.Height - 1 do
        // ���� � ������ ������ ������� ���� ������
        if ObjectColorCurr.PanelArray[x, y] = true then
          with FormPanelColor[x + ObjectColorCurr.Left, y + ObjectColorCurr.Top] do
          begin
            Visible := true;
            with PanelColor do
            begin
              R1 := ObjectColorCurr.PanelColor.R1;
              G1 := ObjectColorCurr.PanelColor.G1;
              B1 := ObjectColorCurr.PanelColor.B1;
              R2 := ObjectColorCurr.PanelColor.R2;
              G2 := ObjectColorCurr.PanelColor.G2;
              B2 := ObjectColorCurr.PanelColor.B2;
            end;
          end;
    // �������� ����� "�������� ������" �� "��������� ������"
    ObjectColorCurr := ObjectColorNext;
    // ���������� "��������� ������"
    CreateNextObjectColor(random(7));
    // ���������, ���� �� ����������� ����� ��� ��������
    EraseLinePanel;
  end;

  procedure MoweDownObject;
  var
    x, y: Byte;
    cX, cY: ShortInt;
    CanMowe: Boolean;
  begin
    CanMowe := true; // �����������, ��� ������ ����� ������������ ����
    with ObjectColorCurr do
      // ���� ������ �����
      if Visible then
        for x := 0 to Width - 1 do
          for y := 0 to Height - 1 do
            // ���� � ������ ������ ������� ���� ������
            if PanelArray[x, y] = true then begin
              cX := Left + x;
              cY := Top  + y + 1;
              if cY < 0 then
                cY := 0;
              if (cX < 0) or (cX > PanelColorSummW - 1) then
                cX := 0;
              if cY > PanelColorSummH - 1 then
              begin
                CanMowe := false;
                break;
              end;
              if FormPanelColor[cX, cY].Visible then
              begin
                // "�������� ������" �� ����� ���������� ����
                CanMowe := false;
                //��������, � ����-�� ����� ��� ������ ����� � �������������...
                if cY = 0 then
                  GameOver := true;
                break;
              end;
            end;
    // �������������� �������� � �������
    if ObjectColorCurr.Visible and not GameOver then
      if CanMowe then
      begin
        // ���������� ������ �� ������ ����
        with ObjectColorCurr do
          inc(Top);
      end else
      begin
        // ������������ ������
        FreezeObject;
      end;
  end;

  procedure MoweLeftOrRightObject(n: ShortInt);
  var
    x, y: Byte;
    cX, cY: ShortInt;
    CanMowe: Boolean;
  begin
    CanMowe := true; // �����������, ��� ������ ����� ������������ � ����
    with ObjectColorCurr do
      // ���� ������ �����
      if Visible then
        for x := 0 to Width - 1 do
          for y := 0 to Height - 1 do
            // ���� � ������ ������ ������� ���� ������
            if PanelArray[x, y] = true then begin
              cX := Left + x + n;
              cY := Top  + y;
              // ���� ������ ���� �������, ���� ��������� ���������� ������
              if cY < 0 then begin
                cY := 0;
                //cX := 0;
              end;
              //
              if (cX < 0) or (cX > PanelColorSummW - 1) then
              begin
                CanMowe := false;
                break;
              end;
              if FormPanelColor[cX, cY].Visible then
              begin
                CanMowe := false;
                break;
              end;
            end;
    // �������������� �������� � �������
    if CanMowe and ObjectColorCurr.Visible then
    begin
      // ���������� ������ �� ������ ����
      with ObjectColorCurr do
        inc(Left, n);
    end;
  end;

  procedure DroppingObject;
  begin
    // �������� ������ ��� ����� ����
    ObjectColorBuff := DropObject(ObjectColorCurr);
    // ������� ����
    CurScore := IncScore(ObjectColorBuff.Top - ObjectColorCurr.Top, CurScore);
    // ��������� ������� �� ������ �����
    ObjectColorCurr := ObjectColorBuff;
    // �������������� �������� � �������
    FreezeObject;
  end;

  procedure ShowShandow;
  begin
    ObjectColorShad := ObjectColorCurr;
    // �������� ���� ������ ��� ����� ����
    ObjectColorShad := DropObject(ObjectColorShad);
  end;

begin

  case mw of
  0: MoweDownObject; // ����������� "�������� ������" � ���
  1: MoweLeftOrRightObject(-1); // ����������� "�������� ������" � ����
  2: MoweLeftOrRightObject(1); // ����������� "�������� ������" � �����
  3: MoweDownObject; // ����������� "�������� ������" � ���
  4: DroppingObject; // ���������� ����������� "�������� ������" (����� :) )
  end;

  ShowShandow; // ���������� ���� ������

end;

procedure TFormTetris.CreateNextObjectColor(NumObj: Byte);

  procedure ClearArray(cWidth, cHeight: Byte);
  var
    x, y: Byte;
  begin
    for x := 0 to cWidth - 1 do
      for y := 0 to cHeight - 1 do
        ObjectColorNext.PanelArray[x,y] := false;
  end;

begin
  with ObjectColorNext do begin
    Visible := true;
    case NumObj of
      0:
      begin
        //��������� �����������
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // �������� ��������� �������
        ClearArray(Width, Height);
        // ����������, ��� ��������� ������
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[1,1] := true;
        PanelArray[2,1] := true;
        //�������� �������
        with PanelColor do begin
          R1 := 100;  R2 := 0; //156/56
          G1 := 143;  G2 := 43; //160/60
          B1 := 121;  B2 := 21; //164/64
        end;
      end;
      1:
      begin
        //��������� �����������
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // �������� ��������� �������
        ClearArray(Width, Height);
        // ����������, ��� ��������� ������
        PanelArray[0,1] := true;
        PanelArray[1,1] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        //�������� �������
        with PanelColor do begin
          R1 := 104;  R2 := 4; //161/61
          G1 := 166;  G2 := 66; //198/98
          B1 := 117;  B2 := 17; //172/72
        end;
      end;
      2:
      begin
        //��������� �����������
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // �������� ��������� �������
        ClearArray(Width, Height);
        // ����������, ��� ��������� ������
        PanelArray[1,0] := true;
        PanelArray[0,1] := true;
        PanelArray[1,1] := true;
        PanelArray[2,1] := true;
        //�������� �������
        with PanelColor do begin
          R1 := 237;  R2 := 138; //247/147
          G1 := 128;  G2 := 28;  //176/76
          B1 := 106;  B2 := 6;  //154/54
        end;
      end;
      3:
      begin
        //��������� �����������
        Height := 2;  Top  := - Height;
        Width  := 2;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // �������� ��������� �������
          {"�������" �������� ��� ���������� ������������, �������� ������}
        // ����������, ��� ��������� ������
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[0,1] := true;
        PanelArray[1,1] := true;
        //�������� �������
        with PanelColor do begin
          R1 := 163;  R2 := 63; //198/98
          G1 := 133;  G2 := 33; //171/71
          B1 := 135;  B2 := 35; //179/79
        end;
      end;
      4:
      begin
        //��������� �����������
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // �������� ��������� �������
        ClearArray(Width, Height);
        // ����������, ��� ��������� ������
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        PanelArray[2,1] := true;
        //�������� �������
        with PanelColor do begin
          R1 := 160;  R2 := 60;  //166/66
          G1 := 101;  G2 := 1;   //161/61
          B1 := 225;  B2 := 125; //252/152
        end;
      end;
      5:
      begin
        //��������� �����������
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // �������� ��������� �������
        ClearArray(Width, Height);
        // ����������, ��� ��������� ������
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        PanelArray[0,1] := true;
        //�������� �������
        with PanelColor do begin
          R1 := 206;  R2 := 106; //159/59
          G1 := 110;  G2 := 10;  //209/109
          B1 := 252;  B2 := 152; //255/155
        end;
      end;
      6:
      begin
        //��������� �����������
        Height := 1;  Top  := - Height;
        Width  := 4;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // �������� ��������� �������
          {"�����" �������� ��� ���������� ������������, �������� ������}
        // ����������, ��� ��������� ������
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        PanelArray[3,0] := true;
        //�������� �������
        with PanelColor do begin
          R1 := 137;  R2 := 37;  //243/143
          G1 := 122;  G2 := 22;  //160/60
          B1 := 234;  B2 := 134; //196/96
        end;
      end;
    end;
  end;
end;

procedure TFormTetris.PaintingAllPanels;

  procedure PaintingPanel(R1, G1, B1, R2, G2, B2: Byte; cLeft, cTop, cHeight, cWidth: Word);
  var
    y: integer;
  begin
    // �������� ����������
    for y:=0 to cHeight do
      with ScrBitmap.Canvas do
      begin
        Pen.Color:=RGB(R1 - (R1 - R2) div cHeight * y,
                       G1 - (G1 - G2) div cHeight * y,
                       B1 - (B1 - B2) div cHeight * y);
        MoveTo(cLeft + 1, cTop + y + 1);
        LineTo(cLeft + cWidth + 1, cTop + y + 1);
      end;
    // ������ ������� �����
    ScrBitmap.Canvas.Pen.Color := RGB(R2, G2, B2);
    ScrBitmap.Canvas.Moveto(cLeft, cTop + 1);
    ScrBitmap.Canvas.LineTo(cLeft + 1, cTop);
    ScrBitmap.Canvas.LineTo(cLeft + PanelColorW - 2, cTop);
    ScrBitmap.Canvas.LineTo(cLeft + PanelColorW - 1, cTop + 1);
    ScrBitmap.Canvas.LineTo(cLeft + PanelColorW - 1, cTop + PanelColorH - 2);
    ScrBitmap.Canvas.LineTo(cLeft + PanelColorW - 2, cTop + PanelColorH - 1);
    ScrBitmap.Canvas.LineTo(cLeft + 1, cTop + PanelColorH - 1);
    ScrBitmap.Canvas.LineTo(cLeft, cTop + PanelColorH - 2);
    ScrBitmap.Canvas.LineTo(cLeft, cTop + 1);
  end;

  procedure PaintingPixel(R1, G1, B1: Byte; cLeft, cTop: Word);
  begin
    with ScrBitmap.Canvas do
      Pixels[cLeft, cTop] := RGB(R1, G1, B1);
  end;

var
  x, y, iW, iH: Byte;
  cTop, cLeft: integer;
begin
  // ����������� ��������������� �������
  for x := 0 to PanelColorSummW - 1 do
    for y := 0 to PanelColorSummH - 1 do
      if FormPanelColor[x,y].Visible then
      begin
        // �������� �� ��������� ������� ������
        cLeft := FrameDepth + PanelColorW * x + x;
        cTop  := FrameDepth + PanelColorH * y + y;
        // ������ ��������������� ��������
        with FormPanelColor[x,y].PanelColor do
          PaintingPanel(R1, G1, B1, R2, G2, B2,
                        cLeft, cTop,
                        PanelColorH - 3, PanelColorW - 2);
      end;

  // ����������� "��������� ������"
  cTop  := FrameDepth + (PanelColorH + 1) * 9;
  cLeft := FrameDepth * 3 + (PanelColorW + 1) * (PanelColorSummW + 1);
  with ObjectColorNext do
    if ObjectColorNext.Visible then // ���� ������ ������... �� , ������ ����� :)
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if PanelArray[x,y] = true then
            with PanelColor do
              PaintingPanel(R1, G1, B1, R2, G2, B2,
                            cLeft + (x + (4 - ObjectColorNext.Width)  div 2) * (PanelColorW + 1),
                            cTop  + (y + (4 - ObjectColorNext.Height) div 2) * (PanelColorH + 1),
                            PanelColorH - 3, PanelColorW - 2);

  // ����������� "����������� ������"
  cTop  := FrameDepth + (PanelColorH + 1) * 15;
  cLeft := FrameDepth * 3 + (PanelColorW + 1) * (PanelColorSummW + 1);
  with ObjectColorCapt do
    if ObjectColorCapt.Visible then // ���� ������ ������... �� , ������ ����� :)
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if PanelArray[x,y] = true then
            with PanelColor do
              PaintingPanel(R1, G1, B1, R2, G2, B2,
                            cLeft + (x + (4 - ObjectColorCapt.Width)  div 2) * (PanelColorW + 1),
                            cTop  + (y + (4 - ObjectColorCapt.Height) div 2) * (PanelColorH + 1),
                            PanelColorH - 3, PanelColorW - 2);
  {
  // ����������� ���� �������� ��������
  cTop  := FrameDepth + (PanelColorH + 1) * ObjectColorShad.Top;
  cLeft := FrameDepth + (PanelColorW + 1) * ObjectColorShad.Left;
  with ObjectColorShad do
    if Visible then // ���� ������ ������... �� , ������ ����� :)
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if PanelArray[x,y] = true then
            with PanelColor do   //R1 - (R1 - R2) div cHeight
              PaintingPanel(R1 - (R1 - 120) div 2,
                            G1 - (G1 - 120) div 2,
                            B1 - (B1 - 120) div 2,
                            R2 - (R2 - 120) div 2,
                            G2 - (G2 - 120) div 2,
                            B2 - (B2 - 120) div 2,
                            cLeft + x * (PanelColorW + 1),
                            cTop  + y * (PanelColorH + 1),
                            PanelColorH - 3, PanelColorW - 2);
  }
  // ����������� �������� ��������
  cTop  := FrameDepth + (PanelColorH + 1) * ObjectColorCurr.Top;
  cLeft := FrameDepth + (PanelColorW + 1) * ObjectColorCurr.Left;
  with ObjectColorCurr do
    if Visible then // ���� ������ ������... �� , ������ ����� :)
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if PanelArray[x,y] = true then
            with PanelColor do
              PaintingPanel(R1, G1, B1, R2, G2, B2,
                            cLeft + x * (PanelColorW + 1),
                            cTop  + y * (PanelColorH + 1),
                            PanelColorH - 3, PanelColorW - 2);

  // ����������� ������� �������� �����
  if yNumLines > 0 then
    for x := 0 to PanelColorSummW - 1 do
    begin
      for y := yNumLines - 1 downto 0 do
      begin
        for iW := 0 to PanelColorW - 1 do
        begin
          for iH := 0 to PanelColorH - 1 do
          begin
            with PixelToClear[x, y, iW, iH] do begin
              // ������ �������
              PaintingPixel(R1,G1,B1,cLeft,cTop);
              // ������������� ��������� �������
              inc(cTop, mY);
              inc(cLeft, mX);
              // ����������� ����������
              if mY<12 then inc(mY);
              // ��������� ������������ �������
              if not mX=0 then
                if mx<0 then
                  inc(mX)
                  else
                    dec(mX);
            end;
          end;
        end;
      end;
    end;
end;

procedure TFormTetris.RefreshBackGround;
var
  X, Y: word;
begin
  // ����������� ����� ����
  for X := 0 to FormW - 1 do
    for Y := 0 to FormH - 1 do
      TBig(Scr^)[X + Y * FormW] := RGB(GetRValue(CanvaGamePanel[X, Y]),
        GetGValue(CanvaGamePanel[X, Y]), GetBValue(CanvaGamePanel[X, Y]));
end;

procedure TFormTetris.PaintClockFace(const sNumber: string; const cLeft, cHeight: Word;
    R, G, B: Byte; const VisibleZero: Boolean);

  procedure PaintLineW(iLeft, iTop, iWidth: Word);
  var
    x: word;
  begin
    for x := iLeft to iLeft + iWidth do
      CanvaGamePanel[x, iTop] := RGB(B, G, R);
  end;

  procedure PaintLineH(iLeft, iTop, iHeight: Word);
  var
    y: word;
  begin
    for y := iTop to iTop + iHeight do
      CanvaGamePanel[iLeft, y] := RGB(B, G, R);
  end;

  procedure PaintUp(iLeft, iTop: Word);
  begin
    PaintLineW(iLeft + 1, iTop, 11);
    PaintLineW(iLeft + 2, iTop + 1, 9);
    PaintLineW(iLeft + 3, iTop + 2, 7);
  end;

  procedure PaintLeftUp(iLeft, iTop: Word);
  begin
    PaintLineH(iLeft, iTop + 1, 8);
    PaintLineH(iLeft + 1, iTop + 2, 7);
    PaintLineH(iLeft + 2, iTop + 3, 5);
  end;

  procedure PaintRightUp(iLeft, iTop: Word);
  begin
    PaintLineH(iLeft + 13, iTop + 1, 8);
    PaintLineH(iLeft + 12, iTop + 2, 7);
    PaintLineH(iLeft + 11, iTop + 3, 5);
  end;

  procedure PaintMid(iLeft, iTop: Word);
  begin
    PaintLineW(iLeft + 3, iTop + 9, 7);
    PaintLineW(iLeft + 2, iTop + 10, 9);
    PaintLineW(iLeft + 3, iTop + 11, 7);
  end;

  procedure PaintLeftDown(iLeft, iTop: Word);
  begin
    PaintLineH(iLeft, iTop + 11, 9);
    PaintLineH(iLeft + 1, iTop + 11, 8);
    PaintLineH(iLeft + 2, iTop + 12, 6);
  end;

  procedure PaintRightDown(iLeft, iTop: Word);
  begin
    PaintLineH(iLeft + 11, iTop + 12, 6);
    PaintLineH(iLeft + 12, iTop + 11, 8);
    PaintLineH(iLeft + 13, iTop + 11, 9);
  end;

  procedure PaintDown(iLeft, iTop: Word);
  begin
    PaintLineW(iLeft + 3, iTop + 19, 7);
    PaintLineW(iLeft + 2, iTop + 20, 9);
    PaintLineW(iLeft + 1, iTop + 21, 11);
  end;

var
  i, n: Byte;
  MyLeft: Word;
begin
  for i := 1 to 8 do begin
    // �������� �� ��������� �����
    MyLeft := cLeft + (i - 1) * 15;
    // ������ ����� �����
    n := StrToInt(sNumber[i]);
    if (n = 0) and (VisibleZero = false) and (i <= 8 - Length(IntToStr(StrToInt(sNumber)))) then
    begin

    end else
    // ������������ ���������
    case n of
      0:
      begin
        PaintUp(MyLeft, cHeight);
        PaintLeftUp(MyLeft, cHeight);
        PaintRightUp(MyLeft, cHeight);
        PaintLeftDown(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
        PaintDown(MyLeft, cHeight);
      end;
      1:
      begin
        PaintRightUp(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
      end;
      2:
      begin
        PaintUp(MyLeft, cHeight);
        PaintRightUp(MyLeft, cHeight);
        PaintMid(MyLeft, cHeight);
        PaintLeftDown(MyLeft, cHeight);
        PaintDown(MyLeft, cHeight);
      end;
      3:
      begin
        PaintUp(MyLeft, cHeight);
        PaintRightUp(MyLeft, cHeight);
        PaintMid(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
        PaintDown(MyLeft, cHeight);
      end;
      4:
      begin
        PaintLeftUp(MyLeft, cHeight);
        PaintRightUp(MyLeft, cHeight);
        PaintMid(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
      end;
      5:
      begin
        PaintUp(MyLeft, cHeight);
        PaintLeftUp(MyLeft, cHeight);
        PaintMid(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
        PaintDown(MyLeft, cHeight);
      end;
      6:
      begin
        PaintUp(MyLeft, cHeight);
        PaintLeftUp(MyLeft, cHeight);
        PaintMid(MyLeft, cHeight);
        PaintLeftDown(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
        PaintDown(MyLeft, cHeight);
      end;
      7:
      begin
        PaintUp(MyLeft, cHeight);
        PaintRightUp(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
      end;
      8:
      begin
        PaintUp(MyLeft, cHeight);
        PaintLeftUp(MyLeft, cHeight);
        PaintRightUp(MyLeft, cHeight);
        PaintMid(MyLeft, cHeight);
        PaintLeftDown(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
        PaintDown(MyLeft, cHeight);
      end;
      9:
      begin
        PaintUp(MyLeft, cHeight);
        PaintLeftUp(MyLeft, cHeight);
        PaintRightUp(MyLeft, cHeight);
        PaintMid(MyLeft, cHeight);
        PaintRightDown(MyLeft, cHeight);
        PaintDown(MyLeft, cHeight);
      end;
    end;
  end;
end;

procedure TFormTetris.PaintGrid;

  procedure NewGrid(cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW: Word);
  var
    R,G,B: Byte;
    X, Y, I: word; // ��������
    cMyLeft, cMyTop: Word;
  begin
    inc(cMaxW, -1); inc (cMaxH, -1);
    R := 138; G := R; B := R;
    // �� ���������
    for X := 0 to cMaxW do
      begin
        // �������� �� ��������� ������� ������
        cMyLeft := cLeft + (PanelColorW + 1) * X;
        // ������ �����
        for I := cTop to cTop + cHeight - 1 do
          CanvaGamePanel[cMyLeft, I] := RGB(B, G, R);
        // ���� ���� ��������
        if X = cMaxW then
          // ������ ����������� �����
          for I := cTop to cTop + cHeight - 1 do
            CanvaGamePanel[cMyLeft + PanelColorW + 1, I] := RGB(B, G, R);
      end;
    // �� �����������
    for Y := 0 to cMaxH do
      begin
        // �������� �� ��������� ������� ������
        cMyTop  := cTop + (PanelColorH + 1) * Y;
        // ���� ���� ��������
        for I := cLeft to cLeft + cWidth - 1 do
          CanvaGamePanel[I, cMyTop] := RGB(B, G, R);
        if Y = cMaxH then
          // ������ ����������� �����
          for I := cLeft to cLeft + cWidth - 1 do
            CanvaGamePanel[I, cMyTop + (PanelColorH + 1)] := RGB(B, G, R);
      end;
  end;

var
  cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW: Word;
begin
  // ������ ����� �� PanelGame (������� ����)
  cTop    := FrameDepth - 1;
  cLeft   := FrameDepth - 1;
  cHeight := (PanelColorH + 1) * PanelColorSummH;
  cWidth  := (PanelColorW + 1) * PanelColorSummW;
  cMaxH   := PanelColorSummH;
  cMaxW   := PanelColorSummW;
  NewGrid(cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW);

  // ������ 1-� ����� �� PanelInfo (��������� ������)
  cTop    := FrameDepth + (PanelColorH + 1) * 9 - 1;
  cLeft   := FrameDepth * 3 + (PanelColorW + 1) * (PanelColorSummW + 1) - 1;
  cHeight := (PanelColorH + 1) * 4;
  cWidth  := (PanelColorW + 1) * 4;
  cMaxH   := 4;
  cMaxW   := 4;
  NewGrid(cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW);

  // ������ 2-� ����� �� PanelInfo (����������� ������)
  cTop    := FrameDepth + (PanelColorH + 1) * 15 - 1;
  cLeft   := FrameDepth * 3 + (PanelColorW + 1) * (PanelColorSummW + 1) - 1;
  cHeight := (PanelColorH + 1) * 4;
  cWidth  := (PanelColorW + 1) * 4;
  cMaxH   := 4;
  cMaxW   := 4;
  NewGrid(cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW);
end;

procedure TFormTetris.FillBackGround;
var
  X, Y: word; // ��������
  R, G, B: Byte; // ������ ���������
  PanelGameShiftX: word; // �������� �� ��� �
begin

  // ������� �����
  R := 64; G := R; B := R;
  for Y := 0 to FrameDepth - 1 do
  begin
    for X := Y to FormW - Y - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // ������ �����
  R := 64; G := R; B := R;
  for X := FormW - 1 downto FormW - FrameDepth do
  begin
    for Y := FormW - X to FormH - (FormW - X) - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // ������ �����
  R := 64; G := R; B := R;
  for Y := FormH - 1 downto FormH - FrameDepth - 1 do
  begin
    for X := FormW - (FormH - Y) downto FormH - Y - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // ����� �����
  R := 64; G := R; B := R;
  for X := 0 to FrameDepth - 1 do
  begin
    for Y := X to FormH - X - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // ����� �� �������� (������)
  R := 64; G := R; B := R;
  PanelGameShiftX := PanelGameW + FrameDepth * 2;
  for X := PanelGameShiftX to PanelGameShiftX + FrameDepth - 1 do
  begin
    for Y := X - PanelGameShiftX to FormH - X + PanelGameShiftX - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // ����� �� �������� (�����)
  R := 64; G := R; B := R;
  PanelGameShiftX := PanelGameW + FrameDepth * 2;
  for X := PanelGameShiftX - 1 downto PanelGameShiftX - FrameDepth - 1 do
  begin
    for Y := PanelGameShiftX - X - 1 to FormH - (PanelGameShiftX - X) do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // ��������� ���������� ������ �������
  PanelGameShiftX := PanelGameW + FrameDepth;
  for X := FrameDepth - 1 to PanelGameShiftX - 1 do
    for Y := FrameDepth - 1 to FormH - FrameDepth - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
  PanelGameShiftX := PanelGameW + FrameDepth * 3;
  for X := PanelGameShiftX - 1 to FormW - FrameDepth - 1 do
    for Y := FrameDepth - 1 to FormH - FrameDepth - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);

end;

procedure TFormTetris.SetLengthCanvaGamePanel;
begin
  SetLength(CanvaGamePanel, FormW, FormH); // ����� ������ �����
  FillBackGround; // ����������� ����
  PaintGrid; // ����������� �����
end;

procedure TFormTetris.WriteText;
begin
  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 48, '����:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 96, '�������:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 144, '�����:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 216, '���������:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 368, '�����������:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);
end;

procedure TFormTetris.ReShowScore;
begin
  PaintClockFace('88888888', PanelGameW + FrameDepth * 2 + 36, 72, 108, 108, 108, true);
  PaintClockFace(CurScore, PanelGameW + FrameDepth * 2 + 36, 72, 0, 0, 0, false);
  PaintClockFace('88888888', PanelGameW + FrameDepth * 2 + 36, 120, 108, 108, 108, true);
  PaintClockFace(CurLevel, PanelGameW + FrameDepth * 2 + 36, 120, 0, 0, 0, false);
  PaintClockFace('88888888', PanelGameW + FrameDepth * 2 + 36, 168, 108, 108, 108, true);
  PaintClockFace(CurLines, PanelGameW + FrameDepth * 2 + 36, 168, 0, 0, 0, false);
end;

procedure TFormTetris.TimerFPSTimer(Sender: TObject);

  procedure PainPanelInfo(const txt: string);
  var
    x1, y1, x2, y2: Word;
  begin

    x1 := FrameDepth + PanelGameW div 32;
    x2 := FrameDepth + PanelGameW - PanelGameW div 32;
    y1 := FrameDepth + PanelGameH div 2 - 24;
    y2 := FrameDepth + PanelGameH div 2 + 240;

    ScrBitmap.Canvas.Pen.Color := RGB(0, 0, 0);
    ScrBitmap.Canvas.Brush.Color := RGB(120, 120, 120);
    ScrBitmap.Canvas.Pen.Width := 1;
    ScrBitmap.Canvas.Rectangle(x1+1, y1+1, x2-1, y2-1);

    ScrBitmap.Canvas.Font.Size := 16;
    ScrBitmap.Canvas.TextOut(x1 + 16, y1 + 8, txt);

    ScrBitmap.Canvas.Font.Size := 12;
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 40,  'ESC    - ������� ����');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 60,  'ENTER  - �����/������� ����');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 80,  'DEL    - ������ ������');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 100, 'PAUSE  - �����/����������');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 120, '�����  - ������� ������');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 140, '����   - �������� ������');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 160, '�����  - ����������� �����');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 180, '������ - ����������� ������');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 200, '������ - ������� ������');
  end;

begin
  RefreshBackGround; // �������������� ���
  PaintingAllPanels; // ������ �������
  ReShowScore; // ��������� ���������� � ����
  WriteText; // ��������� �����
  // ���� ���� ���������
  if GameOver then
  begin
    // ������� ����� � ���������� ����
    PainPanelInfo('���� ��������...');
  end else if CurrGamePause then
  begin
    // ������� ����� � ���������� ����
    PainPanelInfo('�����');
  end;
  FormPaint(Self); // �������������� �����
end;

procedure TFormTetris.TimerGravityTimer(Sender: TObject);
begin
  if not GameOver and not CurrGamePause then
    MoweObjectColor(0);
end;

procedure TFormTetris.CreateScrBitMap(BitMapH, BitMapW: Integer);
var
  BInfo: tagBITMAPINFO;
begin
  BInfo.bmiHeader.biSize := sizeof(tagBITMAPINFOHEADER);
  BInfo.bmiHeader.biWidth := BitMapH;
  BInfo.bmiHeader.biHeight := -BitMapW;
  BInfo.bmiHeader.biPlanes := 1;
  BInfo.bmiHeader.biBitCount := 32;
  BInfo.bmiHeader.biCompression := BI_RGB;
  ScrBitmap := TBitmap.Create();
  ScrBitmap.Handle := CreateDIBSection(Canvas.Handle, BInfo, DIB_RGB_COLORS,
    Scr, 0, 0);
  ZeroMemory(Scr, BitMapH * BitMapW * 4);
end;

procedure TFormTetris.SetLengthFormPanelColor;
var
  x, y: Byte;
begin
  // ������������� ������ �������
  SetLength(FormPanelColor, PanelColorSummW, PanelColorSummH);
  // �������� ������ �������
  for x := 0 to PanelColorSummW - 1 do
    for y := 0 to PanelColorSummH - 1 do
      with FormPanelColor[x,y] do begin
        Visible := false;
        with PanelColor do begin
          R1 := 0;  R2 := 0;
          G1 := 0;  G2 := 0;
          B1 := 0;  B2 := 0;
        end;
      end;
end;

procedure TFormTetris.FormCreate(Sender: TObject);
begin
  GameOver := true;
  CurScore := '00000000';
  CurLevel := '00000001';
  CurLines := '00000000';
  yNumLines := 0;
  CurrGamePause := false;
  // ������� ���������� �����
  ClientHeight := FormH;
  ClientWidth  := FormW;
  // ��������� ����������� BitMap'�
  CreateScrBitmap(ClientWidth, ClientHeight);
  // ��������� ����������� ������� �������� � ������ ���
  SetLengthCanvaGamePanel;
  // ����������� ���������� ��� �����
  RefreshBackGround;
  // �������� ������ ��� ������ �������
  SetLengthFormPanelColor;
  // ������� ������ ��� ������� ���������� �������
  SetLength(PixelToClear, PanelColorSummW, 4, PanelColorW, PanelColorH);
end;

procedure TFormTetris.ReStartGame;
begin
  CurScore := '00000000';
  CurLevel := '00000001';
  CurLines := '00000000';
  CurrGamePause := false;
  // �������� ��� ������
  ObjectColorCurr.Visible := false; // ������� �������� ������
  ObjectColorBuff.Visible := false; // ���������� ��� ��������� ������� � ����� ������
  ObjectColorCapt.Visible := false; // ������ � �������
  ObjectColorShad.Visible := false; // ���� �������� ������ (����������, ���� ������ �������� ������ ���� � �������)
  ObjectColorNext.Visible := false; // ��������� ������
  // �������� ������ ��� ������ ������� (������� ������)
  SetLengthFormPanelColor;
  // ���������� "��������� ������"
  CreateNextObjectColor(random(7));
  // �������� ���������� ������ � "�������� ������"
  ObjectColorCurr := ObjectColorNext;
  // ���������� "��������� ������"
  CreateNextObjectColor(random(7));
  // ���� ��������
  GameOver := false;
end;

procedure TFormTetris.ChangeObjectColor;
begin
  // �������� �������� ������ � ����� ������ �����
  ObjectColorBuff := ObjectColorCurr;
  // ���� ��� ���-�� ���� � "����������� ������"
  if ObjectColorCapt.Visible then
  begin
    // ���������� � "�������� ������"
    ObjectColorCurr := ObjectColorCapt;
    // � "����������� ������" �������� �� ������ ������ �����
    ObjectColorCapt := ObjectColorBuff;
  end else
  begin
    // �������� ����� "�������� ������" �� "��������� ������"
    ObjectColorCurr := ObjectColorNext;
    // ���������� "��������� ������"
    CreateNextObjectColor(random(7));
  end;
  ObjectColorCapt := ObjectColorBuff;
  with ObjectColorCapt do begin
    Top  := - Height;
    Left := (PanelColorSummW - Width) div 2;
  end;
end;

procedure TFormTetris.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : Close; // 'ESC   - ������� ����'
    VK_RETURN : ReStartGame; // 'ENTER - �����/������� ����
    VK_LEFT   : if not GameOver and not CurrGamePause then MoweObjectColor(1); //'�����  - ����������� �����'
    VK_RIGHT  : if not GameOver and not CurrGamePause then MoweObjectColor(2); //'������ - ����������� ������'
    VK_DOWN   : if not GameOver and not CurrGamePause then
                begin
                  MoweObjectColor(3); //'����   - �������� ������'
                  CurScore := IncScore(1, CurScore); //�������� ���� �� 1
                end;
    VK_SPACE  : if not GameOver and not CurrGamePause then MoweObjectColor(4); //'������ - ������� ������'
    VK_DELETE : if not GameOver and not CurrGamePause then //'X - ������ ������'
                begin
                  ChangeObjectColor;  //����������� "�������� ������" � "����������� ������"
                  MoweObjectColor(5);
                end;
    VK_UP     : if not GameOver and not CurrGamePause then TurnObjectColor(90); //'�����  - ������� ������'
    VK_PAUSE  : if not GameOver then CurrGamePause := not CurrGamePause; //'P - �����/����������'
    //90: if not GameOver and not CurrGamePause then TurnObjectColor(-90);
  end;
end;

procedure TFormTetris.FormPaint(Sender: TObject);
begin
  Canvas.Draw(0, 0, ScrBitmap);
end;

end.
