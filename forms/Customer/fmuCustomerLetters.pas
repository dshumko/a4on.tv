unit fmuCustomerLetters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, ComCtrls, ToolWin,
  GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet, ActnList,
  DBGridEhToolCtrls, Buttons, ExtCtrls, DBAxisGridsEh,
  System.Actions, PrjConst, EhLibVCL, System.UITypes, DBGridEhGrouping,
  DynVarsEh;

type
  TapgCustomerLetters = class(TA4onPage)
    dsLetters: TpFIBDataSet;
    srcLetters: TDataSource;
    dbgLetters: TDBGridEh;
    ActListCustomers: TActionList;
    actLetterDel: TAction;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    procedure actLetterDelExecute(Sender: TObject);
    procedure srcLettersDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData;   override;
    procedure CloseData;  override;
    class function GetPageName: string; override;
  end;
implementation

uses DM, MAIN;

{$R *.dfm}

class function TapgCustomerLetters.GetPageName: string;
begin
  Result := rsLettersAndMessages;
end;

procedure TapgCustomerLetters.InitForm;
var
  FullAccess : Boolean;
begin
  FullAccess           := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ
  actLetterDel.Visible := FullAccess;
  pnlButtons.Visible   := FullAccess;

  dsLetters.DataSource := FDataSource;
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
  if (MessageDlg(rsDeleteLetter, mtConfirmation, [mbYes, mbNo], 0) = mrNo)
  then Exit;

  if (dsLetters.FieldByName('ITS_LETTER').IsNull or (dsLetters['ITS_LETTER'] = 1))
  then
    dsLetters.SQLs.DeleteSQL.Text := 'delete from Custletter where Custletterid = :OLD_Mes_Id'
  else
    dsLetters.SQLs.DeleteSQL.Text := 'delete from MESSAGES where MES_ID = :OLD_Mes_Id and MES_RESULT <= 0';

  dsLetters.Delete;
  EnableControls;
end;

procedure TapgCustomerLetters.CloseData;
begin
  dsLetters.Close;
end;

procedure TapgCustomerLetters.EnableControls;
begin
  actLetterDel.Enabled := actLetterDel.Visible and ( dsLetters.RecordCount>0 );
end;

procedure TapgCustomerLetters.srcLettersDataChange(Sender: TObject;
  Field: TField);
begin
  actLetterDel.Enabled := (actLetterDel.Visible) // and (not dsLetters.FieldByName('ITS_LETTER').IsNull) and (dsLetters.FieldByName('ITS_LETTER').AsInteger = 1)
end;

end.
