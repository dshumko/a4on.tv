unit ReportPreview;

interface

uses
  Winapi.Windows,
  System.Classes, System.Types,
  Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList, Vcl.ActnList,
  frxClass, frxPreview,
  {$IFDEF USE_ZEOS}
  frxZeosComponents,
  {$ENDIF}
  System.Actions,
  Vcl.Menus, Vcl.Buttons, Vcl.ExtCtrls,
  frxGradient, frxChBox, frxDCtrl, frxExportPDF, frxCross, frxCtrls, frxDock, frxRes, PrjConst;

type
  TReportChild = class(TForm)
    frxPreview: TfrxPreview;
    PopupMenu2: TPopupMenu;
    PDF1: TMenuItem;
    XLS1: TMenuItem;
    GIF1: TMenuItem;
    frxReport: TfrxReport;
    ExportPopup: TPopupMenu;
    HiddenMenu: TPopupMenu;
    Showtemplate1: TMenuItem;
    RightMenu: TPopupMenu;
    CollapseMI: TMenuItem;
    ExpandMI: TMenuItem;
    N1: TMenuItem;
    ToolBar: TToolBar;
    PrintB: TToolButton;
    OpenB: TToolButton;
    SaveB: TToolButton;
    ExportB: TToolButton;
    PdfB: TToolButton;
    EmailB: TToolButton;
    FindB: TToolButton;
    Sep1: TToolButton;
    ZoomPlusB: TToolButton;
    Sep3: TfrxTBPanel;
    ZoomCB: TfrxComboBox;
    ZoomMinusB: TToolButton;
    Sep2: TToolButton;
    OutlineB: TToolButton;
    ThumbB: TToolButton;
    PageSettingsB: TToolButton;
    DesignerB: TToolButton;
    Sep5: TToolButton;
    FirstB: TToolButton;
    PriorB: TToolButton;
    Sep4: TfrxTBPanel;
    PageE: TEdit;
    NextB: TToolButton;
    LastB: TToolButton;
    frTBPanel1: TfrxTBPanel;
    CancelB: TSpeedButton;
    btnFastview: TToolButton;
    OfNL: TLabel;
    actlst: TActionList;
    actClose: TAction;
    actFind: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PrintBClick(Sender: TObject);
    procedure OpenBClick(Sender: TObject);
    procedure SaveBClick(Sender: TObject);
    procedure FindBClick(Sender: TObject);
    procedure ZoomPlusBClick(Sender: TObject);
    procedure ZoomMinusBClick(Sender: TObject);
    procedure UpdateZoom;
    procedure ZoomCBClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PageSettingsBClick(Sender: TObject);
    procedure PageEClick(Sender: TObject);
    procedure FirstBClick(Sender: TObject);
    procedure PriorBClick(Sender: TObject);
    procedure NextBClick(Sender: TObject);
    procedure LastBClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure DesignerBClick(Sender: TObject);
    procedure NewPageBClick(Sender: TObject);
    procedure DelPageBClick(Sender: TObject);
    procedure ExportMIClick(Sender: TObject);
    procedure DesignerBMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PdfBClick(Sender: TObject);
    procedure EmailBClick(Sender: TObject);
    procedure OutlineBClick(Sender: TObject);
    procedure ThumbBClick(Sender: TObject);
    procedure ToolBarResize(Sender: TObject);
    procedure btnFastviewClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure frxReportProgressStart(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
    procedure frxReportProgressStop(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
    procedure frxPreviewPageChanged(Sender: TfrxPreview; PageNo: Integer);
    procedure actCloseExecute(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actFindExecute(Sender: TObject);
  private
    { Private declarations }
    fReport_ID: Integer;
    FRunning: Boolean;
    FPDFExport: TfrxCustomExportFilter;
    FEmailExport: TfrxCustomExportFilter;
    procedure SetReportID(value: Integer);
    function ReadReportID: Integer;
    procedure Init;
  public
    { Public declarations }
    procedure ShowReportBody;
    procedure LoadReportBody;
    procedure ShowPreparedReport;
    procedure AddReport(const r_id: Integer; const variable: string; const value: Variant;
      const AsNew: Boolean = False);
    function GetVariableID(const variable: string): Integer;
    procedure SetVariable(const variable: string; const value: Variant);
    procedure PrepareReport(const clear: Boolean = true);
    procedure PrintReport;
    property REPORT_ID: Integer read ReadReportID write SetReportID;
    constructor CreateAsPage(AOwner: TComponent);
  end;

procedure ShowReport(const aREPORT_ID: Integer); overload;
procedure ShowReport(const aPATH: String); overload;

implementation

uses
  System.Variants, System.SysUtils,
  Data.DB,
  frxDsgnIntf, frxUtils, MAIN, DM, AtrCommon, CF;

{$R *.dfm}

procedure ShowReport(const aPATH: String);
var
  id: Integer;
begin
  id := dmMain.GET_ID_REPORT_BY_PATH(aPATH);
  if id > 0 then
    ShowReport(id);
end;

procedure ShowReport(const aREPORT_ID: Integer);
var
  i: Integer;
begin
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if A4MainForm.MDIChildren[i].tag = aREPORT_ID then
        A4MainForm.MDIChildren[i].Close;

  with TReportChild.Create(application) do
  begin
    REPORT_ID := aREPORT_ID;
    LoadReportBody;
    ShowReportBody;
    Show;
  end;
end;

constructor TReportChild.CreateAsPage(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle := bsNone;
  FormStyle := fsNormal;
  actClose.Visible := False;
end;

procedure TReportChild.ShowReportBody;
var
  ci: Integer;
begin
  if Assigned(CustomersForm) then
  begin
    ci := frxReport.Variables.IndexOf('CUSTOMER_ID');
    if ci > 0 then
      frxReport.Variables['CUSTOMER_ID'] := CustomersForm.dsCustomers['CUSTOMER_ID'];
  end;

  if frxReport.PrepareReport then
    frxReport.ShowPreparedReport;
end;

procedure TReportChild.ShowPreparedReport;
begin
  frxReport.ShowPreparedReport;
  // frxReport.PreviewPages.Finish;
end;

procedure TReportChild.LoadReportBody;
{
  var
  Stream: TStream;
  begin
  try
  dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value:=fReport_ID;
  dmMain.fdsLoadReport.Open;
  if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value<>NULL then begin
  Stream:=TMemoryStream.Create;
  try
  TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
  Stream.Position:=0;
  frxReport.LoadFromStream(Stream);
  frxReport.FileName:=dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
  Caption := frxReport.FileName;
  finally
  Stream.Free;
  end;
  end;
  finally
  dmMain.fdsLoadReport.Close;
  end;
}
var
  Stream: TFileStream;
  vFN: string;
begin
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').value := fReport_ID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').value <> NULL then
    begin
      vFN := GetTempDir;
      vFN := vFN + dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
      Stream := TFileStream.Create(vFN, fmCreate);
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
      finally
        Stream.Free;
      end;
      if FileExists(vFN) then
      begin
        frxReport.LoadFromFile(vFN);
        // frxReport.FileName:=dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        // Caption := frxReport.FileName;
      end;
    end;
  finally
    if dmMain.fdsLoadReport.Active then
      dmMain.fdsLoadReport.Close;
  end;
end;

procedure TReportChild.SetReportID(value: Integer);
begin
  tag := value;
  fReport_ID := value;
end;

function TReportChild.ReadReportID: Integer;
begin
  Result := fReport_ID;
end;

procedure TReportChild.btnFastviewClick(Sender: TObject);
begin
  frxReport.Preview := nil;

  frxReport.OldStyleProgress := False;
  frxReport.PreviewOptions.ThumbnailVisible := False;
  LoadReportBody;
  ShowReportBody;
end;

procedure TReportChild.FormCreate(Sender: TObject);
begin

  PrintB.Caption := frxGet(101);
  PrintB.Hint := frxGet(102);
  OpenB.Caption := frxGet(103);
  OpenB.Hint := frxGet(104);
  SaveB.Caption := frxGet(105);
  SaveB.Hint := frxGet(106);
  ExportB.Caption := frxGet(107);
  ExportB.Hint := frxGet(108);
  FindB.Caption := frxGet(109);
  FindB.Hint := frxGet(110);
  ZoomCB.Hint := frxGet(119);
  PageSettingsB.Caption := frxGet(120);
  PageSettingsB.Hint := frxGet(121);
  DesignerB.Caption := frxGet(132);
  DesignerB.Hint := frxGet(133);
  FirstB.Caption := frxGet(134);
  FirstB.Hint := frxGet(135);
  PriorB.Caption := frxGet(136);
  PriorB.Hint := frxGet(137);
  NextB.Caption := frxGet(138);
  NextB.Hint := frxGet(139);
  LastB.Caption := frxGet(140);
  LastB.Hint := frxGet(141);
  actClose.Caption := frxResources.Get('clClose');
  PageE.Hint := frxGet(142);
  PdfB.Hint := frxGet(151);
  EmailB.Hint := frxGet(152);
  ZoomPlusB.Caption := frxGet(124);
  ZoomPlusB.Hint := frxGet(125);
  ZoomMinusB.Caption := frxGet(126);
  ZoomMinusB.Hint := frxGet(127);
  OutlineB.Caption := frxGet(128);
  OutlineB.Hint := frxGet(129);
  ThumbB.Caption := frxGet(130);
  btnFastview.Caption := rsViewInFastReport;
  btnFastview.Hint := rsPreviewInWindow;
  ThumbB.Hint := frxGet(131);
  ZoomCB.Items.clear;
  ZoomCB.Items.Add('25%');
  ZoomCB.Items.Add('50%');
  ZoomCB.Items.Add('75%');
  ZoomCB.Items.Add('100%');
  ZoomCB.Items.Add('150%');
  ZoomCB.Items.Add('200%');
  ZoomCB.Items.Add(frxResources.Get('zmPageWidth'));
  ZoomCB.Items.Add(frxResources.Get('zmWholePage'));
  ToolBar.Images := frxResources.PreviewButtonImages;
  ExpandMI.Caption := frxGet(600);
  CollapseMI.Caption := frxGet(601);

  FPDFExport := nil;
  FEmailExport := nil;

  Init;
end;

procedure TReportChild.Init;
var
  i: Integer;
  m: TMenuItem;
begin
  ToolBar.Images := frxResources.PreviewButtonImages;

  for i := 0 to frxExportFilters.Count - 1 do
  begin
    if frxExportFilters[i].Filter = frxDotMatrixExport then
      continue;
    m := TMenuItem.Create(ExportPopup);
    ExportPopup.Items.Add(m);
    m.Caption := TfrxCustomExportFilter(frxExportFilters[i].Filter).GetDescription + '...';
    m.tag := i;
    m.OnClick := ExportMIClick;
    if TfrxCustomExportFilter(frxExportFilters[i].Filter).ClassName = 'TfrxPDFExport' then
    begin
      FPDFExport := TfrxCustomExportFilter(frxExportFilters[i].Filter);
      PdfB.Visible := pbExportQuick in frxReport.PreviewOptions.Buttons;
    end;
    if not(pbNoEmail in frxReport.PreviewOptions.Buttons) then
    begin
      if TfrxCustomExportFilter(frxExportFilters[i].Filter).ClassName = 'TfrxMailExport' then
      begin
        FEmailExport := TfrxCustomExportFilter(frxExportFilters[i].Filter);
        EmailB.Visible := pbExportQuick in frxReport.PreviewOptions.Buttons;
      end;
    end
    else
      EmailB.Visible := False;
  end;
  ExportB.Visible := (not(frxExportFilters.Count = 0) or ((frxExportFilters.Count = 1) and
    (frxExportFilters[0].Filter = frxDotMatrixExport)));

  dmMain.GlobalInitReport(frxReport);

end;

procedure TReportChild.PrintBClick(Sender: TObject);
begin
  try
    frxPreview.Print;
    Enabled := true;
  finally
    Enabled := true;
  end;
end;

procedure TReportChild.OpenBClick(Sender: TObject);
begin
  frxPreview.LoadFromFile;
  Caption := frxReport.ReportOptions.Name;
end;

procedure TReportChild.SaveBClick(Sender: TObject);
begin
  frxPreview.SaveToFile;
end;

procedure TReportChild.FindBClick(Sender: TObject);
begin
  actFindExecute(Sender);
end;

procedure TReportChild.ZoomPlusBClick(Sender: TObject);
begin
  frxPreview.Zoom := frxPreview.Zoom + 0.25;
end;

procedure TReportChild.ZoomMinusBClick(Sender: TObject);
begin
  frxPreview.Zoom := frxPreview.Zoom - 0.25;
end;

procedure TReportChild.UpdateZoom;
begin
  ZoomCB.Text := IntToStr(Round(frxPreview.Zoom * 100)) + '%';
end;

procedure TReportChild.ZoomCBClick(Sender: TObject);
var
  s: String;
begin
  frxPreview.SetFocus;

  if ZoomCB.ItemIndex = 6 then
    frxPreview.ZoomMode := zmPageWidth
  else if ZoomCB.ItemIndex = 7 then
    frxPreview.ZoomMode := zmWholePage
  else
  begin
    s := ZoomCB.Text;

    if Pos('%', s) <> 0 then
      s[Pos('%', s)] := ' ';
    while Pos(' ', s) <> 0 do
      Delete(s, Pos(' ', s), 1);

    if s <> '' then
      frxPreview.Zoom := frxStrToFloat(s) / 100;
  end;

  PostMessage(Handle, WM_UPDATEZOOM, 0, 0);
end;

procedure TReportChild.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Prior then
    frxPreview.PageNo := frxPreview.PageNo - 1
  else if Key = vk_Next then
    frxPreview.PageNo := frxPreview.PageNo + 1
  else if Key = vk_Home then
    frxPreview.PageNo := 1
  else if Key = vk_End then
    frxPreview.PageNo := frxPreview.PageCount
  else if (Key = vk_F3) and (pbFind in frxReport.PreviewOptions.Buttons) then
    frxPreview.FindNext
  else if ssCtrl in Shift then
  begin
    if (Key = Ord('P')) and (pbPrint in frxReport.PreviewOptions.Buttons) then
      frxPreview.Print
    else if (Key = Ord('S')) and (pbSave in frxReport.PreviewOptions.Buttons) then
      frxPreview.SaveToFile
    else if (Key = Ord('F')) and (pbFind in frxReport.PreviewOptions.Buttons) then
      actFindExecute(Sender);
  end;
end;

procedure TReportChild.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if ActiveControl = ZoomCB then
      ZoomCBClick(nil);
    if ActiveControl = PageE then
      PageEClick(nil);
  end;
end;

procedure TReportChild.PageSettingsBClick(Sender: TObject);
begin
  frxPreview.PageSetupDlg;
end;

procedure TReportChild.PageEClick(Sender: TObject);
begin
  frxPreview.PageNo := StrToInt(PageE.Text);
  frxPreview.SetFocus;
end;

procedure TReportChild.FirstBClick(Sender: TObject);
begin
  frxPreview.First;
end;

procedure TReportChild.PriorBClick(Sender: TObject);
begin
  frxPreview.Prior;
end;

procedure TReportChild.NextBClick(Sender: TObject);
begin
  frxPreview.Next;
end;

procedure TReportChild.LastBClick(Sender: TObject);
begin
  frxPreview.Last;
end;

procedure TReportChild.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  frxPreview.MouseWheelScroll(WheelDelta, Shift, MousePos, False);
  // procedure MouseWheelScroll(Delta: Integer; Shift: TShiftState; MousePos: TPoint; Horz: Boolean = False);
end;

procedure TReportChild.frxReportProgressStart(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
begin
  Screen.Cursor := crHourGlass;
  FRunning := true;
  actClose.Visible := true;
  actClose.Caption := frxResources.Get('clCancel');
end;

procedure TReportChild.frxReportProgressStop(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
begin
  Screen.Cursor := crDefault;
  FRunning := False;
  actClose.Visible := False;
  actClose.Caption := frxResources.Get('clClose');
end;

procedure TReportChild.DesignerBClick(Sender: TObject);
begin
  frxPreview.Edit;
end;

procedure TReportChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TReportChild.NewPageBClick(Sender: TObject);
begin
  frxPreview.AddPage;
end;

procedure TReportChild.DelPageBClick(Sender: TObject);
begin
  frxPreview.DeletePage;
end;

procedure TReportChild.ExportMIClick(Sender: TObject);
var
  i: Integer;
begin
  i := TMenuItem(Sender).tag;
  if (i < 0) or (i > (frxExportFilters.Count - 1)) then
    Exit;
  frxPreview.Export(TfrxCustomExportFilter(frxExportFilters[i].Filter));
  Enabled := true;
end;

procedure TReportChild.DesignerBMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt: TPoint;
begin
  pt := DesignerB.ClientToScreen(Point(0, 0));
  if Button = mbRight then
    HiddenMenu.Popup(pt.X, pt.Y);
end;

procedure TReportChild.PdfBClick(Sender: TObject);
begin
  if Assigned(FPDFExport) then
    frxPreview.Export(FPDFExport);
end;

procedure TReportChild.EmailBClick(Sender: TObject);
begin
  if Assigned(FEmailExport) then
    frxPreview.Export(FEmailExport);
end;

procedure TReportChild.OutlineBClick(Sender: TObject);
begin
  frxPreview.OutlineVisible := OutlineB.Down;
end;

procedure TReportChild.ThumbBClick(Sender: TObject);
begin
  frxPreview.ThumbnailVisible := ThumbB.Down;
end;

procedure TReportChild.ToolBarResize(Sender: TObject);
begin
  frTBPanel1.Width := ToolBar.Width - CancelB.Width - frTBPanel1.Left - 10;
end;

function TReportChild.GetVariableID(const variable: string): Integer;
begin
  Result := frxReport.Variables.IndexOf(variable);
end;

procedure TReportChild.SetVariable(const variable: string; const value: Variant);
begin
  frxReport.Variables[variable] := value;
end;

procedure TReportChild.PrepareReport(const clear: Boolean = true);
begin
  frxReport.PrepareReport(clear);
end;

procedure TReportChild.PrintReport;
begin
  frxReport.Print;
end;

procedure TReportChild.actFindExecute(Sender: TObject);
begin
  frxPreview.Find;
end;

procedure TReportChild.AddReport(const r_id: Integer; const variable: string; const value: Variant;
  const AsNew: Boolean = False);
var
  vi: Integer;
begin
  fReport_ID := r_id;
  LoadReportBody;
  vi := frxReport.Variables.IndexOf(variable);
  if vi > 0 then
    frxReport.Variables[variable] := value;

  frxReport.PrepareReport(AsNew);
end;

procedure TReportChild.frxPreviewPageChanged(Sender: TfrxPreview; PageNo: Integer);
begin
  OfNL.Caption := Format(frxResources.Get('clOf'), [frxPreview.PageCount]);
  Sep4.Width := OfNL.Left + OfNL.Width + 4;
  PageE.Text := IntToStr(PageNo);
end;

procedure TReportChild.actCloseExecute(Sender: TObject);
begin
  if FRunning then
    frxPreview.Cancel
  else
    Close;
end;

function TReportChild.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

end.
