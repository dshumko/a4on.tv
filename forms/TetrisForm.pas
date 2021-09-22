unit TetrisForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type

  TBig = array [0 .. 0] of Integer;

  TPanelColor = Record // панели фигуры
    R1, G1, B1, R2, G2, B2: Byte; //цвет панели
  end;

  TPixelToClear = Record // пиксель панели
    mX, mY: ShortInt; // направление пикселя
    R1, G1, B1: Byte; // цвет пиксиля
    cTop, cLeft: Word; // положение фигуры
  end;

  TObjectColor = Record // фигура
    Top, Left:     ShortInt; // положение фигуры
    Height, Width: Byte; // размерность фигуры
    PanelColor:    TPanelColor; // размещение и информация о цвете
    PanelArray: array of array of Boolean;
    Visible:       Boolean;
  end;

  TFormPanelColor = Record // панели на форме
    Visible:    Boolean; // видимость (если нет, значит пустое пространство)
    PanelColor: TPanelColor; // размещение и информация о цвете
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
    Scr: Pointer; // указатель
    ScrBitmap: TBitmap; // BitMap для фоновой прорисовки
    CanvaGamePanel: array of array of TColor; // массив пикселей дисплея
    // переменные текущей игры
    GameOver: Boolean; // игра закончена?
    CurrGamePause: Boolean; // пауза?
    CurScore, CurLevel, CurLines: String;
    // объекты (фигуры)
    ObjectColorCurr, // текущая падающая фигура
    ObjectColorBuff, // переменная для помещения объекта в буфер обмена
    ObjectColorCapt, // фигура в захвате
    ObjectColorShad, // тень падающей фигуры (показывает, куда упадет падающая фигура если её бросить)
    ObjectColorNext: TObjectColor; // следующая фигура
    // массив закрипившихся панелей
    FormPanelColor: array of array of TFormPanelColor;
    // массив стираемых линий (попиксельно)
    PixelToClear: array of array of array of array of TPixelToClear;
    yNumLines: Byte; // кол-во стираемых линий
  public
    { Public declarations }
    function IncScore(const n: Word; const InScore: String): String; // увеличчение/уменьшение счета
    procedure CreateScrBitMap(BitMapH, BitMapW: Integer); // выделение памяти под BitMap
    procedure RefreshBackGround; // перерисовка фона
    procedure PaintGrid; // рисование сетки
    procedure FillBackGround; // заливка массива фоном
    procedure SetLengthCanvaGamePanel; // установка размера массива пикселей дисплея
    Procedure PaintingAllPanels; // перерисовка панеляк
    procedure CreateNextObjectColor(NumObj: Byte); // создаем новую "Следующая фигуруа"
    procedure PaintClockFace(const sNumber: string; const cLeft, cHeight: Word; R, G, B: Byte; const VisibleZero: Boolean); // рисуем циферблат
    procedure WriteText; // выводим подписи
    procedure SetLengthFormPanelColor; // создаем массив панелей на игровой панели
    procedure MoweObjectColor(mw: Byte); // набор процедур для перемещения панелей
    procedure ReStartGame; // рестарт игры
    procedure ChangeObjectColor; //переместить "падающая фигура" в "захваченная фигура"
    procedure TurnObjectColor(angle: ShortInt); //поворот фигуры на заданный угол
    procedure EraseLinePanel; // процедура стирания полноценной линии из панелей
    function DropObject(MyObjectColor: TObjectColor): TObjectColor; // опускание требуемой фигуры как можно ниже
    procedure ReShowScore; // покажем циферблаты и их значения
    procedure CalculateLevel(SumLines: Word);
  end;

//var
  //FormTetris: TFormTetris;

implementation

const
  PanelColorH = 24; // высота панели
  PanelColorW = 24; // ширина панели
  PanelColorSummH = 20; // кол-во панелей в высоту
  PanelColorSummW = 10; // кол-во панелей в ширину
  FrameDepth = 20; // толщина рамки
  PanelGameH = PanelColorH * PanelColorSummH + PanelColorSummH; // высота игрового поля
  PanelGameW = PanelColorW * PanelColorSummW + PanelColorSummW; // ширина игрового поля
  PanelInfoH = PanelGameH; // высота инфо поля
  PanelInfoW = (PanelColorW + 1) * 6; // ширина инфо поля
  FormH = PanelGameH + FrameDepth * 2; // высота формы (учитывая рамку)
  FormW = PanelGameW + FrameDepth * 4 + PanelInfoW; // ширина формы (учитывая рамку)
  StepSplashingH = 3; // взрыв/разброс стираемой линии (размер кусков)
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
  NextMoweObjectColor: // КОГО НЕ УСТРАИВАЕТ, ЗАРУБИТЕСЬ !!! =D
  CanMowe := true; // предположим, что объект может переместится вниз
  with MyObjectColor do
    // если объект виден
    if Visible then begin
      for x := 0 to Width - 1 do begin
        // если уже известно что фигура не может опустится ниже, выходи из цикла
        if not CanMowe then
          Break;
        // иначе, продолжаем проверять
        for y := 0 to Height - 1 do begin
          // запомним координаты на 1-н ниже текущих
          cX := Left + x;
          cY := Top + y + 1;
          // если в данной ячейке массива фигуры есть панель
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
  // если под фигурой ничего не оказалось
  if CanMowe then
  begin
    with MyObjectColor do
      if Visible then
        // опустим её ниже
        inc(Top);
    // и проверим заного, есть ли теперь под ней что-нибудь?
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
  // перебираем по строчно сверху в низ
  for y := 0 to PanelColorSummH - 1 do
  begin
    // перебираем массив линии панелей на полноценность
    FindLine := true;
    for x := 0 to PanelColorSummW - 1 do
    begin
      if not FormPanelColor[x,y].Visible then
      begin
        FindLine := false;
        Break;
      end;
    end;
    // проверяем, это линия?
    if FindLine = true then
    begin
      inc(yNumLines); // кол-во линий на стирание
      CurScore := IncScore(200, CurScore); // линия на стирание есть, увеличиваем очки
      SetLength(yErase, yNumLines);
      yErase[yNumLines - 1] := y; // положение линии на стирание
    end;
  end;
  //если полноценных линий нет, выходим из процедуры
  if yNumLines = 0 then
    Exit;

  CurLines := IncScore(yNumLines, CurLines); //увеличим очки на 1

  // вычисляем текущий уровень игры
  CalculateLevel(StrToInt(CurLines));
  TimerGravity.Interval := 800 - (StrToInt(CurLevel) - 1) * 40;

  // скопируем линии на стирание в массив и опустим их ниже
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
          //вытащим цвет пикселя
          PixelR := GetRValue(ScrBitmap.Canvas.Pixels[cLeft + iW + 1, cTop + iH + 1]);
          PixelG := GetGValue(ScrBitmap.Canvas.Pixels[cLeft + iW + 1, cTop + iH + 1]);
          PixelB := GetBValue(ScrBitmap.Canvas.Pixels[cLeft + iW + 1, cTop + iH + 1]);
          // запишем значения в массив

          { Эффект № 1 "Всплеск" }
          {PixelToClear[x, y, iW, iH].mX := ((PanelColorW div 2) - iW) div 3;
          PixelToClear[x, y, iW, iH].mY := (PanelColorH div 2) - iH; }

          { Эффект № 2 "Раздрабливание" }
          PixelToClear[x, y, iW, iH].mX := StepW * 2;
          PixelToClear[x, y, iW, iH].mY := StepH - 6;

          PixelToClear[x, y, iW, iH].R1 := PixelR;
          PixelToClear[x, y, iW, iH].G1 := PixelG;
          PixelToClear[x, y, iW, iH].B1 := PixelB;
          PixelToClear[x, y, iW, iH].cTop  := cTop + iH;
          PixelToClear[x, y, iW, iH].cLeft := cLeft + iW;
        end;
      end;
      // очистим панели (уберем видимость)
      FormPanelColor[x,yMy].Visible := false;
    end;
  end;

  //опускаем каждую панель ниже
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
    if not ObjectColorCurr.Visible then // если объект не виден, выходим из процедуры
      Exit;
    // предположим, что объект может переместится
    CanMowe := true;
    // копируем панель в буфер панелей
    ObjectColorBuff := ObjectColorCurr;
    // меняем значение высоты на ширину и наоборот
    ObjectColorBuff.Height := ObjectColorCurr.Width;
    ObjectColorBuff.Width  := ObjectColorCurr.Height;
    SetLength(ObjectColorBuff.PanelArray, ObjectColorBuff.Width, ObjectColorBuff.Height);
    // учитывая изменившуюся высоту и ширину фигуры, надо пересчитать Left и Top
    ObjectColorBuff.Top  := ObjectColorCurr.Top  + ObjectColorCurr.Height - ObjectColorBuff.Height;
    ObjectColorBuff.Left := ObjectColorCurr.Left + ObjectColorCurr.Width  - ObjectColorBuff.Width;

    // инвертируем координаты фигуры
    with ObjectColorCurr do
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if b then // опрокидываем фигуру против часовой стрелки
            ObjectColorBuff.PanelArray[y, (Width - 1) - x] :=  ObjectColorCurr.PanelArray[x,y]
            else // опрокидываем фигуру по часовой стрелки
              ObjectColorBuff.PanelArray[(Height - 1) - y, x] :=  ObjectColorCurr.PanelArray[x,y];

    // преобразование готово, проверим, возможно-ли такое положение фигуры?
    with ObjectColorBuff do
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          // если в данной ячейке массива есть панель
          if PanelArray[x, y] = true then begin
            cX := Left + x;
            cY := Top  + y;
            // если фигуры выше граници, надо разрешить перемещать фигуру
            if cY < 0 then
              cY := 0;
            // проверяем на возможность переворачивания
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

    // если такое положение объекта возможно
    if CanMowe then // переносим модернизированную фигуру из буфера обратно в "Падающая панель"
      ObjectColorCurr := ObjectColorBuff;
  end;

begin
  case angle of
     90: TurnObject(false);
    -90: TurnObject(true);
  end;
  MoweObjectColor(5); // перерисовка тени
end;

procedure TFormTetris.MoweObjectColor(mw: Byte);

  procedure FreezeObject;  // замораживаем объект
  var
    x, y: Byte;
  begin
    for x := 0 to ObjectColorCurr.Width - 1 do
      for y := 0 to ObjectColorCurr.Height - 1 do
        // если в данной ячейке массива есть панель
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
    // получаем новую "Падающая фигура" из "Следующая фигура"
    ObjectColorCurr := ObjectColorNext;
    // генерируем "следующая фигура"
    CreateNextObjectColor(random(7));
    // проверяем, есть ли полноценная линия для стирания
    EraseLinePanel;
  end;

  procedure MoweDownObject;
  var
    x, y: Byte;
    cX, cY: ShortInt;
    CanMowe: Boolean;
  begin
    CanMowe := true; // предположим, что объект может переместится вниз
    with ObjectColorCurr do
      // если объект виден
      if Visible then
        for x := 0 to Width - 1 do
          for y := 0 to Height - 1 do
            // если в данной ячейке массива есть панель
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
                // "Падающая фигура" не может опуститься ниже
                CanMowe := false;
                //проверим, а есть-ли место под фигуру чтобы её зафиксировать...
                if cY = 0 then
                  GameOver := true;
                break;
              end;
            end;
    // результативное действие с фигурой
    if ObjectColorCurr.Visible and not GameOver then
      if CanMowe then
      begin
        // перемещаем объект на ячейку вниз
        with ObjectColorCurr do
          inc(Top);
      end else
      begin
        // замораживаем объект
        FreezeObject;
      end;
  end;

  procedure MoweLeftOrRightObject(n: ShortInt);
  var
    x, y: Byte;
    cX, cY: ShortInt;
    CanMowe: Boolean;
  begin
    CanMowe := true; // предположим, что объект может переместится в лево
    with ObjectColorCurr do
      // если объект виден
      if Visible then
        for x := 0 to Width - 1 do
          for y := 0 to Height - 1 do
            // если в данной ячейке массива есть панель
            if PanelArray[x, y] = true then begin
              cX := Left + x + n;
              cY := Top  + y;
              // если фигуры выше граници, надо разрешить перемещать фигуру
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
    // результативное действие с фигурой
    if CanMowe and ObjectColorCurr.Visible then
    begin
      // перемещаем объект на ячейку вниз
      with ObjectColorCurr do
        inc(Left, n);
    end;
  end;

  procedure DroppingObject;
  begin
    // опускаем фигуру как можно ниже
    ObjectColorBuff := DropObject(ObjectColorCurr);
    // считаем очки
    CurScore := IncScore(ObjectColorBuff.Top - ObjectColorCurr.Top, CurScore);
    // переносим обратно из буфера фигур
    ObjectColorCurr := ObjectColorBuff;
    // результативное действие с фигурой
    FreezeObject;
  end;

  procedure ShowShandow;
  begin
    ObjectColorShad := ObjectColorCurr;
    // опускаем тень фигуры как можно ниже
    ObjectColorShad := DropObject(ObjectColorShad);
  end;

begin

  case mw of
  0: MoweDownObject; // перемещение "Падающая фигура" в низ
  1: MoweLeftOrRightObject(-1); // перемещение "Падающая фигура" в лево
  2: MoweLeftOrRightObject(1); // перемещение "Падающая фигура" в право
  3: MoweDownObject; // перемещение "Падающая фигура" в низ
  4: DroppingObject; // мгновенное приземление "падающая фигура" (бабах :) )
  end;

  ShowShandow; // перерисуем тень фигуры

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
        //требуемая размерность
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // обнуляем положение панелей
        ClearArray(Width, Height);
        // показываем, где находятся панели
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[1,1] := true;
        PanelArray[2,1] := true;
        //цветовая палитра
        with PanelColor do begin
          R1 := 100;  R2 := 0; //156/56
          G1 := 143;  G2 := 43; //160/60
          B1 := 121;  B2 := 21; //164/64
        end;
      end;
      1:
      begin
        //требуемая размерность
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // обнуляем положение панелей
        ClearArray(Width, Height);
        // показываем, где находятся панели
        PanelArray[0,1] := true;
        PanelArray[1,1] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        //цветовая палитра
        with PanelColor do begin
          R1 := 104;  R2 := 4; //161/61
          G1 := 166;  G2 := 66; //198/98
          B1 := 117;  B2 := 17; //172/72
        end;
      end;
      2:
      begin
        //требуемая размерность
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // обнуляем положение панелей
        ClearArray(Width, Height);
        // показываем, где находятся панели
        PanelArray[1,0] := true;
        PanelArray[0,1] := true;
        PanelArray[1,1] := true;
        PanelArray[2,1] := true;
        //цветовая палитра
        with PanelColor do begin
          R1 := 237;  R2 := 138; //247/147
          G1 := 128;  G2 := 28;  //176/76
          B1 := 106;  B2 := 6;  //154/54
        end;
      end;
      3:
      begin
        //требуемая размерность
        Height := 2;  Top  := - Height;
        Width  := 2;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // обнуляем положение панелей
          {"квадрат" занимает все выделенное пространство, обнулять ненадо}
        // показываем, где находятся панели
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[0,1] := true;
        PanelArray[1,1] := true;
        //цветовая палитра
        with PanelColor do begin
          R1 := 163;  R2 := 63; //198/98
          G1 := 133;  G2 := 33; //171/71
          B1 := 135;  B2 := 35; //179/79
        end;
      end;
      4:
      begin
        //требуемая размерность
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // обнуляем положение панелей
        ClearArray(Width, Height);
        // показываем, где находятся панели
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        PanelArray[2,1] := true;
        //цветовая палитра
        with PanelColor do begin
          R1 := 160;  R2 := 60;  //166/66
          G1 := 101;  G2 := 1;   //161/61
          B1 := 225;  B2 := 125; //252/152
        end;
      end;
      5:
      begin
        //требуемая размерность
        Height := 2;  Top  := - Height;
        Width  := 3;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // обнуляем положение панелей
        ClearArray(Width, Height);
        // показываем, где находятся панели
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        PanelArray[0,1] := true;
        //цветовая палитра
        with PanelColor do begin
          R1 := 206;  R2 := 106; //159/59
          G1 := 110;  G2 := 10;  //209/109
          B1 := 252;  B2 := 152; //255/155
        end;
      end;
      6:
      begin
        //требуемая размерность
        Height := 1;  Top  := - Height;
        Width  := 4;  Left := (PanelColorSummW - Width) div 2;
        SetLength(PanelArray, Width, Height);
        // обнуляем положение панелей
          {"палка" занимает все выделенное пространство, обнулять ненадо}
        // показываем, где находятся панели
        PanelArray[0,0] := true;
        PanelArray[1,0] := true;
        PanelArray[2,0] := true;
        PanelArray[3,0] := true;
        //цветовая палитра
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
    // заливаем градиентом
    for y:=0 to cHeight do
      with ScrBitmap.Canvas do
      begin
        Pen.Color:=RGB(R1 - (R1 - R2) div cHeight * y,
                       G1 - (G1 - G2) div cHeight * y,
                       B1 - (B1 - B2) div cHeight * y);
        MoveTo(cLeft + 1, cTop + y + 1);
        LineTo(cLeft + cWidth + 1, cTop + y + 1);
      end;
    // рисуем внешнюю рамку
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
  // перерисовка зафиксированных панелей
  for x := 0 to PanelColorSummW - 1 do
    for y := 0 to PanelColorSummH - 1 do
      if FormPanelColor[x,y].Visible then
      begin
        // поправка на положение текущей панели
        cLeft := FrameDepth + PanelColorW * x + x;
        cTop  := FrameDepth + PanelColorH * y + y;
        // рисуем зафиксированные панельки
        with FormPanelColor[x,y].PanelColor do
          PaintingPanel(R1, G1, B1, R2, G2, B2,
                        cLeft, cTop,
                        PanelColorH - 3, PanelColorW - 2);
      end;

  // перерисовка "следующая фигура"
  cTop  := FrameDepth + (PanelColorH + 1) * 9;
  cLeft := FrameDepth * 3 + (PanelColorW + 1) * (PanelColorSummW + 1);
  with ObjectColorNext do
    if ObjectColorNext.Visible then // если объект создан... то , рисуем тогда :)
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if PanelArray[x,y] = true then
            with PanelColor do
              PaintingPanel(R1, G1, B1, R2, G2, B2,
                            cLeft + (x + (4 - ObjectColorNext.Width)  div 2) * (PanelColorW + 1),
                            cTop  + (y + (4 - ObjectColorNext.Height) div 2) * (PanelColorH + 1),
                            PanelColorH - 3, PanelColorW - 2);

  // перерисовка "захваченная фигура"
  cTop  := FrameDepth + (PanelColorH + 1) * 15;
  cLeft := FrameDepth * 3 + (PanelColorW + 1) * (PanelColorSummW + 1);
  with ObjectColorCapt do
    if ObjectColorCapt.Visible then // если объект создан... то , рисуем тогда :)
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if PanelArray[x,y] = true then
            with PanelColor do
              PaintingPanel(R1, G1, B1, R2, G2, B2,
                            cLeft + (x + (4 - ObjectColorCapt.Width)  div 2) * (PanelColorW + 1),
                            cTop  + (y + (4 - ObjectColorCapt.Height) div 2) * (PanelColorH + 1),
                            PanelColorH - 3, PanelColorW - 2);
  {
  // перерисовка тени падающих объектов
  cTop  := FrameDepth + (PanelColorH + 1) * ObjectColorShad.Top;
  cLeft := FrameDepth + (PanelColorW + 1) * ObjectColorShad.Left;
  with ObjectColorShad do
    if Visible then // если объект создан... то , рисуем тогда :)
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
  // перерисовка падающих объектов
  cTop  := FrameDepth + (PanelColorH + 1) * ObjectColorCurr.Top;
  cLeft := FrameDepth + (PanelColorW + 1) * ObjectColorCurr.Left;
  with ObjectColorCurr do
    if Visible then // если объект создан... то , рисуем тогда :)
      for x := 0 to Width - 1 do
        for y := 0 to Height - 1 do
          if PanelArray[x,y] = true then
            with PanelColor do
              PaintingPanel(R1, G1, B1, R2, G2, B2,
                            cLeft + x * (PanelColorW + 1),
                            cTop  + y * (PanelColorH + 1),
                            PanelColorH - 3, PanelColorW - 2);

  // перерисовка эффекта стирания линии
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
              // рисуем пиксель
              PaintingPixel(R1,G1,B1,cLeft,cTop);
              // пересчитываем положение пикселя
              inc(cTop, mY);
              inc(cLeft, mX);
              // увеличиваем притяжение
              if mY<12 then inc(mY);
              // уменьшаем кинетическую энергию
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
  // перерисовка всего фона
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
    // поправка на положение цифры
    MyLeft := cLeft + (i - 1) * 15;
    // узнаем какая цифра
    n := StrToInt(sNumber[i]);
    if (n = 0) and (VisibleZero = false) and (i <= 8 - Length(IntToStr(StrToInt(sNumber)))) then
    begin

    end else
    // отрисовываем требуемую
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
    X, Y, I: word; // счетчики
    cMyLeft, cMyTop: Word;
  begin
    inc(cMaxW, -1); inc (cMaxH, -1);
    R := 138; G := R; B := R;
    // по вертикали
    for X := 0 to cMaxW do
      begin
        // поправка на положение текущей панели
        cMyLeft := cLeft + (PanelColorW + 1) * X;
        // рисуем линию
        for I := cTop to cTop + cHeight - 1 do
          CanvaGamePanel[cMyLeft, I] := RGB(B, G, R);
        // если цикл завершен
        if X = cMaxW then
          // рисуем завершающую линию
          for I := cTop to cTop + cHeight - 1 do
            CanvaGamePanel[cMyLeft + PanelColorW + 1, I] := RGB(B, G, R);
      end;
    // по горизонтали
    for Y := 0 to cMaxH do
      begin
        // поправка на положение текущей панели
        cMyTop  := cTop + (PanelColorH + 1) * Y;
        // если цикл завершен
        for I := cLeft to cLeft + cWidth - 1 do
          CanvaGamePanel[I, cMyTop] := RGB(B, G, R);
        if Y = cMaxH then
          // рисуем завершающую линию
          for I := cLeft to cLeft + cWidth - 1 do
            CanvaGamePanel[I, cMyTop + (PanelColorH + 1)] := RGB(B, G, R);
      end;
  end;

var
  cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW: Word;
begin
  // рисуем сетку на PanelGame (игровое поле)
  cTop    := FrameDepth - 1;
  cLeft   := FrameDepth - 1;
  cHeight := (PanelColorH + 1) * PanelColorSummH;
  cWidth  := (PanelColorW + 1) * PanelColorSummW;
  cMaxH   := PanelColorSummH;
  cMaxW   := PanelColorSummW;
  NewGrid(cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW);

  // рисуем 1-ю сетку на PanelInfo (следующая фигура)
  cTop    := FrameDepth + (PanelColorH + 1) * 9 - 1;
  cLeft   := FrameDepth * 3 + (PanelColorW + 1) * (PanelColorSummW + 1) - 1;
  cHeight := (PanelColorH + 1) * 4;
  cWidth  := (PanelColorW + 1) * 4;
  cMaxH   := 4;
  cMaxW   := 4;
  NewGrid(cTop, cLeft, cHeight, cWidth, cMaxH, cMaxW);

  // рисуем 2-ю сетку на PanelInfo (захваченная фигура)
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
  X, Y: word; // счетчики
  R, G, B: Byte; // храним цветность
  PanelGameShiftX: word; // смещение по оси Х
begin

  // верхняя рамка
  R := 64; G := R; B := R;
  for Y := 0 to FrameDepth - 1 do
  begin
    for X := Y to FormW - Y - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // правая рамка
  R := 64; G := R; B := R;
  for X := FormW - 1 downto FormW - FrameDepth do
  begin
    for Y := FormW - X to FormH - (FormW - X) - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // нижняя рамка
  R := 64; G := R; B := R;
  for Y := FormH - 1 downto FormH - FrameDepth - 1 do
  begin
    for X := FormW - (FormH - Y) downto FormH - Y - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // левая рамка
  R := 64; G := R; B := R;
  for X := 0 to FrameDepth - 1 do
  begin
    for Y := X to FormH - X - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // рамка по середине (правая)
  R := 64; G := R; B := R;
  PanelGameShiftX := PanelGameW + FrameDepth * 2;
  for X := PanelGameShiftX to PanelGameShiftX + FrameDepth - 1 do
  begin
    for Y := X - PanelGameShiftX to FormH - X + PanelGameShiftX - 1 do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // рамка по середине (левая)
  R := 64; G := R; B := R;
  PanelGameShiftX := PanelGameW + FrameDepth * 2;
  for X := PanelGameShiftX - 1 downto PanelGameShiftX - FrameDepth - 1 do
  begin
    for Y := PanelGameShiftX - X - 1 to FormH - (PanelGameShiftX - X) do
      CanvaGamePanel[X, Y] := RGB(B, G, R);
    Inc(R, 3); Inc(G, 3); Inc(B, 3);
  end;

  // заполняем оставшиеся пустые области
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
  SetLength(CanvaGamePanel, FormW, FormH); // новый размер канвы
  FillBackGround; // перезаливка фона
  PaintGrid; // перерисовка сетки
end;

procedure TFormTetris.WriteText;
begin
  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 48, 'Очки:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 96, 'Уровень:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 144, 'Линии:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 216, 'Следующая:');
  SetBkMode(ScrBitmap.Canvas.Handle, OPAQUE);

  SetBkMode(ScrBitmap.Canvas.Handle, TRANSPARENT);
  ScrBitmap.Canvas.Font.Size := 16;
  ScrBitmap.Canvas.TextOut(PanelGameW + FrameDepth * 2 + 36, 368, 'Захваченная:');
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
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 40,  'ESC    - Закрыть игру');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 60,  'ENTER  - Старт/Рестарт игры');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 80,  'DEL    - захват фигуры');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 100, 'PAUSE  - Пауза/Продолжить');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 120, 'Вверх  - поворот фигуры');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 140, 'Вниз   - опустить фигуру');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 160, 'Влево  - переместить влево');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 180, 'Вправо - переместить вправо');
    ScrBitmap.Canvas.TextOut(x1 + 8, y1 + 200, 'Пробел - бросить фигуру');
  end;

begin
  RefreshBackGround; // перерисовываем фон
  PaintingAllPanels; // рисуем объекты
  ReShowScore; // отобразим циферблаты и очки
  WriteText; // отобразим текст
  // если игра завершена
  if GameOver then
  begin
    // выводим форму о завершении игры
    PainPanelInfo('Игра окончена...');
  end else if CurrGamePause then
  begin
    // выводим форму о завершении игры
    PainPanelInfo('Пауза');
  end;
  FormPaint(Self); // перерисовываем канву
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
  // устанавливаем размер массива
  SetLength(FormPanelColor, PanelColorSummW, PanelColorSummH);
  // обнуляем каждый элемент
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
  // размеры клиентской формы
  ClientHeight := FormH;
  ClientWidth  := FormW;
  // указываем размерность BitMap'а
  CreateScrBitmap(ClientWidth, ClientHeight);
  // указываем размерность массива пикселей и рисуем фон
  SetLengthCanvaGamePanel;
  // присваиваем полученный фон канве
  RefreshBackGround;
  // выделяем память под массив панелей
  SetLengthFormPanelColor;
  // выделим памяьб под пиксели рассыпания панелей
  SetLength(PixelToClear, PanelColorSummW, 4, PanelColorW, PanelColorH);
end;

procedure TFormTetris.ReStartGame;
begin
  CurScore := '00000000';
  CurLevel := '00000001';
  CurLines := '00000000';
  CurrGamePause := false;
  // обнуляем все фигуры
  ObjectColorCurr.Visible := false; // текущая падающая фигура
  ObjectColorBuff.Visible := false; // переменная для помещения объекта в буфер обмена
  ObjectColorCapt.Visible := false; // фигура в захвате
  ObjectColorShad.Visible := false; // тень падающей фигуры (показывает, куда упадет падающая фигура если её бросить)
  ObjectColorNext.Visible := false; // следующая фигура
  // выделяем память под массив панелей (очищаем массив)
  SetLengthFormPanelColor;
  // генерируем "следующая фигура"
  CreateNextObjectColor(random(7));
  // передаем полученную фигуру в "падающая фигура"
  ObjectColorCurr := ObjectColorNext;
  // генерируем "следующая фигура"
  CreateNextObjectColor(random(7));
  // игра началась
  GameOver := false;
end;

procedure TFormTetris.ChangeObjectColor;
begin
  // поместим падающую фигуру в буфер обмена фигур
  ObjectColorBuff := ObjectColorCurr;
  // если уже что-то есть в "Захваченная фигура"
  if ObjectColorCapt.Visible then
  begin
    // перемещаем в "Падающая фигура"
    ObjectColorCurr := ObjectColorCapt;
    // в "Захваченная фигура" передаем из буфера обмена фигур
    ObjectColorCapt := ObjectColorBuff;
  end else
  begin
    // получаем новую "Падающая фигура" из "Следующая фигура"
    ObjectColorCurr := ObjectColorNext;
    // генерируем "следующая фигура"
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
    VK_ESCAPE : Close; // 'ESC   - Закрыть игру'
    VK_RETURN : ReStartGame; // 'ENTER - Старт/Рестарт игры
    VK_LEFT   : if not GameOver and not CurrGamePause then MoweObjectColor(1); //'Влево  - переместить влево'
    VK_RIGHT  : if not GameOver and not CurrGamePause then MoweObjectColor(2); //'Вправо - переместить вправо'
    VK_DOWN   : if not GameOver and not CurrGamePause then
                begin
                  MoweObjectColor(3); //'Вниз   - опустить фигуру'
                  CurScore := IncScore(1, CurScore); //увеличим очки на 1
                end;
    VK_SPACE  : if not GameOver and not CurrGamePause then MoweObjectColor(4); //'Пробел - бросить фигуру'
    VK_DELETE : if not GameOver and not CurrGamePause then //'X - захват фигуры'
                begin
                  ChangeObjectColor;  //переместить "падающая фигура" в "захваченная фигура"
                  MoweObjectColor(5);
                end;
    VK_UP     : if not GameOver and not CurrGamePause then TurnObjectColor(90); //'Вверх  - поворот фигуры'
    VK_PAUSE  : if not GameOver then CurrGamePause := not CurrGamePause; //'P - Пауза/Продолжить'
    //90: if not GameOver and not CurrGamePause then TurnObjectColor(-90);
  end;
end;

procedure TFormTetris.FormPaint(Sender: TObject);
begin
  Canvas.Draw(0, 0, ScrBitmap);
end;

end.
