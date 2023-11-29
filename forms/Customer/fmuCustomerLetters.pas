unit fmuCustomerLetters;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons,
  Vcl.ExtCtrls,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, Vcl.Menus;

type
  TapgCustomerLetters = class(TA4onPage)
    dsLetters: TpFIBDataSet;
    srcLetters: TDataSource;
    dbgLetters: TDBGridEh;
    ActListCustomers: TActionList;
    actLetterDel: TAction;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    pmGrid: TPopupMenu;
    actSendMessage: TAction;
    miSendMessage: TMenuItem;
    procedure actLetterDelExecute(Sender: TObject);
    procedure srcLettersDataChange(Sender: TObject; Field: TField);
    procedure dbgLettersGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure actSendMessageExecute(Sender: TObject);
    procedure dbgLettersDblClick(Sender: TObject);
  private
    FclIncome : TColor;
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  DM, MAIN, SendMessagesForma, atrStrUtils, atrCmdUtils;

{$R *.dfm}

class function TapgCustomerLetters.GetPageName: string;
begin
  Result := rsLettersAndMessages;
end;

procedure TapgCustomerLetters.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ
  actLetterDel.Visible := FullAccess;
  pnlButtons.Visible := FullAccess;

  dsLetters.DataSource := FDataSource;

  try
    FclIncome := StringToColor(dmMain.GetSettingsValue('ROW_HL_WARNING'));
  except
    FclIncome := $0066FFFF;
  end;
end;

procedure TapgCustomerLetters.OpenData;
begin
  if dsLetters.Active then
    dsLetters.Close;
  dsLetters.OrderClause := GetOrderClause(dbgLetters);
  dsLetters.Open;
  EnableControls;
end;

procedure TapgCustomerLetters.actLetterDelExecute(Sender: TObject);
begin
  // служебные письма не удалять
  if (dsLetters['Custletterid'] < 0) or ((not dsLetters.FieldByName('TYPE_ID').IsNull) and (dsLetters['TYPE_ID'] < 0))
  then
    Exit;

  if (MessageDlg(rsDeleteLetter, mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  if (dsLetters.FieldByName('ITS_LETTER').IsNull or (dsLetters['ITS_LETTER'] = 1)) then
    dsLetters.SQLs.DeleteSQL.Text := 'delete from Custletter where LETTERTYPEID >=0 and Custletterid = :OLD_Mes_Id'
  else
    dsLetters.SQLs.DeleteSQL.Text := 'delete from MESSAGES where MES_ID = :OLD_Mes_Id and MES_RESULT=0';

  dsLetters.Delete;
  EnableControls;
end;

procedure TapgCustomerLetters.actSendMessageExecute(Sender: TObject);
var
  i : Integer;
begin
  if not(dmMain.AllowedAction(rght_Customer_full) //
    or dmMain.AllowedAction(rght_Messages_add)) then
    exit;

  if (dsLetters.RecordCount = 0) //
    or dsLetters.FieldByName('RECIVER').IsNull //
  then
    exit;

  i := -1;
  if not dsLetters.FieldByName('Mes_Id').IsNull then
    i := dsLetters.FieldByName('Mes_Id').AsInteger;

  SendMessages(FDataSource.DataSet['CUSTOMER_ID'], dsLetters.FieldByName('RECIVER').AsString, i);
  dsLetters.CloseOpen(true);
  if i>0 then
    dsLetters.Locate('Mes_Id', i, []);
end;

procedure TapgCustomerLetters.CloseData;
begin
  dsLetters.Close;
end;

procedure TapgCustomerLetters.dbgLettersDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  s: String;
begin
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgLetters.ScreenToClient(ScrPt);
  Cell := dbgLetters.MouseCoord(GrdPt.X, GrdPt.Y);
  s := UpperCase(dbgLetters.Fields[Cell.X - 1].FieldName);
  if (s = 'MES_TEXT') then
  begin
    if not dbgLetters.DataSource.DataSet.FieldByName(s).IsNull then
    begin
      s := ExtractUrl(dbgLetters.DataSource.DataSet.FieldByName(s).AsString); // atrStrUtils
      if not s.IsEmpty then
      begin
        atrCmdUtils.ShellExecute(Application.MainForm.Handle, '', s.trim);
      end
    end;
  end;
end;

procedure TapgCustomerLetters.dbgLettersGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    Exit;

  if (gdSelected in State) then
  begin
    // AFont.Color := clHighlightText;
    Background := clHighlight;
  end
  else
  begin
    if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').IsNull then
    begin
      if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').AsInteger = 1) then
        Background := FclIncome;
    end;
  end;
end;

procedure TapgCustomerLetters.EnableControls;
begin
  actLetterDel.Enabled := actLetterDel.Visible and (dsLetters.RecordCount > 0);
end;

procedure TapgCustomerLetters.srcLettersDataChange(Sender: TObject; Field: TField);
begin
  actLetterDel.Enabled := (actLetterDel.Visible)
  // and (not dsLetters.FieldByName('ITS_LETTER').IsNull) and (dsLetters.FieldByName('ITS_LETTER').AsInteger = 1)
end;

end.
