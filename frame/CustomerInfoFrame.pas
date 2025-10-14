unit CustomerInfoFrame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Menus, Vcl.Mask,
  Dm, PrjConst, A4onTypeUnit, DBCtrlsEh, HtmlView, HTMLSubs,
  HTMLUn2,
  FramView, FramBrwz;

type
  TCustomerInfoFrm = class(TFrame)
    gbInfo: TGroupBox;
    pmHV: TPopupMenu;
    miCopy: TMenuItem;
    HtmlViewer: THtmlViewer;
    procedure HtmlViewerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HtmlViewerSectionClick(Sender: TObject; Obj: TSectionBase; Button: TMouseButton; Shift: TShiftState;
      X, Y, IX, IY: Integer);
    procedure HtmlViewerHotSpotClick(Sender: TObject; const SRC: string; var Handled: Boolean);
    procedure miCopyClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
    Font_size: Integer;
    Font_name: string;
    FRed_Sum: single;
    FShowAsBalance: Boolean;
    FShowMoney: Boolean;
    ci: TCustomerInfo;
    procedure SetCI(Value: TCustomerInfo);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property Customer: TCustomerInfo read ci write SetCI;
    procedure MakeHtml;
  end;

implementation

uses
  MAIN, CustomerForma;

{$R *.dfm}

constructor TCustomerInfoFrm.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  Font_size := 8;
  Font_name := 'Tahoma';
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  FRed_Sum := dmMain.GetSettingsValue('DOLG');
  FShowAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');
  FShowMoney := (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full))
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
  HtmlViewer.defBackground := clBtnFace;

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
      dText := '<i>' + dText + '</i>: ' + '<font' + dColor + '><strong>' + FormatFloat(',0.00', ci.Debt_sum) + '</strong></font><br>';
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
    else
      clr := clBtnFace;

    HtmlViewer.DefFontName := Font_name;
    HtmlViewer.DefFontSize := Font_size;
    HtmlViewer.defBackground := clr;
    gbInfo.Color := clr;
  end;

  HtmlViewer.LoadFromString(FHtml);
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

procedure TCustomerInfoFrm.miCopyClick(Sender: TObject);
begin
  HtmlViewer.CopySelectedAsTextToClipboard;
end;

procedure TCustomerInfoFrm.SetCI(Value: TCustomerInfo);
begin
  ci := Value;
  MakeHtml;
end;

end.
