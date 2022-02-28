unit NodeLinkForma;

interface

uses
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  WinAPI.Windows, WinAPI.Messages, Data.DB,
  Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask, Vcl.Forms,
  FIBDataSet, pFIBDataSet,
  DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst,
  GridsEh, DBGridEh, OkCancel_frame, FIBDatabase, pFIBDatabase,
  A4onTypeUnit;

type

  TNodeLinkForm = class(TForm)
    OkCancelFrame: TOkCancelFrame;
    srcLink: TDataSource;
    dsLink: TpFIBDataSet;
    CnErrors: TCnErrorProvider;
    dsType: TpFIBDataSet;
    srcType: TDataSource;
    dsNodes: TpFIBDataSet;
    srcNodes: TDataSource;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlMain: TPanel;
    pnlSecond: TPanel;
    mmoNOTICE: TDBMemoEh;
    lbl3: TLabel;
    ednLength: TDBNumberEditEh;
    lbl4: TLabel;
    ednStock: TDBNumberEditEh;
    edtNAME: TDBEditEh;
    Label1: TLabel;
    lbl2: TLabel;
    lcbLinkType: TDBLookupComboboxEh;
    lbl1: TLabel;
    Label2: TLabel;
    lcbNode: TDBLookupComboboxEh;
    Label3: TLabel;
    lcbPOINT_S: TDBLookupComboboxEh;
    srcMain: TDataSource;
    lbl5: TLabel;
    ednSTOCK1: TDBNumberEditEh;
    dsMat: TpFIBDataSet;
    srcMat: TDataSource;
    lcbApplMID: TDBLookupComboboxEh;
    lcbLabel: TDBLookupComboboxEh;
    lbl6: TLabel;
    srcLabel: TDataSource;
    dsLabel: TpFIBDataSet;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbLinkTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure lcbNodeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbNodeChange(Sender: TObject);
    procedure lcbLinkTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbPOINT_SChange(Sender: TObject);
  private
    FMainLink: TNodeLinkItem;
    FSecondLink: TNodeLinkItem;
    procedure GenName();
    procedure SetMainLink(value: TNodeLinkItem);
    procedure SetSecondLink(value: TNodeLinkItem);
    procedure SaveLink;
  public
    property MainLink: TNodeLinkItem read FMainLink write SetMainLink;
    property SecondLink: TNodeLinkItem read FSecondLink write SetSecondLink;
  end;

function LinkNodes(var MainItem, SecondItem: TNodeLinkItem): Boolean;

implementation

uses DM, pFIBQuery, AtrStrUtils;

{$R *.dfm}

function getFirstLetters(const s: String): String;
var
  w : TStringArray;
  i : Integer;
begin
  Result := '';
  w := Explode(' ', s);
  for I := 0 to Length(w)-1 do begin
    Result := Result + Copy(w[i],1,1);
  end;
  Result := UpperCase(Result, loUserLocale);
end;

function LinkNodes(var MainItem, SecondItem: TNodeLinkItem): Boolean;
begin
  result := false;
  with TNodeLinkForm.Create(Application) do
  begin
    try
      MainLink := MainItem;
      SecondLink := SecondItem;

      if ShowModal = mrOk then
      begin
        MainItem.LINK_ID := MainLink.LINK_ID;
        result := true;
      end;
    finally
      free
    end;
  end;
end;

procedure TNodeLinkForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsLink.Active then
  begin
    if dsLink.State in [dsEdit, dsInsert] then
      dsLink.Cancel;
    dsLink.Close;
  end;
  if dsNodes.Active then
    dsNodes.Close;
  if dsType.Active then
    dsType.Close;
  if dsMat.Active then
    dsMat.Close;
  if dsLabel.Active then
    dsLabel.Close;
end;

procedure TNodeLinkForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TNodeLinkForm.FormShow(Sender: TObject);
begin
  OkCancelFrame.bbOk.Visible := ((dmMain.AllowedAction(rght_Dictionary_full)) or (dmMain.AllowedAction(rght_Dictionary_Nodes)));
  dsNodes.ParamByName('NODE_ID').value := FMainLink.NODE_ID;
  dsNodes.Open;
  dsType.Open;
  dsMat.Open;
  dsLabel.Open;

  dsLink.ParamByName('WID').value := FMainLink.LINK_ID;
  dsLink.Open;

  if FMainLink.LINK_ID <= 0 then
    dsLink.Insert
  else
    dsLink.Edit;

  if FMainLink.NODE_ID > 0 then
    Caption := Caption + ' > ' + FMainLink.NODE_Name
  else
  begin
    if FSecondLink.NODE_ID > 0 then
      Caption := Caption + ' < ' + FSecondLink.NODE_Name
  end;

  if FSecondLink.NODE_ID > 0 then
    lcbNode.value := FSecondLink.NODE_ID;
end;

procedure TNodeLinkForm.lcbLinkTypeChange(Sender: TObject);
begin
  GenName();
end;

procedure TNodeLinkForm.lcbLinkTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsType.Active) and (not dsType.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsType['COLOR'])
  else
    Background := clWindow;
end;

procedure TNodeLinkForm.lcbNodeChange(Sender: TObject);
begin
  if (FSecondLink.NODE_ID <= 0) and (lcbNode.Text <> '') and (not dsNodes.FieldByName('Name').IsNull) then begin
    FSecondLink.NODE_Name := dsNodes['Name'];
    FSecondLink.NODE_TYPE := dsNodes['O_Name'];
  end;
  GenName();
end;

procedure TNodeLinkForm.lcbNodeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsNodes.Active) and (not dsNodes.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsNodes['COLOR'])
  else
    Background := clWindow;
end;

procedure TNodeLinkForm.lcbPOINT_SChange(Sender: TObject);
begin
  if (FMainLink.NODE_ID <= 0) and (lcbPOINT_S.Text <> '') and (not dsNodes.FieldByName('Name').IsNull) then
    FMainLink.NODE_Name := dsNodes['Name'];
  GenName;
end;

procedure TNodeLinkForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  if not ((dmMain.AllowedAction(rght_Dictionary_full)) or (dmMain.AllowedAction(rght_Dictionary_Nodes)))
  then begin
    errors := True;
    Exit;
  end;

  errors := false;
  if VarIsNull(lcbLinkType.value) then
  begin
    errors := true;
    CnErrors.SetError(lcbLinkType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(lcbLinkType);

  if (FMainLink.NODE_ID <= 0) and VarIsNull(lcbPOINT_S.value) then
  begin
    errors := true;
    CnErrors.SetError(lcbPOINT_S, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(lcbPOINT_S);
  {
    if VarIsNull(lcbNode.value) then
    begin
    errors := true;
    CnErrors.SetError(lcbNode, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
    CnErrors.Dispose(lcbNode);
  }
  if not errors then
    SaveLink
  else
    ModalResult := mrNone;
end;

procedure TNodeLinkForm.GenName();
var
  s: string;
begin
  s := '';
  if FMainLink.LINK_ID <= 0 then
  begin
    if (lcbLinkType.Text <> '') and (not dsType.FieldByName('O_NAME').IsNull) then
      s := dsType['O_NAME'] + ':';

    s := s + getFirstLetters(FMainLink.NODE_TYPE) +'-'+ FMainLink.NODE_Name + '>';
    s := s + getFirstLetters(FSecondLink.NODE_TYPE) +'-' + FSecondLink.NODE_Name;

    edtNAME.Text := s
  end;
end;

procedure TNodeLinkForm.SetMainLink(value: TNodeLinkItem);
begin
  FMainLink := value;
  pnlMain.Visible := (FMainLink.NODE_ID <= 0);
  if pnlMain.Visible then
  begin
    lcbPOINT_S.ListSource := srcMain;
  end;
end;

procedure TNodeLinkForm.SetSecondLink(value: TNodeLinkItem);
begin
  FSecondLink := value;
end;

procedure TNodeLinkForm.SaveLink;
begin
  if FMainLink.LINK_ID <= 0 then
  begin
    FMainLink.LINK_ID := dmMain.dbTV.Gen_Id('GEN_DEVICES_ID', 1, dmMain.trWriteQ);
    dsLink['WID'] := FMainLink.LINK_ID;
    if FMainLink.NODE_ID > 0 then
      dsLink['POINT_S'] := FMainLink.NODE_ID
    else
      dsLink['POINT_S'] := lcbPOINT_S.value
  end;

  dsLink.Post;
  ModalResult := mrOk;
end;

end.
