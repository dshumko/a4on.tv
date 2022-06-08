unit CircuitMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.UITypes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.Menus, Vcl.ActnList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.Imaging.pngimage,
  SimpleGraph;

type
  TCircuitForm = class(TForm)
    ToolBar: TToolBar;
    StatusBar: TStatusBar;
    ImageList: TImageList;
    ActionList: TActionList;
    FileNew: TAction;
    FileOpen: TAction;
    FileSave: TAction;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    FileExit: TAction;
    N1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    EditCut: TAction;
    EditCopy: TAction;
    EditPaste: TAction;
    EditDelete: TAction;
    EditSelectAll: TAction;
    EditLockNodes: TAction;
    Edit1: TMenuItem;
    EditCut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N2: TMenuItem;
    SelectAll1: TMenuItem;
    N3: TMenuItem;
    LockNodes1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ObjectsNone: TAction;
    ObjectsRectangle: TAction;
    ObjectsRoundRect: TAction;
    ObjectsEllipse: TAction;
    ObjectsLink: TAction;
    Opjects1: TMenuItem;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    EditBringToFront: TAction;
    EditSendToBack: TAction;
    N6: TMenuItem;
    BringToFront1: TMenuItem;
    SendToBack1: TMenuItem;
    EditProperties: TAction;
    N7: TMenuItem;
    Properties1: TMenuItem;
    DesignerPopup: TPopupMenu;
    ObjectsPopup: TPopupMenu;
    Properties2: TMenuItem;
    Cut1: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    Delete2: TMenuItem;
    N8: TMenuItem;
    Properties3: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    SelectAllNodes1: TMenuItem;
    Paste5: TMenuItem;
    EditMode1: TMenuItem;
    N4: TMenuItem;
    InsertRectangle1: TMenuItem;
    InsertRoundRectangle1: TMenuItem;
    InsertEllipse1: TMenuItem;
    N5: TMenuItem;
    LinkObjects1: TMenuItem;
    N9: TMenuItem;
    InsertRectangle2: TMenuItem;
    InsertRoundRectangle2: TMenuItem;
    InsertEllipse2: TMenuItem;
    N14: TMenuItem;
    LinkObjects2: TMenuItem;
    N15: TMenuItem;
    BringToFront2: TMenuItem;
    SendToBack2: TMenuItem;
    FilePrint: TAction;
    N16: TMenuItem;
    Print1: TMenuItem;
    PrinterSetupDialog: TPrinterSetupDialog;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    btnSaveAs: TToolButton;
    FileSaveAs: TAction;
    FileSaveAs1: TMenuItem;
    FormatToolBar: TToolBar;
    cbxFontName: TComboBox;
    cbxFontSize: TComboBox;
    btnBoldface: TToolButton;
    btnItalic: TToolButton;
    btnUnderline: TToolButton;
    FormatBold: TAction;
    FormatItalic: TAction;
    FormatUnderline: TAction;
    FormatAlignLeft: TAction;
    FormatCenter: TAction;
    FormatAlignRight: TAction;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ExportMetafile: TAction;
    SavePictureDialog: TSavePictureDialog;
    ToolButton30: TToolButton;
    ToolButton17: TToolButton;
    ToolButton25: TToolButton;
    ViewZoomIn: TAction;
    ViewZoomOut: TAction;
    ToolButton32: TToolButton;
    ObjectsTriangle: TAction;
    ToolButton33: TToolButton;
    ObjectsRhomboid: TAction;
    ToolButton34: TToolButton;
    ObjectsPentagon: TAction;
    ToolButton35: TToolButton;
    FormatAlignTop: TAction;
    FormatVCenter: TAction;
    FormatAlignBottom: TAction;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ViewGrid: TAction;
    ToolButton42: TToolButton;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    InsertTriangle1: TMenuItem;
    InsertRhomboid1: TMenuItem;
    InsertPentagon1: TMenuItem;
    EditLockLinks: TAction;
    EditLockLinks1: TMenuItem;
    InsertTriangle2: TMenuItem;
    InsertRhomboid2: TMenuItem;
    InsertPentagon2: TMenuItem;
    View1: TMenuItem;
    ShowGrid1: TMenuItem;
    N11: TMenuItem;
    ZoomIn1: TMenuItem;
    ZoomOut1: TMenuItem;
    ViewActualSize: TAction;
    ActualSize1: TMenuItem;
    ToolButton11: TToolButton;
    LinkRemovePoint: TAction;
    LinkAddPoint: TAction;
    LinkGrow: TAction;
    LinkShrink: TAction;
    LinkRotateCW: TAction;
    LinkRotateCCW: TAction;
    N13: TMenuItem;
    LinkReverse: TAction;
    AddPoint1: TMenuItem;
    RemovePoint1: TMenuItem;
    N17: TMenuItem;
    LinkGrow1: TMenuItem;
    Shrink1: TMenuItem;
    RotateClockwise1: TMenuItem;
    RotateCounterClockwise1: TMenuItem;
    ReverseDirection1: TMenuItem;
    HelpUsage: TAction;
    UsingKeyboardandMouse1: TMenuItem;
    EditInvertSelection: TAction;
    InvertSelection1: TMenuItem;
    OptionsConfirmHookLink: TAction;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton41: TToolButton;
    ToolButton49: TToolButton;
    ObjectsHexagon: TAction;
    InsertHexagon1: TMenuItem;
    InsertHexagon2: TMenuItem;
    EditMakeAllSelectable: TAction;
    MakeAllSelectable1: TMenuItem;
    OptionsConfirmDeletion: TAction;
    N19: TMenuItem;
    Prefernces1: TMenuItem;
    ConfirmDeletion1: TMenuItem;
    ConfirmHookingLinking1: TMenuItem;
    ViewWholeGraph: TAction;
    FullGraph1: TMenuItem;
    ExportBitmap: TAction;
    Export1: TMenuItem;
    AsMetafile1: TMenuItem;
    AsBitmap1: TMenuItem;
    FileMerge: TAction;
    Merge1: TMenuItem;
    ViewPan: TAction;
    ToolButton18: TToolButton;
    N20: TMenuItem;
    PanMode1: TMenuItem;
    ClipboardNative: TAction;
    ClipboardBitmap: TAction;
    ClipboardMetafile: TAction;
    ClipboardFormats1: TMenuItem;
    Native1: TMenuItem;
    Bitmap1: TMenuItem;
    Metafile1: TMenuItem;
    EditAlign: TAction;
    ViewFixScrolls: TAction;
    FixScrollBars1: TMenuItem;
    Align1: TMenuItem;
    Align2: TMenuItem;
    ViewTransparent: TAction;
    ransparent1: TMenuItem;
    ToolButton26: TToolButton;
    EditSize: TAction;
    Size1: TMenuItem;
    Size2: TMenuItem;
    ToolButton31: TToolButton;
    SimpleGraph: TSimpleGraph;
    procedure FileNewExecute(Sender: TObject);
    procedure FileOpenExecute(Sender: TObject);
    procedure FileSaveExecute(Sender: TObject);
    procedure FileSaveAsExecute(Sender: TObject);
    procedure ExportMetafileExecute(Sender: TObject);
    procedure FilePrintExecute(Sender: TObject);
    procedure FileExitExecute(Sender: TObject);
    procedure EditCutExecute(Sender: TObject);
    procedure EditCopyExecute(Sender: TObject);
    procedure EditPasteExecute(Sender: TObject);
    procedure EditDeleteExecute(Sender: TObject);
    procedure EditSelectAllExecute(Sender: TObject);
    procedure EditSendToBackExecute(Sender: TObject);
    procedure EditBringToFrontExecute(Sender: TObject);
    procedure EditLockNodesExecute(Sender: TObject);
    procedure EditPropertiesExecute(Sender: TObject);
    procedure FormatBoldExecute(Sender: TObject);
    procedure FormatItalicExecute(Sender: TObject);
    procedure FormatUnderlineExecute(Sender: TObject);
    procedure FormatAlignLeftExecute(Sender: TObject);
    procedure FormatCenterExecute(Sender: TObject);
    procedure FormatAlignRightExecute(Sender: TObject);
    procedure ObjectsNoneExecute(Sender: TObject);
    procedure ObjectsRectangleExecute(Sender: TObject);
    procedure ObjectsRoundRectExecute(Sender: TObject);
    procedure ObjectsEllipseExecute(Sender: TObject);
    procedure ObjectsTriangleExecute(Sender: TObject);
    procedure ObjectsLinkExecute(Sender: TObject);
    procedure ObjectsRhomboidExecute(Sender: TObject);
    procedure ObjectsPentagonExecute(Sender: TObject);
    procedure ObjectsHexagonExecute(Sender: TObject);
    procedure ViewZoomInExecute(Sender: TObject);
    procedure ViewZoomOutExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbxFontSizeChange(Sender: TObject);
    procedure cbxFontNameChange(Sender: TObject);
    procedure SimpleGraphDblClick(Sender: TObject);
    procedure SimpleGraphNodeDblClick(Graph: TSimpleGraph; Node: TGraphNode);
    procedure SimpleGraphLinkDblClick(Graph: TSimpleGraph; Link: TGraphLink);
    procedure FormCreate(Sender: TObject);
    procedure SimpleGraphCommandModeChange(Sender: TObject);
    procedure SimpleGraphObjectSelect(Graph: TSimpleGraph; GraphObject: TGraphObject);
    procedure SimpleGraphObjectDblClick(Graph: TSimpleGraph; GraphObject: TGraphObject);
    procedure FormatAlignTopExecute(Sender: TObject);
    procedure FormatVCenterExecute(Sender: TObject);
    procedure FormatAlignBottomExecute(Sender: TObject);
    procedure ViewGridExecute(Sender: TObject);
    procedure SimpleGraphInfoTip(Graph: TSimpleGraph; GraphObject: TGraphObject; var InfoTip: String);
    procedure EditLockLinksExecute(Sender: TObject);
    procedure ViewActualSizeExecute(Sender: TObject);
    procedure LinkRemovePointExecute(Sender: TObject);
    procedure LinkAddPointExecute(Sender: TObject);
    procedure LinkGrowExecute(Sender: TObject);
    procedure LinkShrinkExecute(Sender: TObject);
    procedure LinkRotateCWExecute(Sender: TObject);
    procedure LinkRotateCCWExecute(Sender: TObject);
    procedure LinkReverseExecute(Sender: TObject);
    procedure ObjectsPopupPopup(Sender: TObject);
    procedure HelpUsageExecute(Sender: TObject);
    procedure EditInvertSelectionExecute(Sender: TObject);
    procedure SimpleGraphCanHookLink(Graph: TSimpleGraph; GraphObject: TGraphObject; Link: TGraphLink; Index: Integer;
      var CanHook: Boolean);
    procedure SimpleGraphCanLinkObjects(Graph: TSimpleGraph; Link: TGraphLink; Source, Target: TGraphObject;
      var CanLink: Boolean);
    procedure OptionsConfirmHookLinkExecute(Sender: TObject);
    procedure OptionsConfirmDeletionExecute(Sender: TObject);
    procedure EditMakeAllSelectableExecute(Sender: TObject);
    procedure SimpleGraphCanRemoveObject(Graph: TSimpleGraph; GraphObject: TGraphObject; var CanRemove: Boolean);
    procedure ViewWholeGraphExecute(Sender: TObject);
    procedure SimpleGraphObjectChange(Graph: TSimpleGraph; GraphObject: TGraphObject);
    procedure ExportBitmapExecute(Sender: TObject);
    procedure SimpleGraphObjectInitInstance(Graph: TSimpleGraph; GraphObject: TGraphObject);
    procedure SimpleGraphMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FileMergeExecute(Sender: TObject);
    procedure SimpleGraphMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure SimpleGraphMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ViewPanExecute(Sender: TObject);
    procedure SimpleGraphNodeMoveResize(Graph: TSimpleGraph; Node: TGraphNode);
    procedure ClipboardNativeExecute(Sender: TObject);
    procedure ClipboardBitmapExecute(Sender: TObject);
    procedure ClipboardMetafileExecute(Sender: TObject);
    procedure ViewFixScrollsExecute(Sender: TObject);
    procedure EditAlignExecute(Sender: TObject);
    procedure ClipboardBitmapUpdate(Sender: TObject);
    procedure ClipboardMetafileUpdate(Sender: TObject);
    procedure ClipboardNativeUpdate(Sender: TObject);
    procedure EditAlignUpdate(Sender: TObject);
    procedure EditBringToFrontUpdate(Sender: TObject);
    procedure EditCopyUpdate(Sender: TObject);
    procedure EditCutUpdate(Sender: TObject);
    procedure EditDeleteUpdate(Sender: TObject);
    procedure EditInvertSelectionUpdate(Sender: TObject);
    procedure EditLockLinksUpdate(Sender: TObject);
    procedure EditLockNodesUpdate(Sender: TObject);
    procedure EditMakeAllSelectableUpdate(Sender: TObject);
    procedure EditPasteUpdate(Sender: TObject);
    procedure EditSelectAllUpdate(Sender: TObject);
    procedure EditSendToBackUpdate(Sender: TObject);
    procedure ExportBitmapUpdate(Sender: TObject);
    procedure ExportMetafileUpdate(Sender: TObject);
    procedure FileMergeUpdate(Sender: TObject);
    procedure FilePrintUpdate(Sender: TObject);
    procedure FileSaveAsUpdate(Sender: TObject);
    procedure FileSaveUpdate(Sender: TObject);
    procedure ObjectsEllipseUpdate(Sender: TObject);
    procedure ObjectsHexagonUpdate(Sender: TObject);
    procedure ObjectsLinkUpdate(Sender: TObject);
    procedure ObjectsNoneUpdate(Sender: TObject);
    procedure ObjectsPentagonUpdate(Sender: TObject);
    procedure ObjectsRectangleUpdate(Sender: TObject);
    procedure ObjectsRhomboidUpdate(Sender: TObject);
    procedure ObjectsRoundRectUpdate(Sender: TObject);
    procedure ObjectsTriangleUpdate(Sender: TObject);
    procedure ViewActualSizeUpdate(Sender: TObject);
    procedure ViewFixScrollsUpdate(Sender: TObject);
    procedure ViewGridUpdate(Sender: TObject);
    procedure ViewPanUpdate(Sender: TObject);
    procedure ViewWholeGraphUpdate(Sender: TObject);
    procedure ViewZoomInUpdate(Sender: TObject);
    procedure ViewZoomOutUpdate(Sender: TObject);
    procedure SimpleGraphZoomChange(Sender: TObject);
    procedure SimpleGraphGraphChange(Sender: TObject);
    procedure ViewTransparentUpdate(Sender: TObject);
    procedure ViewTransparentExecute(Sender: TObject);
    procedure EditSizeUpdate(Sender: TObject);
    procedure EditSizeExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    TargetPt: TPoint;
    FIsReadonly: Boolean;
    FModified: Boolean;
    FPngStream: TMemoryStream;
    FCircuitStream: TMemoryStream;
    SaveHint: TNotifyEvent;
    function IsGraphSaved: Boolean;
    procedure ShowHint(Sender: TObject);
    function ForEachCallback(GraphObject: TGraphObject; Action: Integer): Boolean;
  public
    procedure GetCircuitStream(CircuitStream: TMemoryStream);
    procedure GetPngStream(PngStream: TMemoryStream);
    property IsReadonly: Boolean read FIsReadonly write FIsReadonly;
    property Modyfied: Boolean read FModified;
  end;

function EditCircuit(CircuitStream: TMemoryStream; PngStream: TMemoryStream; const ReadOnly: Boolean = False): Boolean;

implementation

{$R *.dfm}

uses
  Vcl.Clipbrd, Vcl.Printers,
  DesignProp, ObjectProp, NodeProp, LinkProp, UsageHelp, AlignDlg, SizeDlg, DM;

resourcestring
  SSaveChanges = 'Схема изменена, Вы хотите ее сохранить?';
  SViewOnly = 'Только просмотр';
  SEditing = 'Редактирование';
  SPan = 'Режим просмотра';
  SInsertingLink = 'Вставить связь/линию';
  SInsertingNode = 'Вставить узел';
  SModified = 'Изменено';
  SUntitled = 'Без названия';
  SMultiSelect = '%d выделено объектов';
  SNumOfPoints = '%d точек';
  SStartPoint = 'Точка начала';
  SEndPoint = 'Точка окончания';
  SNoName = 'NONAME';
  SCanDelete = 'Удалить объект ''%s''?';
  SCanHook = 'Подключить %s ''%s'' связью к ''%s''?';
  SCanLink = 'Связать ''%s'' и ''%s'' используя связь ''%s''?';
  SHooked = 'Подключен';
  SNodeInfo = '%s Узел: %s' + #13#10 + 'Позиция: %d, %d; Размер: %d x %d' + #13#10 +
    'Входящих связей: %d; Исходящих связей: %d';
  SLinkInfo = 'Связь: %s' + #13#10 + 'Начало: (%d, %d) %s' + #13#10 + 'Окончание: (%d, %d) %s' + #13#10 +
    'Количество узлов: %d';

const
  // ForEachObject Actions
  FEO_DELETE = 00;
  FEO_SELECT = 01;
  FEO_INVERTSELECTION = 02;
  FEO_SENDTOBACK = 03;
  FEO_BRINGTOFRONT = 04;
  FEO_MAKESELECTABLE = 05;
  FEO_SETFONTFACE = 06;
  FEO_SETFONTSIZE = 07;
  FEO_SETFONTBOLD = 08;
  FEO_SETFONTITALIC = 09;
  FEO_SETFONTUNDERLINE = 10;
  FEO_RESETFONTBOLD = 11;
  FEO_RESETFONTITALIC = 12;
  FEO_RESETFONTUNDERLINE = 13;
  FEO_SETALIGNMENTLEFT = 14;
  FEO_SETALIGNMENTCENTER = 15;
  FEO_SETALIGNMENTRIGHT = 16;
  FEO_SETLAYOUTTOP = 17;
  FEO_SETLAYOUTCENTER = 18;
  FEO_SETLAYOUTBOTTOM = 19;
  FEO_REVERSEDIRECTION = 20;
  FEO_ROTATE90CW = 21;
  FEO_ROTATE90CCW = 22;
  FEO_GROW25 = 23;
  FEO_SHRINK25 = 24;

function EditCircuit(CircuitStream: TMemoryStream; PngStream: TMemoryStream; const ReadOnly: Boolean = False): Boolean;
var
  CircuitForm: TCircuitForm;
begin
  CircuitForm := TCircuitForm.Create(Application);
  try
    if CircuitStream.Size <> 0 then
    begin
      CircuitForm.SimpleGraph.LoadFromStream(CircuitStream);
    end;
    CircuitForm.IsReadonly := ReadOnly;
    CircuitForm.ShowModal;
    Result := CircuitForm.Modyfied;
    if Result then
    begin
      CircuitStream.Clear;
      PngStream.Clear;
      CircuitForm.GetCircuitStream(CircuitStream);
      CircuitForm.GetPngStream(PngStream);
    end;

  finally
    CircuitForm.Free;
  end;
end;

function TCircuitForm.ForEachCallback(GraphObject: TGraphObject; Action: Integer): Boolean;
var
  RotateOrg: TPoint;
begin
  Result := True;
  case Action of
    FEO_DELETE:
      Result := GraphObject.Delete;
    FEO_SELECT:
      GraphObject.Selected := True;
    FEO_INVERTSELECTION:
      GraphObject.Selected := not GraphObject.Selected;
    FEO_SENDTOBACK:
      GraphObject.SendToBack;
    FEO_BRINGTOFRONT:
      GraphObject.BringToFront;
    FEO_MAKESELECTABLE:
      GraphObject.Options := GraphObject.Options + [goSelectable];
    FEO_SETFONTFACE:
      GraphObject.Font.Name := cbxFontName.Text;
    FEO_SETFONTSIZE:
      GraphObject.Font.Size := cbxFontSize.Tag;
    FEO_SETFONTBOLD:
      GraphObject.Font.Style := GraphObject.Font.Style + [fsBold];
    FEO_SETFONTITALIC:
      GraphObject.Font.Style := GraphObject.Font.Style + [fsItalic];
    FEO_SETFONTUNDERLINE:
      GraphObject.Font.Style := GraphObject.Font.Style + [fsUnderline];
    FEO_RESETFONTBOLD:
      GraphObject.Font.Style := GraphObject.Font.Style - [fsBold];
    FEO_RESETFONTITALIC:
      GraphObject.Font.Style := GraphObject.Font.Style - [fsItalic];
    FEO_RESETFONTUNDERLINE:
      GraphObject.Font.Style := GraphObject.Font.Style - [fsUnderline];
    FEO_SETALIGNMENTLEFT:
      if GraphObject is TGraphNode then
        TGraphNode(GraphObject).Alignment := taLeftJustify;
    FEO_SETALIGNMENTCENTER:
      if GraphObject is TGraphNode then
        TGraphNode(GraphObject).Alignment := taCenter;
    FEO_SETALIGNMENTRIGHT:
      if GraphObject is TGraphNode then
        TGraphNode(GraphObject).Alignment := taRightJustify;
    FEO_SETLAYOUTTOP:
      if GraphObject is TGraphNode then
        TGraphNode(GraphObject).Layout := tlTop;
    FEO_SETLAYOUTCENTER:
      if GraphObject is TGraphNode then
        TGraphNode(GraphObject).Layout := tlCenter;
    FEO_SETLAYOUTBOTTOM:
      if GraphObject is TGraphNode then
        TGraphNode(GraphObject).Layout := tlBottom;
    FEO_REVERSEDIRECTION:
      if GraphObject is TGraphLink then
        TGraphLink(GraphObject).Reverse;
    FEO_ROTATE90CW:
      if GraphObject is TGraphLink then
        with TGraphLink(GraphObject) do
        begin
          RotateOrg := CenterOfPoints(Polyline);
          Rotate(+Pi / 2, RotateOrg);
        end;
    FEO_ROTATE90CCW:
      if GraphObject is TGraphLink then
        with TGraphLink(GraphObject) do
        begin
          RotateOrg := CenterOfPoints(Polyline);
          Rotate(-Pi / 2, RotateOrg);
        end;
    FEO_GROW25:
      if GraphObject is TGraphLink then
        TGraphLink(GraphObject).Scale(1.25);
    FEO_SHRINK25:
      if GraphObject is TGraphLink then
        TGraphLink(GraphObject).Scale(0.75);
  else
    Result := False;
  end;
end;

function TCircuitForm.IsGraphSaved: Boolean;
begin
  Result := True;
  if SimpleGraph.Modified then
    case MessageDlg(SSaveChanges, mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes:
        begin
          FileSave.Execute;
          Result := not SimpleGraph.Modified;
        end;
      mrCancel:
        Result := False;
    end;
end;

procedure TCircuitForm.ShowHint(Sender: TObject);
begin
  if Assigned(StatusBar) then
    StatusBar.Panels[StatusBar.Panels.Count - 1].Text := Application.Hint;
end;

procedure TCircuitForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  if Assigned(Application.OnHint) then
    SaveHint := Application.OnHint;
  if not TryStrToInt(dmMain.GetIniValue('HIDEHINT'), i) then
    i := 0;
  if Assigned(StatusBar) and (i = 1) then
    Application.OnHint := ShowHint;

  SimpleGraphCommandModeChange(nil);
  SimpleGraphZoomChange(nil);
  cbxFontName.Items := Screen.Fonts;
  FPngStream := TMemoryStream.Create;
  FCircuitStream := TMemoryStream.Create;
end;

procedure TCircuitForm.FileNewExecute(Sender: TObject);
begin
  if IsGraphSaved then
  begin
    SimpleGraph.Clear;
    SimpleGraph.Zoom := 100;
    SimpleGraph.CommandMode := cmEdit;
    FIsReadonly := False;
    FModified := False;
    SaveDialog.FileName := SUntitled;
    Caption := SaveDialog.FileName + ' - ' + Application.Title;
  end;
end;

procedure TCircuitForm.FileOpenExecute(Sender: TObject);
begin
  OpenDialog.Options := OpenDialog.Options - [ofHideReadOnly];
  if IsGraphSaved and OpenDialog.Execute then
  begin
    SimpleGraph.LoadFromFile(OpenDialog.FileName);
    SimpleGraph.ZoomGraph;
    if FIsReadonly then
      SimpleGraph.CommandMode := cmViewOnly
    else
      SimpleGraph.CommandMode := cmEdit;
    FModified := True;
    SimpleGraph.Modified := True;
    Caption := SaveDialog.FileName + ' - ' + Application.Title;
  end;
end;

procedure TCircuitForm.FileMergeUpdate(Sender: TObject);
begin
  FileMerge.Enabled := not FIsReadonly and (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.FileMergeExecute(Sender: TObject);
begin
  OpenDialog.Options := OpenDialog.Options + [ofHideReadOnly];
  if OpenDialog.Execute then
    with SimpleGraph do
      MergeFromFile(OpenDialog.FileName, 0, GraphBounds.Bottom + 4 * GridSize);
end;

procedure TCircuitForm.FileSaveUpdate(Sender: TObject);
begin
  FileSave.Enabled := SimpleGraph.Modified;
end;

procedure TCircuitForm.FileSaveExecute(Sender: TObject);
begin
  FModified := True;
  SimpleGraph.SaveToStream(FCircuitStream);
  SimpleGraph.SaveAsPNGtoStream(FPngStream);
  FCircuitStream.Seek(0, soBeginning);
  // FPngStream.Seek(0,soBeginning);
end;

procedure TCircuitForm.FileSaveAsUpdate(Sender: TObject);
begin
  FileSaveAs.Enabled := (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.FileSaveAsExecute(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    SimpleGraph.SaveToFile(SaveDialog.FileName);
    SimpleGraph.CommandMode := cmEdit;
    Caption := SaveDialog.FileName + ' - ' + Application.Title;
  end;
end;

procedure TCircuitForm.ExportMetafileUpdate(Sender: TObject);
begin
  ExportMetafile.Enabled := (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.ExportMetafileExecute(Sender: TObject);
begin
  SavePictureDialog.Filter := GraphicFilter(TMetafile);
  SavePictureDialog.DefaultExt := GraphicExtension(TMetafile);
  SavePictureDialog.FileName := ChangeFileExt(SaveDialog.FileName, '.' + SavePictureDialog.DefaultExt);
  if SavePictureDialog.Execute then
    SimpleGraph.SaveAsMetafile(SavePictureDialog.FileName);
end;

procedure TCircuitForm.ExportBitmapUpdate(Sender: TObject);
begin
  ExportBitmap.Enabled := (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.ExportBitmapExecute(Sender: TObject);
begin
  SavePictureDialog.Filter := GraphicFilter(TPngImage);
  SavePictureDialog.DefaultExt := GraphicExtension(TPngImage);
  SavePictureDialog.FileName := ChangeFileExt(SaveDialog.FileName, '.' + SavePictureDialog.DefaultExt);
  if SavePictureDialog.Execute then
    SimpleGraph.SaveAsPNG(SavePictureDialog.FileName);
end;

procedure TCircuitForm.FilePrintUpdate(Sender: TObject);
begin
  FilePrint.Enabled := (Printer.Printers.Count > 0) and (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.FilePrintExecute(Sender: TObject);
var
  Rect: TRect;
begin
  if PrinterSetupDialog.Execute then
  begin
    SetRect(Rect, 0, 0, Printer.PageWidth, Printer.PageHeight);
    InflateRect(Rect, -50, -50);
    Printer.Title := Application.Title;
    Printer.BeginDoc;
    try
      SimpleGraph.Print(Printer.Canvas, Rect);
    finally
      Printer.EndDoc;
    end;
  end;
end;

procedure TCircuitForm.FileExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TCircuitForm.EditCutUpdate(Sender: TObject);
begin
  EditCut.Enabled := not FIsReadonly and (SimpleGraph.SelectedObjects.Count > 0);
end;

procedure TCircuitForm.EditCutExecute(Sender: TObject);
begin
  EditCopy.Execute;
  EditDelete.Execute;
end;

procedure TCircuitForm.EditCopyUpdate(Sender: TObject);
begin
  EditCopy.Enabled := (SimpleGraph.SelectedObjects.Count > 0);
end;

procedure TCircuitForm.EditCopyExecute(Sender: TObject);
begin
  SimpleGraph.CopyToClipboard(True);
end;

procedure TCircuitForm.EditPasteUpdate(Sender: TObject);
begin
  EditPaste.Enabled := not FIsReadonly and Clipboard.HasFormat(CF_SIMPLEGRAPH);
end;

procedure TCircuitForm.EditPasteExecute(Sender: TObject);
begin
  SimpleGraph.PasteFromClipboard;
end;

procedure TCircuitForm.EditDeleteUpdate(Sender: TObject);
begin
  EditDelete.Enabled := not FIsReadonly and (SimpleGraph.SelectedObjects.Count > 0);
end;

procedure TCircuitForm.EditDeleteExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_DELETE, True);
end;

procedure TCircuitForm.EditSelectAllUpdate(Sender: TObject);
begin
  EditSelectAll.Enabled := not FIsReadonly and (SimpleGraph.Objects.Count > SimpleGraph.SelectedObjects.Count);
end;

procedure TCircuitForm.EditSelectAllExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SELECT, False);
end;

procedure TCircuitForm.EditInvertSelectionUpdate(Sender: TObject);
begin
  EditInvertSelection.Enabled := not FIsReadonly and (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.EditInvertSelectionExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_INVERTSELECTION, False);
end;

procedure TCircuitForm.EditMakeAllSelectableUpdate(Sender: TObject);
begin
  EditMakeAllSelectable.Enabled := not FIsReadonly and (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.EditMakeAllSelectableExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_MAKESELECTABLE, False);
end;

procedure TCircuitForm.EditSendToBackUpdate(Sender: TObject);
begin
  EditSendToBack.Enabled := not FIsReadonly and (SimpleGraph.SelectedObjects.Count > 0);
end;

procedure TCircuitForm.EditSendToBackExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SENDTOBACK, True);
end;

procedure TCircuitForm.EditBringToFrontUpdate(Sender: TObject);
begin
  EditBringToFront.Enabled := not FIsReadonly and (SimpleGraph.SelectedObjects.Count > 0);
end;

procedure TCircuitForm.EditBringToFrontExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_BRINGTOFRONT, True);
end;

procedure TCircuitForm.EditAlignUpdate(Sender: TObject);
begin
  EditAlign.Enabled := (SimpleGraph.SelectedObjects.Count > 1);
end;

procedure TCircuitForm.EditAlignExecute(Sender: TObject);
var
  H: THAlignOption;
  V: TVAlignOption;
begin
  if TAlignDialog.Execute(H, V) then
    SimpleGraph.AlignSelection(H, V);
end;

procedure TCircuitForm.EditSizeUpdate(Sender: TObject);
begin
  EditSize.Enabled := (SimpleGraph.SelectedObjects.Count > 1);
end;

procedure TCircuitForm.EditSizeExecute(Sender: TObject);
var
  Horz, Vert: TResizeOption;
begin
  if TSizeDialog.Execute(Horz, Vert) then
    SimpleGraph.ResizeSelection(Horz, Vert);
end;

procedure TCircuitForm.EditLockNodesUpdate(Sender: TObject);
begin
  EditLockNodes.Checked := SimpleGraph.LockNodes;
  EditLockNodes.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.EditLockNodesExecute(Sender: TObject);
begin
  SimpleGraph.LockNodes := not SimpleGraph.LockNodes;
end;

procedure TCircuitForm.EditLockLinksUpdate(Sender: TObject);
begin
  EditLockLinks.Checked := SimpleGraph.LockLinks;
  EditLockLinks.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.EditLockLinksExecute(Sender: TObject);
begin
  SimpleGraph.LockLinks := not SimpleGraph.LockLinks;
end;

procedure TCircuitForm.EditPropertiesExecute(Sender: TObject);
var
  LinkCount: Integer;
begin
  if SimpleGraph.SelectedObjects.Count = 0 then
    TDesignerProperties.Execute(SimpleGraph)
  else
  begin
    LinkCount := SimpleGraph.SelectedObjectsCount(TGraphLink);
    if LinkCount = 0 then
      TNodeProperties.Execute(SimpleGraph.SelectedObjects)
    else if LinkCount = SimpleGraph.SelectedObjects.Count then
      TLinkProperties.Execute(SimpleGraph.SelectedObjects)
    else
      TObjectProperties.Execute(SimpleGraph.SelectedObjects);
  end;
end;

procedure TCircuitForm.ClipboardNativeUpdate(Sender: TObject);
begin
  ClipboardNative.Checked := cfNative in SimpleGraph.ClipboardFormats;
end;

procedure TCircuitForm.ClipboardNativeExecute(Sender: TObject);
begin
  if cfNative in SimpleGraph.ClipboardFormats then
    SimpleGraph.ClipboardFormats := SimpleGraph.ClipboardFormats - [cfNative]
  else
    SimpleGraph.ClipboardFormats := SimpleGraph.ClipboardFormats + [cfNative];
end;

procedure TCircuitForm.ClipboardBitmapUpdate(Sender: TObject);
begin
  ClipboardBitmap.Checked := cfBitmap in SimpleGraph.ClipboardFormats;
end;

procedure TCircuitForm.ClipboardBitmapExecute(Sender: TObject);
begin
  if cfBitmap in SimpleGraph.ClipboardFormats then
    SimpleGraph.ClipboardFormats := SimpleGraph.ClipboardFormats - [cfBitmap]
  else
    SimpleGraph.ClipboardFormats := SimpleGraph.ClipboardFormats + [cfBitmap];
end;

procedure TCircuitForm.ClipboardMetafileUpdate(Sender: TObject);
begin
  ClipboardMetafile.Checked := cfMetafile in SimpleGraph.ClipboardFormats;
end;

procedure TCircuitForm.ClipboardMetafileExecute(Sender: TObject);
begin
  if cfMetafile in SimpleGraph.ClipboardFormats then
    SimpleGraph.ClipboardFormats := SimpleGraph.ClipboardFormats - [cfMetafile]
  else
    SimpleGraph.ClipboardFormats := SimpleGraph.ClipboardFormats + [cfMetafile];
end;

procedure TCircuitForm.FormatBoldExecute(Sender: TObject);
begin
  FormatBold.Checked := not FormatBold.Checked;
  if FormatBold.Checked then
    SimpleGraph.ForEachObject(ForEachCallback, FEO_SETFONTBOLD, True)
  else
    SimpleGraph.ForEachObject(ForEachCallback, FEO_RESETFONTBOLD, True);
end;

procedure TCircuitForm.FormatItalicExecute(Sender: TObject);
begin
  FormatItalic.Checked := not FormatItalic.Checked;
  if FormatItalic.Checked then
    SimpleGraph.ForEachObject(ForEachCallback, FEO_SETFONTITALIC, True)
  else
    SimpleGraph.ForEachObject(ForEachCallback, FEO_RESETFONTITALIC, True);
end;

procedure TCircuitForm.FormatUnderlineExecute(Sender: TObject);
begin
  FormatUnderline.Checked := not FormatUnderline.Checked;
  if FormatUnderline.Checked then
    SimpleGraph.ForEachObject(ForEachCallback, FEO_SETFONTUNDERLINE, True)
  else
    SimpleGraph.ForEachObject(ForEachCallback, FEO_RESETFONTUNDERLINE, True);
end;

procedure TCircuitForm.FormatAlignLeftExecute(Sender: TObject);
begin
  FormatAlignLeft.Checked := True;
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETALIGNMENTLEFT, True);
end;

procedure TCircuitForm.FormatCenterExecute(Sender: TObject);
begin
  FormatCenter.Checked := True;
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETALIGNMENTCENTER, True);
end;

procedure TCircuitForm.FormatAlignRightExecute(Sender: TObject);
begin
  FormatAlignRight.Checked := True;
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETALIGNMENTRIGHT, True);
end;

procedure TCircuitForm.FormatAlignTopExecute(Sender: TObject);
begin
  FormatAlignTop.Checked := True;
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETLAYOUTTOP, True);
end;

procedure TCircuitForm.FormatVCenterExecute(Sender: TObject);
begin
  FormatVCenter.Checked := True;
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETLAYOUTCENTER, True);
end;

procedure TCircuitForm.FormatAlignBottomExecute(Sender: TObject);
begin
  FormatAlignBottom.Checked := True;
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETLAYOUTBOTTOM, True);
end;

procedure TCircuitForm.ObjectsNoneUpdate(Sender: TObject);
begin
  ObjectsNone.Checked := (SimpleGraph.CommandMode in [cmEdit, cmViewOnly]);
end;

procedure TCircuitForm.ObjectsNoneExecute(Sender: TObject);
begin
  if FIsReadonly then
    SimpleGraph.CommandMode := cmViewOnly
  else
    SimpleGraph.CommandMode := cmEdit;
end;

procedure TCircuitForm.ObjectsRectangleUpdate(Sender: TObject);
begin
  ObjectsRectangle.Checked := (SimpleGraph.CommandMode = cmInsertNode) and
    (SimpleGraph.DefaultNodeClass = TRectangularNode);
  ObjectsRectangle.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsRectangleExecute(Sender: TObject);
begin
  SimpleGraph.DefaultNodeClass := TRectangularNode;
  SimpleGraph.CommandMode := cmInsertNode;
end;

procedure TCircuitForm.ObjectsRoundRectUpdate(Sender: TObject);
begin
  ObjectsRoundRect.Checked := (SimpleGraph.CommandMode = cmInsertNode) and
    (SimpleGraph.DefaultNodeClass = TRoundRectangularNode);
  ObjectsRoundRect.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsRoundRectExecute(Sender: TObject);
begin
  SimpleGraph.DefaultNodeClass := TRoundRectangularNode;
  SimpleGraph.CommandMode := cmInsertNode;
end;

procedure TCircuitForm.ObjectsEllipseUpdate(Sender: TObject);
begin
  ObjectsEllipse.Checked := (SimpleGraph.CommandMode = cmInsertNode) and (SimpleGraph.DefaultNodeClass = TEllipticNode);
  ObjectsEllipse.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsEllipseExecute(Sender: TObject);
begin
  SimpleGraph.DefaultNodeClass := TEllipticNode;
  SimpleGraph.CommandMode := cmInsertNode;
end;

procedure TCircuitForm.ObjectsTriangleUpdate(Sender: TObject);
begin
  ObjectsTriangle.Checked := (SimpleGraph.CommandMode = cmInsertNode) and
    (SimpleGraph.DefaultNodeClass = TTriangularNode);
  ObjectsTriangle.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsTriangleExecute(Sender: TObject);
begin
  SimpleGraph.DefaultNodeClass := TTriangularNode;
  SimpleGraph.CommandMode := cmInsertNode;
end;

procedure TCircuitForm.ObjectsRhomboidUpdate(Sender: TObject);
begin
  ObjectsRhomboid.Checked := (SimpleGraph.CommandMode = cmInsertNode) and
    (SimpleGraph.DefaultNodeClass = TRhomboidalNode);
  ObjectsRhomboid.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsRhomboidExecute(Sender: TObject);
begin
  SimpleGraph.DefaultNodeClass := TRhomboidalNode;
  SimpleGraph.CommandMode := cmInsertNode;
end;

procedure TCircuitForm.ObjectsPentagonUpdate(Sender: TObject);
begin
  ObjectsPentagon.Checked := (SimpleGraph.CommandMode = cmInsertNode) and
    (SimpleGraph.DefaultNodeClass = TPentagonalNode);
  ObjectsPentagon.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsPentagonExecute(Sender: TObject);
begin
  SimpleGraph.DefaultNodeClass := TPentagonalNode;
  SimpleGraph.CommandMode := cmInsertNode;
end;

procedure TCircuitForm.ObjectsHexagonUpdate(Sender: TObject);
begin
  ObjectsHexagon.Checked := (SimpleGraph.CommandMode = cmInsertNode) and
    (SimpleGraph.DefaultNodeClass = THexagonalNode);
  ObjectsHexagon.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsHexagonExecute(Sender: TObject);
begin
  SimpleGraph.DefaultNodeClass := THexagonalNode;
  SimpleGraph.CommandMode := cmInsertNode;
end;

procedure TCircuitForm.ObjectsLinkUpdate(Sender: TObject);
begin
  ObjectsLink.Checked := (SimpleGraph.CommandMode = cmInsertLink);
  ObjectsLink.Enabled := not FIsReadonly;
end;

procedure TCircuitForm.ObjectsLinkExecute(Sender: TObject);
begin
  SimpleGraph.CommandMode := cmInsertLink;
end;

procedure TCircuitForm.ViewZoomInUpdate(Sender: TObject);
begin
  ViewZoomIn.Enabled := (SimpleGraph.Zoom < High(TZoom));
end;

procedure TCircuitForm.ViewZoomInExecute(Sender: TObject);
begin
  SimpleGraph.ChangeZoomBy(+10, zoCenter);
end;

procedure TCircuitForm.ViewZoomOutUpdate(Sender: TObject);
begin
  ViewZoomOut.Enabled := (SimpleGraph.Zoom > Low(TZoom));
end;

procedure TCircuitForm.ViewZoomOutExecute(Sender: TObject);
begin
  SimpleGraph.ChangeZoomBy(-10, zoCenter);
end;

procedure TCircuitForm.ViewActualSizeUpdate(Sender: TObject);
begin
  ViewActualSize.Enabled := (SimpleGraph.Zoom <> 100);
end;

procedure TCircuitForm.ViewActualSizeExecute(Sender: TObject);
begin
  SimpleGraph.ChangeZoom(100, zoTopLeft);
end;

procedure TCircuitForm.ViewWholeGraphUpdate(Sender: TObject);
begin
  ViewWholeGraph.Enabled := (SimpleGraph.Objects.Count > 0);
end;

procedure TCircuitForm.ViewWholeGraphExecute(Sender: TObject);
begin
  SimpleGraph.ZoomGraph;
end;

procedure TCircuitForm.ViewGridUpdate(Sender: TObject);
begin
  ViewGrid.Checked := SimpleGraph.ShowGrid;
end;

procedure TCircuitForm.ViewGridExecute(Sender: TObject);
begin
  SimpleGraph.ShowGrid := not SimpleGraph.ShowGrid;
end;

procedure TCircuitForm.ViewFixScrollsUpdate(Sender: TObject);
begin
  ViewFixScrolls.Checked := SimpleGraph.FixedScrollBars;
end;

procedure TCircuitForm.ViewFixScrollsExecute(Sender: TObject);
begin
  SimpleGraph.FixedScrollBars := not SimpleGraph.FixedScrollBars;
end;

procedure TCircuitForm.ViewTransparentUpdate(Sender: TObject);
begin
  ViewTransparent.Checked := SimpleGraph.Transparent;
end;

procedure TCircuitForm.ViewTransparentExecute(Sender: TObject);
begin
  SimpleGraph.Transparent := not SimpleGraph.Transparent;
end;

procedure TCircuitForm.ViewPanUpdate(Sender: TObject);
begin
  ViewPan.Checked := (SimpleGraph.CommandMode = cmPan);
  ViewPan.Enabled := (SimpleGraph.HorzScrollBar.IsScrollBarVisible or SimpleGraph.VertScrollBar.IsScrollBarVisible);
end;

procedure TCircuitForm.ViewPanExecute(Sender: TObject);
begin
  SimpleGraph.CommandMode := cmPan;
end;

procedure TCircuitForm.HelpUsageExecute(Sender: TObject);
begin
  THelpOnActions.Execute;
end;

procedure TCircuitForm.OptionsConfirmHookLinkExecute(Sender: TObject);
begin
  OptionsConfirmHookLink.Checked := not OptionsConfirmHookLink.Checked;
end;

procedure TCircuitForm.OptionsConfirmDeletionExecute(Sender: TObject);
begin
  OptionsConfirmDeletion.Checked := not OptionsConfirmDeletion.Checked;
end;

procedure TCircuitForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FIsReadonly or IsGraphSaved then
  begin
    SimpleGraph.Clear;
    CanClose := True;
  end
  else
    CanClose := False;
end;

procedure TCircuitForm.cbxFontSizeChange(Sender: TObject);
begin
  cbxFontSize.Tag := StrToIntDef(cbxFontSize.Text, cbxFontSize.Tag);
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETFONTSIZE, True);
end;

procedure TCircuitForm.cbxFontNameChange(Sender: TObject);
begin
  cbxFontName.Text := cbxFontName.Items[cbxFontName.ItemIndex];
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SETFONTFACE, True);
end;

procedure TCircuitForm.LinkRemovePointExecute(Sender: TObject);
begin
  with TGraphLink(SimpleGraph.SelectedObjects[0]) do
    RemovePoint(LinkRemovePoint.Tag);
end;

procedure TCircuitForm.LinkAddPointExecute(Sender: TObject);
begin
  with TGraphLink(SimpleGraph.SelectedObjects[0]) do
    AddBreakPoint(TargetPt);
end;

procedure TCircuitForm.LinkGrowExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_GROW25, True);
end;

procedure TCircuitForm.LinkShrinkExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_SHRINK25, True);
end;

procedure TCircuitForm.LinkRotateCWExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_ROTATE90CW, True);
end;

procedure TCircuitForm.LinkRotateCCWExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_ROTATE90CCW, True);
end;

procedure TCircuitForm.LinkReverseExecute(Sender: TObject);
begin
  SimpleGraph.ForEachObject(ForEachCallback, FEO_REVERSEDIRECTION, True);
end;

procedure TCircuitForm.ObjectsPopupPopup(Sender: TObject);
var
  HT: DWORD;
  Index: Integer;
  Link: TGraphLink;
begin
  if (SimpleGraph.SelectedObjects.Count = 1) and (SimpleGraph.SelectedObjects[0] is TGraphLink) then
  begin
    LinkRemovePoint.Visible := True;
    LinkAddPoint.Visible := True;
    LinkGrow.Visible := True;
    LinkShrink.Visible := True;
    LinkRotateCW.Visible := True;
    LinkRotateCCW.Visible := True;
    LinkReverse.Visible := True;
    TargetPt := SimpleGraph.CursorPos;
    Link := TGraphLink(SimpleGraph.SelectedObjects[0]);
    HT := Link.HitTest(TargetPt);
    Index := HiWord(HT);
    LinkRemovePoint.Enabled := ((HT and GHT_POINT) <> 0) and not Link.IsFixedPoint(Index, False);
    LinkRemovePoint.Tag := Index;
    LinkAddPoint.Enabled := ((HT and GHT_LINE) <> 0) and not(gloFixedBreakPoints in Link.LinkOptions);
    LinkGrow.Enabled := Link.CanMove;
    LinkShrink.Enabled := Link.CanMove;
    LinkRotateCW.Enabled := Link.CanMove;
    LinkRotateCCW.Enabled := Link.CanMove;
  end
  else
  begin
    LinkRemovePoint.Visible := False;
    LinkAddPoint.Visible := False;
    LinkGrow.Visible := False;
    LinkShrink.Visible := False;
    LinkRotateCW.Visible := False;
    LinkRotateCCW.Visible := False;
    LinkReverse.Visible := False;
  end;
end;

procedure TCircuitForm.SimpleGraphDblClick(Sender: TObject);
begin
  EditProperties.Execute;
end;

procedure TCircuitForm.SimpleGraphNodeDblClick(Graph: TSimpleGraph; Node: TGraphNode);
begin
  EditProperties.Execute;
end;

procedure TCircuitForm.SimpleGraphLinkDblClick(Graph: TSimpleGraph; Link: TGraphLink);
begin
  EditProperties.Execute;
end;

procedure TCircuitForm.SimpleGraphObjectDblClick(Graph: TSimpleGraph; GraphObject: TGraphObject);
begin
  EditProperties.Execute;
end;

procedure TCircuitForm.SimpleGraphGraphChange(Sender: TObject);
begin
  if SimpleGraph.Modified then
    StatusBar.Panels[4].Text := SModified
  else
    StatusBar.Panels[4].Text := '';
end;

procedure TCircuitForm.SimpleGraphZoomChange(Sender: TObject);
begin
  StatusBar.Panels[5].Text := Format('%d%%', [SimpleGraph.Zoom]);
end;

procedure TCircuitForm.SimpleGraphCommandModeChange(Sender: TObject);
begin
  case SimpleGraph.CommandMode of
    cmViewOnly:
      StatusBar.Panels[0].Text := SViewOnly;
    cmPan:
      StatusBar.Panels[0].Text := SPan;
    cmEdit:
      StatusBar.Panels[0].Text := SEditing;
    cmInsertLink:
      StatusBar.Panels[0].Text := SInsertingLink;
    cmInsertNode:
      StatusBar.Panels[0].Text := SInsertingNode;
  end;
end;

procedure TCircuitForm.SimpleGraphNodeMoveResize(Graph: TSimpleGraph; Node: TGraphNode);
begin
  if Node.Selected and (SimpleGraph.SelectedObjects.Count = 1) then
  begin
    StatusBar.Panels[1].Text := Format('(%d, %d)', [Node.Left, Node.Top]);
    StatusBar.Panels[2].Text := Format('%d x %d', [Node.Width, Node.Height]);
  end;
end;

procedure TCircuitForm.SimpleGraphObjectSelect(Graph: TSimpleGraph; GraphObject: TGraphObject);
begin
  if SimpleGraph.SelectedObjects.Count = 1 then
    SimpleGraphObjectChange(Graph, SimpleGraph.SelectedObjects[0])
  else
  begin
    StatusBar.Panels[1].Text := '';
    StatusBar.Panels[2].Text := '';
    if SimpleGraph.SelectedObjects.Count > 1 then
      StatusBar.Panels[3].Text := Format(SMultiSelect, [SimpleGraph.SelectedObjects.Count])
    else
      StatusBar.Panels[3].Text := '';
  end;
end;

procedure TCircuitForm.SimpleGraphInfoTip(Graph: TSimpleGraph; GraphObject: TGraphObject; var InfoTip: String);
const
  Hooked: array [Boolean] of String = ('', SHooked);
begin
  if GraphObject.IsLink then
    with TGraphLink(GraphObject) do
    begin
      InfoTip := Format(SLinkInfo, [Text, Points[0].X, Points[0].Y, Hooked[Assigned(Source)], Points[PointCount - 1].X,
        Points[PointCount - 1].Y, Hooked[Assigned(Target)], PointCount - 2]);
    end
  else
    with TGraphNode(GraphObject) do
    begin
      InfoTip := Format(SNodeInfo, [PrettyNodeClassName(ClassName), Text, Left, Top, Width, Height,
        TGraphNode(GraphObject).LinkInputCount, TGraphNode(GraphObject).LinkOutputCount]);
    end;
end;

procedure TCircuitForm.SimpleGraphCanHookLink(Graph: TSimpleGraph; GraphObject: TGraphObject; Link: TGraphLink;
  Index: Integer; var CanHook: Boolean);
const
  StartEndPoints: array [Boolean] of String = (SStartPoint, SEndPoint);
var
  MsgText: String;
  LinkName, ObjectName: String;
begin
  if OptionsConfirmHookLink.Checked and not Link.Dragging and CanHook then
  begin
    LinkName := Link.Text;
    if LinkName = '' then
      LinkName := SNoName;
    ObjectName := GraphObject.Text;
    if ObjectName = '' then
      ObjectName := SNoName;
    MsgText := Format(SCanHook, [StartEndPoints[Index <> 0], LinkName, ObjectName]);
    CanHook := (MessageDlg(MsgText, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
  end;
end;

procedure TCircuitForm.SimpleGraphCanLinkObjects(Graph: TSimpleGraph; Link: TGraphLink; Source, Target: TGraphObject;
  var CanLink: Boolean);
var
  MsgText: String;
  LinkName, SourceName, TargetName: String;
begin
  if OptionsConfirmHookLink.Checked and not Link.Dragging and CanLink then
  begin
    LinkName := Link.Text;
    if LinkName = '' then
      LinkName := SNoName;
    SourceName := Source.Text;
    if SourceName = '' then
      SourceName := SNoName;
    TargetName := Target.Text;
    if TargetName = '' then
      TargetName := SNoName;
    MsgText := Format(SCanLink, [SourceName, TargetName, LinkName]);
    CanLink := (MessageDlg(MsgText, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
  end;
end;

procedure TCircuitForm.SimpleGraphCanRemoveObject(Graph: TSimpleGraph; GraphObject: TGraphObject;
  var CanRemove: Boolean);
var
  MsgText: String;
  ObjectName: String;
begin
  if OptionsConfirmDeletion.Checked then
  begin
    ObjectName := GraphObject.Text;
    if ObjectName = '' then
      ObjectName := SNoName;
    ObjectName := GraphObject.ClassName + ': ' + ObjectName;
    MsgText := Format(SCanDelete, [ObjectName]);
    CanRemove := (MessageDlg(MsgText, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
  end;
end;

procedure TCircuitForm.SimpleGraphObjectChange(Graph: TSimpleGraph; GraphObject: TGraphObject);
var
  PosFirstLine: Integer;
begin
  if (SimpleGraph.SelectedObjects.Count = 1) and (SimpleGraph.SelectedObjects[0] = GraphObject) then
  begin
    cbxFontName.Text := GraphObject.Font.Name;
    cbxFontSize.Text := IntToStr(GraphObject.Font.Size);
    FormatBold.Checked := (fsBold in GraphObject.Font.Style);
    FormatItalic.Checked := (fsItalic in GraphObject.Font.Style);
    FormatUnderline.Checked := (fsUnderline in GraphObject.Font.Style);
    if GraphObject is TGraphNode then
      with TGraphNode(GraphObject) do
      begin
        FormatAlignLeft.Checked := (Alignment = taLeftJustify);
        FormatCenter.Checked := (Alignment = taCenter);
        FormatAlignRight.Checked := (Alignment = taRightJustify);
        FormatAlignTop.Checked := (Layout = tlTop);
        FormatVCenter.Checked := (Layout = tlCenter);
        FormatAlignBottom.Checked := (Layout = tlBottom);
        StatusBar.Panels[1].Text := Format('(%d, %d)', [Left, Top]);
        StatusBar.Panels[2].Text := Format('%d x %d', [Width, Height]);
        PosFirstLine := Pos(#$D#$A, Text);
        if PosFirstLine <> 0 then
          StatusBar.Panels[3].Text := Copy(Text, 1, PosFirstLine)
        else
          StatusBar.Panels[3].Text := Text;
      end
    else
      with TGraphLink(GraphObject) do
      begin
        StatusBar.Panels[1].Text := '';
        StatusBar.Panels[2].Text := Format(SNumOfPoints, [PointCount]);
        StatusBar.Panels[3].Text := Text;
      end;
  end;
end;

procedure TCircuitForm.SimpleGraphObjectInitInstance(Graph: TSimpleGraph; GraphObject: TGraphObject);
var
  FontStyle: TFontStyles;
begin
  FontStyle := [];
  if FormatBold.Checked then
    Include(FontStyle, fsBold);
  if FormatItalic.Checked then
    Include(FontStyle, fsItalic);
  if FormatUnderline.Checked then
    Include(FontStyle, fsUnderline);
  with GraphObject.Font do
  begin
    if cbxFontName.Text <> '' then
      Name := cbxFontName.Text;
    Size := cbxFontSize.Tag;
    Style := FontStyle;
  end;
  if GraphObject is TGraphNode then
  begin
    if FormatAlignLeft.Checked then
      TGraphNode(GraphObject).Alignment := taLeftJustify
    else if FormatAlignRight.Checked then
      TGraphNode(GraphObject).Alignment := taRightJustify
    else
      TGraphNode(GraphObject).Alignment := taCenter;
    if FormatAlignTop.Checked then
      TGraphNode(GraphObject).Layout := tlTop
    else if FormatAlignBottom.Checked then
      TGraphNode(GraphObject).Layout := tlBottom
    else
      TGraphNode(GraphObject).Layout := tlCenter;
  end;
end;

procedure TCircuitForm.SimpleGraphMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  with SimpleGraph.ClientToGraph(X, Y) do
    StatusBar.Panels[6].Text := Format('(%d, %d)', [X, Y]);
end;

procedure TCircuitForm.SimpleGraphMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
var
  i: Integer;
begin
  MousePos := SimpleGraph.ScreenToClient(MousePos);
  if PtInRect(SimpleGraph.ClientRect, MousePos) then
  begin
    for i := 1 to 5 do
    begin
      SimpleGraph.ChangeZoomBy(-1, zoCursor);
      SimpleGraph.Update;
    end;
    Handled := True;
  end;
end;

procedure TCircuitForm.SimpleGraphMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
var
  i: Integer;
begin
  MousePos := SimpleGraph.ScreenToClient(MousePos);
  if PtInRect(SimpleGraph.ClientRect, MousePos) then
  begin
    for i := 1 to 5 do
    begin
      SimpleGraph.ChangeZoomBy(+1, zoCursor);
      SimpleGraph.Update;
    end;
    Handled := True;
  end;
end;

procedure TCircuitForm.GetCircuitStream(CircuitStream: TMemoryStream);
begin
  FCircuitStream.Seek(0, soBeginning);
  FCircuitStream.SaveToStream(CircuitStream);
  // CircuitStream.CopyFrom( FCircuitStream, SizeOf(FCircuitStream));
end;

procedure TCircuitForm.GetPngStream(PngStream: TMemoryStream);
begin
  FPngStream.Seek(0, soBeginning);
  FPngStream.SaveToStream(PngStream);
  // PngStream.CopyFrom( FPngStream, SizeOf(FPngStream));
end;

procedure TCircuitForm.FormDestroy(Sender: TObject);
begin
  if Assigned(SaveHint) then
    Application.OnHint := SaveHint
  else
    Application.OnHint := nil;

  FPngStream.Free;
  FCircuitStream.Free;
end;

procedure TCircuitForm.FormShow(Sender: TObject);
begin
  if SimpleGraph.ObjectsCount() > 0 then
    ViewWholeGraphExecute(nil);
end;

end.
