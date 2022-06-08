unit uDBImages;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes,
  Data.DB,
  Vcl.Controls, Vcl.Graphics, Vcl.DBCtrls, Vcl.Forms;

type
  TImageType  = (itUnknown, itBitmap, itJPG, itICO, itPNG);
  TImageTypes = set of TImageType;

  TpDBImage = class(TCustomControl)
  private
    FDataLink: TFieldDataLink;
    FPicture: TPicture;
    FBorderStyle: TBorderStyle;
    FAutoDisplay: Boolean;
    FStretch: Boolean;
    FCenter: Boolean;
    FPictureLoaded: Boolean;
    FQuickDraw: Boolean;
    FImageType: TImageType;
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure PictureChanged(Sender: TObject);
    procedure SetAutoDisplay(Value: Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetCenter(Value: Boolean);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetPicture(Value: TPicture);
    procedure SetReadOnly(Value: Boolean);
    procedure SetStretch(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMCopy(var Message: TMessage); message WM_COPY;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMSize(var Message: TMessage); message WM_SIZE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    function GetPalette: HPALETTE; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    procedure LoadPicture(DrawPicture: TPicture = nil);
    procedure PasteFromClipboard;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function GetImageType: TImageType;
    property Field: TField read GetField;
    property Picture: TPicture read FPicture write SetPicture;
  published
    property Align;
    property Anchors;
    property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Center: Boolean read FCenter write SetCenter default True;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor default False;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property QuickDraw: Boolean read FQuickDraw write FQuickDraw default True;
    property ShowHint;
    property Stretch: Boolean read FStretch write SetStretch default False;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

function TypeImageInStream(Stream: TStream): TImageType;

procedure Register;

implementation

uses
  System.Types,
  Vcl.Clipbrd, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TSign = array [0 .. 2] of Char;

  TCursorOrIcon = packed record
    Reserved: Word;
    wType: Word;
    Count: Word;
  end;

const
  rc3_StockIcon = 0;
  rc3_Icon      = 1;

function TypeImageInStream(Stream: TStream): TImageType;
const
  // JpegSign:TSign=('я', 'Ш', 'я', 'а', #0, #16, 'J', 'F', 'I', 'F');
  JpegSign: TSign = (#255, #216, #255);
  PNGSign: TSign = (#137, #80, #73);
var
  OldPos: integer;
  sign: TSign;
  CI: TCursorOrIcon;
begin
  Result := itUnknown;
  OldPos := Stream.Position;
  try
    Stream.Position := 0;
    Stream.ReadBuffer(sign[0], 3);
    if (sign[0] = 'B') and (sign[1] = 'M')
    then Result := itBitmap
    else if JpegSign = sign
    then Result := itJPG
    else if PNGSign = sign
    then Result := itPNG
    else begin
      Stream.Position := 0;
      Stream.ReadBuffer(CI, SizeOf(CI));
      if (CI.wType in [rc3_StockIcon, rc3_Icon])
      then Result := itICO
    end;
  finally Stream.Position := OldPos;
  end;
end;

constructor TpDBImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque, csReplicatable];
  if not NewStyleControls
  then ControlStyle := ControlStyle + [csFramed];
  Width := 105;
  Height := 105;
  TabStop := True;
  ParentColor := False;
  FPicture := TPicture.Create;
  FPicture.OnChange := PictureChanged;
  FBorderStyle := bsSingle;
  FAutoDisplay := True;
  FCenter := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FQuickDraw := True;
end;

destructor TpDBImage.Destroy;
begin
  FPicture.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TpDBImage.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TpDBImage.SetDataSource(Value: TDataSource);
begin
  if not(FDataLink.DataSourceFixed and (csLoading in ComponentState))
  then FDataLink.DataSource := Value;
  if Value <> nil
  then Value.FreeNotification(Self);
end;

function TpDBImage.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TpDBImage.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TpDBImage.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TpDBImage.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TpDBImage.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TpDBImage.GetPalette: HPALETTE;
begin
  Result := 0;
  if FPicture.Graphic is TBitmap
  then Result := TBitmap(FPicture.Graphic).Palette;
end;

procedure TpDBImage.SetAutoDisplay(Value: Boolean);
begin
  if FAutoDisplay <> Value
  then begin
    FAutoDisplay := Value;
    if Value
    then LoadPicture;
  end;
end;

procedure TpDBImage.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value
  then begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TpDBImage.SetCenter(Value: Boolean);
begin
  if FCenter <> Value
  then begin
    FCenter := Value;
    Invalidate;
  end;
end;

procedure TpDBImage.SetPicture(Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TpDBImage.SetStretch(Value: Boolean);
begin
  if FStretch <> Value
  then begin
    FStretch := Value;
    Invalidate;
  end;
end;

function TpDBImage.GetImageType: TImageType;
begin
  Result := FImageType
end;

procedure TpDBImage.Paint;
var
  Size: TSize;
  R: TRect;
  S: string;
  DrawPict: TPicture;
  Form: TCustomForm;
  Pal: HPALETTE;
  proporciaImage: double;
  proporciaSelf: double;
  stretchRect: TRect;
  delta: integer;
begin
  with Canvas do begin
    Brush.Style := bsSolid;
    Brush.Color := Color;
    if FPictureLoaded or (csPaintCopy in ControlState)
    then begin
      DrawPict := TPicture.Create;
      Pal := 0;
      try
        if (csPaintCopy in ControlState) and Assigned(FDataLink.Field) and FDataLink.Field.IsBlob
        then begin
          // FPictureLoaded:=False;
          LoadPicture(DrawPict);

          // DrawPict.Assign(FDataLink.Field);
          if DrawPict.Graphic is TBitmap
          then DrawPict.Bitmap.IgnorePalette := QuickDraw;
        end
        else begin
          DrawPict.Assign(Picture);
          if Focused and (DrawPict.Graphic <> nil) and (DrawPict.Graphic.Palette <> 0)
          then begin { Control has focus, so realize the bitmap palette in foreground }
            Pal := SelectPalette(Handle, DrawPict.Graphic.Palette, False);
            RealizePalette(Handle);
          end;
        end;
        if Stretch
        then
          if (DrawPict.Graphic = nil) or DrawPict.Graphic.Empty
          then FillRect(ClientRect)
          else begin
            stretchRect := ClientRect;
            if DrawPict.Graphic.Width <> 0
            then proporciaImage := DrawPict.Graphic.Height / DrawPict.Graphic.Width
            else proporciaImage := 0;
            if Width <> 0
            then proporciaSelf := (stretchRect.Bottom - stretchRect.Top) / (stretchRect.Right - stretchRect.Left)
            else proporciaSelf := 0;
            if (proporciaSelf <> 0) and (proporciaImage <> 0)
            then begin
              if proporciaSelf > proporciaImage
              then begin
                // За счет высоты
                stretchRect.Bottom := stretchRect.Top + Trunc((stretchRect.Right - stretchRect.Left) * proporciaImage);
                delta := ((ClientRect.Bottom - ClientRect.Top) - (stretchRect.Bottom - stretchRect.Top)) div 2;
                Inc(stretchRect.Top, delta);
                Inc(stretchRect.Bottom, delta);
                FillRect(Rect(ClientRect.Left, ClientRect.Top, ClientRect.Right, stretchRect.Top));
                FillRect(Rect(ClientRect.Left, stretchRect.Bottom, ClientRect.Right, ClientRect.Bottom));
              end
              else begin
                // За счет ширины
                stretchRect.Right := stretchRect.Left +
                  Trunc(1 / (proporciaImage / (stretchRect.Bottom - stretchRect.Top)));
                delta := ((ClientRect.Right - ClientRect.Left) - (stretchRect.Right - stretchRect.Left)) div 2;
                Inc(stretchRect.Right, delta);
                Inc(stretchRect.Left, delta);
                FillRect(Rect(ClientRect.Left, ClientRect.Top, stretchRect.Left, ClientRect.Bottom));
                FillRect(Rect(stretchRect.Right, ClientRect.Top, ClientRect.Right, ClientRect.Bottom));
              end;

            end;
            StretchDraw(stretchRect, DrawPict.Graphic)
            // StretchDraw(ClientRect, DrawPict.Graphic)
          end
        else begin
          SetRect(R, 0, 0, DrawPict.Width, DrawPict.Height);
          if Center
          then OffsetRect(R, (ClientWidth - DrawPict.Width) div 2, (ClientHeight - DrawPict.Height) div 2);
          StretchDraw(R, DrawPict.Graphic);
          ExcludeClipRect(Handle, R.Left, R.Top, R.Right, R.Bottom);
          FillRect(ClientRect);
          SelectClipRgn(Handle, 0);
        end;
      finally
        if Pal <> 0
        then SelectPalette(Handle, Pal, True);
        DrawPict.Free;
      end;
    end
    else begin
      Font := Self.Font;
      if FDataLink.Field <> nil
      then S := FDataLink.Field.DisplayLabel
      else S := Name;
      S := '(' + S + ')';
      Size := TextExtent(S);
      R := ClientRect;
      TextRect(R, (R.Right - Size.cx) div 2, (R.Bottom - Size.cy) div 2, S);
    end;
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.ActiveControl = Self) and not(csDesigning in ComponentState) and
      not(csPaintCopy in ControlState)
    then begin
      Brush.Color := clWindowFrame;
      FrameRect(ClientRect);
    end;
  end;
end;

procedure TpDBImage.PictureChanged(Sender: TObject);
begin
  if FPictureLoaded
  then FDataLink.Modified;
  FPictureLoaded := True;
  Invalidate;
end;

procedure TpDBImage.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and (AComponent = DataSource)
  then DataSource := nil;
end;

procedure TpDBImage.LoadPicture(DrawPicture: TPicture = nil);
var
  StreamValue: TMemoryStream;
  Jpg: TJPEGImage;
  png : TPngImage;
  Ic: TIcon;
  Reload: Boolean;
begin
  if not Assigned(FDataLink.Field)
  then begin
    FImageType := itUnknown;
    Exit;
  end;

  Reload := DrawPicture <> nil;
  if not Reload
  then begin
    DrawPicture := Picture;
  end;
  if (not FPictureLoaded or Reload) and FDataLink.Field.IsBlob
  then begin
    if (not FDataLink.Field.IsBlob and FDataLink.Field.IsNull) or (TBlobField(FDataLink.Field).BlobSize = 0)
    then DrawPicture.Assign(FDataLink.Field)
    else begin
      begin
        StreamValue := TMemoryStream.Create;
        try
          TBlobField(FDataLink.Field).SaveToStream(StreamValue);
          StreamValue.Position := 0;
          case TypeImageInStream(StreamValue) of
            itBitmap: begin
                FImageType := itBitmap;
                DrawPicture.Assign(FDataLink.Field);
              end;
            itJPG: begin
                FImageType := itJPG;
                Jpg := TJPEGImage.Create;
                try
                  Jpg.LoadFromStream(StreamValue);
                  DrawPicture.Assign(Jpg)
                finally Jpg.Free;
                end;
              end;
            itICO: begin
                FImageType := itICO;
                Ic := TIcon.Create;
                try
                  Ic.LoadFromStream(StreamValue);
                  DrawPicture.Assign(Ic)
                finally Ic.Free;
                end
              end;
            itPNG: begin
                FImageType := itPNG;
                png := TPngImage.Create;
                try
                  png.LoadFromStream(StreamValue);
                  DrawPicture.Assign(png)
                finally png.Free;
                end;
              end;
          end; // case
        finally StreamValue.Free;
        end;
      end;
    end;
  end;
end;

procedure TpDBImage.DataChange(Sender: TObject);
begin
  Picture.Graphic := nil;
  FPictureLoaded := False;
  if FAutoDisplay
  then LoadPicture;
end;

procedure TpDBImage.UpdateData(Sender: TObject);
begin
  if Picture.Graphic is TBitmap
  then FDataLink.Field.Assign(Picture.Graphic)
  else FDataLink.Field.Clear;
end;

procedure TpDBImage.CopyToClipboard;
begin
  if Picture.Graphic <> nil
  then Clipboard.Assign(Picture);
end;

procedure TpDBImage.CutToClipboard;
begin
  if Picture.Graphic <> nil
  then
    if FDataLink.Edit
    then begin
      CopyToClipboard;
      Picture.Graphic := nil;
    end;
end;

procedure TpDBImage.PasteFromClipboard;
begin
  if Clipboard.HasFormat(CF_BITMAP) and FDataLink.Edit
  then Picture.Bitmap.Assign(Clipboard);
end;

procedure TpDBImage.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    if FBorderStyle = bsSingle
    then
      if NewStyleControls and Ctl3D
      then ExStyle := ExStyle or WS_EX_CLIENTEDGE
      else Style := Style or WS_BORDER;
    WindowClass.Style := WindowClass.Style and not(CS_HREDRAW or CS_VREDRAW);
  end;
end;

procedure TpDBImage.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  case Key of
    VK_INSERT: if ssShift in Shift then PasteFromClipboard
      else if ssCtrl in Shift
      then CopyToClipboard;
    VK_DELETE: if ssShift in Shift then CutToClipboard;
  end;
end;

procedure TpDBImage.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    ^X: CutToClipboard;
    ^C: CopyToClipboard;
    ^V: PasteFromClipboard;
    #13: LoadPicture;
    #27: FDataLink.Reset;
  end;
end;

procedure TpDBImage.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := integer(FDataLink);
end;

procedure TpDBImage.CMEnter(var Message: TCMEnter);
begin
  Invalidate; { Draw the focus marker }
  inherited;
end;

procedure TpDBImage.CMExit(var Message: TCMExit);
begin
  try
    if Assigned(DataSource) and Assigned(DataSource.DataSet) and (DataSource.DataSet.State in [dsInsert, dsEdit])
    then FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  Invalidate; { Erase the focus marker }
  inherited;
end;

procedure TpDBImage.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if not FPictureLoaded
  then Invalidate;
end;

procedure TpDBImage.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if TabStop and CanFocus
  then SetFocus;
  inherited;
end;

procedure TpDBImage.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  LoadPicture;
  inherited;
end;

procedure TpDBImage.WMCut(var Message: TMessage);
begin
  CutToClipboard;
end;

procedure TpDBImage.WMCopy(var Message: TMessage);
begin
  CopyToClipboard;
end;

procedure TpDBImage.WMPaste(var Message: TMessage);
begin
  PasteFromClipboard;
end;

procedure TpDBImage.WMSize(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

function TpDBImage.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and FDataLink.ExecuteAction(Action);
end;

function TpDBImage.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and FDataLink.UpdateAction(Action);
end;

procedure Register;
begin
  RegisterComponents('Data Controls', [TpDBImage]);
end;

end.
