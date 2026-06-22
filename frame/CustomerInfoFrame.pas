unit CustomerInfoFrame;

{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Menus, Vcl.Mask,
  Dm, PrjConst, A4onTypeUnit, DBCtrlsEh,
{$IFDEF USE_PIXIE}
  Vcl.Clipbrd, Pixie.HtmlView.Vcl, Pixie.Document
{$ELSE}
  Vcl.ExtCtrls, HtmlView, HTMLSubs, HTMLUn2, FramView, FramBrwz
{$IFEND}
    ;

type
  TCustomerInfoFrm = class(TFrame)
    gbInfo: TGroupBox;
    pmHV: TPopupMenu;
    miCopy: TMenuItem;
    procedure miCopyClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
    FFontSize: Integer;
    FFontName: string;
    FRed_Sum: single;
    FShowAsBalance: Boolean;
    FShowMoney: Boolean;
    FHidePersonalData: Boolean;
    FHidePersonalName: Boolean;
    ci: TCustomerInfo;
    FHtmlForCID: Integer;
{$IFDEF USE_PIXIE}
    HtmlViewer: TPixieHtmlView;
    procedure PixieHtmlViewerSectionClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ViewAnchorClick(Sender: TObject; const Url: string);
{$ELSE}
    HtmlViewer: THtmlViewer;
    procedure CreateBerndGabrielHtmlViewer();
    procedure HtmlViewerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HtmlViewerSectionClick(Sender: TObject; Obj: TSectionBase; Button: TMouseButton; Shift: TShiftState;
      X, Y, IX, IY: Integer);
    procedure HtmlViewerHotSpotClick(Sender: TObject; const SRC: string; var Handled: Boolean);
{$IFEND}
    procedure SetCI(Value: TCustomerInfo);
    procedure CreateHtmlView;
    procedure DestroyHtmlView;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Customer: TCustomerInfo read ci write SetCI;
    procedure MakeHtml;
  end;

implementation

uses
  AtrStrUtils, MAIN, CustomerForma;

{$R *.dfm}

constructor TCustomerInfoFrm.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  FFontSize := 8;
  FFontName := 'Tahoma';
  if TryStrToInt(dmMain.GetIniValue('FFontSize'), i) then
  begin
    FFontSize := i;
    FFontName := dmMain.GetIniValue('FFontName');
  end;
  FRed_Sum := dmMain.GetSettingsValue('DOLG');
  FShowAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');
  FShowMoney := (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full));
  FHidePersonalData := dmMain.AllowedAction(rght_Customer_PersonalData);
  FHidePersonalName := dmMain.AllowedAction(rght_Customer_PersonalName);

  CreateHtmlView;
end;

destructor TCustomerInfoFrm.Destroy;
begin
  DestroyHtmlView;
  inherited;
end;

procedure TCustomerInfoFrm.CreateHtmlView;
begin
{$IFDEF USE_PIXIE}
  HtmlViewer := TPixieHtmlView.Create(Self);
  HtmlViewer.Parent := gbInfo;
  HtmlViewer.Align := alClient;
  HtmlViewer.BorderStyle := bsNone;
  HtmlViewer.Color := clWhite;
  HtmlViewer.OnMouseUp := PixieHtmlViewerSectionClick;
  HtmlViewer.OnAnchorClick := ViewAnchorClick;
{$ELSE}
  CreateBerndGabrielHtmlViewer;
{$IFEND}
end;

procedure TCustomerInfoFrm.DestroyHtmlView;
begin
  // if Assigned(FWkeWebbrowser) then
  // FWkeWebbrowser.Free;
  if Assigned(HtmlViewer) then
    HtmlViewer.Free;
end;

procedure TCustomerInfoFrm.FrameResize(Sender: TObject);
begin
  MakeHtml;
end;

procedure TCustomerInfoFrm.MakeHtml;
var
  FHtml: string;
  clr: TColor;
  addr, sText, lText: string;
  dText, dColor: string;
  fo: TCustomForm;
begin
  if FHtmlForCID = ci.CUSTOMER_ID then
    Exit;

  clr := clBtnFace;

  if ci.CUSTOMER_ID = -1 then
    FHtml := '<html><body>' + rsNOT_FOUND_CUST + '</body></html>'
  else
  begin
    if FShowMoney // просмотр сумм
    then
    begin
      dColor := '';
      if FShowAsBalance then
      begin
        dText := rsBALANCE;
        if (-1 * ci.Debt_sum > FRed_Sum) then
          dColor := ' color="RED"';
      end
      else
      begin
        dText := rsSALDO;
        if (ci.Debt_sum > FRed_Sum) then
          dColor := ' color="RED"';
      end;
      dText := '<i>' + dText + '</i>: ' + '<font' + dColor + '><strong>' + FormatFloat(',0.00', ci.Debt_sum) +
        '</strong></font>';
      if (ci.Tarif_Month > -1) or (ci.Tarif_Month > -1) then
      begin
        dText := dText + ' <i>Сумма тарифов</i>';
        if ci.Tarif_Month > -1 then
          dText := dText + ' <i>за месяц</i>: ' + FormatFloat(',0.00', ci.Tarif_Month);
        if ci.Tarif_Day > -1 then
          dText := dText + ' <i>за день</i>: ' + FormatFloat(',0.00', ci.Tarif_Day);
      end;
      dText := dText + '<br>';
    end;

    addr := '' + ci.Street + ' д.' + ci.HOUSE_NO;
    if not ci.flat_No.IsEmpty then
      addr := addr + ' кв.' + ci.flat_No;
    if not ci.City.IsEmpty then
      addr := addr + ' (' + ci.City + ')';

    if not ci.CUST_STATE_DESCR.IsEmpty then
      sText := '<i>' + rsSTATE + '</i>: ' + ci.CUST_STATE_DESCR;

    if not ci.notice.IsEmpty then
    begin
      if not sText.IsEmpty then
        sText := sText + '<br>';
      sText := sText + '<i>' + rsSNotice + '</i>: ' + ci.notice;
    end;

    lText := '<strong>' + ci.Account_no + '</strong>';
    fo := GetParentForm(Self);
    if (not(fsModal in fo.FormState)) then
      lText := '<a href="ls:' + ci.Account_no + '">' + lText + '</a>';

    FHtml := '<html><body>' +
    // для соохранения форматирования
      '<i>ЛC</i>: ' + lText + ' ' + ci.FIO + '<br>' +
    // для соохранения форматирования
      dText +
    // для соохранения форматирования
      '<i>' + rsCode + '</i>: ' + ci.cust_code + ' ' + addr + ' ' + '<br>' +
    // для соохранения форматирования
      sText +
    // для соохранения форматирования
      '</body></html>';

    if ci.Color <> '' then
      clr := StringToColor(ci.Color)
  end;

{$IFDEF USE_PIXIE}
  HtmlViewer.Color := clr;
{$ELSE}
  HtmlViewer.DefFontName := FFontName;
  HtmlViewer.DefFontSize := FFontSize;
  HtmlViewer.defBackground := clr;
{$IFEND}
  gbInfo.Color := clr;
  HtmlViewer.LoadFromString(FHtml);
  FHtmlForCID := ci.CUSTOMER_ID
end;

{$IFDEF USE_PIXIE}

procedure TCustomerInfoFrm.PixieHtmlViewerSectionClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  pt: TPoint;
begin
  if (Button = mbRight) and HtmlViewer.Document.HasSelection and (Length(HtmlViewer.Document.GetSelectedText) > 0) then
  begin
    pt := Mouse.CursorPos;
    pmHV.Popup(pt.X, pt.Y);
  end;
end;

procedure TCustomerInfoFrm.ViewAnchorClick(Sender: TObject; const Url: string);
var
  FullUrl: string;
begin
  FullUrl := Url;
  if (Pos('ls:', LowerCase(FullUrl)) = 1) then
  begin
    if ci.CUSTOMER_ID <> -1 then
      ShowCustomer(ci.CUSTOMER_ID);
  end;
end;
{$ELSE}

procedure TCustomerInfoFrm.CreateBerndGabrielHtmlViewer;
begin
  HtmlViewer := THtmlViewer.Create(Self);

  HtmlViewer.Name := 'HtmlViewer';
  HtmlViewer.Parent := gbInfo;
  HtmlViewer.ParentCustomHint := False;
  HtmlViewer.BorderStyle := htNone;
  HtmlViewer.DefFontName := 'Tahoma';
  HtmlViewer.DefFontSize := 8;
  HtmlViewer.DefHotSpotColor := clBtnText;
  HtmlViewer.DefOverLinkColor := clBtnText;
  HtmlViewer.HistoryMaxCount := 0;
  HtmlViewer.HtOptions := [htOverLinksActive];
  HtmlViewer.NoSelect := False;
  HtmlViewer.Text := '';
  HtmlViewer.ViewImages := False;
  HtmlViewer.Align := alClient;
  HtmlViewer.PopupMenu := pmHV;
  HtmlViewer.TabOrder := 0;
  HtmlViewer.OnKeyUp := HtmlViewerKeyUp;
  HtmlViewer.OnHotSpotClick := HtmlViewerHotSpotClick;
  HtmlViewer.OnSectionClick := HtmlViewerSectionClick;
end;

procedure TCustomerInfoFrm.HtmlViewerHotSpotClick(Sender: TObject; const SRC: string; var Handled: Boolean);
begin
  if ci.CUSTOMER_ID <> -1 then
    ShowCustomer(ci.CUSTOMER_ID);
  Handled := True;
end;

procedure TCustomerInfoFrm.HtmlViewerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin
    case Key of
      67:
        HtmlViewer.CopySelectedAsTextToClipboard;
      65:
        HtmlViewer.SelectAll; // Ctrl+A
    end;
  end;
end;

procedure TCustomerInfoFrm.HtmlViewerSectionClick(Sender: TObject; Obj: TSectionBase; Button: TMouseButton;
  Shift: TShiftState; X, Y, IX, IY: Integer);
var
  pt: TPoint;
begin
  if HtmlViewer.SelLength <> 0 then
  begin
    pt := Mouse.CursorPos;
    pmHV.Popup(pt.X, pt.Y);
  end;
end;
{$IFEND}

procedure TCustomerInfoFrm.miCopyClick(Sender: TObject);
begin
{$IFDEF USE_PIXIE}
  if HtmlViewer.Document.HasSelection then
    Clipboard.AsText := HtmlViewer.Document.GetSelectedText;
{$ELSE}
  HtmlViewer.CopySelectedAsTextToClipboard;
{$IFEND}
end;

procedure TCustomerInfoFrm.SetCI(Value: TCustomerInfo);
begin
  ci := Value;
  if FHidePersonalData or FHidePersonalName then
    ci.FIO := HideFullName(ci.FIO, FHidePersonalData, FHidePersonalName);

  MakeHtml;
end;

end.
