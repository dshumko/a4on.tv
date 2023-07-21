unit NodeLinkForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask, Vcl.Forms,
  FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst, GridsEh, DBGridEh,
  OkCancel_frame,
  FIBDatabase, pFIBDatabase, A4onTypeUnit;

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
    procedure FormShow(Sender: TObject);
    procedure lcbPOINT_SChange(Sender: TObject);
    procedure lcbNodeExit(Sender: TObject);
    procedure lcbLinkTypeExit(Sender: TObject);
  private
    FCanEdit: Boolean;
    FLineCnt: Integer;
    FMainLink: TNodeLinkItem;
    FSecondLink: TNodeLinkItem;
    procedure GenName();
    procedure GenWireCnt;
    procedure SetMainLink(value: TNodeLinkItem);
    procedure SetSecondLink(value: TNodeLinkItem);
    procedure SaveLink;
  public
    property MainLink: TNodeLinkItem read FMainLink write SetMainLink;
    property SecondLink: TNodeLinkItem read FSecondLink write SetSecondLink;
  end;

function LinkNodes(var MainItem, SecondItem: TNodeLinkItem): Boolean;

implementation

uses
  DM, pFIBQuery, AtrStrUtils;

{$R *.dfm}

function getFirstLetters(const s: String): String;
var
  w: TStringArray;
  i: Integer;
begin
  Result := '';
  w := Explode(' ', s);
  for i := 0 to Length(w) - 1 do
  begin
    Result := Result + Copy(w[i], 1, 1);
  end;
  Result := UpperCase(Result, loUserLocale);
end;

function LinkNodes(var MainItem, SecondItem: TNodeLinkItem): Boolean;
begin
  Result := false;
  with TNodeLinkForm.Create(Application) do
  begin
    try
      MainLink := MainItem;
      SecondLink := SecondItem;

      if ShowModal = mrOk then
      begin
        MainItem.LINK_ID := MainLink.LINK_ID;
        Result := true;
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
  // FLineCnt := 0;
  FCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Nodes);
  FCanEdit := FCanEdit or dmMain.AllowedAction(rght_Comm_Node_Links);

  OkCancelFrame.bbOk.Visible := FCanEdit;

  dsNodes.ParamByName('NODE_ID').value := FMainLink.NODE_ID;
  dsNodes.Open;
  dsType.Open;
  dsMat.Open;
  dsLabel.Open;

  dsLink.ParamByName('WID').value := FMainLink.LINK_ID;
  dsLink.Open;
  // if not dsLink.FieldByName('WIRE_CNT').IsNull then
  // FLineCnt := dsLink['WIRE_CNT'];

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

procedure TNodeLinkForm.lcbLinkTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsType.Active) and (not dsType.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsType['COLOR'])
  else
    Background := clWindow;
end;

procedure TNodeLinkForm.lcbLinkTypeExit(Sender: TObject);
begin
  GenName();
end;

procedure TNodeLinkForm.lcbNodeChange(Sender: TObject);
begin
  if (not VarIsNull(lcbNode.value)) and (not dsNodes.FieldByName('Name').IsNull) then
  begin
    FSecondLink.NODE_Name := dsNodes['Name'];
    FSecondLink.NODE_TYPE := dsNodes['O_Name'];
  end;
  FLineCnt := 0;
end;

procedure TNodeLinkForm.lcbNodeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsNodes.Active) and (not dsNodes.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsNodes['COLOR'])
  else
    Background := clWindow;
end;

procedure TNodeLinkForm.lcbNodeExit(Sender: TObject);
begin
  GenName();
end;

procedure TNodeLinkForm.lcbPOINT_SChange(Sender: TObject);
begin
  if (FMainLink.NODE_ID <= 0) and (lcbPOINT_S.Text <> '') and (not dsNodes.FieldByName('Name').IsNull) then
  begin
    FMainLink.NODE_Name := dsNodes['Name'];
    FMainLink.NODE_TYPE := dsNodes['O_Name']; // Тип ноды
    // if not dsNodes.FieldByName('WIRE_CNT').IsNull then
    // FLineCnt := dsNodes['WIRE_CNT'];
  end;
  GenName;
end;

procedure TNodeLinkForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  if not(FCanEdit) then
  begin
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

    s := s + getFirstLetters(FMainLink.NODE_TYPE) + '-' + FMainLink.NODE_Name + '>';
    s := s + getFirstLetters(FSecondLink.NODE_TYPE) + '-' + FSecondLink.NODE_Name;
    GenWireCnt;
    s := s + Format(' (%d)', [FLineCnt + 1]);

    edtNAME.Text := s
  end;
end;

procedure TNodeLinkForm.GenWireCnt;
begin
  if ((FMainLink.NODE_ID < 0) and (lcbPOINT_S.Text.IsEmpty)) or (VarIsNull(lcbNode.value)) then
  begin
    Exit;
  end;

  if (FLineCnt <> 0) then
  begin
    Exit;
  end;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select count(*) wcnt from wire w where w.Point_S = :ns and w.Point_E = :ne';
      if FMainLink.NODE_ID > 0 then
        ParamByName('ns').AsInteger := FMainLink.NODE_ID
      else
        ParamByName('ns').AsInteger := lcbPOINT_S.value;
      ParamByName('ne').AsInteger := lcbNode.value;
      Transaction.StartTransaction;
      ExecQuery;
      if not EOF then
        FLineCnt := FieldByName('wcnt').value;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
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
