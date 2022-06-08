unit fmuCustomerDigit;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.ActnList,
  Vcl.Buttons, Vcl.Menus,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, PropFilerEh, PropStorageEh;

type
  TapgCustomerDigit = class(TA4onPage)
    dsDecoders: TpFIBDataSet;
    srcDecoders: TDataSource;
    dbgCustDec: TDBGridEh;
    ActListCustomers: TActionList;
    actDigitDecoderAdd: TAction;
    actDigitDecoderEdit: TAction;
    actDigitDecoderDel: TAction;
    actDigitPacketAdd: TAction;
    actDigitPacketDel: TAction;
    dsDecoderPacket: TpFIBDataSet;
    srcDecoderPacket: TDataSource;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    pmDigit: TPopupMenu;
    actPairing: TAction;
    actResetPIN: TAction;
    actParing1: TMenuItem;
    actResetPIN1: TMenuItem;
    btnMenu: TSpeedButton;
    actMenu: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    actChanAdd: TAction;
    actChanEdit: TAction;
    actChanDel: TAction;
    srcChannels: TDataSource;
    dsChannels: TpFIBDataSet;
    PropStorage: TPropStorageEh;
    pnlPers: TPanel;
    pnlDecPackets: TPanel;
    lbl1: TLabel;
    dbgrdhDecoderPacket: TDBGridEh;
    pnl2: TPanel;
    btnDigitPacketDel: TSpeedButton;
    btnDigitPacketAdd: TSpeedButton;
    pnlPersChannels: TPanel;
    lbl2: TLabel;
    dbgCustChan: TDBGridEh;
    pnl3: TPanel;
    btnChanDel: TSpeedButton;
    btnChanAdd: TSpeedButton;
    spl1: TSplitter;
    spl2: TSplitter;
    procedure actDigitDecoderAddExecute(Sender: TObject);
    procedure actDigitDecoderEditExecute(Sender: TObject);
    procedure actDigitDecoderDelExecute(Sender: TObject);
    procedure actDigitPacketAddExecute(Sender: TObject);
    procedure actDigitPacketDelExecute(Sender: TObject);
    procedure dbgCustDecDblClick(Sender: TObject);
    procedure srcDecodersDataChange(Sender: TObject; Field: TField);
    procedure dbgrdhDecoderPacketGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actMenuExecute(Sender: TObject);
    procedure actPairingExecute(Sender: TObject);
    procedure actResetPINExecute(Sender: TObject);
    procedure actChanAddExecute(Sender: TObject);
    procedure actChanDelExecute(Sender: TObject);
  private
    { Private declarations }
    rghtDigitEdit: Boolean;
    rghtFullAccess: Boolean;
    procedure AddSrvAfterEvent(const Srv: String; const DECODER: String);
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, DM, DecoderPacketForma, DigitCardForma, DecoderDeleteDlgForma, pFIBQuery, CustChannelForma;

class function TapgCustomerDigit.GetPageName: string;
begin
  Result := rsPageDigit;
end;

procedure TapgCustomerDigit.InitForm;
begin
  rghtFullAccess := dmMain.AllowedAction(rght_Customer_full);
  rghtDigitEdit := dmMain.AllowedAction(rght_Customer_EditDigit);

  actDigitPacketAdd.Visible := rghtDigitEdit or rghtFullAccess;
  actDigitPacketDel.Visible := rghtDigitEdit or rghtFullAccess;

  actDigitDecoderAdd.Visible := rghtDigitEdit or rghtFullAccess;
  actDigitDecoderEdit.Visible := rghtDigitEdit or rghtFullAccess;
  actDigitDecoderDel.Visible := rghtDigitEdit or rghtFullAccess;

  actChanAdd.Visible := rghtDigitEdit or rghtFullAccess;
  actChanEdit.Visible := rghtDigitEdit or rghtFullAccess;
  actChanDel.Visible := rghtDigitEdit or rghtFullAccess;

  actPairing.Visible := rghtDigitEdit or rghtFullAccess;
  actResetPIN1.Visible := rghtDigitEdit or rghtFullAccess;
  actMenu.Visible := rghtDigitEdit or rghtFullAccess;

  pnlDecPackets.Visible := (dmMain.GetSettingsValue('PERS_PACKETS') = '1');
  pnlPersChannels.Visible := (dmMain.GetSettingsValue('PERS_CHANNEL') = '1');
  if (not pnlDecPackets.Visible) and (pnlPersChannels.Visible) then
    pnlPersChannels.Align := alClient;
  pnlPers.Visible := pnlDecPackets.Visible or pnlPersChannels.Visible;

  dsDecoders.DataSource := FDataSource;
end;

procedure TapgCustomerDigit.OpenData;
begin
  if dsDecoders.Active then
    dsDecoders.Close;
  dsDecoders.OrderClause := GetOrderClause(dbgCustDec);
  dsDecoders.Open;
  if pnlDecPackets.Visible then
    dsDecoderPacket.Open;
  if pnlPersChannels.Visible then
    dsChannels.Open;
end;

procedure TapgCustomerDigit.actDigitPacketAddExecute(Sender: TObject);
begin
  if (dsDecoders.RecordCount = 0) or (dsDecoders.FieldByName('DECODER_N').IsNull) then
    Exit;

  if AddPaket(dsDecoders['DECODER_N']) then
    dsDecoderPacket.CloseOpen(true);
end;

procedure TapgCustomerDigit.actDigitPacketDelExecute(Sender: TObject);
begin
  if dsDecoderPacket.RecordCount = 0 then
    Exit;
  if dsDecoderPacket.FieldByName('NAME').IsNull then
    Exit;
  if not(rghtFullAccess or rghtDigitEdit) then
    Exit;

  if (MessageDlg(format(rsDelDigitPacket, [dsDecoderPacket['NAME'], dsDecoders['DECODER_N']]), mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    dsDecoderPacket.Delete;
  end;
end;

procedure TapgCustomerDigit.actChanAddExecute(Sender: TObject);
begin
  if (dsDecoders.RecordCount = 0) then
    Exit;
  if dsDecoders.FieldByName('DEC_ID').IsNull then
    Exit;
  if CustomerChannels(dsDecoders['DEC_ID'], -1) then
    dsChannels.CloseOpen(true);
end;

procedure TapgCustomerDigit.actChanDelExecute(Sender: TObject);
begin
  if dsChannels.RecordCount = 0 then
    Exit;

  if (MessageDlg('Удалить данные о канале ' + dsChannels['CH_NAME'] + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
  begin
    dsChannels.Delete;
  end;
end;

procedure TapgCustomerDigit.actDigitDecoderAddExecute(Sender: TObject);
var
  DECODER: String;
begin
  if not(rghtFullAccess or rghtDigitEdit) then
    Exit;
  if FDataSource.DataSet.RecordCount = 0 then
    Exit;
  if FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
    Exit;

  DECODER := AddDecoder(FDataSource.DataSet['CUSTOMER_ID']);
  if (DECODER <> '') then
  begin
    AddSrvAfterEvent(dmMain.GetSettingsValue('CARD_ADD_SRV'), DECODER);
    dsDecoders.CloseOpen(true);
    dsDecoders.Locate('DECODER_N', DECODER, []);
  end;
end;

procedure TapgCustomerDigit.actDigitDecoderDelExecute(Sender: TObject);
var
  s_dec, s_stb: integer;
  nCard, nSTB: string;
begin
  nSTB := '';
  nCard := '';
  if dsDecoders.RecordCount = 0 then
    Exit;
  if dsDecoders.FieldByName('DECODER_N').IsNull then
    Exit;
  if not(rghtFullAccess or rghtDigitEdit) then
    Exit;

  if not dsDecoders.FieldByName('STB_N').IsNull then
    nSTB := dsDecoders['STB_N'];
  nCard := dsDecoders['DECODER_N'];

  if DeleteDecoderStbDialog(nCard, nSTB, s_dec, s_stb) then
  begin
    dsDecoders.SQLs.DeleteSQL.Text := 'execute procedure Delete_Customer_Decoder(:OLD_DEC_ID, ' + IntToStr(s_dec) + ', '
      + IntToStr(s_stb) + ')';
    dsDecoders.Delete;
    AddSrvAfterEvent(dmMain.GetSettingsValue('CARD_DEL_SRV'), nCard);
  end;

end;

procedure TapgCustomerDigit.actDigitDecoderEditExecute(Sender: TObject);
var
  bm: TBookmark;
  oldDECODER, newDECODER: String;
begin
  if not(rghtFullAccess or rghtDigitEdit) then
    Exit;
  if dsDecoders.RecordCount = 0 then
    Exit;
  if dsDecoders.FieldByName('DEC_ID').IsNull then
    Exit;

  if not dsDecoders.FieldByName('DECODER_N').IsNull then
    oldDECODER := dsDecoders['DECODER_N']
  else
    oldDECODER := '';

  if EditDecoder(dsDecoders['DEC_ID']) then
  begin
    bm := dsDecoders.GetBookmark;
    dsDecoders.CloseOpen(true);
    dsDecoders.GotoBookmark(bm);

    if not dsDecoders.FieldByName('DECODER_N').IsNull then
      newDECODER := dsDecoders['DECODER_N']
    else
      newDECODER := '';

    if (newDECODER <> oldDECODER) then
    begin
      AddSrvAfterEvent(dmMain.GetSettingsValue('CARD_DEL_SRV'), oldDECODER);
      AddSrvAfterEvent(dmMain.GetSettingsValue('CARD_ADD_SRV'), newDECODER);
    end;
  end;
end;

procedure TapgCustomerDigit.CloseData;
begin
  dsDecoderPacket.Close;
  dsDecoders.Close;
end;

procedure TapgCustomerDigit.dbgCustDecDblClick(Sender: TObject);
begin
  if (Sender as TDBGridEh).DataSource.DataSet.RecordCount = 0 then
  begin
    if actDigitDecoderAdd.Enabled then
      actDigitDecoderAdd.Execute;
  end
  else
  begin
    if actDigitDecoderEdit.Enabled then
      actDigitDecoderEdit.Execute;
  end;
end;

procedure TapgCustomerDigit.srcDecodersDataChange(Sender: TObject; Field: TField);
begin
  actDigitDecoderEdit.Enabled := (dsDecoders.RecordCount > 0);
  actDigitDecoderDel.Enabled := (dsDecoders.RecordCount > 0);

  actDigitPacketAdd.Enabled := (dsDecoders.RecordCount > 0);
  actDigitPacketDel.Enabled := (dsDecoders.RecordCount > 0);
end;

procedure TapgCustomerDigit.dbgrdhDecoderPacketGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (Sender as TDBGridEh).DataSource.DataSet.FieldValues['state_sgn'] = 1 then
    AFont.Color := gCustActive
  else
    AFont.Color := gCustInactiveDebt;
end;

procedure TapgCustomerDigit.actMenuExecute(Sender: TObject);
begin
  pmDigit.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TapgCustomerDigit.actPairingExecute(Sender: TObject);
begin
  if not(rghtFullAccess or rghtDigitEdit) then
    Exit;

  if (dsDecoders.FieldByName('DECODER_N').IsNull) then
    Exit;
  if (dsDecoders.FieldByName('STB_N').IsNull) then
    Exit;

  with TpFIBQuery.Create(Self) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      Transaction.StartTransaction;
      SQL.Text :=
        'insert into Tqueue ("ACTION", Hardware_Id, Card_Num_First) values (-2, :Hardware_Id, :Card_Num_First)';
      ParamByName('Hardware_Id').AsString := dsDecoders['DECODER_N'];
      ParamByName('Card_Num_First').AsString := dsDecoders['STB_N'];
      ExecQuery;
      Transaction.Commit;
      dsDecoders.Edit;
      dsDecoders['PAIRING'] := 1;
      dsDecoders.Post;
    finally
      Free;
    end
end;

procedure TapgCustomerDigit.actResetPINExecute(Sender: TObject);
begin
  if not(rghtFullAccess or rghtDigitEdit) then
    Exit;

  if (dsDecoders.FieldByName('DECODER_N').IsNull) then
    Exit;

  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      Transaction.StartTransaction;
      SQL.Text := 'insert into Tqueue ("ACTION", Hardware_Id) values (-1, :Hardware_Id)';
      ParamByName('Hardware_Id').AsString := dsDecoders['DECODER_N'];
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TapgCustomerDigit.AddSrvAfterEvent(const Srv: String; const DECODER: String);
// var i: integer;
begin
  {
    if (Srv.IsEmpty) or (not TryStrToInt(Srv, i)) or (FDataSource.DataSet.RecordCount = 0) or
    (FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull) then
    Exit;

    with TpFIBQuery.Create(Self) do
    begin
    try
    DataBase := dmMain.dbTV;
    Transaction := dmMain.trWriteQ;
    SQL.Text := 'execute procedure Add_Single_Service(:P_Customer_Id, :P_Service_Id, :P_Units, :P_Date, :P_Notice)';
    ParamByName('P_Customer_Id').AsInteger := FDataSource.DataSet['CUSTOMER_ID'];
    ParamByName('P_Service_Id').AsInteger := i;
    ParamByName('P_Units').AsInteger := 1;
    ParamByName('P_Date').AsDate := now();
    ParamByName('P_Notice').AsString := DECODER;
    Transaction.StartTransaction;
    ExecQuery;
    Transaction.Commit;
    finally
    Free;
    end;
    end;
  }
end;

end.
